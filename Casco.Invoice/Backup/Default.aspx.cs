using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using System.Text;
using System.Net.Security;

namespace Casco.Invoice
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetCNTCount();
        }
        /// <summary>
        /// 获取CNT待办数量
        /// </summary>
        private void GetCNTCount()
        {
            try
            {
                string url = "https://emmprd.casco.com.cn:9443/dsms/dsms";
                string data = string.Format("action=getDsmsCnt&userId={0}", "61479");//GetCurrtUserName()
                string result = HttpGet(url, data);
                if (result != "")
                {
                    string CntCount2 = result.Remove(0, 30);
                    int a = 0;
                     CntCount2 = CntCount2.Remove(CntCount2.Length - 4, 4);
                     if (int.TryParse(CntCount2, out a) == false) //判断是否可以转换为整型
                     {
                         
                     }
                     else
                     {
                         
                     }
                  
                }
            }
            catch (Exception ex)
            {

            }
        }
        public class Info
        {
            public string status { get; set; }
            public data data { get; set; }
        }

        public class data
        {
            public int cnt { get; set; }
        }

        /// <summary>  
        /// GET请求与获取结果  
        /// </summary>  
        public static string HttpGet(string Url, string postDataStr)
        {
            ServicePointManager.ServerCertificateValidationCallback = new
RemoteCertificateValidationCallback
(
   delegate { return true; }
);
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(Url + (postDataStr == "" ? "" : "?") + postDataStr);
            request.Method = "GET";
            request.ContentType = "text/html;charset=UTF-8";

            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            Stream myResponseStream = response.GetResponseStream();
            StreamReader myStreamReader = new StreamReader(myResponseStream, Encoding.UTF8);
            string retString = myStreamReader.ReadToEnd();
            myStreamReader.Close();
            myResponseStream.Close();

            return retString;
        }
    }
}