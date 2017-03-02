using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Casco.Invoice
{
    public partial class Verification : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string json = "";
            if (Request.Form.Count > 20)
            {

                InvoiceInfo info = new InvoiceInfo();
                #region 数据
                if (Request.Form["pData[InvoiceProvince]"] != null)
                {
                    info.InvoiceProvince = Request.Form["pData[InvoiceProvince]"];
                }
                if (Request.Form["pData[InvoiceType]"] != null)
                {
                    info.InvoiceType = Request.Form["pData[InvoiceType]"];
                }
                if (Request.Form["pData[InvoiceCode]"] != null)
                {
                    info.InvoiceCode = Request.Form["pData[InvoiceCode]"];
                }
                if (Request.Form["pData[InvoiceNumber]"] != null)
                {
                    info.InvoiceNumber = Request.Form["pData[InvoiceNumber]"]; 
                }
                if (Request.Form["pData[InvoiceDate]"] != null)
                {
                    info.InvoiceDate = Request.Form["pData[InvoiceDate]"];
                }
                if (Request.Form["pData[CheckCode]"] != null)
                {
                    info.CheckCode = Request.Form["pData[CheckCode]"];
                }
                if (Request.Form["pData[MachineNumber]"] != null)
                {
                    info.MachineNumber = Request.Form["pData[MachineNumber]"];
                }
                if (Request.Form["pData[GName]"] != null)
                {
                    info.GName = Request.Form["pData[GName]"];
                }
                if (Request.Form["pData[GIdentificationCode]"] != null)
                {
                    info.GIdentificationCode = Request.Form["pData[GIdentificationCode]"];
                }
                if (Request.Form["pData[GAddressPhone]"] != null)
                {
                    info.GAddressPhone = Request.Form["pData[GAddressPhone]"];
                }
                if (Request.Form["pData[GBankAccount]"] != null)
                {
                    info.GBankAccount = Request.Form["pData[GBankAccount]"];
                }
                if (Request.Form["pData[PasswordArea]"] != null)
                {
                    info.PasswordArea = Request.Form["pData[PasswordArea]"];
                }
                if (Request.Form["pData[TotalPriceB]"] != null)
                {
                    info.TotalPriceB = Request.Form["pData[TotalPriceB]"];
                }
                if (Request.Form["pData[TotalPriceS]"] != null)
                {
                    info.TotalPriceS = Request.Form["pData[TotalPriceS]"];
                }
                if (Request.Form["pData[XName]"] != null)
                {
                    info.XName = Request.Form["pData[XName]"];
                }
                if (Request.Form["pData[XIdentificationCode]"] != null)
                {
                    info.XIdentificationCode = Request.Form["pData[XIdentificationCode]"];
                }
                if (Request.Form["pData[XAddressPhone]"] != null)
                {
                    info.XAddressPhone = Request.Form["pData[XAddressPhone]"];
                }
                if (Request.Form["pData[XBankAccount]"] != null)
                {
                    info.XBankAccount = Request.Form["pData[XBankAccount]"];
                }
                if (Request.Form["pData[InspectionTimes]"] != null)
                {
                    info.InspectionTimes = Request.Form["pData[InspectionTimes]"];
                }
                if (Request.Form["pData[InspectionTime]"] != null)
                {
                    info.InspectionTime = Request.Form["pData[InspectionTime]"];
                }
                if (Request.Form["pData[Remark]"] != null)
                {
                    info.Remark = Request.Form["pData[Remark]"];
                }
                info.OperatorID = Request.LogonUserIdentity.Name;
                #endregion
                List<InvoiceSubInfo> LsubInfo = new List<InvoiceSubInfo>();
                if (Request.Form["pData[InvoiceSubInfo][0][InvoiceCode]"] != null)
                {
                    for (int i = 0; i < 100; i++)
                    {
                        InvoiceSubInfo subInfo = new InvoiceSubInfo();
                        #region 子数据
                        if (string.IsNullOrEmpty(Request.Form["pData[InvoiceSubInfo][" + i + "][InvoiceCode]"]))
                        {
                            break;
                        }
                        if (Request.Form["pData[InvoiceSubInfo][" + i + "][InvoiceCode]"] != null)
                        {
                            subInfo.InvoiceCode = Request.Form["pData[InvoiceSubInfo][" + i + "][InvoiceCode]"];
                        }
                        if (Request.Form["pData[InvoiceSubInfo][" + i + "][InvoiceNumber]"] != null)
                        {
                            subInfo.InvoiceNumber = Request.Form["pData[InvoiceSubInfo][" + i + "][InvoiceNumber]"];
                        }
                        if (Request.Form["pData[InvoiceSubInfo][" + i + "][CheckCode]"] != null)
                        {
                            subInfo.CheckCode = Request.Form["pData[InvoiceSubInfo][" + i + "][CheckCode]"];
                        }
                        if (Request.Form["pData[InvoiceSubInfo][" + i + "][MachineNumber]"] != null)
                        {
                            subInfo.MachineNumber = Request.Form["pData[InvoiceSubInfo][" + i + "][MachineNumber]"];
                        }
                        if (Request.Form["pData[InvoiceSubInfo][" + i + "][NO]"] != null)
                        {
                            subInfo.NO = i.ToString();
                        }
                        if (Request.Form["pData[InvoiceSubInfo][" + i + "][GoodsName]"] != null)
                        {
                            subInfo.GoodsName = Request.Form["pData[InvoiceSubInfo][" + i + "][GoodsName]"];
                        }
                        if (Request.Form["pData[InvoiceSubInfo][" + i + "][SpecificationModel]"] != null)
                        {
                            subInfo.SpecificationModel = Request.Form["pData[InvoiceSubInfo][" + i + "][SpecificationModel]"];
                        }
                        if (Request.Form["pData[InvoiceSubInfo][" + i + "][Unit]"] != null)
                        {
                            subInfo.Unit = Request.Form["pData[InvoiceSubInfo][" + i + "][Unit]"];
                        }
                        if (Request.Form["pData[InvoiceSubInfo][" + i + "][Quantity]"] != null)
                        {
                            subInfo.Quantity = Request.Form["pData[InvoiceSubInfo][" + i + "][Quantity]"];
                        }
                        if (Request.Form["pData[InvoiceSubInfo][" + i + "][UnitPrice]"] != null)
                        {
                            subInfo.UnitPrice = Request.Form["pData[InvoiceSubInfo][" + i + "][UnitPrice]"];
                        }
                        if (Request.Form["pData[InvoiceSubInfo][" + i + "][Money]"] != null)
                        {
                            subInfo.Money = Request.Form["pData[InvoiceSubInfo][" + i + "][Money]"];
                        }
                        if (Request.Form["pData[InvoiceSubInfo][" + i + "][TaxRate]"] != null)
                        {
                            subInfo.TaxRate = Request.Form["pData[InvoiceSubInfo][" + i + "][TaxRate]"];
                        }
                        if (Request.Form["pData[InvoiceSubInfo][" + i + "][Tax]"] != null)
                        {
                            subInfo.Tax = Request.Form["pData[InvoiceSubInfo][" + i + "][Tax]"];
                        }
                        if (Request.Form["pData[InvoiceSubInfo][" + i + "][Total]"] != null)
                        {
                            subInfo.Total = Request.Form["pData[InvoiceSubInfo][" + i + "][Total]"];
                        }
                        if (Request.Form["pData[InvoiceSubInfo][" + i + "][TotalTax]"] != null)
                        {
                            subInfo.TotalTax = Request.Form["pData[InvoiceSubInfo][" + i + "][TotalTax]"];
                        }
                        #endregion 
                        LsubInfo.Add(subInfo);
                    }
                    info.SubInfo = LsubInfo;
                }
                if (info.InvoiceCode != "")
                {
                    DataSet ds = DataOperate.JudgeInvoiceInfo(info);
                    if (ds != null && ds.Tables[0].Rows.Count > 0)
                    {
                        json = "{success:'false',inf:'发票重复'}";
                    }
                    else
                    {
                        if (info.InvoiceType == "01")
                        {
                            DataSet dss = DataOperate.JudgeInvoiceInfoYN(info);
                            if (dss != null && dss.Tables[0].Rows.Count > 0)
                            {
                                int result = DataOperate.InsertInvoiceInfo(info);
                                if (result > 0)
                                {
                                    json = "{success:'true',inf:'发票校验成功'}";
                                }
                                else
                                {
                                    json = "{success:'false',inf:'发票数据存储出错'}";
                                }

                            }
                            else
                            {
                                json = "{success:'false',inf:'发票名称有误'}";
                            }
                        }
                        else
                        {
                            //DataSet dsss = DataOperate.JudgeInvoiceInfoName(info);
                            //if (dsss != null && dsss.Tables[0].Rows.Count > 0)
                            //{
                                int result = DataOperate.InsertInvoiceInfo(info);
                                if (result > 0)
                                {
                                    json = "{success:'true',inf:'发票校验成功'}";
                                }
                                else
                                {
                                    json = "{success:'false',inf:'发票数据存储出错'}";
                                }
                            //}
                            //else
                            //{
                            //    json = "{success:'false',inf:'发票名称有误'}";
                            //}
                        }
                    }
                }
                Response.Write(json);
                Response.End();
            }
        }
    }
}