/***********************************************************
 * Product Name: FPTToolWeb
 * Copyright (c)2006, Tanldt
 * Author: Tanldt
 * Web Site: 
 * Mail/MSN: trungtan03200017@yahoo.com
 * ********************************************************/
using System;
using System.Data;
using System.Web.UI.WebControls;
using System.Web;
using System.Web.Caching;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Configuration;
using System.Web.UI;
using System.IO;
using System.Web.Util;
using System.Data.OleDb;
using System.Text;

namespace FPTToolWeb.Reports
{
	public abstract class DataGridExporterBase
	{
		/// <summary>
		/// Holds a reference to the datagrid being exported
		/// </summary>
		protected DataGrid MyDataGrid;

		/// <summary>
		/// Holds a reference to the page where the datagrid locates
		/// </summary>
		protected Page CurrentPage;

		/// <summary>
		/// Overloaded. Initializes a new instance of the DataGridExporterBase class.
		/// </summary>
		/// <param name="dg">The datagrid to be exported</param>
		/// <param name="pg">The page to which the datagrid is to be exported</param>
		public DataGridExporterBase(DataGrid dg, Page pg)
		{
			MyDataGrid = dg;
			CurrentPage = pg;
		}
		public DataGridExporterBase(Page pg)
		{
			CurrentPage = pg;
		}

		/// <summary>
		/// Overloaded. Initializes a new instance of the DataGridExporterBase class.
		/// </summary>
		/// <param name="dg">The datagrid to be exported</param>
		public DataGridExporterBase(DataGrid dg):this(dg, dg.Page)
		{
		}

		/// <summary>
		/// Exports the current datagrid
		/// </summary>
		public abstract void Export();
	}

	/// <summary>
	/// Exports a datagrid to a excel file. 
	/// </summary>
	/// <requirements>Microsoft Excel 97 or above should be installed on the client machine in order to make 
	/// this function work
	/// </requirements>
	public class DataGridExcelExporter:DataGridExporterBase
	{

		#region string Css
		/// <summary>
		/// CSS file for decoration, se it if any or dont use it
		/// </summary>
		private const string MY_CSS_FILE = @"
H1              {
                font-family: Verdana, Arial;
                font-size: medium;
                }
H2              {
                font-family: Verdana, Arial;
                font-size: small;
                }
BODY
{
	font-size: x-small;
	margin: 2px 0px 0px 10px;
	line-height: 5px;
	font-family: Verdana, Arial;
}
TABLE           {
                font-family: Verdana, Arial;
                font-size: x-small;
                }
INPUT           {
                font-family: Verdana, Arial;
                font-size: x-small;
                }
SELECT          {
                font-family: Verdana, Arial;
                font-size: x-small;
                }
a:link
{
	font-weight: bold;
	color: blue;
	text-decoration: underline;
}
a:active        {
                color: blue;
                font-weight: bold;
                text-decoration: underline;
                }
a:visited       {
                color: blue;
                font-weight: bold;
                text-decoration: underline;
                }
a:hover         {
                color: blue;
                font-weight: bold;
                text-decoration: underline;
                }
.navtable       {
                background-color: #000066;
                color: #FFFFFF;
                font-weight: bold;
                }
.navtext        {
                color: #FFFFFF;
                font-weight: bold;
                }
.navlink:link   {
                color: silver;
                text-decoration: none;
                }
.navlink:active {
                color: silver;
                text-decoration: none;
                }
.navlink:visited {
                color: silver;
                text-decoration: none;
                }
.navlink:hover  {
                color: white;
                text-decoration: underline;
                }
.rheader        {
                background-color: #000066;
                color: white;
		font-weight: bold;
                }
.rheadercol2     {
                border-color: black;
                border-style: solid;
                border-width: 1;
                }
.rheadercoll2    {
                border-color: black;
                border-right: 0;
                border-style: solid;
                border-width: 1;
                }
.rheadercolr2    {
                border-color: black;
                border-left: 0;
                border-style: solid;
                border-width: 1;
                }
.rbody          {
                background-color: #FFFFFF;
                }
.rbodycol2       {
                border-color: black;
                border-style: solid;
                border-top: 0;
                border-width: 1;
                }
.smalltext       {
                COLOR: gray;
                FONT-FAMILY: Verdana, Arial;
                FONT-SIZE: 9pt;
                LINE-HEIGHT: 140%
                }

.labeltext
{
	font-weight: bold;
	font-size: x-small;
	color: white;
	font-family: Verdana,Arial;
}

