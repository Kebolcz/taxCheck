using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace Casco.Invoice
{
    /// <summary>
    /// taxOperateHandler 的摘要说明
    /// </summary>
    public class taxOperateHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            string json = "";
            string operatorID = context.Request.LogonUserIdentity.Name;
            if (context.Request["method"] != null)
            {
                try
                {
                    switch (context.Request.QueryString["method"])
                    {
                        case "checkMethod":
                            InvoiceInfo info = new InvoiceInfo();
                            #region 数据
                            if (context.Request.Form["pData[InvoiceProvince]"] != null)
                            {
                                info.InvoiceProvince = context.Request.Form["pData[InvoiceProvince]"];
                            }
                            if (context.Request.Form["pData[djsys]"] != null)
                            {
                                info.Djsys = context.Request.Form["pData[djsys]"];
                            }
                            if (context.Request.Form["pData[InvoiceType]"] != null)
                            {
                                info.InvoiceType = context.Request.Form["pData[InvoiceType]"];
                            }
                            if (context.Request.Form["pData[InvoiceCode]"] != null)
                            {
                                info.InvoiceCode = context.Request.Form["pData[InvoiceCode]"];
                            }
                            if (context.Request.Form["pData[InvoiceNumber]"] != null)
                            {
                                info.InvoiceNumber = context.Request.Form["pData[InvoiceNumber]"];
                            }
                            if (context.Request.Form["pData[InvoiceDate]"] != null)
                            {
                                info.InvoiceDate = context.Request.Form["pData[InvoiceDate]"];
                            }
                            if (context.Request.Form["pData[CheckCode]"] != null)
                            {
                                info.CheckCode = context.Request.Form["pData[CheckCode]"];
                            }
                            if (context.Request.Form["pData[MachineNumber]"] != null)
                            {
                                info.MachineNumber = context.Request.Form["pData[MachineNumber]"];
                            }
                            if (context.Request.Form["pData[GName]"] != null)
                            {
                                info.GName = context.Request.Form["pData[GName]"];
                            }
                            if (context.Request.Form["pData[GIdentificationCode]"] != null)
                            {
                                info.GIdentificationCode = context.Request.Form["pData[GIdentificationCode]"];
                            }
                            if (context.Request.Form["pData[GAddressPhone]"] != null)
                            {
                                info.GAddressPhone = context.Request.Form["pData[GAddressPhone]"];
                            }
                            if (context.Request.Form["pData[GBankAccount]"] != null)
                            {
                                info.GBankAccount = context.Request.Form["pData[GBankAccount]"];
                            }
                            if (context.Request.Form["pData[PasswordArea]"] != null)
                            {
                                info.PasswordArea = context.Request.Form["pData[PasswordArea]"];
                            }
                            if (context.Request.Form["pData[TotalPriceB]"] != null)
                            {
                                info.TotalPriceB = context.Request.Form["pData[TotalPriceB]"];
                            }
                            if (context.Request.Form["pData[TotalPriceS]"] != null)
                            {
                                info.TotalPriceS = context.Request.Form["pData[TotalPriceS]"];
                            }
                            if (context.Request.Form["pData[XName]"] != null)
                            {
                                info.XName = context.Request.Form["pData[XName]"];
                            }
                            if (context.Request.Form["pData[XIdentificationCode]"] != null)
                            {
                                info.XIdentificationCode = context.Request.Form["pData[XIdentificationCode]"];
                            }
                            if (context.Request.Form["pData[XAddressPhone]"] != null)
                            {
                                info.XAddressPhone = context.Request.Form["pData[XAddressPhone]"];
                            }
                            if (context.Request.Form["pData[XBankAccount]"] != null)
                            {
                                info.XBankAccount = context.Request.Form["pData[XBankAccount]"];
                            }
                            if (context.Request.Form["pData[InspectionTimes]"] != null)
                            {
                                info.InspectionTimes = context.Request.Form["pData[InspectionTimes]"];
                            }
                            if (context.Request.Form["pData[InspectionTime]"] != null)
                            {
                                info.InspectionTime = context.Request.Form["pData[InspectionTime]"];
                            }
                            if (context.Request.Form["pData[Remark]"] != null)
                            {
                                info.Remark = context.Request.Form["pData[Remark]"];
                            }
                            info.OperatorID = context.Request.LogonUserIdentity.Name;
                            #endregion
                            List<InvoiceSubInfo> LsubInfo = new List<InvoiceSubInfo>();
                            if (context.Request.Form["pData[InvoiceSubInfo][0][InvoiceCode]"] != null)
                            {
                                for (int i = 0; i < 100; i++)
                                {
                                    InvoiceSubInfo subInfo = new InvoiceSubInfo();
                                    #region 子数据
                                    if (string.IsNullOrEmpty(context.Request.Form["pData[InvoiceSubInfo][" + i + "][InvoiceCode]"]))
                                    {
                                        break;
                                    }
                                    if (context.Request.Form["pData[InvoiceSubInfo][" + i + "][InvoiceCode]"] != null)
                                    {
                                        subInfo.InvoiceCode = context.Request.Form["pData[InvoiceSubInfo][" + i + "][InvoiceCode]"];
                                    }
                                    if (context.Request.Form["pData[InvoiceSubInfo][" + i + "][InvoiceNumber]"] != null)
                                    {
                                        subInfo.InvoiceNumber = context.Request.Form["pData[InvoiceSubInfo][" + i + "][InvoiceNumber]"];
                                    }
                                    if (context.Request.Form["pData[InvoiceSubInfo][" + i + "][CheckCode]"] != null)
                                    {
                                        subInfo.CheckCode = context.Request.Form["pData[InvoiceSubInfo][" + i + "][CheckCode]"];
                                    }
                                    if (context.Request.Form["pData[InvoiceSubInfo][" + i + "][MachineNumber]"] != null)
                                    {
                                        subInfo.MachineNumber = context.Request.Form["pData[InvoiceSubInfo][" + i + "][MachineNumber]"];
                                    }
                                    if (context.Request.Form["pData[InvoiceSubInfo][" + i + "][NO]"] != null)
                                    {
                                        subInfo.NO = i.ToString();
                                    }
                                    if (context.Request.Form["pData[InvoiceSubInfo][" + i + "][GoodsName]"] != null)
                                    {
                                        subInfo.GoodsName = context.Request.Form["pData[InvoiceSubInfo][" + i + "][GoodsName]"];
                                    }
                                    if (context.Request.Form["pData[InvoiceSubInfo][" + i + "][SpecificationModel]"] != null)
                                    {
                                        subInfo.SpecificationModel = context.Request.Form["pData[InvoiceSubInfo][" + i + "][SpecificationModel]"];
                                    }
                                    if (context.Request.Form["pData[InvoiceSubInfo][" + i + "][Unit]"] != null)
                                    {
                                        subInfo.Unit = context.Request.Form["pData[InvoiceSubInfo][" + i + "][Unit]"];
                                    }
                                    if (context.Request.Form["pData[InvoiceSubInfo][" + i + "][Quantity]"] != null)
                                    {
                                        subInfo.Quantity = context.Request.Form["pData[InvoiceSubInfo][" + i + "][Quantity]"];
                                    }
                                    if (context.Request.Form["pData[InvoiceSubInfo][" + i + "][UnitPrice]"] != null)
                                    {
                                        subInfo.UnitPrice = context.Request.Form["pData[InvoiceSubInfo][" + i + "][UnitPrice]"];
                                    }
                                    if (context.Request.Form["pData[InvoiceSubInfo][" + i + "][Money]"] != null)
                                    {
                                        subInfo.Money = context.Request.Form["pData[InvoiceSubInfo][" + i + "][Money]"];
                                    }
                                    if (context.Request.Form["pData[InvoiceSubInfo][" + i + "][TaxRate]"] != null)
                                    {
                                        subInfo.TaxRate = context.Request.Form["pData[InvoiceSubInfo][" + i + "][TaxRate]"];
                                    }
                                    if (context.Request.Form["pData[InvoiceSubInfo][" + i + "][Tax]"] != null)
                                    {
                                        subInfo.Tax = context.Request.Form["pData[InvoiceSubInfo][" + i + "][Tax]"];
                                    }
                                    if (context.Request.Form["pData[InvoiceSubInfo][" + i + "][Total]"] != null)
                                    {
                                        subInfo.Total = context.Request.Form["pData[InvoiceSubInfo][" + i + "][Total]"];
                                    }
                                    if (context.Request.Form["pData[InvoiceSubInfo][" + i + "][TotalTax]"] != null)
                                    {
                                        subInfo.TotalTax = context.Request.Form["pData[InvoiceSubInfo][" + i + "][TotalTax]"];
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
                                    json += "{success:'false',inf:'发票重复',plus:'";

                                    NetLog.WriteTextLog(operatorID, "【查验发票】", "【发票重复】："+ info.InvoiceNumber);
                                    DataView dv = ds.Tables[0].DefaultView;
                                    foreach (DataRowView rowview in dv)
                                    {
                                        for (int i = 0; i < dv.Table.Columns.Count; i++)
                                        {
                                            json += rowview[i] + ",";
                                        }
                                    }
                                    json = json.Remove(json.Length - 1, 1);
                                    json += "'}";
                                    json = json.Replace("\\", " ");
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

                            break;

                        case "matchMethod":
                            string fpdm = "";
                            string fphm = "";
                            string kprq = "";
                            string operateTime = "";
                            string OperatorID = context.Request.LogonUserIdentity.Name;
                            if (context.Request.Form["pData[fpdm]"] != null)
                            {
                                fpdm = context.Request.Form["pData[fpdm]"];
                            }
                            if (context.Request.Form["pData[fphm]"] != null)
                            {
                                fphm = context.Request.Form["pData[fphm]"];
                            }
                            if (context.Request.Form["pData[kprq]"] != null)
                            {
                                kprq = context.Request.Form["pData[kprq]"];
                            }
                            if (context.Request.Form["pData[operateTime]"] != null)
                            {
                                operateTime = context.Request.Form["pData[operateTime]"];
                            }

                            if (fpdm != "" && fphm != "" && kprq != "")
                            {
                                DataSet ds = DataOperate.JudgeIsMatch(fpdm, fphm, kprq);
                                if (ds != null && ds.Tables[0].Rows.Count > 0)
                                {
                                    json += "{success:'false',inf:'发票重复',plus:'";
                                    NetLog.WriteTextLog(operatorID, "【查验发票】", "【发票重复】：" + fphm);

                                    DataView dv = ds.Tables[0].DefaultView;
                                    foreach (DataRowView rowview in dv)
                                    {
                                        for (int i = 0; i < dv.Table.Columns.Count; i++)
                                        {
                                            json += rowview[i] + ",";
                                        }
                                    }
                                    json = json.Remove(json.Length - 1, 1);
                                    json += "'}";
                                    json = json.Replace("\\", " ");
                                }
                                else
                                {
                                    int result = DataOperate.InsertOnlyMatch(fpdm, fphm, kprq, operateTime, OperatorID);
                                    if (result > 0)
                                    {
                                        json = "{success:'true',inf:'发票保存成功'}";
                                    }
                                    else
                                    {
                                        json = "{success:'false',inf:'发票数据存储出错'}";
                                    }
                                }
                            }
                            else
                            {

                            }

                            break;

                        case "netLog":
                            NetLog.WriteTextLog(operatorID, "【查验发票】", "【"+ context.Request.Form["pData[msg]"] + "】：" + context.Request.Form["pData[fpdm]"]);
                            break;
                    }
                }
                catch (Exception ex)
                {
                    json = ex.Message;
                }

                context.Response.Write(json);
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}