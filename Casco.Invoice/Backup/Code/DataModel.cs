using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Casco.Invoice
{
    public class InvoiceInfo
    {
        private string invoiceType;
        /// <summary>
        /// 发票类型
        /// </summary>
        public string InvoiceType { get; set; }

        private string invoiceProvince;
        /// <summary>
        /// 发票省份
        /// </summary>
        public string InvoiceProvince { get; set; }

        private string invoiceCode;
        /// <summary>
        /// 发票代码
        /// </summary>
        public string InvoiceCode { get; set; }

        private string invoiceNumber;
        /// <summary>
        /// 发票号码
        /// </summary>
        public string InvoiceNumber { get; set; }

        private string invoiceDate;
        /// <summary>
        /// 开票日期
        /// </summary>
        public string InvoiceDate { get; set; }

        private string checkCode;
        /// <summary>
        /// 校验码
        /// </summary>
        public string CheckCode { get; set; }

        private string machineNumber;
        /// <summary>
        /// 机器编号
        /// </summary>
        public string MachineNumber { get; set; }

        private string gName;
        /// <summary>
        /// 购买方名称
        /// </summary>
        public string GName { get; set; }

        private string gIdentificationCode;
        /// <summary>
        /// 购买方纳税人识别号
        /// </summary>
        public string GIdentificationCode { get; set; }

        private string gAddressPhone;
        /// <summary>
        /// 购买方地址、电话
        /// </summary>
        public string GAddressPhone { get; set; }

        private string gBankAccount;
        /// <summary>
        /// 购买方开户行及账号
        /// </summary>
        public string GBankAccount { get; set; }

        private string passwordArea;
        /// <summary>
        /// 密码区
        /// </summary>
        public string PasswordArea { get; set; }

        private string totalPriceB;
        /// <summary>
        /// 价税合计大写
        /// </summary>
        public string TotalPriceB { get; set; }

        private string totalPriceS;
        /// <summary>
        /// 计税合计小写
        /// </summary>
        public string TotalPriceS { get; set; }

        private string xName;
        /// <summary>
        /// 销售方名称
        /// </summary>
        public string XName { get; set; }

        private string xIdentificationCode;
        /// <summary>
        /// 销售方纳税人识别号
        /// </summary>
        public string XIdentificationCode { get; set; }
        private string xAddressPhone;
        /// <summary>
        /// 销售方地址、电话
        /// </summary>
        public string XAddressPhone { get; set; }

        private string xBankAccount;
        /// <summary>
        /// 销售方开户行及账号
        /// </summary>
        public string XBankAccount { get; set; }
        private string inspectionTimes;
        /// <summary>
        /// 查验次数
        /// </summary>
        public string InspectionTimes { get; set; }

        private string inspectionTime;
        /// <summary>
        /// 查验时间
        /// </summary>
        public string InspectionTime { get; set; }
        private string remark;
        /// <summary>
        /// 备注
        /// </summary>
        public string Remark { get; set; }

        private List<InvoiceSubInfo> subInfo;
        /// <summary>
        /// 子信息
        /// </summary>
        public List<InvoiceSubInfo> SubInfo { get; set; }

    }
    public class InvoiceSubInfo
    {
        private string invoiceCode;
        /// <summary>
        /// 发票代码
        /// </summary>
        public string InvoiceCode { get; set; }

        private string invoiceNumber;
        /// <summary>
        /// 发票号码
        /// </summary>
        public string InvoiceNumber { get; set; }

        private string checkCode;
        /// <summary>
        /// 校验码
        /// </summary>
        public string CheckCode { get; set; }

        private string machineNumber;
        /// <summary>
        /// 机器编号
        /// </summary>
        public string MachineNumber { get; set; }

        private string nO;
        /// <summary>
        /// 行号
        /// </summary>
        public string NO { get; set; }

        private string goodsName;
        /// <summary>
        /// 货物名称
        /// </summary>
        public string GoodsName { get; set; }

        private string specificationModel;
        /// <summary>
        /// 规格型号
        /// </summary>
        public string SpecificationModel { get; set; }

        private string unit;
        /// <summary>
        /// 单位
        /// </summary>
        public string Unit { get; set; }

        private string quantity;
        /// <summary>
        /// 数量
        /// </summary>
        public string Quantity { get; set; }
        private string unitPrice;
        /// <summary>
        /// 单价
        /// </summary>
        public string UnitPrice { get; set; }

        private string money;
        /// <summary>
        /// 金额
        /// </summary>
        public string Money { get; set; }

        private string taxRate;
        /// <summary>
        /// 税率
        /// </summary>
        public string TaxRate { get; set; }

        private string tax;
        /// <summary>
        /// 税额
        /// </summary>
        public string Tax { get; set; }

        private string total;
        /// <summary>
        /// 合计
        /// </summary>
        public string Total { get; set; }
        private string totalTax;
        /// <summary>
        /// 合计税额
        /// </summary>
        public string TotalTax { get; set; }

    }
}
