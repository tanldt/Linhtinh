/***********************************************************
 * Product Name: FPTToolWeb
 * Copyright (c)2006, Tanldt
 * Author: Tanldt
 * Web Site: 
 * Mail/MSN: letanphp@gmail.com
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
using System.Web.UI.HtmlControls;
using FPTToolWeb.Data;

namespace FPTToolWeb.Control.DataGrids
{
	#region Class ExporterBase
	public abstract class ExporterBase
	{
		/// <summary>
		/// Holds a reference to the datagrid being exported
		/// </summary>
		protected DataGrid MyDataGrid;

		/// <summary>
		/// Holds a reference to the page where the datagrid locates
		/// </summary>
		protected Page CurrentPage;
		//protected ;

		/// <summary>
		/// Overloaded. Initializes a new instance of the DataGridExporterBase class.
		/// </summary>
		/// <param name="dg">The datagrid to be exported</param>
		/// <param name="pg">The page to which the datagrid is to be exported</param>
		public ExporterBase(DataGrid dg, Page pg)
		{
			MyDataGrid = dg;
			CurrentPage = pg;
		}
		public ExporterBase(Page pg)
		{
			CurrentPage = pg;
		}

		/// <summary>
		/// Overloaded. Initializes a new instance of the DataGridExporterBase class.
		/// </summary>
		/// <param name="dg">The datagrid to be exported</param>
		public ExporterBase(DataGrid dg):this(dg, dg.Page)
		{
		}

		/// <summary>
		/// Exports the current datagrid
		/// </summary>
		public abstract void Export();
	}
	#endregion
	/// <summary>
	/// Exports a datagrid to a excel file. 
	/// </summary>
	/// <requirements>Microsoft Excel 97 or above should be installed on the client machine in order to make 
	/// this function work
	/// </requirements>
	public class ExcelExporter:ExporterBase
	{

		#region Phan khai bao
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
		public ExcelExporter(DataGrid dg, Page pg):base(dg, pg)
		{
		}

		/// <summary>
		/// Overloaded. Initializes a new instance of the DataGridExcelExporter class.
		/// </summary>
		/// <param name="dg">The datagrid to be exported</param>
		public ExcelExporter(DataGrid dg):base(dg)
		{
		}
		public ExcelExporter(Page pg):base(pg)
		{
		}

		/// <summary>
		/// Overloaded. Exports a datagrid to an excel file, the title of which is empty
		/// </summary>
		public override void Export()
		{
			ExportDataGrid(String.Empty);
		}

		#endregion
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
		/// <param name="ReportHeader">Name of the datasheet.
		/// </param>
		public virtual void ExportDataGrid(string ReportHeader)
		{
			ClearChildControls(MyDataGrid);
			AddSpaceControls(MyDataGrid);
			MyDataGrid.EnableViewState = false;//Gets rid of the viewstate of the control. The viewstate may make an excel file unreadable.

		
			CurrentPage.Response.Clear();
			CurrentPage.Response.Buffer = true; 

			//This will make the browser interpret the output as an Excel file
			//CurrentPage.Response.AddHeader( "Content-Disposition", "filename="+ReportHeader);
			CurrentPage.Response.AddHeader( "Content-Disposition", "attachment; filename=export.xls");
			CurrentPage.Response.ContentType="application/vnd.ms-excel";


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
		#endregion
		#region Export Page HTML To Excel
		/// <summary>
		/// Exports the Page to an Excel file with the name of the datasheet provided by the passed in parameter
		/// </summary>
		/// <param name="ReportHeader">Name of the datasheet.
		/// </param>
		public virtual void ExportPageToExcel(string ReportHeader,string Type)
		{
			RecursiveClear(CurrentPage);
			CurrentPage.EnableViewState = false;

			CurrentPage.Response.Clear();
			CurrentPage.Response.Buffer = true; 

			#region Type Export
			if (Type.ToLower() == "doc")
			{
				CurrentPage.Response.AddHeader("content-disposition", "attachment;filename=export.doc");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType = "application/vnd.word";
			}
			else if (Type.ToLower() == "txt")
			{
				CurrentPage.Response.AddHeader("content-disposition", 
					"attachment;filename=export.txt");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType = "application/vnd.text";
			}
			else
			{
				CurrentPage.Response.AddHeader( "Content-Disposition", "attachment; filename=export.xls");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType="application/vnd.ms-excel";
			}
			#endregion

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
		#region Export Table HTML To Excel
		/// <summary>
		/// Exports the Page to an Excel file with the name of the datasheet provided by the passed in parameter
		/// </summary>
		/// <param name="ReportHeader">Name of the datasheet.
		/// </param>
		public virtual void ExportTableToExcel(string Table, string Type)
		{
			CurrentPage.EnableViewState = false;

			CurrentPage.Response.Clear();
			CurrentPage.Response.Buffer = true; 

			#region Type Export
			if (Type.ToLower() == "doc")
			{
				CurrentPage.Response.AddHeader("content-disposition", "attachment;filename=export.doc");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType = "application/vnd.word";
			}
			else if (Type.ToLower() == "txt")
			{
				CurrentPage.Response.AddHeader("content-disposition", 
					"attachment;filename=export.txt");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType = "application/vnd.text";
			}
			else
			{
				CurrentPage.Response.AddHeader( "Content-Disposition", "attachment; filename=export.xls");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType="application/vnd.ms-excel";
			}
			#endregion
			//Prepares the html and write it into a StringWriter
			StringWriter stringWriter = new StringWriter();
			HtmlTextWriter htmlWriter = new HtmlTextWriter(stringWriter);
			FrontDecorator(htmlWriter);

			HtmlTable tbl = new HtmlTable();
			tbl = (HtmlTable)CurrentPage.FindControl(Table);
			if (tbl != null)
                tbl.RenderControl(htmlWriter);
			else
				htmlWriter.Write("Khong tim thay id :" + Table);

			RearDecorator(htmlWriter);

			//Write the content to the web browser
			CurrentPage.Response.Write(stringWriter.ToString());
			CurrentPage.Response.End();
		}
		#endregion
		#region Export string HTML To Excel
		/// <summary>
		/// Exports the Page to an Excel file with the name of the datasheet provided by the passed in parameter
		/// </summary>
		/// <param name="ReportHeader">Name of the datasheet.
		/// </param>
		public virtual void ExportHTMLToExcel(string strHTML, string Type)
		{
			CurrentPage.Response.Clear();
			CurrentPage.Response.Buffer = true; 

			#region Type Export
			if (Type.ToLower() == "doc")
			{
				CurrentPage.Response.AddHeader("content-disposition", "attachment;filename=export.doc");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType = "application/vnd.word";
			}
			else if (Type.ToLower() == "txt")
			{
				CurrentPage.Response.AddHeader("content-disposition", 
					"attachment;filename=export.txt");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType = "application/vnd.text";
			}
			else
			{
				CurrentPage.Response.AddHeader( "Content-Disposition", "attachment; filename=export.xls");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType="application/vnd.ms-excel";
			}
			#endregion

			//Prepares the html and write it into a StringWriter
			StringWriter stringWriter = new StringWriter();
			HtmlTextWriter htmlWriter = new HtmlTextWriter(stringWriter);
			FrontDecorator(htmlWriter);
			StringBuilder oStringBuilder = new StringBuilder();

			htmlWriter.Write(strHTML);

			RearDecorator(htmlWriter);

			CurrentPage.Response.Write(stringWriter.ToString());
			CurrentPage.Response.End();
		}
		#endregion
		#region Export Div HTML To Excel
		/// <summary>
		/// Exports the Div to an Excel file with the name of the datasheet provided by the passed in parameter
		/// </summary>
		/// <param name="ReportHeader">Name of the datasheet.
		/// </param>
		public virtual void ExportDivToExcel(HtmlGenericControl Div, string Type)
		{
			CurrentPage.EnableViewState = false;

			CurrentPage.Response.Clear();
			CurrentPage.Response.Buffer = true; 

			#region Type Export
			if (Type.ToLower() == "doc")
			{
				CurrentPage.Response.AddHeader("content-disposition", "attachment;filename=export.doc");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType = "application/vnd.word";
			}
			else if (Type.ToLower() == "txt")
			{
				CurrentPage.Response.AddHeader("content-disposition", 
					"attachment;filename=export.txt");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType = "application/vnd.text";
			}
			else
			{
				CurrentPage.Response.AddHeader( "Content-Disposition", "attachment; filename=export.xls");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType="application/vnd.ms-excel";
			}
			#endregion
			//Prepares the html and write it into a StringWriter
			StringWriter stringWriter = new StringWriter();
			HtmlTextWriter htmlWriter = new HtmlTextWriter(stringWriter);
			FrontDecorator(htmlWriter);

			HtmlGenericControl tbl = new HtmlGenericControl();
			tbl = Div;
			tbl.RenderControl(htmlWriter);
//			tbl = (HtmlGenericControl)CurrentPage.FindControl(Div);
//			if (tbl != null)
//				tbl.RenderControl(htmlWriter);
//			else
//				htmlWriter.Write("Khong tim thay id :" + Div);

			RearDecorator(htmlWriter);

			//Write the content to the web browser
			CurrentPage.Response.Write(stringWriter.ToString());
			CurrentPage.Response.End();
		}
		#endregion
		#region Export DataTable Group by Cap 3
		/// <summary>
		/// Xuất ra Excel Từ 1 DataTable Group Level1
		/// </summary>
		/// <param name="oDataTable"></param>
		/// <param name="ReportHeader"></param>
		public virtual void ExportGroupLevel(DataTable oDataTable,string ReportHeader,string ReportFooter, int iGroupLevel1, int iGroupLevel2, int iGroupLevel3, string Type)
		{
			CurrentPage.Response.Clear();
			CurrentPage.Response.Buffer = true; 

			#region Type Export
			if (Type.ToLower() == "doc")
			{
				CurrentPage.Response.AddHeader("content-disposition", "attachment;filename=export.doc");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType = "application/vnd.word";
			}
			else if (Type.ToLower() == "txt")
			{
				CurrentPage.Response.AddHeader("content-disposition", 
					"attachment;filename=export.txt");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType = "application/vnd.text";
			}
			else if (Type.ToLower() == "pdf")
			{
				CurrentPage.Response.AddHeader("content-disposition", 
					"attachment;filename=export.pdf");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType = "application/pdf";
			}
			else if (Type.ToLower() == "rtf")
			{
				CurrentPage.Response.AddHeader("content-disposition", 
					"attachment;filename=export.rtf");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType = "application/rtf";
			}
			else
			{
				CurrentPage.Response.AddHeader( "Content-Disposition", "attachment; filename=export.xls");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType="application/vnd.ms-excel";
			}
			#endregion

			
			//Prepares the html and write it into a StringWriter
			StringWriter stringWriter = new StringWriter();
			HtmlTextWriter htmlWriter = new HtmlTextWriter(stringWriter);
			FrontDecorator(htmlWriter);
			//MyDataGrid.RenderControl(htmlWriter);
			//CurrentPage.RenderControl(htmlWriter);
			StringBuilder oStringBuilder = new StringBuilder();

			AddDataHTMLCap(htmlWriter,oDataTable,ReportHeader,ReportFooter, iGroupLevel1,iGroupLevel2,iGroupLevel3);

			RearDecorator(htmlWriter);

			//Write the content to the web browser
			//htmlWriter.WriteLine(oStringBuilder.ToString());
			CurrentPage.Response.Write(stringWriter.ToString());
			CurrentPage.Response.End();
		}
		private void AddDataHTMLCap(HtmlTextWriter htmlWriter,DataTable oDataTable,string ReportHeader,string ReportFooter, int iGroupLevel1, int iGroupLevel2, int iGroupLevel3)
		{
			#region khai bao
			int k = 0;
//			DataSet ds1 = new DataSet();
//			DataSet ds2 = new DataSet();
			DataSet ds;
			DataSetHelper dsHelper;

			// Export the details of specified columns
			ds = new DataSet();
			dsHelper = new DataSetHelper(ref ds);
			// Getting Field Names
			string sColumnName1 = "";
			string sColumnName2 = "";
			string sColumnName3 = "";
			
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
			htmlWriter.Write("<TD></TD>");
			htmlWriter.Write("<TD colspan="+(oDataTable.Columns.Count-3)+" align=center><H3>");
			htmlWriter.Write(ReportHeader);// Report Name Header
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
			htmlWriter.Write("<TD bgcolor=#FFFF99>"+ boldTagStart +"No."+ boldTagEnd +"</TD>");
			foreach(DataColumn oDataColumn in oDataTable.Columns)	
			{
				if((iGroupLevel1 < 0) || (iGroupLevel1 >= oDataTable.Columns.Count))// Check
					throw new Exception("ExportColumn Number should not exceed Total Columns Range");

				if (k == iGroupLevel1) // Neu nam trong List Group 1
				{
					sColumnName1 = oDataColumn.ColumnName;
				}
				else if (k == iGroupLevel2) // Neu nam trong List Group 2
				{
					sColumnName2 = oDataColumn.ColumnName;
				}
				else if (k == iGroupLevel3) // Neu nam trong List Group 3
				{
					sColumnName3 = oDataColumn.ColumnName;
				}
				else
				{
					htmlWriter.Write("<TD bgcolor=#FFFF99>" + boldTagStart + oDataColumn.ColumnName + boldTagEnd + "</TD>");
				}
				k++;
			}
			k = 0;
			htmlWriter.Write("</TR>");

			/*******************************************************************
			 * End, Creating table header
			 * *****************************************************************/
			#endregion

			#region Cap 1
			DataTable dtb =  SQLOps.SelectDistinct(oDataTable,sColumnName1);// Lay ra cac String trong Group
			foreach(DataRow oDataRow in dtb.Rows)	
			{
				DataTable dtcap1 = CreateGroupByTable(oDataRow[0].ToString(),oDataTable,oDataRow[0].ToString(),sColumnName1);

				htmlWriter.Write("<TR>");
				htmlWriter.Write("<TD bgcolor=#9A9999 align=left colspan="+(dtcap1.Columns.Count-1)+">&nbsp;&bull;&nbsp;<b>" + sColumnName1 + ": " +oDataRow[0].ToString()+ "</b></TD>");
				htmlWriter.Write("</TR>");
				#region Cap 2
				DataTable dtb2 =  SQLOps.SelectDistinct(dtcap1,sColumnName2);// Lay ra cac String trong Group 2
				foreach(DataRow oDataRow2 in dtb2.Rows)	
				{
					DataTable dtcap2 = CreateGroupByTable(oDataRow2[0].ToString(),dtcap1,oDataRow2[0].ToString(),sColumnName2);

					htmlWriter.Write("<TR>");
					htmlWriter.Write("<TD bgcolor=#B9B8B8 align=left colspan="+(dtcap2.Columns.Count)+">&nbsp;&nbsp;&nbsp;&nbsp;&bull;&nbsp;<b>" + sColumnName2 + ": " +oDataRow2[0].ToString()+ "</b></TD>");
					htmlWriter.Write("</TR>");

					#region Cap 3
					DataTable dtb3 =  SQLOps.SelectDistinct(dtcap2,sColumnName3);// Lay ra cac String trong Group 3
					foreach(DataRow oDataRow3 in dtb3.Rows)	
					{
						DataTable dtcap3 = CreateGroupByTable(oDataRow3[0].ToString(),dtcap2,oDataRow3[0].ToString(),sColumnName3);

						htmlWriter.Write("<TR>");
						htmlWriter.Write("<TD align=left colspan="+(dtcap3.Columns.Count+1)+">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&bull;&nbsp;<b>" + sColumnName3 + ": " +oDataRow3[0].ToString()+ "</b></TD>");
						htmlWriter.Write("</TR>");

						#region Creating rows
						/*******************************************************************
							* Start, Creating rows
							* *****************************************************************/
						AddHTMLDataTable2(htmlWriter,dtcap3);
						/*******************************************************************
							* End, Creating rows
							* *****************************************************************/
						#endregion
						dtcap3.Dispose();
					}
					#endregion
					dtcap2.Dispose();
				}
				#endregion
				dtcap1.Dispose();
			}
			#endregion
			
			htmlWriter.Write("</Table>");
			#region Tao Report Footer
			htmlWriter.Write("<Table>");
			htmlWriter.Write("<TR>");
			htmlWriter.Write("<TD></TD>");
			htmlWriter.Write("<TD colspan="+(oDataTable.Columns.Count-3)+" align=center>");
			htmlWriter.Write(ReportFooter);// Report Name Footer
			htmlWriter.Write("</TD>");
			htmlWriter.Write("</TR>");
			htmlWriter.Write("<TR><TD><br></TD></TR>");
			htmlWriter.Write("</Table>");
			#endregion
		}

		#endregion
		#region Export DataTable Group by Cap 2
		/// <summary>
		/// Xuất ra Excel Từ 1 DataTable Group Level1
		/// </summary>
		/// <param name="oDataTable"></param>
		/// <param name="ReportHeader"></param>
		public virtual void ExportGroupLevel(DataTable oDataTable,string ReportHeader,string ReportFooter, int iGroupLevel1, int iGroupLevel2, string Type)
		{
			CurrentPage.Response.Clear();
			CurrentPage.Response.Buffer = true; 

			#region Type Export
			if (Type.ToLower() == "doc")
			{
				CurrentPage.Response.AddHeader("content-disposition", "attachment;filename=export.doc");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType = "application/vnd.word";
			}
			else if (Type.ToLower() == "txt")
			{
				CurrentPage.Response.AddHeader("content-disposition", 
					"attachment;filename=export.txt");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType = "application/vnd.text";
			}
			else if (Type.ToLower() == "pdf")
			{
				CurrentPage.Response.AddHeader("content-disposition", 
					"attachment;filename=export.pdf");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType = "application/pdf";
			}
			else if (Type.ToLower() == "rtf")
			{
				CurrentPage.Response.AddHeader("content-disposition", 
					"attachment;filename=export.rtf");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType = "application/rtf";
			}
			else
			{
				CurrentPage.Response.AddHeader( "Content-Disposition", "attachment; filename=export.xls");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType="application/vnd.ms-excel";
			}
			#endregion
			
			//Prepares the html and write it into a StringWriter
			StringWriter stringWriter = new StringWriter();
			HtmlTextWriter htmlWriter = new HtmlTextWriter(stringWriter);
			FrontDecorator(htmlWriter);
			//MyDataGrid.RenderControl(htmlWriter);
			//CurrentPage.RenderControl(htmlWriter);
			StringBuilder oStringBuilder = new StringBuilder();

			AddDataHTMLCap(htmlWriter,oDataTable,ReportHeader,ReportFooter, iGroupLevel1,iGroupLevel2);

			RearDecorator(htmlWriter);

			//Write the content to the web browser
			//htmlWriter.WriteLine(oStringBuilder.ToString());
			CurrentPage.Response.Write(stringWriter.ToString());
			CurrentPage.Response.End();
		}
		private void AddDataHTMLCap(HtmlTextWriter htmlWriter,DataTable oDataTable,string ReportHeader,string ReportFooter, int iGroupLevel1, int iGroupLevel2)
		{
			#region khai bao
			int k = 0;
			DataSet ds1 = new DataSet();
			DataSet ds2 = new DataSet();
			DataSet ds;
			DataSetHelper dsHelper;

			// Export the details of specified columns
			ds = new DataSet();
			dsHelper = new DataSetHelper(ref ds);
			// Getting Field Names
			string sColumnName1 = "";
			string sColumnName2 = "";
			
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
			htmlWriter.Write("<TD></TD>");
			htmlWriter.Write("<TD colspan="+(oDataTable.Columns.Count-2)+" align=center><H3>");
			htmlWriter.Write(ReportHeader);// Report Name Header
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
			htmlWriter.Write("<TD bgcolor=#FFFF99>"+ boldTagStart +"No."+ boldTagEnd +"</TD>");
			foreach(DataColumn oDataColumn in oDataTable.Columns)	
			{
				if((iGroupLevel1 < 0) || (iGroupLevel1 >= oDataTable.Columns.Count))// Check
					throw new Exception("ExportColumn Number should not exceed Total Columns Range");

				if (k == iGroupLevel1) // Neu nam trong List Group
				{
					sColumnName1 = oDataColumn.ColumnName;
				}
				else if (k == iGroupLevel2) // Neu nam trong List Group
				{
					sColumnName2 = oDataColumn.ColumnName;
				}
				else
				{
					htmlWriter.Write("<TD bgcolor=#FFFF99>" + boldTagStart + oDataColumn.ColumnName + boldTagEnd + "</TD>");
				}
				k++;
			}
			k = 0;
			htmlWriter.Write("</TR>");

			/*******************************************************************
			 * End, Creating table header
			 * *****************************************************************/
			#endregion

			#region Cap 1
			DataTable dtb =  SQLOps.SelectDistinct(oDataTable,sColumnName1);// Lay ra cac String trong Group
			foreach(DataRow oDataRow in dtb.Rows)	
			{
				DataTable dtcap1 = CreateGroupByTable(oDataRow[0].ToString(),oDataTable,oDataRow[0].ToString(),sColumnName1);

				htmlWriter.Write("<TR>");
				htmlWriter.Write("<TD bgcolor=#9A9999 align=left colspan="+(dtcap1.Columns.Count)+">&nbsp;<b>" + sColumnName1 + ": " +oDataRow[0].ToString()+ "</b></TD>");
				htmlWriter.Write("</TR>");
				#region Cap 2
				DataTable dtb2 =  SQLOps.SelectDistinct(dtcap1,sColumnName2);// Lay ra cac String trong Group 2
				foreach(DataRow oDataRow2 in dtb2.Rows)	
				{
					DataTable dtcap2 = CreateGroupByTable(oDataRow2[0].ToString(),dtcap1,oDataRow2[0].ToString(),sColumnName2);

					htmlWriter.Write("<TR>");
					htmlWriter.Write("<TD></TD>");
					htmlWriter.Write("<TD bgcolor=#B9B8B8 align=left colspan="+dtcap2.Columns.Count+">&nbsp;<b>" + sColumnName2 + ": " +oDataRow2[0].ToString()+ "</b></TD>");
					htmlWriter.Write("</TR>");

					#region Creating rows
					/*******************************************************************
						* Start, Creating rows
						* *****************************************************************/
					AddHTMLDataTable2(htmlWriter,dtcap2);
					/*******************************************************************
						* End, Creating rows
						* *****************************************************************/
					#endregion
					dtcap2.Dispose();
				}
				#endregion
				dtcap1.Dispose();
			}
			#endregion

			htmlWriter.Write("</Table>");
			#region Tao Report Footer
			htmlWriter.Write("<Table>");
			htmlWriter.Write("<TR>");
			htmlWriter.Write("<TD></TD>");
			htmlWriter.Write("<TD colspan="+(oDataTable.Columns.Count-2)+" align=center>");
			htmlWriter.Write(ReportFooter);// Report Name Footer
			htmlWriter.Write("</TD>");
			htmlWriter.Write("</TR>");
			htmlWriter.Write("<TR><TD><br></TD></TR>");
			htmlWriter.Write("</Table>");
			#endregion
		}

		public void AddHTMLDataTable2(HtmlTextWriter htmlWriter,DataTable oDataTable)
		{
			int i = 1;
			foreach(DataRow oDataRow in oDataTable.Rows)	
			{
				htmlWriter.Write("<TR>");
				htmlWriter.Write("<TD>&nbsp;" + i.ToString() + "</TD>");
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
				i++;
			}
		}
		public DataTable CreateGroupByTable1(string TableName, DataTable SourceTable, string strGroupBy, string ColumnName)
		{
			DataTable dt = new DataTable(TableName);
			int k = 1;
			int[] l = new int[100];
			foreach(DataColumn oDataColumn in SourceTable.Columns)	
			{
				if (ColumnName != oDataColumn.ColumnName) // Neu nam trong List Group
					dt.Columns.Add(oDataColumn.ColumnName);
				else
					l[k] = k;
				k++;
			}
			
			foreach(DataRow oDataRow in SourceTable.Rows)	
			{
				k = 0;
				if (oDataRow[ColumnName].ToString() == strGroupBy)	
				{
					string[] ii = new string[SourceTable.Columns.Count - 1];
					for ( int i = 0; i < SourceTable.Columns.Count; i++)
					{
						if (l[i+1] == 0 || l[i+1].ToString() == null)
						{
							ii[i-k] = oDataRow[i].ToString();
						}
						else
							k++;
					}

					dt.Rows.Add(ii);
				}

			}
			return dt;

		}

		#endregion
		#region Export DataTable Group by Cap 2 No Header DataTable
		/// <summary>
		/// Xuất ra Excel Từ 1 DataTable Group Level1
		/// </summary>
		/// <param name="oDataTable"></param>
		/// <param name="ReportHeader"></param>
		public virtual void ExportGroupLevelNoHeader(DataTable oDataTable,string ReportHeader,string ReportFooter, int iGroupLevel1, int iGroupLevel2, string Type)
		{
			CurrentPage.Response.Clear();
			CurrentPage.Response.Buffer = true; 

			#region Type Export
			if (Type.ToLower() == "doc")
			{
				CurrentPage.Response.AddHeader("content-disposition", "attachment;filename=export.doc");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType = "application/vnd.word";
			}
			else if (Type.ToLower() == "txt")
			{
				CurrentPage.Response.AddHeader("content-disposition", 
					"attachment;filename=export.txt");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType = "application/vnd.text";
			}
			else if (Type.ToLower() == "pdf")
			{
				CurrentPage.Response.AddHeader("content-disposition", 
					"attachment;filename=export.pdf");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType = "application/pdf";
			}
			else if (Type.ToLower() == "rtf")
			{
				CurrentPage.Response.AddHeader("content-disposition", 
					"attachment;filename=export.rtf");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType = "application/rtf";
			}
			else
			{
				CurrentPage.Response.AddHeader( "Content-Disposition", "attachment; filename=export.xls");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType="application/vnd.ms-excel";
			}
			#endregion
			
			//Prepares the html and write it into a StringWriter
			StringWriter stringWriter = new StringWriter();
			HtmlTextWriter htmlWriter = new HtmlTextWriter(stringWriter);
			FrontDecorator(htmlWriter);
			//MyDataGrid.RenderControl(htmlWriter);
			//CurrentPage.RenderControl(htmlWriter);
			StringBuilder oStringBuilder = new StringBuilder();

			AddDataHTMLCapNoHeader(htmlWriter,oDataTable,ReportHeader,ReportFooter, iGroupLevel1,iGroupLevel2);

			RearDecorator(htmlWriter);

			//Write the content to the web browser
			//htmlWriter.WriteLine(oStringBuilder.ToString());
			CurrentPage.Response.Write(stringWriter.ToString());
			CurrentPage.Response.End();
		}
		private void AddDataHTMLCapNoHeader(HtmlTextWriter htmlWriter,DataTable oDataTable,string ReportHeader,string ReportFooter, int iGroupLevel1, int iGroupLevel2)
		{
			
			#region khai bao
			int k = 0;
			DataSet ds1 = new DataSet();
			DataSet ds2 = new DataSet();
			DataSet ds;
			DataSetHelper dsHelper;

			// Export the details of specified columns
			ds = new DataSet();
			dsHelper = new DataSetHelper(ref ds);
			// Getting Field Names
			string sColumnName1 = "";
			string sColumnName2 = "";
			
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
//			htmlWriter.Write("<Table>");
//			htmlWriter.Write("<TR>");
//			htmlWriter.Write("<TD></TD>");
//			htmlWriter.Write("<TD colspan="+(oDataTable.Columns.Count-2)+" align=center><H3>");
			htmlWriter.Write(ReportHeader);// Report Name Header
//			htmlWriter.Write("</H3></TD>");
//			htmlWriter.Write("</TR>");
//			htmlWriter.Write("<TR><TD><br></TD></TR>");
//			htmlWriter.Write("</Table>");
			#endregion
			/********************************************************
			 * End,Check for bold heading
			 * ******************************************************/
			htmlWriter.Write("<Table border=" + borderWidth + ">");
			#region Creating table header
			/*******************************************************************
			 * Start, Creating table header
			 * *****************************************************************/

			
			//htmlWriter.Write("<TR>");
			//htmlWriter.Write("<TD bgcolor=#FFFF99>"+ boldTagStart +"No."+ boldTagEnd +"</TD>");
			foreach(DataColumn oDataColumn in oDataTable.Columns)	
			{
				if((iGroupLevel1 < 0) || (iGroupLevel1 >= oDataTable.Columns.Count))// Check
					throw new Exception("ExportColumn Number should not exceed Total Columns Range");

				if (k == iGroupLevel1) // Neu nam trong List Group
				{
					sColumnName1 = oDataColumn.ColumnName;
				}
				else if (k == iGroupLevel2) // Neu nam trong List Group
				{
					sColumnName2 = oDataColumn.ColumnName;
				}
				else
				{
					//htmlWriter.Write("<TD bgcolor=#FFFF99>" + boldTagStart + oDataColumn.ColumnName + boldTagEnd + "</TD>");
				}
				k++;
			}
			k = 0;
			//htmlWriter.Write("</TR>");

			/*******************************************************************
			 * End, Creating table header
			 * *****************************************************************/
			#endregion

			#region Cap 1
			DataTable dtb =  SQLOps.SelectDistinct(oDataTable,sColumnName1);// Lay ra cac String trong Group
			foreach(DataRow oDataRow in dtb.Rows)	
			{
				DataTable dtcap1 = CreateGroupByTable(oDataRow[0].ToString(),oDataTable,oDataRow[0].ToString(),sColumnName1);

				htmlWriter.Write("<TR>");
				htmlWriter.Write("<TD bgcolor=#9A9999 align=left colspan="+(dtcap1.Columns.Count)+">&nbsp;<b>" + sColumnName1 + ": " +oDataRow[0].ToString()+ "</b></TD>");
				htmlWriter.Write("</TR>");
				#region Cap 2
				DataTable dtb2 =  SQLOps.SelectDistinct(dtcap1,sColumnName2);// Lay ra cac String trong Group 2
				foreach(DataRow oDataRow2 in dtb2.Rows)	
				{
					DataTable dtcap2 = CreateGroupByTable(oDataRow2[0].ToString(),dtcap1,oDataRow2[0].ToString(),sColumnName2);

					htmlWriter.Write("<TR>");
					htmlWriter.Write("<TD></TD>");
					htmlWriter.Write("<TD bgcolor=#B9B8B8 align=left colspan="+dtcap2.Columns.Count+">&nbsp;<b>" + sColumnName2 + ": " +oDataRow2[0].ToString()+ "</b></TD>");
					htmlWriter.Write("</TR>");

					#region Creating rows
					/*******************************************************************
						* Start, Creating rows
						* *****************************************************************/
					dtcap2 = SortDataTable(dtcap2, dtcap2.Columns[0].ColumnName+" asc");
					AddHTMLDataTable2(htmlWriter,dtcap2);
					/*******************************************************************
						* End, Creating rows
						* *****************************************************************/
					#endregion
					dtcap2.Dispose();
				}
				#endregion
				dtcap1.Dispose();
			}
			#endregion

			htmlWriter.Write("</Table>");
			#region Tao Report Footer
			htmlWriter.Write("<Table>");
			htmlWriter.Write("<TR>");
			htmlWriter.Write("<TD></TD>");
			htmlWriter.Write("<TD colspan="+(oDataTable.Columns.Count-2)+" align=center>");
			htmlWriter.Write(ReportFooter);// Report Name Footer
			htmlWriter.Write("</TD>");
			htmlWriter.Write("</TR>");
			htmlWriter.Write("<TR><TD><br></TD></TR>");
			htmlWriter.Write("</Table>");
			#endregion
		}
		#endregion
		#region Export DataTable Group by Cap 1
		/// <summary>
		/// Xuất ra Excel Từ 1 DataTable Group Level1
		/// </summary>
		/// <param name="oDataTable"></param>
		/// <param name="ReportHeader"></param>
		public virtual void ExportGroupLevel(DataTable oDataTable,string ReportHeader,string ReportFooter, int iGroupLevel1, string Type)
		{
			CurrentPage.Response.Clear();
			CurrentPage.Response.Buffer = true; 

			#region Type Export
			if (Type.ToLower() == "doc")
			{
				CurrentPage.Response.AddHeader("content-disposition", "attachment;filename=export.doc");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType = "application/vnd.word";
			}
			else if (Type.ToLower() == "txt")
			{
				CurrentPage.Response.AddHeader("content-disposition", 
					"attachment;filename=export.txt");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType = "application/vnd.text";
			}
			else if (Type.ToLower() == "pdf")
			{
				CurrentPage.Response.AddHeader("content-disposition", 
					"attachment;filename=export.pdf");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType = "application/pdf";
			}
			else if (Type.ToLower() == "rtf")
			{
				CurrentPage.Response.AddHeader("content-disposition", 
					"attachment;filename=export.rtf");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType = "application/rtf";
			}
			else
			{
				CurrentPage.Response.AddHeader( "Content-Disposition", "attachment; filename=export.xls");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType="application/vnd.ms-excel";
			}
			#endregion

			
			//Prepares the html and write it into a StringWriter
			StringWriter stringWriter = new StringWriter();
			HtmlTextWriter htmlWriter = new HtmlTextWriter(stringWriter);
			FrontDecorator(htmlWriter);
			//MyDataGrid.RenderControl(htmlWriter);
			//CurrentPage.RenderControl(htmlWriter);
			StringBuilder oStringBuilder = new StringBuilder();

			AddDataHTMLCap(htmlWriter,oDataTable,ReportHeader,ReportFooter, iGroupLevel1);

			RearDecorator(htmlWriter);

			//Write the content to the web browser
			//htmlWriter.WriteLine(oStringBuilder.ToString());
			CurrentPage.Response.Write(stringWriter.ToString());
			CurrentPage.Response.End();
		}
		private void AddDataHTMLCap(HtmlTextWriter htmlWriter,DataTable oDataTable,string ReportHeader,string ReportFooter, int ColumnList)
		{
			#region khai bao
			int k = 0;
			int l = 0;
			int iLevel = 1;
			DataSet ds2 = new DataSet();
			DataSet ds;
			DataSetHelper dsHelper;

			// Export the details of specified columns
			ds = new DataSet();
			dsHelper = new DataSetHelper(ref ds);
			// Getting Field Names
			string sHeaders = "";
			
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
			htmlWriter.Write(ReportHeader);// Report Name Header
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
				for (int i=0; i < iLevel; i++)
				{
					if((ColumnList < 0) || (ColumnList >= oDataTable.Columns.Count))// Check
						throw new Exception("ExportColumn Number should not exceed Total Columns Range");

					if (k == ColumnList) // Neu nam trong List Group
					{
						sHeaders = oDataColumn.ColumnName;
					}
					else
					{
						htmlWriter.Write("<TD bgcolor=#D6D7E1>" + boldTagStart + oDataColumn.ColumnName + boldTagEnd + "</TD>");
					}
				}
				k++;
			}
			k = 0;
			htmlWriter.Write("</TR>");

			/*******************************************************************
			 * End, Creating table header
			 * *****************************************************************/
			#endregion

			DataTable dtb =  SQLOps.SelectDistinct(oDataTable,sHeaders);// Lay ra cac String trong Group
			string[] sFileds = new string[dtb.Rows.Count];
			l = 0;
			foreach(DataRow oDataRow in dtb.Rows)	
			{
				DataTable dt = CreateGroupByTable(oDataRow[0].ToString(),oDataTable,oDataRow[0].ToString(),sHeaders);
				ds2.Tables.Add(dt);
				sFileds[l] = oDataRow[0].ToString();
				l++;
			}
			#region Creating rows
			/*******************************************************************
				* Start, Creating rows
				* *****************************************************************/

			for (int i = 0; i < ds2.Tables.Count; i++)
			{
			
				htmlWriter.Write("<TR>");
				htmlWriter.Write("<TD align=left colspan="+ds2.Tables[i].Columns.Count+">&nbsp;<b>" + sHeaders + ": " +sFileds[i]+ "</b></TD>");
				htmlWriter.Write("</TR>");

				AddHTMLDataTable(htmlWriter,ds2.Tables[i]);
			}
		
			/*******************************************************************
				* End, Creating rows
				* *****************************************************************/
			#endregion
			
			htmlWriter.Write("</Table>");
			#region Tao Report Footer
			htmlWriter.Write("<Table>");
			htmlWriter.Write("<TR>");
			htmlWriter.Write("<TD></TD>");
			htmlWriter.Write("<TD colspan="+(oDataTable.Columns.Count-2)+" align=center>");
			htmlWriter.Write(ReportFooter);// Report Name Footer
			htmlWriter.Write("</TD>");
			htmlWriter.Write("</TR>");
			htmlWriter.Write("<TR><TD><br></TD></TR>");
			htmlWriter.Write("</Table>");
			#endregion
		}

		public DataTable CreateGroupByTable(string TableName, DataTable SourceTable, string strGroupBy, string ColumnName)
		{
			DataTable dt = new DataTable(TableName);
			int k = 1;
			int[] l = new int[100];
			foreach(DataColumn oDataColumn in SourceTable.Columns)	
			{
				if (ColumnName != oDataColumn.ColumnName) // Neu nam trong List Group
					dt.Columns.Add(oDataColumn.ColumnName);
				else
					l[k] = k;
				k++;
			}
			
			foreach(DataRow oDataRow in SourceTable.Rows)	
			{
				k = 0;
				if (oDataRow[ColumnName].ToString() == strGroupBy)	
				{
					string[] ii = new string[SourceTable.Columns.Count - 1];
					for ( int i = 0; i < SourceTable.Columns.Count; i++)
					{
						if (l[i+1] == 0 || l[i+1].ToString() == null)
						{
							ii[i-k] = oDataRow[i].ToString();
						}
						else
							k++;
					}

					dt.Rows.Add(ii);
				}

			}
			return dt;

		}
		#endregion
		#region Export DataTable Group by
		/// <summary>
		/// Xuất ra Excel Từ 1 DataTable Group Level1
		/// </summary>
		/// <param name="oDataTable"></param>
		/// <param name="ReportHeader"></param>
		public virtual void ExportDataTable(DataTable oDataTable,string ReportHeader, int[] iGroupColumn, string Type)
		{
			CurrentPage.Response.Clear();
			CurrentPage.Response.Buffer = true; 

			#region Type Export
			if (Type.ToLower() == "doc")
			{
				CurrentPage.Response.AddHeader("content-disposition", "attachment;filename=export.doc");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType = "application/vnd.word";
			}
			else if (Type.ToLower() == "txt")
			{
				CurrentPage.Response.AddHeader("content-disposition", 
					"attachment;filename=export.txt");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType = "application/vnd.text";
			}
			else if (Type.ToLower() == "pdf")
			{
				CurrentPage.Response.AddHeader("content-disposition", 
					"attachment;filename=export.pdf");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType = "application/pdf";
			}
			else if (Type.ToLower() == "rtf")
			{
				CurrentPage.Response.AddHeader("content-disposition", 
					"attachment;filename=export.rtf");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType = "application/rtf";
			}
			else
			{
				CurrentPage.Response.AddHeader( "Content-Disposition", "attachment; filename=export.xls");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType="application/vnd.ms-excel";
			}
			#endregion
			
			//Prepares the html and write it into a StringWriter
			StringWriter stringWriter = new StringWriter();
			HtmlTextWriter htmlWriter = new HtmlTextWriter(stringWriter);
			FrontDecorator(htmlWriter);
			//MyDataGrid.RenderControl(htmlWriter);
			//CurrentPage.RenderControl(htmlWriter);
			StringBuilder oStringBuilder = new StringBuilder();

			AddDataHTML(htmlWriter,oDataTable,ReportHeader, iGroupColumn);

			RearDecorator(htmlWriter);

			//Write the content to the web browser
			//htmlWriter.WriteLine(oStringBuilder.ToString());
			CurrentPage.Response.Write(stringWriter.ToString());
			CurrentPage.Response.End();
		}
		private void AddDataHTML(HtmlTextWriter htmlWriter,DataTable oDataTable,string ReportHeader, int[] ColumnList)
		{
			#region khai bao
			int k = 0;
			int l = 0;
			int iLevel = ColumnList.Length;
			DataSet ds2 = new DataSet();
			DataSet ds;
			DataSetHelper dsHelper;

			// Export the details of specified columns
			ds = new DataSet();
			dsHelper = new DataSetHelper(ref ds);
			// Getting Field Names
			string[] sHeaders = new string[iLevel];
			
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
			htmlWriter.Write(ReportHeader);// Report Name Header
			htmlWriter.Write("</H3></TD>");
			htmlWriter.Write("</TR>");
			htmlWriter.Write("<TR><TD><br></TD></TR>");
			htmlWriter.Write("</Table>");
			#endregion
			/********************************************************
			 * End,Check for bold heading
			 * ******************************************************/
			htmlWriter.Write("<Table border=" + borderWidth + ">");
			#region Creating List Name from Column List
//			foreach(DataColumn oDataColumn in oDataTable.Columns)	
//			{
//				for (int i=0; i < iLevel; i++)
//				{
//					if((ColumnList[i] < 0) || (ColumnList[i] >= oDataTable.Columns.Count))// Check
//						throw new Exception("ExportColumn Number should not exceed Total Columns Range");
//
//					if (k == ColumnList[i]) // Neu nam trong List Group
//					{
//						sHeaders[i] = oDataColumn.ColumnName;
//					}
//				}
//				k++;
//			}
//			k = 0;
			#endregion
			#region Creating table header
			/*******************************************************************
			 * Start, Creating table header
			 * *****************************************************************/

			
			htmlWriter.Write("<TR>");

			foreach(DataColumn oDataColumn in oDataTable.Columns)	
			{
				//dt.Columns.Add(oDataColumn.ColumnName);

				for (int i=0; i < iLevel; i++)
				{
					if((ColumnList[i] < 0) || (ColumnList[i] >= oDataTable.Columns.Count))// Check
						throw new Exception("ExportColumn Number should not exceed Total Columns Range");

					if (k == ColumnList[i]) // Neu nam trong List Group
					{
						sHeaders[i] = oDataColumn.ColumnName;
						//htmlWriter.Write("<TD bgcolor=#D6D7E1>" + boldTagStart + oDataColumn.ColumnName + boldTagEnd + "</TD>");
					}
					else
					{
						htmlWriter.Write("<TD bgcolor=#D6D7E1>" + boldTagStart + oDataColumn.ColumnName + boldTagEnd + "</TD>");
					}
				}
				k++;
			}
			k = 0;
			htmlWriter.Write("</TR>");

			/*******************************************************************
			 * End, Creating table header
			 * *****************************************************************/
			#endregion

			for(k=0; k < sHeaders.Length; k++)
			{
				DataTable dtb =  SQLOps.SelectDistinct(oDataTable,sHeaders[k]);// Lay ra cac String trong Group
				string[,] sFileds = new string[sHeaders.Length,dtb.Rows.Count];
				l = 0;
				foreach(DataRow oDataRow in dtb.Rows)	
				{
					DataTable dt = CreateGroupByTable(oDataRow[0].ToString(),oDataTable,oDataRow[0].ToString(),sHeaders,k+1);
					ds2.Tables.Add(dt);
					sFileds[k,l] = oDataRow[0].ToString();
					l++;
				}
				#region Creating rows
				/*******************************************************************
				 * Start, Creating rows
				 * *****************************************************************/

				//+ sHeaders[i]
				for (int i = 0; i < ds2.Tables.Count; i++)
				{
				
					htmlWriter.Write("<TR>");
					htmlWriter.Write("<TD align=left colspan="+ds2.Tables[i].Columns.Count+">&nbsp;<b>" + sHeaders[0] + ": " +sFileds[0,i]+ "</b></TD>");
					htmlWriter.Write("</TR>");

					AddHTMLDataTable(htmlWriter,ds2.Tables[i]);
				}
			
				/*******************************************************************
				 * End, Creating rows
				 * *****************************************************************/
				#endregion
			}
			
			htmlWriter.Write("</Table>");
		}

		public void AddHTMLDataTable(HtmlTextWriter htmlWriter,DataTable oDataTable)
		{
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
		}
		public DataTable CreateGroupByTable(string TableName, DataTable SourceTable, string strGroupBy,string[] ColumnList, int iLanthu)
		{
			// ilanthu : cho biet dang o Group thu bao nhieu
			DataTable dt = new DataTable(TableName);
			int k = 1;
			int iLevel = ColumnList.Length;
			int[] l = new int[100];
			foreach(DataColumn oDataColumn in SourceTable.Columns)	
			{
				for (int i=0; i < iLevel; i++)
				{
					if (ColumnList[i] != oDataColumn.ColumnName) // Neu nam trong List Group
						dt.Columns.Add(oDataColumn.ColumnName);
					else
						l[k] = k;
				}
				k++;
			}
			
			foreach(DataRow oDataRow in SourceTable.Rows)	
			{
				k = 0;
				if (oDataRow[ColumnList[0]].ToString() == strGroupBy)	
				{
					string[] ii = new string[SourceTable.Columns.Count - iLevel];
					for ( int i = 0; i < SourceTable.Columns.Count; i++)
					{
						if (l[i+1] == 0 || l[i+1].ToString() == null)
						{
							ii[i-k] = oDataRow[i].ToString();
						}
						else
							k++;
					}

					dt.Rows.Add(ii);
				}

			}
			return dt;

		}
		public DataTable CreateGroupByTable(string TableName, DataTable SourceTable, int iGroupBy)
		{
			int l = 0;
			string strRowFirst = "";
			DataTable dt = new DataTable(TableName);
			foreach(DataColumn oDataColumn in SourceTable.Columns)	
			{
				dt.Columns.Add(oDataColumn.ColumnName);
			}
			foreach(DataRow oDataRow in SourceTable.Rows)	
			{
				if (l==0)
					strRowFirst = oDataRow[0].ToString();
				if (oDataRow[0].ToString() == strRowFirst)	
				{
					string[] ii = new string[SourceTable.Columns.Count];
					for ( int i = 0; i < SourceTable.Columns.Count; i++)
					{
						ii[i] = oDataRow[i].ToString();
					}

					//oDataRow
					dt.Rows.Add(ii);
				}
				l++;
			}
			return dt;
		}
		#endregion
		#region Export DataTable
		/// <summary>
		/// Xuất ra Excel Từ 1 DataTable
		/// </summary>
		/// <param name="oDataTable"></param>
		/// <param name="ReportHeader"></param>
		public virtual void ExportDataTable(DataTable oDataTable,string ReportHeader,string ReportFooter, string Type)
		{
			CurrentPage.Response.Clear();
			CurrentPage.Response.Buffer = true; 

			#region Type Export
			if (Type.ToLower() == "doc")
			{
				CurrentPage.Response.AddHeader("content-disposition", "attachment;filename=export.doc");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType = "application/vnd.word";
			}
			else if (Type.ToLower() == "txt")
			{
				CurrentPage.Response.AddHeader("content-disposition", 
					"attachment;filename=export.txt");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType = "application/vnd.text";
			}
			else
			{
				CurrentPage.Response.AddHeader( "Content-Disposition", "attachment; filename=export.xls");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType="application/vnd.ms-excel";
			}
			#endregion

			//Prepares the html and write it into a StringWriter
			StringWriter stringWriter = new StringWriter();
			HtmlTextWriter htmlWriter = new HtmlTextWriter(stringWriter);
			FrontDecorator(htmlWriter);
			//MyDataGrid.RenderControl(htmlWriter);
			StringBuilder oStringBuilder = new StringBuilder();

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
			

			htmlWriter.Write("<Table>");
			htmlWriter.Write("<TR>");
			htmlWriter.Write("<TD colspan="+oDataTable.Columns.Count.ToString()+" align=center><H3>");
			htmlWriter.Write(ReportHeader);// Report Name Header
			htmlWriter.Write("</H3></TD>");
			htmlWriter.Write("</TR>");
			htmlWriter.Write("<TR><TD><br></TD></TR>");
			htmlWriter.Write("</Table>");

			/********************************************************
			 * End,Check for bold heading
			 * ******************************************************/

			htmlWriter.Write("<Table border=" + borderWidth + ">");

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

			htmlWriter.Write("</Table>");

			htmlWriter.Write("<Table>");
			htmlWriter.Write("<TR>");
			htmlWriter.Write("<TD colspan="+oDataTable.Columns.Count.ToString()+" align=center>");
			htmlWriter.Write(ReportFooter);// Report Name Footer
			htmlWriter.Write("</TD>");
			htmlWriter.Write("</TR>");
			htmlWriter.Write("<TR><TD><br></TD></TR>");
			htmlWriter.Write("</Table>");


			RearDecorator(htmlWriter);

			//Write the content to the web browser
			//htmlWriter.WriteLine(oStringBuilder.ToString());
			CurrentPage.Response.Write(stringWriter.ToString());
			CurrentPage.Response.End();
		}
		#endregion
		#region Export DataTable TableHearder
		/// <summary>
		/// Xuất ra Excel Từ 1 DataTable, Header trong DataTable ẩn đi, truyền TableHearder từ ngoài vào
		/// </summary>
		/// <param name="oDataTable"></param>
		/// <param name="ReportHeader"></param>
		public virtual void ExportDataTable(DataTable oDataTable,string ReportHeader, string Type,string TableHeader, string[] RowList )
		{
			CurrentPage.Response.Clear();
			CurrentPage.Response.Buffer = true; 

			int iLevel = RowList.Length;

			#region Type Export
			if (Type.ToLower() == "doc")
			{
				CurrentPage.Response.AddHeader("content-disposition", "attachment;filename=export.doc");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType = "application/vnd.word";
			}
			else if (Type.ToLower() == "txt")
			{
				CurrentPage.Response.AddHeader("content-disposition", 
					"attachment;filename=export.txt");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType = "application/vnd.text";
			}
			else
			{
				CurrentPage.Response.AddHeader( "Content-Disposition", "attachment; filename=export.xls");
				CurrentPage.Response.Charset = "";
				CurrentPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
				CurrentPage.Response.ContentType="application/vnd.ms-excel";
			}
			#endregion

			//Prepares the html and write it into a StringWriter
			StringWriter stringWriter = new StringWriter();
			HtmlTextWriter htmlWriter = new HtmlTextWriter(stringWriter);
			FrontDecorator(htmlWriter);
			//MyDataGrid.RenderControl(htmlWriter);
			StringBuilder oStringBuilder = new StringBuilder();

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
			

			htmlWriter.Write("<Table>");
			htmlWriter.Write("<TR>");
			htmlWriter.Write("<TD colspan="+oDataTable.Columns.Count.ToString()+" align=center><H3>");
			htmlWriter.Write(ReportHeader);// Report Name Header
			htmlWriter.Write("</H3></TD>");
			htmlWriter.Write("</TR>");
			htmlWriter.Write("<TR><TD><br></TD></TR>");
			htmlWriter.Write("</Table>");

			/********************************************************
			 * End,Check for bold heading
			 * ******************************************************/

			htmlWriter.Write("<Table border=" + borderWidth + ">");

			/*******************************************************************
			 * Start, Creating table header
			 * *****************************************************************/

			
			htmlWriter.Write("<TR>");

//			foreach(DataColumn oDataColumn in oDataTable.Columns)	
//			{
//				htmlWriter.Write("<TD bgcolor=#D6D7E1>" + boldTagStart + oDataColumn.ColumnName + boldTagEnd + "</TD>");
//			}
			htmlWriter.Write(TableHeader);
			htmlWriter.Write("</TR>");

			/*******************************************************************
			 * End, Creating table header
			 * *****************************************************************/

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



			htmlWriter.Write("</Table>");

			RearDecorator(htmlWriter);

			//Write the content to the web browser
			//htmlWriter.WriteLine(oStringBuilder.ToString());
			CurrentPage.Response.Write(stringWriter.ToString());
			CurrentPage.Response.End();
		}
		#endregion
		
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

		private DataTable sortTable(DataTable table)
		{
			DataTable t = null;
			t = table.Copy();
			t.DefaultView.Sort=t.Columns[0].ColumnName+" asc";
			return t;
		}
		private DataTable SortDataTable(DataTable dt, string sort)
		{
			DataTable newDT = dt.Clone();
			int rowCount = dt.Rows.Count;

			DataRow[] foundRows = dt.Select(null, sort); // Sort with Column name
			for (int i = 0 ; i < rowCount; i++)
			{
				object[] arr = new object[dt.Columns.Count];
				for (int j = 0; j < dt.Columns.Count; j++)
				{
					arr[j]=foundRows[i][j];
				}
				DataRow data_row = newDT.NewRow();
				data_row.ItemArray=arr;
				newDT.Rows.Add(data_row);
			}

//			//clear the incoming dt
//			dt.Rows.Clear();
//
//			for(int i = 0; i < newDT.Rows.Count; i++)
//			{
//				object[] arr = new object[dt.Columns.Count];
//				for (int j = 0; j < dt.Columns.Count; j++)
//				{
//					arr[j]=newDT.Rows[i][j];
//				}
//
//				DataRow data_row = dt.NewRow();
//				data_row.ItemArray = arr;
//				dt.Rows.Add(data_row);
//			}

			return newDT;
		}
	}
	/// <summary>
	/// HTML Encodes an entire DataGrid. 
	/// It iterates through each cell in the TableRow, ensuring that all 
	/// the text being displayed is HTML Encoded, irrespective of whether 
	/// they are just plain text, buttons, HyperLinks, multiple controls etc..
	/// </summary>
	public class CellFormater
	{
		/// <summary>
		/// Constructs an instance of the CellFormater class.
		/// </summary>
		public CellFormater()
		{
			//
			// TODO: Add constructor logic here
			//
			
		}

		/// <summary>
		/// Method that HTML Encodes an entire DataGrid. 
		/// It iterates through each cell in the TableRow, ensuring that all 
		/// the text being displayed is HTML Encoded, irrespective of whether 
		/// they are just plain text, buttons, HyperLinks, multiple controls etc..
		/// <seealso cref="System.Web.UI.WebControls.DataGrid.ItemDataBound">DataGrid.ItemDataBound Event</seealso>
		/// </summary>
		/// <param name="item">
		/// The DataGridItem that is currently being bound in the calling Web 
		/// Page's DataGrid.ItemDataBound Event.
		/// </param>
		/// <remarks>
		/// This method should be called from the 
		/// <c>DataGrid_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)</c> 
		/// event in the respective Web View Codebehind.
		/// </remarks>
		/// <example>
		///          We want to HTMLEncode a complete DataGrid (all columns and all 
		///          rows that may/do contain characters that will require encoding 
		///          for display in HTML) called dgIssues.
		///          Use the following code for the ItemDataBound Event:
		///          <code>
		///               private void dgIssues_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		///               {
		///                    WebMethod wm = new WebMethod();
		///                    wm.DataGrid_ItemDataBound_HTMLEncode((DataGridItem) e.Item);
		///               }//dgIssues_ItemDataBound
		///          </code>
		/// </example>
		public void AdHocHTMLEncode(System.Web.UI.WebControls.DataGridItem item)
		{
			bool doHTMLEncode = false;
			switch (item.ItemType)
			{                         
					#region DataBound
					//The following case statements are in ascending TableItemStyle order.
					//See ms-help://MS.VSCC/MS.MSDNVS/cpref/html/frlrfsystemwebuiwebcontrolsdatagridclassitemstyletopic.htm for details.
				case System.Web.UI.WebControls.ListItemType.Item:
				{
					doHTMLEncode = true;
					break;
				}//ListItemType.Item
				case System.Web.UI.WebControls.ListItemType.AlternatingItem:
				{					
					doHTMLEncode = true;
					break;
				}//ListItemType.AlternatingItem
				case System.Web.UI.WebControls.ListItemType.SelectedItem:
				{
					doHTMLEncode = true;
					break;
				}//ListItemType.SelectedItem					
				case System.Web.UI.WebControls.ListItemType.EditItem:
				{
					//These should not be prone to this as TextBoxes aren't.
					doHTMLEncode = false;
					break;
				}//ListItemType.EditItem
					#endregion DataBound
					#region Non-DataBound
					//The remainder are the other ListItemTypes that are non-Data-bound.
				case System.Web.UI.WebControls.ListItemType.Header:
				{
					//We might have specified Headers like "<ID>".
					doHTMLEncode = true;
					break;
				}//ListItemType.Header
				case System.Web.UI.WebControls.ListItemType.Footer:
				{
					//Similarly for the Footer as with the Header.
					doHTMLEncode = true;

					break;
				}//ListItemType.Footer
				case System.Web.UI.WebControls.ListItemType.Pager:
				{
					//With just numbers or buttons, none is required.
					//However, for buttons, this is not strictly true as you 
					//need to specify the text on the buttons. But the Property 
					//Builder for the DataGrid hints in its defaults that these 
					//need to be HTMLencoded anyway.
					doHTMLEncode = false;
					break;
				}//ListItemType.Pager
				case System.Web.UI.WebControls.ListItemType.Separator:
				{
					doHTMLEncode = false;
					break;
				}//ListItemType.Separator
					#endregion Non-DataBound
				default:
				{
					//This will never be executed as all ItemTypes are listed above.
					break;
				}//default
			}//switch

			if (doHTMLEncode)
			{
				//Encode the cells dependent on the type of content 
				//within (e.g. BoundColumn, HyperLink), taking into account 
				//that there may be more than one (or even zero) control in 
				//each cell.
				System.Web.UI.WebControls.TableCellCollection cells = (System.Web.UI.WebControls.TableCellCollection)item.Cells;
				foreach (System.Web.UI.WebControls.TableCell cell in cells)
				{
					if (cell.Controls.Count != 0)
					{
						foreach (System.Web.UI.Control ctrl in cell.Controls)
						{
							if (ctrl is Button)
							{
								Button btn = (Button) ctrl;
								btn.Text = HttpUtility.HtmlEncode(btn.Text);
							}//if
							else if (ctrl is HyperLink)
							{
								HyperLink hyp = (HyperLink) ctrl;
								hyp.Text = HttpUtility.HtmlEncode(hyp.Text);
								//hyp.NavigateUrl = HttpUtility.UrlEncode(hyp.NavigateUrl);
							}//else if
							else if (ctrl is LinkButton)
							{
								LinkButton lb = (LinkButton) ctrl;
								lb.Text = HttpUtility.HtmlEncode(lb.Text);
							}//else if
								// this check is for to change the forecolor of REJECTED activities to red
							else if(ctrl is Label)
							{
								Label objL = (Label)ctrl;
								if(objL.Text == "REJECTED")
									objL.ForeColor = System.Drawing.Color.Red;
							}//else if
						}//foreach
					}//if
					else
					{
						//The cell is a BoundColumn.
						if (cell.Text.ToLower().Trim()!="&nbsp;") 
							cell.Text = HttpUtility.HtmlEncode(cell.Text);
						
					}//else
				}//foreach
			}//if
		}//DataGrid_ItemDataBound_HTMLEncode
	}	
}
