using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Script;
using System.Web.Script.Services;
using System.Web.Services;
namespace Casco.Invoice
{
    public partial class Verification : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string result = "";
                try
                {
                    string OperatorID = Request.LogonUserIdentity.Name;
                    if (OperatorID != "")
                    {
                        DataSet ds = DataOperate.JudgeHasAuth(OperatorID);
                        if (ds != null && ds.Tables[0].Rows.Count > 0)
                        {
                            result = "<script language=javascript>alert('授权登录!');</script>";
                        }
                        else
                        {
                            result = "<script language=javascript>alert('查无权限!');window.location='./NoAuth.html';</script>";
                            Response.Write(result);
                            Response.End();
                        }
                    }
                    else {
                        result = "<script language=javascript>alert('登录失效!');window.location='./NoAuth.html';</script>";
                        Response.Write(result);
                        Response.End();
                    }

                }
                catch (Exception ex) {
                    result = "<script language=javascript>alert('"+ ex.Message + "');window.location='./NoAuth.html';</script>";
                    Response.Write(result);
                    Response.End();
                }
                Response.Write(result);
            }
        }
    }
}