	.inputpanel
{
	BORDER-RIGHT: #808080 1px solid; 
	BORDER-TOP: #808080 1px solid; 
	BORDER-LEFT: #808080 1px solid; 
	BORDER-BOTTOM: #808080 1px solid; 
	BORDER-COLLAPSE: collapse
}
	.dgheader
{
	font-weight: bold;
	border-bottom: #808080 1px solid;
	background-color: #ffffb0;
	BORDER-COLLAPSE:separate
}

	.subnavbar
{
	border-bottom-color: silver;
	background-color: #ffffb0;
	BORDER-RIGHT: #808080 1px solid; 
	BORDER-LEFT: #808080 1px solid; 
	BORDER-BOTTOM: #808080 1px solid;
	border-collapse:collapse;
	height:23px
}

	.contentspace
{
	border-bottom-color: silver;
	BORDER-RIGHT: #808080 1px solid; 
	BORDER-LEFT: #808080 1px solid; 
	BORDER-BOTTOM: #808080 1px solid;
	border-collapse:collapse;

}
	BR
{
	font-size: x-small;
}
	.dgalteritem
{
	background-color: #ccffcc;
}
.grid
{
	font-size: 8pt;
	font-family: Arial;
	background-color: White;
}

.gridHeader
{
	height: 21px;
	color: #000000;
	font-weight: bold;
	text-align: center;
	background-color: #dcdcdc;
}
.gridHeader a:link { 
  color: #0033CC ; 
  text-decoration: none 
}
.gridHeader a:visited { 
  color: #0033CC; 
  text-decoration: none 
}
.gridHeader a:hover { 
  color: #ff6600; 
  text-decoration: underline 
}

.gridFooter
{
	height: 21px;
	color: #CCCCFF;
	font-weight: bold;
	text-align: center;
	font-size: 8pt;
	background-color: #D6D7E1;
}
.gridhover 
{
	background-color: #DFEEF1;
	cursor: hand; 
	padding-left: 3;
	padding-right: 3;
	font-size: 8pt;
}
.gridItem
{
	color: Black;
	background-color: White;
	padding-left: 3;
	padding-right: 3;
	font-size: 8pt;
}
.gridAlter
{
	color: Black;
	background-color: #F6F6F8;
	padding-left: 3;
	padding-right: 3;
	font-size: 8pt;
}
.gridClick
{
	color: #333333;
	background-color: #D7E4EA;
	padding-left: 3;
	padding-right: 3;
	font-size: 8pt;
}
.gridPage
{
	height: 19px;
	color: #003399;
	text-align: right;
	font-weight: bold;
	font-size: 8pt;
	background-color: #DCDCDC;
}
.grid_line
{
	border: #4A2C00;
}
	";
		#endregion
		/// <summary>
		/// Overloaded. Initializes a new instance of the DataGridExcelExporter class.
		/// </summary>
		/// <param name="dg">The datagrid to be exported</param>
		/// <param name="pg">The page to which the datagrid is to be exported</param>
		public DataGridExcelExporter(DataGrid dg, Page pg):base(dg, pg)
		{
		}

		/// <summary>
		/// Overloaded. Initializes a new instance of the DataGridExcelExporter class.
		/// </summary>
		/// <param name="dg">The datagrid to be exported</param>
		public DataGridExcelExporter(DataGrid dg):base(dg)
		{
		}
		public DataGridExcelExporter(Page pg):base(pg)
		{
		}

		/// <summary>
		/// Overloaded. Exports a datagrid to an excel file, the title of which is empty
		/// </summary>
		public override void Export()
		{
			Export(String.Empty);
		}

