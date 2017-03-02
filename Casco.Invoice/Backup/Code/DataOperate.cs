using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace Casco.Invoice
{
    public class DataOperate
    {

        /// <summary>
        /// 插入发票信息
        /// </summary>
        /// <returns></returns>
        public static int InsertInvoiceInfo(InvoiceInfo info)
        {
            int result = 0;
            List<string> lt = new List<string>();
            if (info != null)
            {
                string sqlStr = string.Format("INSERT INTO B_InvoiceInfo([InvoiceCode],[InvoiceNumber],[InvoiceDate] ,[CheckCode] ,[MachineNumber],[GName],[GIdentificationCode] ,[GAddressPhone] " +
                 ",[GBankAccount] ,[PasswordArea] ,[TotalPriceB] ,[TotalPriceS],[XName] ,[XIdentificationCode] ,[XAddressPhone],[XBankAccount] ,[InspectionTimes] ,[InspectionTime] ,[Remark]"+
                " ,[InvoiceProvince] ,[InvoiceType]) " +
                "VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}','{13}','{14}','{15}','{16}','{17}','{18}','{19}','{20}')", info.InvoiceCode, info.InvoiceNumber,
                info.InvoiceDate, info.CheckCode, info.MachineNumber, info.GName, info.GIdentificationCode, info.GAddressPhone,
                info.GBankAccount, info.PasswordArea, info.TotalPriceB, info.TotalPriceS, info.XName, info.XIdentificationCode,
                info.XAddressPhone, info.XBankAccount, info.InspectionTimes, info.InspectionTime, info.Remark,info.InvoiceProvince,info.InvoiceType);
                lt.Add(sqlStr);
                foreach (InvoiceSubInfo subInfo in info.SubInfo)
                {
                    string sqlStr1 = string.Format("INSERT INTO B_InvoiceSubInfo([InvoiceCode],[InvoiceNumber],[CheckCode],[MachineNumber] ,[NO] ,[GoodsName] ,[SpecificationModel] ,[Unit]" +
                     ",[Quantity],[UnitPrice],[Money],[TaxRate],[Tax] ,[Total],[TotalTax]) " +
                    "VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}','{13}','{14}')", subInfo.InvoiceCode, subInfo.InvoiceNumber,
                    subInfo.CheckCode, subInfo.MachineNumber, subInfo.NO, subInfo.GoodsName, subInfo.SpecificationModel, subInfo.Unit,
                    subInfo.Quantity, subInfo.UnitPrice, subInfo.Money, subInfo.TaxRate, subInfo.Tax, subInfo.Total, subInfo.TotalTax);
                    lt.Add(sqlStr1);
                }
                try
                {
                    result = Maticsoft.DBUtility.DbHelperSQL.ExecuteSqlTran(lt);
                }
                catch (Exception)
                {
                    result = -1;
                }
            }
            return result;
        }

        /// <summary>
        /// 获取发票信息
        /// </summary>
        /// <returns></returns>
        public static DataSet JudgeInvoiceInfo(InvoiceInfo info)
        {
            DataSet ds = null;
            try
            {
                string strSql = "SELECT * FROM [CascoInvoice ].[dbo].[B_InvoiceInfo] WHERE InvoiceCode='" + info.InvoiceCode + "' and InvoiceNumber='" + info.InvoiceNumber + "'";
                ds = Maticsoft.DBUtility.DbHelperSQL.Query(strSql);
            }
            catch (Exception)
            {
                ds = null;
            }
            return ds;
        }

        /// <summary>
        /// 判断专用发票信息是否正确
        /// </summary>
        /// <returns></returns>
        public static DataSet JudgeInvoiceInfoYN(InvoiceInfo info)
        {
            DataSet ds = null;
            try
            {
                string strSql = "SELECT * FROM [CascoInvoice ].[dbo].[W_CompanyInfo] WHERE CompanyName='" + info.GName + "' and CompanytaxNo='" + info.GIdentificationCode + "'";
                ds = Maticsoft.DBUtility.DbHelperSQL.Query(strSql);
            }
            catch (Exception)
            {
                ds = null;
            }
            return ds;
        }
        /// <summary>
        /// 判断发票名称是否正确
        /// </summary>
        /// <returns></returns>
        public static DataSet JudgeInvoiceInfoName(InvoiceInfo info)
        {
            DataSet ds = null;
            try
            {
                string strSql = "SELECT * FROM [CascoInvoice ].[dbo].[W_CompanyInfo] WHERE CompanyName='" + info.GName + "'";
                ds = Maticsoft.DBUtility.DbHelperSQL.Query(strSql);
            }
            catch (Exception)
            {
                ds = null;
            }
            return ds;
        }
    }
}
