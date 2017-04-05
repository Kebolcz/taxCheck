using System;
using System.Collections.Generic;
using System.Web;
using System.IO;
using System.Text;

namespace Casco.Invoice
{
    public class NetLog
    {
        /// <summary>  
        /// 写入日志到文本文件  
        /// </summary>  
        /// <param name="operatorID">操作人</param>  
        /// <param name="action">动作</param>  
        /// <param name="strMessage">日志内容</param>
        public static void WriteTextLog(string operatorID, string action, string strMessage)
        {
            string path = AppDomain.CurrentDomain.BaseDirectory + @"System\Log\";
            if (!Directory.Exists(path))
                Directory.CreateDirectory(path);
            DateTime now = DateTime.Now;
            string fileFullPath = path + now.ToString("yyyy-MM-dd") + ".System.txt";
            StringBuilder str = new StringBuilder();
            str.Append("【" + now.ToString() + "】\t");
            str.Append("Operator：【" + operatorID +"】\t");
            str.Append("Action: " + action + "\t");
            str.Append("Message: " + strMessage + "\r\n");
            str.Append("-----------------------------------------------------------\r\n\r\n");
            StreamWriter sw;
            if (!File.Exists(fileFullPath))
            {
                sw = File.CreateText(fileFullPath);
            }
            else
            {
                sw = File.AppendText(fileFullPath);
            }
            sw.WriteLine(str.ToString());
            sw.Close();
        }
    }
}