		/// <summary>
		/// Renders the html text before the datagrid.
		/// </summary>
		/// <param name="writer">A HtmlTextWriter to write html to output stream</param>
		protected virtual void FrontDecorator(HtmlTextWriter writer)
		{
			writer.WriteFullBeginTag("HTML");
			writer.WriteFullBeginTag("meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"");
			writer.WriteFullBeginTag("Head");
			writer.RenderBeginTag(HtmlTextWriterTag.Style);
			writer.Write("<!--");
			
//			if(File.Exists(CurrentPage.MapPath(MY_CSS_FILE)))
//			{
//				StreamReader sr = File.OpenText(CurrentPage.MapPath(MY_CSS_FILE));			
//				String input;
//				while ((input=sr.ReadLine())!=null)
//				{
					writer.WriteLine(MY_CSS_FILE);
//				}
//				sr.Close();
//			}
			writer.Write("-->");
			writer.RenderEndTag();
			writer.WriteEndTag("Head");
			writer.WriteFullBeginTag("Body");
		}
		/// <summary>
		/// Renders the html text after the datagrid.
		/// </summary>
		/// <param name="writer">A HtmlTextWriter to write html to output stream</param>
		protected virtual void RearDecorator(HtmlTextWriter writer)
		{
			writer.WriteEndTag("Body");
			writer.WriteEndTag("HTML");
		}

		#region Export DataGrid To Excel
		/// <summary>
		/// Exports the datagrid to an Excel file with the name of the datasheet provided by the passed in parameter
		/// </summary>
		/// <param name="reportName">Name of the datasheet.
		/// </param>
		public virtual void Export(string reportName)
		{
			ClearChildControls(MyDataGrid);
			AddSpaceControls(MyDataGrid);
			MyDataGrid.EnableViewState = false;//Gets rid of the viewstate of the control. The viewstate may make an excel file unreadable.

		
			CurrentPage.Response.Clear();
			CurrentPage.Response.Buffer = true; 

			//This will make the browser interpret the output as an Excel file
			//CurrentPage.Response.AddHeader( "Content-Disposition", "filename="+reportName);
			CurrentPage.Response.AddHeader( "Content-Disposition", "attachment; filename=export.xls");
			CurrentPage.Response.ContentType="application/vnd.ms-excel";
			CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);

			//Prepares the html and write it into a StringWriter
			StringWriter stringWriter = new StringWriter();
			HtmlTextWriter htmlWriter = new HtmlTextWriter(stringWriter);
			FrontDecorator(htmlWriter);
			MyDataGrid.RenderControl(htmlWriter);
			RearDecorator(htmlWriter);

			//Write the content to the web browser
			CurrentPage.Response.Write(stringWriter.ToString());
			CurrentPage.Response.End();
		}
		#endregion
		#region Export Page HTML To Excel
		/// <summary>
		/// Exports the Page to an Excel file with the name of the datasheet provided by the passed in parameter
		/// </summary>
		/// <param name="reportName">Name of the datasheet.
		/// </param>
		public virtual void ExportPageToExcel(string reportName)
		{
			CurrentPage.Response.Clear();
			CurrentPage.Response.Buffer = true; 

			//This will make the browser interpret the output as an Excel file
			//CurrentPage.Response.AddHeader( "Content-Disposition", "filename="+reportName);
			CurrentPage.Response.AddHeader( "Content-Disposition", "attachment; filename=export.xls");
			CurrentPage.Response.ContentType="application/vnd.ms-excel";
			CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);


			//Prepares the html and write it into a StringWriter
			StringWriter stringWriter = new StringWriter();
			HtmlTextWriter htmlWriter = new HtmlTextWriter(stringWriter);
			FrontDecorator(htmlWriter);
			CurrentPage.RenderControl(htmlWriter);
			RearDecorator(htmlWriter);

			//Write the content to the web browser
			CurrentPage.Response.Write(stringWriter.ToString());
			CurrentPage.Response.End();
		}
		#endregion
		#region Export DataTable
		/// <summary>
		/// Xuất ra Excel Từ 1 DataTable
		/// </summary>
		/// <param name="oDataTable"></param>
		/// <param name="reportName"></param>
		public virtual void ExportDataTable(DataTable oDataTable,string reportName)
		{
			CurrentPage.Response.Clear();
			CurrentPage.Response.Buffer = true; 

			//This will make the browser interpret the output as an Excel file
			//CurrentPage.Response.AppendHeader( "Content-Disposition", "filename="+reportName + ".xls");
			CurrentPage.Response.AppendHeader( "Content-Disposition", "attachment; filename=export.xls");
			CurrentPage.Response.ContentType="application/vnd.ms-excel";
			CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);


