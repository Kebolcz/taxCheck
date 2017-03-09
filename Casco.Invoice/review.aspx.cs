using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace Casco.Invoice
{
    public partial class review : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }


        protected void search_Click(object sender, EventArgs e)
        {
            //发票类型代码:00所有/01专票/04普票
            string invoiceType = this.DropDownList1.SelectedValue.ToString();
            //起始日期
            string startDate = this.startDate.Text;
            //结束日期
            string endDate = this.endDate.Text;
            string operatorID = Request.LogonUserIdentity.Name;
            if (invoiceType != "" && startDate != "" && endDate != "" && operatorID != "")
            {
                DataSet ds = DataOperate.queryInvoiceInfo(invoiceType, startDate, endDate, operatorID);
                GridView1.DataSource = ds.Tables[0];
                GridView1.DataKeyNames = new string[] { "InvoiceCode", "InvoiceNumber" };//主键
                GridView1.DataBind();
                if (!(ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0))
                {
                    Response.Write("<script language=javascript>alert('该时间段内没有该类型发票!');</script>");
                }
            }
            else
            {
                Response.Write("<script language=javascript>alert('请完善查询起止日期!');</script>");
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //GridView1.PageIndex = e.NewPageIndex;
            //GridView1.DataBind();
            // 得到该控件
            GridView theGrid = sender as GridView;
            int newPageIndex = 0;
            if (e.NewPageIndex == -3)
            {
                //点击了Go按钮
                TextBox txtNewPageIndex = null;

                //GridView较DataGrid提供了更多的API，获取分页块可以使用BottomPagerRow 或者TopPagerRow，当然还增加了HeaderRow和FooterRow
                GridViewRow pagerRow = theGrid.BottomPagerRow;

                if (pagerRow != null)
                {
                    //得到text控件
                    txtNewPageIndex = pagerRow.FindControl("txtNewPageIndex") as TextBox;
                }
                if (txtNewPageIndex != null)
                {
                    //得到索引
                    newPageIndex = int.Parse(txtNewPageIndex.Text) - 1;
                }
            }
            else
            {
                //点击了其他的按钮
                newPageIndex = e.NewPageIndex;
            }
            //防止新索引溢出
            newPageIndex = newPageIndex < 0 ? 0 : newPageIndex;
            newPageIndex = newPageIndex >= theGrid.PageCount ? theGrid.PageCount - 1 : newPageIndex;

            //得到新的值
            theGrid.PageIndex = newPageIndex;

            //发票类型代码:00所有/01专票/04普票
            string invoiceType = this.DropDownList1.SelectedValue.ToString();
            //起始日期
            string startDate = this.startDate.Text;
            //结束日期
            string endDate = this.endDate.Text;
            string operatorID = Request.LogonUserIdentity.Name;
            if (invoiceType != "" && startDate != "" && endDate != "" && operatorID != "")
            {
                //重新绑定
                DataSet ds = DataOperate.queryInvoiceInfo(invoiceType, startDate, endDate, operatorID);
                GridView1.DataSource = ds.Tables[0];
                GridView1.DataKeyNames = new string[] { "InvoiceCode", "InvoiceNumber" };//主键
                theGrid.DataBind();
                if (!(ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0))
                {
                    Response.Write("<script language=javascript>alert('该时间段内没有该类型发票!');</script>");
                }
            }
            else
            {
                Response.Write("<script language=javascript>alert('请完善查询起止日期!');</script>");
            }
        }

        protected void export_Click(object sender, EventArgs e)
        {
            string style = @"<style type=""text/css"">td{mso-number-format:'\@';text-align:center;}</style>";

            //从页面取到查询条件  
            //发票类型代码:00所有/01专票/04普票
            string invoiceType = this.DropDownList1.SelectedValue.ToString();
            //起始日期
            string startDate = this.startDate.Text;
            //结束日期
            string endDate = this.endDate.Text;
            //填充数据源  
            string operatorID = Request.LogonUserIdentity.Name;
            if (invoiceType != "" && startDate != "" && endDate != "" && operatorID != "")
            {
                DataSet ds = DataOperate.exportInvoiceInfo(invoiceType, startDate, endDate, operatorID);
                if (!(ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0))
                {
                    Response.Write("<script language=javascript>alert('该时间段内没有该类型发票!');</script>");
                }
                else
                {
                    Response.ClearContent();
                    //Response.Buffer = true;
                    //Response.Charset = "gb2312";
                    //Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
                    Response.Charset = "UTF-8";
                    Response.ContentEncoding = System.Text.Encoding.UTF8;
                    Response.AddHeader("content-disposition", "attachment; filename=export.xls");
                    Response.ContentType = "application/ms-excel";
                    StringWriter sw = new StringWriter();
                    HtmlTextWriter htw = new HtmlTextWriter(sw);
                    StringWriter sw2 = new StringWriter();
                    HtmlTextWriter htw2 = new HtmlTextWriter(sw2);
                    //导出前将GridView排序和分页都关闭  
                    GridView1.AllowPaging = false;
                    GridView1.AllowSorting = false;
                    GridView1.DataSource = ds.Tables[0];
                    GridView2.DataSource = ds.Tables[1];
                    //绑定数据源  
                    GridView1.DataBind();
                    GridView2.DataBind();
                    // 清除GridView1中的所有控件，以便导出Excel
                    ClearControls(GridView1);
                    GridView1.RenderControl(htw);
                    GridView2.RenderControl(htw2);
                    //Style为导出Excel时的格式（有个五六种吧，去网上查一下）  
                    Response.Write(style);
                    Response.Write(sw.ToString());
                    Response.Write(sw2.ToString());
                    Response.Flush();
                    Response.End();
                    //导出前将GridView分页打开  
                    GridView1.AllowPaging = true;
                    GridView1.AllowSorting = false;
                    //重新绑定数据源  
                    //DataSet ds = DataOperate.queryInvoiceInfo("61106", "20170101", "20171231");
                    GridView1.DataSource = ds.Tables[0];
                    GridView1.DataKeyNames = new string[] { "InvoiceCode", "InvoiceNumber" };//主键
                    GridView1.DataBind();
                }
            }
            else
            {
                Response.Write("<script language=javascript>alert('请完善查询起止日期!');</script>");
            }
        }

        /// <summary>
        /// 清除控件中的所有控件，以便导出Excel
        /// </summary>
        /// <param name="control"></param>
        private void ClearControls(Control control)
        {
            for (int i = control.Controls.Count - 1; i >= 0; i--)
            {
                ClearControls(control.Controls[i]);
            }

            if (!(control is TableCell))
            {
                if (control.GetType().GetProperty("SelectedItem") != null)
                {
                    LiteralControl literal = new LiteralControl();
                    control.Parent.Controls.Add(literal);
                    try
                    {
                        literal.Text = (string)control.GetType().GetProperty("SelectedItem").GetValue(control, null);
                    }
                    catch
                    {
                    }
                    control.Parent.Controls.Remove(control);
                }
                else if (control.GetType().GetProperty("Text") != null)
                {
                    LiteralControl literal = new LiteralControl();
                    control.Parent.Controls.Add(literal);
                    literal.Text = (string)control.GetType().GetProperty("Text").GetValue(control, null);
                    control.Parent.Controls.Remove(control);
                }
            }
            return;
        }

        /// <summary>  
        /// 重写一下，导出为excel时不会报错  
        /// </summary>  
        /// <param name="control"></param>  
        public override void VerifyRenderingInServerForm(Control control)
        { }

        //报警删除
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string key1 = GridView1.DataKeys[e.RowIndex].Values[0].ToString();
            string key2 = GridView1.DataKeys[e.RowIndex].Values[1].ToString();

            int flag = DataOperate.deleteInvoiceInfo(key1, key2);
            if (flag > 0)
            {
                string invoiceType = this.DropDownList1.SelectedValue.ToString();
                //起始日期
                string startDate = this.startDate.Text;
                //结束日期
                string endDate = this.endDate.Text;
                //string endDate = this.DropDownList_DepotType.SelectedValue;
                //填充数据源  
                //GridView1.DataSource = CheckStatBll.getCheckStatByCondition(materialType, depotId, depotType, goodsName);
                string operatorID = Request.LogonUserIdentity.Name;
                DataSet ds = DataOperate.exportInvoiceInfo(invoiceType, startDate, endDate, operatorID);
                DataSet ds1 = DataOperate.queryInvoiceInfo(invoiceType, startDate, endDate, operatorID);
                GridView1.DataSource = ds1.Tables[0];
                GridView1.DataKeyNames = new string[] { "InvoiceCode", "InvoiceNumber" };//主键
                GridView1.DataBind();
                GridView2.DataSource = ds.Tables[1];
                GridView2.DataBind();
                Response.Write("<script language=javascript>alert('删除发票代码:" + key1 + ",号码:" + key2 + "记录成功!');</script>");
            }
            else
                Response.Write("<script language=javascript>alert('删除发票记录失败!');</script>");
        }


        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowIndex != -1)
            {
                int ID = e.Row.RowIndex + 1;
                e.Row.Cells[0].Text = ID.ToString();
            }
            //如果是绑定数据行 
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
                {
                    ((LinkButton)e.Row.Cells[16].Controls[0]).Attributes.Add("onclick", "javascript:return confirm('你确认要删除：" + e.Row.Cells[2].Text.Trim() + "吗?操作不可逆!')");
                }
            }
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowIndex != -1)
            {
                int ID = e.Row.RowIndex + 1;
                e.Row.Cells[0].Text = ID.ToString();
            }
        }
    }
}