﻿using System;
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
        /// 检查登录人登录系统授权信息
        /// </summary>
        /// <returns></returns>
        public static DataSet JudgeHasAuth(String userId)
        {
            DataSet ds = null;
            try
            {
                string strSql = "SELECT * FROM [CascoInvoice ].[dbo].[W_Authority] WHERE userId='" + userId + "'";
                ds = Maticsoft.DBUtility.DbHelperSQL.Query(strSql);
            }
            catch (Exception)
            {
                ds = null;
            }
            return ds;
        }


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
                string sqlStr = string.Format("INSERT INTO B_InvoiceInfo([InvoiceCode],[Djsys],[InvoiceNumber],[InvoiceDate] ,[CheckCode] ,[MachineNumber],[GName],[GIdentificationCode] ,[GAddressPhone] " +
                 ",[GBankAccount] ,[PasswordArea] ,[TotalPriceB] ,[TotalPriceS],[XName] ,[XIdentificationCode] ,[XAddressPhone],[XBankAccount] ,[InspectionTimes] ,[InspectionTime] ,[Remark]" +
                " ,[InvoiceProvince] ,[InvoiceType],[OperatorID]) " +
                "VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}','{13}','{14}','{15}','{16}','{17}','{18}','{19}','{20}','{21}','{22}')", info.InvoiceCode, info.Djsys, info.InvoiceNumber,
                info.InvoiceDate, info.CheckCode, info.MachineNumber, info.GName, info.GIdentificationCode, info.GAddressPhone,
                info.GBankAccount, info.PasswordArea, info.TotalPriceB, info.TotalPriceS, info.XName, info.XIdentificationCode,
                info.XAddressPhone, info.XBankAccount, info.InspectionTimes, info.InspectionTime, info.Remark, info.InvoiceProvince, info.InvoiceType
                , info.OperatorID);
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
        /// 查询发票信息
        /// </summary>
        /// <returns></returns>
        public static DataSet queryInvoiceInfo(String invoiceType, String startDate, String endDate, String operatorID)
        {
            DataSet ds = null;
            try
            {    /// <summary>
                 /// 查询发票信息,查询日期是发票开票日期
                 /// </summary>
                 /// <returns></returns>

                string strSql = "SELECT DISTINCT a.InvoiceType,a.InvoiceCode,a.InvoiceNumber,a.Djsys,replace(replace(replace(a.InvoiceDate,'年','-'),'月','-'),'日','') as InvoiceDate,a.GIdentificationCode,a.GName,a.XIdentificationCode,a.XName,a.TotalPriceS,b.Total,b.TotalTax,a.OperatorID,a.InspectionTime, CASE a.NotCheck WHEN 1 THEN '未校验' ELSE '' END AS IsChecked " +
                    "FROM [CascoInvoice ].[dbo].[B_InvoiceInfo] a(nolock) left join [CascoInvoice ].[dbo].[B_InvoiceSubInfo] b on a.InvoiceNumber = b.InvoiceNumber WHERE a.InvoiceType like '%"
                    + invoiceType + "%' and CONVERT(varchar(10),InspectionTime,111)>=CONVERT(varchar(10),'" + startDate + "',111) and CONVERT(varchar(10),InspectionTime,111)<= CONVERT(varchar(10), '" +
                    endDate + "',111) and a.OperatorID = '" + operatorID + "' and a.Disabled is null order by InspectionTime";

                ds = Maticsoft.DBUtility.DbHelperSQL.Query(strSql);

                return ds;
            }
            catch (Exception)
            {
                ds = null;
            }
            return ds;
        }

        /// <summary>
        /// 精确查询发票信息
        /// </summary>
        /// <returns></returns>
        public static DataSet positioningInvoiceInfo(String djsys, String invoiceNum, String operatorID)
        {
            DataSet ds = null;
            try
            {
                string strSql = "SELECT DISTINCT a.InvoiceType,a.InvoiceCode,a.InvoiceNumber,a.Djsys,replace(replace(replace(a.InvoiceDate,'年','-'),'月','-'),'日','') as InvoiceDate,a.GIdentificationCode,a.GName,a.XIdentificationCode,a.XName,a.TotalPriceS,b.Total,b.TotalTax,a.OperatorID,a.InspectionTime, CASE a.NotCheck WHEN 1 THEN '未校验' ELSE '' END AS IsChecked " +
                    "FROM [CascoInvoice ].[dbo].[B_InvoiceInfo] a(nolock) left join [CascoInvoice ].[dbo].[B_InvoiceSubInfo] b on a.InvoiceNumber = b.InvoiceNumber WHERE a.Djsys like '%"
                    + djsys + "%' and a.[InvoiceNumber] like '%" + invoiceNum + "%' and a.OperatorID = '" + operatorID + "' and a.Disabled is null order by InspectionTime";

                ds = Maticsoft.DBUtility.DbHelperSQL.Query(strSql);

                return ds;
            }
            catch (Exception)
            {
                ds = null;
            }
            return ds;
        }

        /// <summary>
        /// 导出发票信息,使用到的方法
        /// 未校验的发票不予导出.
        /// </summary>
        /// <returns></returns>
        public static DataSet exportInvoiceInfo(String invoiceType, String startDate, String endDate, String operatorID)
        {
            DataSet ds = null;
            try
            {    /// <summary>
                 /// 查询发票信息,查询日期是发票开票日期
                 /// </summary>
                 /// <returns></returns>

                string strSql = "SELECT DISTINCT a.InvoiceType,a.InvoiceCode,a.InvoiceNumber,a.Djsys,replace(replace(replace(a.InvoiceDate,'年','-'),'月','-'),'日','') as InvoiceDate,a.GIdentificationCode,a.GName,a.XIdentificationCode,a.XName,a.TotalPriceS,b.Total,b.TotalTax,a.OperatorID,a.InspectionTime, CASE a.NotCheck WHEN 1 THEN '未校验' ELSE '' END AS IsChecked " +
                    "FROM [CascoInvoice ].[dbo].[B_InvoiceInfo] a(nolock) left join [CascoInvoice ].[dbo].[B_InvoiceSubInfo] b on a.InvoiceNumber = b.InvoiceNumber WHERE a.InvoiceType like '%"
                    + invoiceType + "%' and CONVERT(varchar(10),InspectionTime,111)>=CONVERT(varchar(10),'" + startDate + "',111) and CONVERT(varchar(10),InspectionTime,111)<= CONVERT(varchar(10), '" +
                    endDate + "',111) and a.OperatorID = '" + operatorID + "' and a.Disabled is null and a.NotCheck is null order by InspectionTime" + " SELECT c.InvoiceType,c.InvoiceCode,c.InvoiceNumber,c.GName,c.XName,d.GoodsName,d.SpecificationModel,d.Unit,d.Quantity,d.UnitPrice,d.[Money],d.[TaxRate],d.[Tax] FROM [CascoInvoice ].[dbo].[B_InvoiceInfo] c(nolock) right join [CascoInvoice ].[dbo].[B_InvoiceSubInfo] d on c.InvoiceCode = d.InvoiceCode and c.InvoiceNumber = d.InvoiceNumber WHERE c.InvoiceType like '%"
                    + invoiceType + "%' and CONVERT(varchar(10),c.InspectionTime,111)>=CONVERT(varchar(10),'" + startDate + "',111) and CONVERT(varchar(10),c.InspectionTime,111)<= CONVERT(varchar(10), '" +
                    endDate + "',111) and c.OperatorID = '" + operatorID + "' and c.Disabled is null and d.Disabled is null";


                ds = Maticsoft.DBUtility.DbHelperSQL.Query(strSql);
                return ds;
            }
            catch (Exception)
            {
                ds = null;
            }
            return ds;
        }

        /// <summary>
        /// 删除发票信息,增加flag,使用到的方法
        /// </summary>
        /// <returns></returns>
        public static int deleteInvoiceInfo(String code, String num)
        {
            int result = 0;
            List<string> lt = new List<string>();

            string strSql = "update [CascoInvoice ].[dbo].[B_InvoiceSubInfo] set Disabled = '1' where [InvoiceCode] = '" + code + "' and [InvoiceNumber] = '" + num + "'";
            string strSql1 = "update [CascoInvoice ].[dbo].[B_InvoiceInfo] set Disabled = '1' where [InvoiceCode] = '" + code + "' and [InvoiceNumber] = '" + num + "'";
            lt.Add(strSql);
            lt.Add(strSql1);
            try
            {
                result = Maticsoft.DBUtility.DbHelperSQL.ExecuteSqlTran(lt);
            }
            catch (Exception)
            {
                result = -1;
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
                string strSql = "SELECT * FROM [CascoInvoice ].[dbo].[B_InvoiceInfo] WHERE InvoiceCode='" + info.InvoiceCode + "' and InvoiceNumber='" + info.InvoiceNumber + "' and Disabled is null";
                ds = Maticsoft.DBUtility.DbHelperSQL.Query(strSql);
            }
            catch (Exception)
            {
                ds = null;
            }
            return ds;
        }


        /// <summary>
        /// 仅查重模式下,校验发票是否重复
        /// </summary>
        /// <returns></returns>
        public static DataSet JudgeIsMatch(String code,String num,String date)
        {
            DataSet ds = null;
            try
            {
                string strSql = "SELECT * FROM [CascoInvoice ].[dbo].[B_InvoiceInfo] WHERE InvoiceCode='" + code + "' and InvoiceNumber='" + num + "' and Disabled is null";
                ds = Maticsoft.DBUtility.DbHelperSQL.Query(strSql);
            }
            catch (Exception)
            {
                ds = null;
            }
            return ds;
        }

        /// <summary>
        /// 仅查重模式下,插入数据库表B_InvoiceInfo该条记录,增加字段NotCheck
        /// </summary>
        /// <returns></returns>
        public static int InsertOnlyMatch(String code, String num, String date, String operateTime, String operatorID)
        {
            int result = 0;
            try
            {
                string strSql = "INSERT INTO B_InvoiceInfo([InvoiceType],[InvoiceCode],[InvoiceNumber],[InvoiceDate],[InspectionTime],[OperatorID],[NotCheck]) VALUES ('00','" + code + "','"+ num + "','" + date + "','" + operateTime + "','" + operatorID + "','1')";
                result = Maticsoft.DBUtility.DbHelperSQL.ExecuteSql(strSql);
            }
            catch (Exception)
            {
                result = -1;
            }
            return result;
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