			//Prepares the html and write it into a StringWriter
			StringWriter stringWriter = new StringWriter();
			HtmlTextWriter htmlWriter = new HtmlTextWriter(stringWriter);
			FrontDecorator(htmlWriter);
			//MyDataGrid.RenderControl(htmlWriter);
			StringBuilder oStringBuilder = new StringBuilder();

			#region khai bao
			/********************************************************
			 * Start, check for border width
			 * ******************************************************/
			int borderWidth = 0;
			borderWidth = 1;
			
			/********************************************************
			 * End, Check for border width
			 * ******************************************************/

			/********************************************************
			 * Start, Check for bold heading
			 * ******************************************************/
			string boldTagStart = "";
			string boldTagEnd = "";
			
			boldTagStart = "<B>";
			boldTagEnd = "</B>";
			#endregion

			#region Tao Report Title
			htmlWriter.Write("<Table>");
			htmlWriter.Write("<TR>");
			htmlWriter.Write("<TD colspan=5 align=center><H3>");
			htmlWriter.Write(reportName);// Report Name Header
			htmlWriter.Write("</H3></TD>");
			htmlWriter.Write("</TR>");
			htmlWriter.Write("<TR><TD><br></TD></TR>");
			htmlWriter.Write("</Table>");
			#endregion

			/********************************************************
			 * End,Check for bold heading
			 * ******************************************************/

			htmlWriter.Write("<Table border=" + borderWidth + ">");

			#region Creating table header
			/*******************************************************************
			 * Start, Creating table header
			 * *****************************************************************/

			
			htmlWriter.Write("<TR>");

			foreach(DataColumn oDataColumn in oDataTable.Columns)	
			{
				htmlWriter.Write("<TD bgcolor=#D6D7E1>" + boldTagStart + oDataColumn.ColumnName + boldTagEnd + "</TD>");
			}

			htmlWriter.Write("</TR>");

			/*******************************************************************
			 * End, Creating table header
			 * *****************************************************************/
			#endregion
			#region Creating rows
			/*******************************************************************
			 * Start, Creating rows
			 * *****************************************************************/

			foreach(DataRow oDataRow in oDataTable.Rows)	
			{
				htmlWriter.Write("<TR>");

				foreach(DataColumn oDataColumn in oDataTable.Columns)	
				{
					if (oDataRow[oDataColumn.ColumnName] is long)	
					{
						htmlWriter.Write("<TD align=right>&nbsp;" + oDataRow[oDataColumn.ColumnName] + "</TD>");
					}
					else	
					{
						htmlWriter.Write("<TD>&nbsp;" + oDataRow[oDataColumn.ColumnName] + "</TD>");
					}
					
					
				}

				htmlWriter.Write("</TR>");
			}
			

			/*******************************************************************
			 * End, Creating rows
			 * *****************************************************************/
			#endregion

			htmlWriter.Write("</Table>");

			RearDecorator(htmlWriter);

			//Write the content to the web browser
			//htmlWriter.WriteLine(oStringBuilder.ToString());
			CurrentPage.Response.Write(stringWriter.ToString());
			CurrentPage.Response.End();
		}
		#endregion
		#region Export DataTable Group by
		/// <summary>
		/// Xuất ra Excel Từ 1 DataTable Group Level1
		/// </summary>
		/// <param name="oDataTable"></param>
		/// <param name="reportName"></param>
		public virtual void ExportDataTable(DataTable oDataTable,string reportName, int[] iGroupColumn)
		{
			CurrentPage.Response.Clear();
			CurrentPage.Response.Buffer = true; 

			//This will make the browser interpret the output as an Excel file
			//CurrentPage.Response.AppendHeader( "Content-Disposition", "filename="+reportName + ".xls");
			CurrentPage.Response.AppendHeader( "Content-Disposition", "attachment; filename=export.xls");
			CurrentPage.Response.ContentType="application/vnd.ms-excel";
			CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);

			
			//Prepares the html and write it into a StringWriter
			StringWriter stringWriter = new StringWriter();
			HtmlTextWriter htmlWriter = new HtmlTextWriter(stringWriter);
			FrontDecorator(htmlWriter);
			//MyDataGrid.RenderControl(htmlWriter);
			//CurrentPage.RenderControl(htmlWriter);
			StringBuilder oStringBuilder = new StringBuilder();

			AddDataHTML(htmlWriter,oDataTable,reportName, iGroupColumn);

			RearDecorator(htmlWriter);

			//Write the content to the web browser
			//htmlWriter.WriteLine(oStringBuilder.ToString());
			CurrentPage.Response.Write(stringWriter.ToString());
			CurrentPage.Response.End();
		}
		private void AddDataHTML(HtmlTextWriter htmlWriter,DataTable oDataTable,string reportName, int[] ColumnList)
		{
			#region khai bao
			int k = 0;int l = 0;int m = 0;
			string strRowFirst = "";
			//DataTable dt = new DataTable();
			//DataSet ds;
			// Getting Field Names
			string[] sHeaders = new string[ColumnList.Length];
			//string[] sFileds = new string[ColumnList.Length];
			/********************************************************
			 * Start, check for border width
			 * ******************************************************/
			int borderWidth = 0;
			borderWidth = 1;
			
			/********************************************************
			 * End, Check for border width
			 * ******************************************************/

			/********************************************************
			 * Start, Check for bold heading
			 * ******************************************************/
			string boldTagStart = "";
			string boldTagEnd = "";
			
			boldTagStart = "<B>";
			boldTagEnd = "</B>";
			#endregion
			#region Tao Report Title
			htmlWriter.Write("<Table>");
			htmlWriter.Write("<TR>");
			htmlWriter.Write("<TD colspan=5 align=center><H3>");
			htmlWriter.Write(reportName);// Report Name Header
			htmlWriter.Write("</H3></TD>");
			htmlWriter.Write("</TR>");
			htmlWriter.Write("<TR><TD><br></TD></TR>");
			htmlWriter.Write("</Table>");
			#endregion
			/********************************************************
			 * End,Check for bold heading
			 * ******************************************************/
			htmlWriter.Write("<Table border=" + borderWidth + ">");
			#region Creating table header
			/*******************************************************************
			 * Start, Creating table header
			 * *****************************************************************/

			
			htmlWriter.Write("<TR>");

			foreach(DataColumn oDataColumn in oDataTable.Columns)	
			{
				//dt.Columns.Add(oDataColumn.ColumnName);

				for (int i=0; i < ColumnList.Length; i++)
				{
					if((ColumnList[i] < 0) || (ColumnList[i] >= oDataTable.Columns.Count))// Check
						throw new Exception("ExportColumn Number should not exceed Total Columns Range");

					if (k == ColumnList[i]) // Neu nam trong List Group
					{
						sHeaders[i] = oDataColumn.ColumnName;
					}
					else
					{
						htmlWriter.Write("<TD bgcolor=#D6D7E1>" + boldTagStart + oDataColumn.ColumnName + boldTagEnd + "</TD>");
					}
				}
				k++;
			}
//			foreach(DataRow oDataRow in oDataTable.Rows)	
//			{
//				if (l==0)
//					strRowFirst = oDataRow[0].ToString();
//				if (oDataRow[0].ToString() == strRowFirst)	
//					dt.Rows.Add(oDataRow);
//				l++;
//			}
			k = 0;
			htmlWriter.Write("</TR>");

			/*******************************************************************
			 * End, Creating table header
			 * *****************************************************************/
			#endregion
			
			for(k=0; k < sHeaders.Length; k++)
			{
				htmlWriter.Write("<TR>");
				htmlWriter.Write("<TD align=right>&nbsp;" + sHeaders[k] + "</TD>");
				htmlWriter.Write("</TR>");
				
			}
			
			#region Creating rows
			/*******************************************************************
			 * Start, Creating rows
			 * *****************************************************************/


			htmlWriter.Write("<TR><TD><br></TD></TR>");
			foreach(DataRow oDataRow in oDataTable.Rows)	
			{
				htmlWriter.Write("<TR>");

				foreach(DataColumn oDataColumn in oDataTable.Columns)	
				{
					if (oDataRow[oDataColumn.ColumnName] is long)	
					{
						htmlWriter.Write("<TD align=right>&nbsp;" + oDataRow[oDataColumn.ColumnName] + "</TD>");
					}
					else	
					{
						htmlWriter.Write("<TD>&nbsp;" + oDataRow[oDataColumn.ColumnName] + "</TD>");
					}
					
					
				}

				htmlWriter.Write("</TR>");
			}
			

			/*******************************************************************
			 * End, Creating rows
			 * *****************************************************************/
			#endregion
			htmlWriter.Write("</Table>");
		}

		#endregion
		public DataTable CreateGroupByTable(string TableName, DataTable SourceTable, string GroupBy)
		{
			DataTable dt = new DataTable(TableName);
			
			
			return dt;

		}
		/// <summary>
		/// Iterates a control and its children controls, ensuring they are all LiteralControls
		/// <remarks>
		/// Only LiteralControl can call RenderControl(System.Web.UI.HTMLTextWriter htmlWriter) method. Otherwise 
		/// a runtime error will occur. This is the reason why this method exists.
		/// </remarks>
		/// </summary>
		/// <param name="control">The control to be cleared and verified</param>
		private void RecursiveClear(System.Web.UI.Control control)
		{
			//Clears children controls
			for (int i=control.Controls.Count -1; i>=0; i--)
			{
				RecursiveClear(control.Controls[i]);
			}

			//
			//If it is a LinkButton, convert it to a LiteralControl
			//
			if (control is LinkButton) 
			{
				LiteralControl literal = new LiteralControl();
				control.Parent.Controls.Add(literal);
				literal.Text = "&nbsp;" + ((LinkButton)control).Text;
				control.Parent.Controls.Remove(control);
			}
				//We don't need a button in the excel sheet, so simply delete it
			else if(control is Button)
			{
				control.Parent.Controls.Remove(control);
			}

				//If it is a ListControl, copy the text to a new LiteralControl
			else if(control is ListControl)
			{
				LiteralControl literal = new LiteralControl();
				control.Parent.Controls.Add(literal);
				try
				{
					literal.Text = "&nbsp;" + ((ListControl)control).SelectedItem.Text;
				}
				catch
				{
				}
				control.Parent.Controls.Remove(control);
						
			}
			else if(control is CheckBox)
			{
				control.Parent.Controls.Remove(control);
			}
			else if(control is TextBox)
			{
				LiteralControl literal = new LiteralControl();
				control.Parent.Controls.Add(literal);
				try
				{
					literal.Text = "&nbsp;" + ((TextBox)control).Text;
				}
				catch
				{
				}
				control.Parent.Controls.Remove(control);
			}
			else if(control is ImageButton)
			{				
				control.Parent.Controls.Remove(control);
			}

			//You may add more conditions when necessary

			return;
		}

		
		/// <summary>
		/// Clears the child controls of a Datagrid to make sure all controls are LiteralControls
		/// </summary>
		/// <param name="dg">Datagrid to be cleared and verified</param>
		protected void ClearChildControls(DataGrid dg)
		{
			
			for(int i = dg.Columns.Count -1 ; i>=0; i--)
			{
				DataGridColumn column = dg.Columns[i];
				if (column is ButtonColumn)
				{
					dg.Columns.Remove(column);
				}
			}
			
			this.RecursiveClear(dg);
			
		}

		protected void AddSpaceControls(DataGrid dg)
		{
			for (int i =0; i < dg.Items.Count;i++)
			{
				System.Web.UI.WebControls.TableCellCollection cells = (System.Web.UI.WebControls.TableCellCollection)dg.Items[i].Cells;
				foreach (System.Web.UI.WebControls.TableCell cell in cells)
				{
					if (cell.Text.ToString().Trim() != "")
                        cell.Text = "&nbsp;" + cell.Text;
					string a = cell.Text;
				}
			}
		}
	}

	
	
	

	
}
