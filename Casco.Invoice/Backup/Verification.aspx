<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Verification.aspx.cs" Inherits="Casco.Invoice.Verification" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>增值税发票查验平台</title>
    <meta name="keywords" content="">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
    <meta http-equiv="expires" content="0">
    <meta name="format-detection" content="telephone=no">
    <meta property="wb:webmaster" content="" />
    <script language="javascript">
        document.write("<l" + "ink rel='stylesheet' type='text/css' href='https://inv-veri.chinatax.gov.cn/css/common.css?" + Math.random() + "' />");
        document.write("<l" + "ink rel='stylesheet' type='text/css' href='https://inv-veri.chinatax.gov.cn/css/jquery.alerts.css?" + Math.random() + "' media='screen' />");
        document.write("<l" + "ink rel='stylesheet' type='text/css' href='https://inv-veri.chinatax.gov.cn/css/bootstrap-datepicker.min.css' />");
        if (top != self) {
            location.href = "about:blank";
        }
        document.write("<s" + "cript charset='utf-8' type='text/javascript' src='https://inv-veri.chinatax.gov.cn/js/jquery-1.10.2.min.js'></scr" + "ipt>");
        document.write("<s" + "cript charset='utf-8' type='text/javascript' src='https://inv-veri.chinatax.gov.cn/js/jquery.PrintArea.js'></scr" + "ipt>");
        document.write("<s" + "cript charset='utf-8' type='text/javascript' src='https://inv-veri.chinatax.gov.cn/js/jquery.alerts.js?" + Math.random() + "'></scr" + "ipt>");
        document.write("<s" + "cript charset='utf-8' type='text/javascript' src='https://inv-veri.chinatax.gov.cn/js/jquery.md5.js'></scr" + "ipt>");
        document.write("<s" + "cript charset='utf-8' type='text/javascript' src='https://inv-veri.chinatax.gov.cn/js/showModalDialog.js?" + Math.random() + "'></scr" + "ipt>");
        document.write("<s" + "cript charset='utf-8' type='text/javascript' src='https://inv-veri.chinatax.gov.cn/js/aes.js'></scr" + "ipt>");
        document.write("<s" + "cript charset='utf-8' type='text/javascript' src='https://inv-veri.chinatax.gov.cn/js/pbkdf2.js'></scr" + "ipt>");
        document.write("<s" + "cript charset='utf-8' type='text/javascript' src='https://inv-veri.chinatax.gov.cn/js/AesUtil.js'></scr" + "ipt>");
        document.write("<s" + "cript charset='utf-8' type='text/javascript' src='https://inv-veri.chinatax.gov.cn/js/cookies.js?" + Math.random() + "'></scr" + "ipt>");
        document.write("<s" + "cript charset='utf-8' type='text/javascript' src='https://inv-veri.chinatax.gov.cn/js/common.js?" + Math.random() + "'></scr" + "ipt>");
        document.write("<s" + "cript charset='utf-8' type='text/javascript' src='https://inv-veri.chinatax.gov.cn/js/validate.js?" + Math.random() + "'></scr" + "ipt>");
        document.write("<s" + "cript charset='utf-8' type='text/javascript' src='https://inv-veri.chinatax.gov.cn/js/result.js?" + Math.random() + "'></scr" + "ipt>");
        document.write("<s" + "cript type='text/javascript' language='javascript' src='https://inv-veri.chinatax.gov.cn/js/bootstrap-datepicker.js'></scr" + "ipt>");
        document.write("<s" + "cript type='text/javascript' language='javascript' src='https://inv-veri.chinatax.gov.cn/js/bootstrap-datepicker.zh-CN.min.js'></scr" + "ipt>"); 
  
    </script>
    <script>
        var browser = "";
        browser = getBrowser();
        function pad(num, n) {
            var len = num.toString().length;
            while (len < n) {
                num = "0" + num;
                len++;
            }
            return num;
        }

        var jsname = ""; 
    </script>
</head>
<body onload="arw();">
    <div id="top">
        <!--header begin-->
        <div id="headerbox">
            <div id="header">
                <div class="logo" style="background: url(../images/logo.png) no-repeat left center;
                    padding-left: 170px">
                    增值税发票查验平台</div>
                <span id="Hotnews" style="left: 170px">支持增值税专用发票、增值税普通发票（含电子普通发票、卷式发票）、机动车销售统一发票、货物运输业增值税专用发票在线查验</span>
            </div>
        </div>
        <!--header end-->
    </div>
    <!--content begin-->
    <div id="content2" class="pad_t_50 clearfix" style="text-align: center; padding-top: 30px !important">
        <div class="ktsm" id="ktsm_tip">
            <p>
                <b>提示：</b> 您当前使用的是非推荐版本浏览器，可能会影响查验结果展示，请使用推荐版本浏览器进行查验！
            </p>
            <span class="close_ktsm"></span>
        </div>
        <!--左侧-->
        <div class="sm_box" style="display: none">
            <div class="cont_ps">
                <p>
                    1、当日开具发票最快可于次日进行查验。
                    <br />
                    2、每份发票每天最多可查验5次。<br />
                    3、可查验最近1年内增值税发票管理新系统开具的发票。<br />
                    <!-- <span style="color:red">5、当前仅支持北京、上海、深圳三地区增值税发票查验。</span> -->
                </p>
            </div>
        </div>
        <!--左侧-->
        <table border="0" class="comm_table2 fr" style="float: right;">
            <tr>
                <td class="align_right2" style="font-weight: bold">
                    扫一扫：
                </td>
                <td width="600">
                    <input type="text" name="fpsys"  id="fpsys" maxlength="1200"  style="width: 540px" />
                </td>
                <td width="400">
                    <div id="Div1" class="tip_common">
                        请扫描发票二维码</div>
                </td>
            </tr>
        </table>
        <!--右侧-->
        <table border="0" class="comm_table2 fr">
            <tr>
                <td class="align_right2">
                    <span class="font_red">*</span>发票代码：
                </td>
                <td>
                    <input type="text" id="fpdm" maxlength="12" autocomplete="off" />
                </td>
                <td width="200">
                    <div id="fpdmjy" class="tip_common">
                        请输入发票代码</div>
                </td>
            </tr>
            <tr>
                <td class="align_right2">
                    <span class="font_red">*</span>发票号码：
                </td>
                <td>
                    <input type="text" id="fphm" maxlength="8" autocomplete="off" />
                </td>
                <td>
                    <div id="fphmjy" class="tip_common">
                        请输入发票号码</div>
                </td>
            </tr>
            <tr>
                <td class="align_right2">
                    <span class="font_red">*</span>开票日期：
                </td>
                <td>
                    <label>
                        <input type="text" id="kprq" class="form-control" maxlength="8" value="YYYYMMDD"
                            style="color: #999999" autocomplete="off" />
                    </label>
                </td>
                <td>
                    <div id="kprqjy" class="tip_common">
                        请输入开票日期</div>
                </td>
            </tr>
            <tr>
                <td class="align_right2">
                    <span class="font_red">*</span><span id="context">开具金额(不含税)：</span>
                </td>
                <td>
                    <input type="text" id="kjje" autocomplete="off" />
                </td>
                <td>
                    <div id="kjjejy" class="tip_common">
                        请输入开具金额</div>
                </td>
            </tr>
            <tr>
                <td class="align_right2">
                    <span class="font_red">*</span>验证码：
                </td>
                <td>
                    <input type="text" style="color: #999999" value="请输入验证码" id="yzm" autocomplete="off" />
                    <!--<span class="con_img" id="imgarea"><a href="#"><input type="button" value="获取验证码" id="yzm_img" /></a></span> code.png -->
                </td>
                <td id="yzminfo" style="font-size: 14px;">
                    &nbsp;
                </td>
                <!-- <td><div id="yzmjy"class="tip_common">请输入验证码</div></td> -->
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td id="imgarea">
                    <div>
                        <a href="javascript:void(0);">
                            <img width="220" height="120" src="images/code.png" id="yzm_img" style="cursor: pointer;
                                vertical-align: top;" />
                            <img width="220" height="120" src="images/code.png" id="yzm_unuse_img" style="cursor: pointer;
                                vertical-align: top; display: none;" /></a><div style="float: right; margin-right: 20px;
                                    margin-top: 10px;">
                                    <span class="tip_yzm">点击图片刷新</span></div>
                    </div>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <div class="comm_btn_div2 clearfix">
                        <button class="gray_button" style="cursor: default; display: none" id="uncheckfp"
                            disabled="true">
                            查 验</button>
                        <button class="blue_button" onmousemove="this.className='green_button';" onmouseout="this.className='blue_button';"
                            id="checkfp">
                            查 验</button>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <button class="blue_button" onmousemove="this.className='green_button';" onmouseout="this.className='blue_button';"
                            id="reset">
                            重 置</button></div>
                </td>
            </tr>
        </table>
        <!--右侧-->
    </div>
    <div id="foot">
    </div>
    <div id="cover">
    </div>
    <div id="floatwin">
    </div>
    <div id="floatwin1">
    </div>
    <script language="javascript">
        /*
        if (browser == "error") {
        jAlert("建议使用IE8及以上版本浏览器，使用其它\r\n浏览器可能会导致显示异常。", "警告
        }
        */
        if (browser == "ie6") {
            jAlert("您正在使用的浏览器版本过低，请升级至IE8及以上版本！", "警告");
        } else if (browser.indexOf("others") != -1 || browser.indexOf("ok") != -1) {
            if (browser.indexOf("_chrome") != -1) {
                browser = browser.substring(browser.indexOf("_") + 1);
                browser = browser.toUpperCase();
                browser = "谷歌" + browser.substring(browser.indexOf(" "));
                $('#ktsm_tip').html("<p><b>提示：</b>您使用的是内核为" + browser + "版本浏览器，建议使用内核为谷歌 55版本浏览器。同时，请参照操作说明安装根证书。</p>" + "<span class='close_ktsm'></span>");
                $('#ktsm_tip').show();
                browser = "chrome";
            } else if (browser.indexOf("_firefox") != -1) {
                browser = browser.substring(browser.indexOf("_") + 1);
                browser = browser.toUpperCase();
                browser = "火狐" + browser.substring(browser.indexOf(" "));
                $('#ktsm_tip').html("<p><b>提示：</b>您使用的是" + browser + "版本浏览器，建议使用50版本。同时，请参照操作说明安装根证书。</p>" + "<span class='close_ktsm'></span>");
                $('#ktsm_tip').show();
                browser = "firefox";
            } else if (browser.indexOf("chrome") != -1) {
                $('#ktsm_tip').html("<p><b>提示：</b>您使用的是谷歌 55版本浏览器，请参照操作说明安装根证书再进行发票查验操作！</p>" + "<span class='close_ktsm'></span>");
                $('#ktsm_tip').show();
                browser = "chrome";
            } else if (browser.indexOf("firefox") != -1) {
                $('#ktsm_tip').html("<p><b>提示：</b>您使用的是火狐 50版本浏览器，请参照操作说明安装根证书再进行发票查验操作！</p>" + "<span class='close_ktsm'></span>");
                $('#ktsm_tip').show();
                browser = "firefox";
            }
        } else if (browser == "others") {
            $('#ktsm_tip').show();
        }

        var dalog;
        var dalog2;
        var show_yzm = "";
        var code = new Array('144031539110', '131001570151', '133011501118', '111001571071');
        var code10 = new Array('1440315391', '1310015701', '1330115011', '1110015710');
        $(document).ready(function () {

            // var MyStore = new ActiveXObject("CAPICOM.Store"); 
            // var Certificate = new ActiveXObject("CAPICOM.Certificate"); 
            // alert(MyStore);

            cover_width = document.body.clientWidth; //获取body宽度
            cover_height = window.screen.height; //获取body高度
            document.getElementById("cover").style.width = cover_width + "px";
            document.getElementById("cover").style.height = cover_height + "px";

            $("#top").load("top.html?" + Math.random());
            $("#foot").load("footer.html?" + Math.random());

            if (browser == 'ie8') {
                sessionStorage["browser"] = "ie8";
            } else if (browser == 'edge' || browser == 'firefox') {
                sessionStorage["browser"] = "edge";
            } else {
                sessionStorage["browser"] = "";
            }

            //关闭开通说明
            $(".close_ktsm").click(function () {
                $(this).parent().hide();
            });

            var endTime = new Date();
            var yesterday_miliseconds = endTime.getTime() - 1000 * 60 * 60 * 24;
            var Yesterday = new Date();
            Yesterday.setTime(yesterday_miliseconds);

            $('#kprq').datepicker({
                format: "yyyymmdd",
                autoclose: true,
                endDate: Yesterday,
                language: "zh-CN"
            }).on('changeDate',
    function (ev) {
        var kprq = $("#kprq").val().trim();
        $('#kprq').css('color', '#555');
        if (kprq.length != "") {
            kprqChange(kprq);
        } else {
            //$("#kprqjy").removeClass();
            // $("#kprqjy").addClass("tip_common");
            //$("#kprqjy").html("请输入开票日期");
        }

        acb(fplx);
    });
        });
        var yzmSj = "";
        var jmmy = "";
        var fplx = "99";
        var skxt = 0;
        var xsje = 1;
        var swjgmc = "";
        var delayFlag = "";
        var delayTime = 6;
        var delayMessage = "";
        var iv;
        var salt;

        $("#fpsys").keypress(function (event) {
            if (event.keyCode == 13) {
                var strs = new Array(); //定义一数组 
                strs = $("#fpsys").val().trim().split(","); //字符分割 
                $("#fpsys").val('');
                $("#fpdm").val(strs[2]);
                $("#fpdm").keyup();
                $('#fpdm').blur();
                $("#fphm").val(strs[3]);
                $("#fphm").keyup();
                $('#fphm').blur();
                $("#kprq").val(strs[5]);
                $("#kprq").keyup();
                $("#kprq").blur();
                $("#kjje").val(strs[4]);
                if (strs[1] == "04") {
                    $("#kjje").val(strs[6].slice(-6));
                }
                $("#kjje").keyup();
                $("#kjje").blur();
                getYzmXx();

            }
        })


        $("#fpdm").keyup(function () {
            var fpdm = $("#fpdm").val().trim();
            afcdm(fpdm);
            acb(fplx);
        });

        $('#fpdm').blur(function () {
            var fpdm = $("#fpdm").val().trim();
            if (fpdm.length == 10 || fpdm.length == 12) {
                afcdm(fpdm);
            } else {
                $("#fpdmjy").addClass("tip_common_wrong");
                $("#fpdmjy").addClass("font_red");
                $("#fpdmjy").html("发票代码有误!");
            }
            acb(fplx);
        });

        $("#fphm").keyup(function () {
            var fphm = $("#fphm").val().trim();
            if (fphm.length >= 8) {
                ahmch(fphm);
            } else {
                $("#fphmjy").removeClass();
                $("#fphmjy").addClass("tip_common");
                $("#fphmjy").html("请输入发票号码");
            }
            acb(fplx);
        });

        $('#fphm').blur(function () {
            var fphm = $("#fphm").val().trim();
            if (fphm.length != 0 && fphm.length < 8) {
                ahmch(fphm);
            }
            acb(fplx);
        });
        $("#kjje").keyup(function () {
            var kjje = "";
            var fpdm = $("#fpdm").val().trim();

            var classInfo = $("#kjjejy").attr('class');
            $("#kjjejy").removeClass(classInfo);

            if (fpdm == "" || fplx == "01" || fplx == "02" || fplx == "03" || fplx == "99") {
                $("#kjje").attr('maxlength', '20');
                kjje = $("#kjje").val().trim();
                if (!aje(fpdm, kjje)) {
                    $("#kjjejy").addClass("tip_common_wrong");
                    $("#kjjejy").addClass("font_red");
                    if (fplx == "02") {
                        $("#kjjejy").html("合计金额有误!");
                    } else if (fplx == "03") {
                        $("#kjjejy").html("不含税价有误!");
                    } else {
                        $("#kjjejy").html("开票金额有误!");
                    }
                } else {
                    $("#kjjejy").addClass("tip_common_right");
                    $("#kjjejy").html("&nbsp;");
                }
            } else if (fplx == "04" || fplx == "10" || fplx == "11") {
                $("#kjje").attr('maxlength', '6');
                kjje = $("#kjje").val().trim();
                if (kjje.length >= 6) {

                    if (!ajy(kjje)) {
                        $("#kjjejy").addClass("tip_common_wrong");
                        $("#kjjejy").addClass("font_red");
                        $("#kjjejy").html("校验码有误!");
                    } else {
                        $("#kjjejy").addClass("tip_common_right");
                        $("#kjjejy").html("&nbsp;");
                    }
                } else {
                    $("#kjjejy").removeClass();
                    $("#kjjejy").addClass("tip_common");
                    $("#kjjejy").html("请输入校验码<font color=\"red\" size=\"4\">后六位</font>");
                }

            }
            acb(fplx);
        });
        $("#kjje").blur(function () {
            var kjje = $("#kjje").val().trim();
            var fpdm = $("#fpdm").val().trim();

            var classInfo = $("#kjjejy").attr('class');
            $("#kjjejy").removeClass(classInfo);

            if (fpdm == "" || fplx == "01" || fplx == "02" || fplx == "03" || fplx == "99") {
                if (kjje.length != 0) {
                    if (!aje(fpdm, kjje)) {
                        $("#kjjejy").addClass("tip_common_wrong");
                        $("#kjjejy").addClass("font_red");
                        if (fplx == "02") {
                            $("#kjjejy").html("合计金额有误!");
                        } else if (fplx == "03") {
                            $("#kjjejy").html("不含税价有误!");
                        } else {
                            $("#kjjejy").html("开票金额有误!");
                        }
                    } else {
                        $("#kjjejy").addClass("tip_common_right");
                        $("#kjjejy").html("&nbsp;");
                    }
                } else {
                    $("#kjjejy").removeClass();
                    $("#kjjejy").addClass("tip_common");
                    if (fplx == "02") {
                        $("#kjjejy").html("请输入合计金额");
                    } else if (fplx == "03") {
                        $("#kjjejy").html("请输入不含税价");
                    } else {
                        $("#kjjejy").html("请输入开具金额");
                    }
                }
            } else if (fplx == "04" || fplx == "10" || fplx == "11") {
                if (kjje.length != 0) {
                    if (!ajy(kjje)) {
                        $("#kjjejy").addClass("tip_common_wrong");
                        $("#kjjejy").addClass("font_red");
                        $("#kjjejy").html("校验码有误!");
                    } else {
                        $("#kjjejy").addClass("tip_common_right");
                        $("#kjjejy").html("&nbsp;");
                    }
                } else {
                    $("#kjjejy").removeClass();
                    $("#kjjejy").addClass("tip_common");
                    $("#kjjejy").html("请输入校验码<font color=\"red\" size=\"4\">后六位</font>");
                }
            }
            acb(fplx);
        });

        $("#kprq").keyup(function () {
            var kprq = $("#kprq").val().trim();
            if (kprq.length >= 8) {
                kprqChange(kprq);
            } else {
                $("#kprqjy").removeClass();
                $("#kprqjy").addClass("tip_common");
                $("#kprqjy").html("请输入开票日期");
            }
            acb(fplx);
        });
        $("#kprq").blur(function () {
            var kprq = $("#kprq").val().trim();
            if (kprq == "") {
                $('#kprq').val("YYYYMMDD");
                $('#kprq').css('color', '#999999');
            }
            if (kprq.length != 0) {
                kprqChange(kprq);
            } else {
                $("#kprqjy").removeClass();
                $("#kprqjy").addClass("tip_common");
                $("#kprqjy").html("请输入开票日期");
            }
            acb(fplx);
        });

        $('#yzm').focus(function () {
            var value = $('#yzm').val();
            var defaultValue = "请输入验证码";
            if (value == defaultValue) {
                $('#yzm').val('');
                $('#yzm').css('color', '#000000');
            }
        });

        $('#yzm').blur(function () {
            var value = $('#yzm').val();
            if (value == "") {
                $('#yzm').val('请输入验证码');
                $('#yzm').css('color', '#999999');
            }
            acb(fplx);
        });

        $("#yzm").keyup(function () {
            var yzm = $("#yzm").val().trim();
            //console.log("yzm keyup :" + yzm);
            var classInfo = $("#yzmjy").attr('class');
            $("#yzmjy").removeClass(classInfo);
            if (!avym(yzm)) {
                $("#yzmjy").addClass("tip_common_wrong");
                $("#yzmjy").addClass("font_red");
            } else {
                $("#yzmjy").html("&nbsp");
            }
            acb(fplx);
        });

        $("#yzm_img").click(function () {
            var fpdm = $("#fpdm").val().trim();
            //var fphm = $("#fphm").val().trim();
            if (fpdm == "") { //&& fphm == "") {
                jAlert('请先输入发票代码!', '提示');
            } else {
                getYzmXx();
            }
        });

        $('#reset').click(function () {
            arw();
            //location.reload();
        });

        function loadScript(url, callback) {
            var script = document.createElement("script");
            script.type = "text/javascript";
            if (typeof (callback) != "undefined") {
                if (script.readyState) {
                    script.onreadystatechange = function () {
                        if (script.readyState == "loaded" || script.readyState == "complete") {
                            script.onreadystatechange = null;
                            callback();
                        }
                    };
                } else {
                    script.onload = function () {
                        callback();
                    };
                }
            }
            script.src = url;
            document.body.appendChild(script);
        }
        function bb(obj) {
            var str;
            if (obj != "") {
                str = JSON.stringify(obj);
                sessionStorage["result"] = str;
            }
            var data;
            var sechw;
            if (browser == "edge") {
                var edgedata = sessionStorage["result"];
                data = JSON.parse(edgedata);
            } else {
                data = window.dialogArguments;
                if (data) {

                } else {
                    data = sessionStorage["result"];
                    data = JSON.parse(data);
                }
            }
            var tempno = data.template;
            var fplx, hwxxs, fpxxs;

            if (tempno == 0) {
                fplx = data.fplx;
                hwxxs = data.hwxx;
                fpxxs = data.fpxx;
            } else if (tempno == 1) {
                fplx = data.f3ld;
                hwxxs = data.fdzx;
                fpxxs = data.h2gx;
            } else if (tempno == 2) {
                fplx = data.a3b0;
                hwxxs = data.eb2a;
                fpxxs = data.f8d7;
            } else if (tempno == 3) {
                fplx = data.c342;
                hwxxs = data.dbd2;
                fpxxs = data.d64b;
            } else if (tempno == 4) {
                fplx = data.af0b;
                hwxxs = data.c32a;
                fpxxs = data.a22a;
            } else if (tempno == 5) {
                fplx = data.ecae;
                hwxxs = data.c3c0;
                fpxxs = data.cb20;
            } else if (tempno == 6) {
                fplx = data.c3c8;
                hwxxs = data.a574;
                fpxxs = data.da20;
            } else if (tempno == 7) {
                fplx = data.dc02;
                hwxxs = data.cc66;
                fpxxs = data.ddbb;
            } else if (tempno == 8) {
                fplx = data.b3dd;
                hwxxs = data.c2b9;
                fpxxs = data.e72d;
            } else if (tempno == 9) {
                fplx = data.f16a;
                hwxxs = data.ceb5;
                fpxxs = data.a83e;
            }
            var rule = sessionStorage["rule"];
            var rules = rule.split('☺');
            var splitstr = rules[0];
            fpxxs = fpxxs.replaceAll(splitstr, "≡");
            hwxxs = hwxxs.replaceAll(splitstr, "≡");
            splitstr = "≡";

            var sort = data.sort;
            var sortarray = sort.split("_");
            var tmpfpxx = fpxxs.split("≡");
            var cysj = tmpfpxx[tmpfpxx.length - 1];
            var tmpfp = new Array(tmpfpxx.length - 4);
            for (i = 3; i < tmpfpxx.length - 1; i++) {
                tmpfp[i - 3] = tmpfpxx[i];
            }

            var newfpxx = new Array(tmpfpxx.length - 4);
            for (i = 0; i < tmpfpxx.length - 4; i++) {
                newfpxx[i] = tmpfp[parseInt(sortarray[i])];
            }
            var newfpxxstr = tmpfpxx[0] + "≡" + tmpfpxx[1] + "≡" + tmpfpxx[2] + "≡";
            for (i = 0; i < newfpxx.length; i++) {
                newfpxxstr = newfpxxstr + newfpxx[i] + "≡";
            }
            fpxxs = newfpxxstr + cysj;
            var cycs = 0;
            if (fpxxs != null && fpxxs != "") {
                var fpxx = fpxxs.split(splitstr); //"≡"); 
                cycs = Number(fpxx[3]) + 1;
                var InvoiceSubInfos = [];

                var hwii = hwxxs.split("▄");
                if (hwii.length > 1) {
                    hwxxs = hwii[0];
                }
                var hwinfo = hwxxs.split('≡');
                var hw;
                var html = "";
                for (var i = 0; i < hwinfo.length; i++) {
                    hw = hwinfo[i].split('█');
                    var InvoiceSubInfo = new Object();
                    InvoiceSubInfo.InvoiceCode = fpxx[0];
                    InvoiceSubInfo.InvoiceNumber = fpxx[1];
                    InvoiceSubInfo.CheckCode = fpxx[19];
                    InvoiceSubInfo.MachineNumber = fpxx[17];
                    InvoiceSubInfo.NO = "";
                    InvoiceSubInfo.GoodsName = FormatHwmc(hw[0], rules[4]);
                    InvoiceSubInfo.SpecificationModel = hw[1];
                    InvoiceSubInfo.Unit = hw[2];
                    InvoiceSubInfo.Quantity = getzeroDot(hw[3]);
                    InvoiceSubInfo.UnitPrice = GetJeToDot(hw[4].trim());
                    InvoiceSubInfo.Money = GetJeToDot(hw[5].trim());
                    InvoiceSubInfo.TaxRate = FormatSl(hw[6]);
                    InvoiceSubInfo.Tax = GetJeToDot(hw[7].trim());
                    InvoiceSubInfo.Total = '￥' + GetJeToDot(getje(fpxx[13], rules[2]));
                    InvoiceSubInfo.TotalTax = '￥' + GetJeToDot(getje(fpxx[14], rules[2]));
                    InvoiceSubInfos.push(InvoiceSubInfo);
                }
                var postData = {
                    InvoiceProvince: fpxx[2],
                    InvoiceType: fplx,  //发票类型
                    InvoiceCode: fpxx[0],  //发票代码
                    InvoiceNumber: fpxx[1], //发票号码
                    InvoiceDate: FormatDate(fpxx[4], rules[3]),
                    CheckCode: fpxx[19],
                    MachineNumber: fpxx[17],
                    GName: fpxx[5],
                    GIdentificationCode: fpxx[6],
                    GAddressPhone: fpxx[7],
                    GBankAccount: fpxx[8],
                    PasswordArea: "",
                    TotalPriceB: NoToChinese(GetJeToDot(getje(fpxx[15], rules[2])), "01"),
                    TotalPriceS: GetJeToDot(getje(fpxx[15], rules[2])),
                    XName: fpxx[9],
                    XIdentificationCode: FormatSBH(fpxx[10], rules[1]),
                    XAddressPhone: fpxx[11],
                    XBankAccount: fpxx[12],
                    InspectionTimes: cycs,  //查验次数
                    InspectionTime: fpxx[21], //查验时间
                    Remark: data.jmbz.replace(/\r\n/g, "<br/>").replace(/\n/g, "<br/>"),
                    InvoiceSubInfo: InvoiceSubInfos
                };
                $.ajax({
                    type: "POST",
                    url: "Verification.aspx",
                    timeout: 900000, //超时时间设置，单位毫秒
                    //contentType: "application/json", //这个一定要加上哟！
                    dataType: "text",
                    data: { pData: postData },
                    success: function (jsondata) {
                        var json = eval("(" + jsondata + ")");
                        if (json.success == 'true') {
                            clearInfo();
                            divFadeAlert(json.inf, "1");
                            //jAlert('成功!', json.inf);
                        }
                        if (json.success == 'false') {
                            clearInfo();
                            divFadeAlert(json.inf, "2");
                            //jAlert('出错!', json.inf);
                        }
                    },
                    fail: function (data) {
                        clearInfo();
                        divFadeAlert('异常出错！', "2");
                        //jAlert('出错!', data);
                    }
                });
            }
        }

        $("#checkfp").click(function () {
            var fpdm = $("#fpdm").val().trim();
            var fphm = $("#fphm").val().trim();
            var kprq = $("#kprq").val().trim();
            var dmchek = getSwjg(fpdm, 1);
            if (dmchek.length > 0) {
                var DATE_FORMAT = /^[0-9]{4}[0-1]?[0-9]{1}[0-3]?[0-9]{1}$/;
                if (DATE_FORMAT.test(kprq)) {

                } else {
                    jAlert("日期格式错误，为YYYYMMDD格式！", "提示");
                    return;
                }
                var kjje = $("#kjje").val().trim();
                if (aur()) {
                    $('#checkfp').hide();
                    $('#uncheckfp').show();
                    //$('#checkfp').attr("disabled", true);
                    var date = new Date();

                    var yzm = $("#yzm").val().trim();
                    var setText = "";

                    var param = null;
                    var url = "";

                    var iterationCount = 100;
                    var keySize = 128;
                    iv = CryptoJS.lib.WordArray.random(128 / 8).toString(CryptoJS.enc.Hex);
                    salt = CryptoJS.lib.WordArray.random(128 / 8).toString(CryptoJS.enc.Hex);
                    var aesUtil = new AesUtil(keySize, iterationCount);

                    if (avai(fplx)) {

                        if (fplx == "01" || fplx == "02" || fplx == "03") {
                            var index = kjje.indexOf(".");
                            if (index > 0) {
                                var arr = kjje.split(".");
                                if (arr[1] == "00" || arr[1] == "0") {
                                    kjje = arr[0];
                                } else if (arr[1].charAt(1) == "0") {
                                    kjje = arr[0] + "." + arr[1].charAt(0);
                                }
                            }
                        }

                        param = {
                            'fpdm': fpdm,
                            'fphm': fphm,
                            'kprq': kprq,
                            'fpje': kjje,
                            'fplx': fplx,
                            'yzm': yzm,
                            'yzmSj': yzmSj,
                            'index': jmmy,
                            'iv': iv,
                            'salt': salt
                        };
                        delayMessage = "发票查验请求失败!";
                        showTime();

                        url = ip + "/query"; //省局外网包查验发票的地址
                        $.ajax({
                            type: "post",
                            url: url,
                            dataType: "jsonp",
                            data: param,
                            jsonp: "callback",
                            success: function (jsonData) {
                                delayFlag = "1";
                                var cyjgdm = jsonData.key1;

                                if (cyjgdm == "1") {
                                    show_yzm = "";
                                    //标志为1，是试运行且代码为非北京，上海，深圳的。防范前台没卡住的情况
                                    jAlert("该省尚未开通发票查验功能！", "提示");
                                } else if (cyjgdm == "001") {
                                    show_yzm = "";
                                    var t = jsonData.key5;
                                    //var t = "var aa17=fpdm+\"≡\"+fphm+\"≡\"+swjgmc+\"≡\"+jsonData.key2+\"≡\"+yzmSj";
                                    //这里是从后台传来的
                                    eval(t);
                                    var hwxx = jsonData.key3;
                                    var jmbz = "";
                                    if (jsonData.key4.trim() != '') {
                                        jmbz = aesUtil.decrypt(jsonData.key8, jsonData.key7, jsonData.key9, jsonData.key4); //解密备注
                                    }
                                    var jmsort = aesUtil.decrypt(jsonData.key8, jsonData.key7, jsonData.key9, jsonData.key10); //解密排序顺序
                                    var tt = jsonData.key6;
                                    jsname = jsonData.key11 + ".js"; //用哪个js，从后台传过来。还需要一个配置页面
                                    //var tt = "var result={\"template\":3,\"c342\":fplx,\"d64b\":aa17,\"dbd2\":hwxx,\"jmbz\":jmbz,\"sort\":jmsort}";//这个也是后台传的
                                    eval(tt);
                                    //key7也需要获取，如果未获取到，则用上面定义的jsname，否则，使用key7代入的jsname。
                                    if (browser == "edge" || browser == "firefox") {
                                        sessionStorage["jsname"] = jsname;
                                        $.getScript("https://inv-veri.chinatax.gov.cn/js/" + jsname,
                                function () { //加载,并执行回调函数 (回调函数是空的)
                                    sessionStorage["rule"] = rule;
                                    bb(result);
                                    //show_dialog(1100, 700, "cyjgedge" + fplx + ".html", result);
                                });
                                    } else if (browser == "ie8") { //ie8不能通过方法参数获取到相应数据，所以特殊处理
                                        sessionStorage["jsname"] = jsname;
                                        sessionStorage["browser"] = "ie8";
                                        var str = JSON.stringify(result);
                                        sessionStorage["result"] = str;
                                        $.getScript("https://inv-veri.chinatax.gov.cn/js/" + jsname,
                                function () { //加载,并执行回调函数 (回调函数是空的)
                                    sessionStorage["rule"] = rule;
                                    bb(result);
                                    //show_dialog(1100, 700, "cyjgedge" + fplx + ".html", result);
                                });
                                    } else {
                                        sessionStorage["jsname"] = jsname;
                                        $.getScript("https://inv-veri.chinatax.gov.cn/js/" + jsname,
                                function () { //加载,并执行回调函数 
                                    sessionStorage["rule"] = rule;
                                    //window.showModalDialog('cyjg' + fplx + '.html', result, "dialogTop:10px;dialogWidth:1100px;dialogHeight:700px;");
                                });
                                    }
                                } else if (cyjgdm == "002") {
                                    show_yzm = "";
                                    jAlert("超过该张发票当日查验次数(请于次日再次查验)!", "提示",
                            function (r) {
                                if (r) {
                                    arw();
                                }
                            });
                                } else if (cyjgdm == "003") {
                                    show_yzm = "";
                                    jAlert("发票查验请求太频繁，请稍后再试！", "提示",
                            function (r) {
                                if (r) {
                                }
                            });
                                } else if (cyjgdm == "004") {
                                    show_yzm = "";
                                    jAlert("超过服务器最大请求数，请稍后访问!", "提示",
                            function (r) {
                                if (r) {
                                }
                            });
                                } else if (cyjgdm == "005") {
                                    show_yzm = "";
                                    jAlert("请求不合法!", "提示",
                            function (r) {
                                if (r) {
                                }
                            });
                                } else if (cyjgdm == "020") {
                                    show_yzm = "";
                                    jAlert("由于查验行为异常，涉嫌违规，当前无法使用查验服务！", "提示",
                            function (r) {
                                if (r) {
                                }
                            });
                                } else if (cyjgdm == "006") {
                                    show_yzm = "";
                                    setText = "不一致";
                                    jAlert("数据不一致!", "提示");
                                    param = {
                                        'fplx': fplx,
                                        'swjg': swjgmc,
                                        'fpdm': fpdm,
                                        'fphm': fphm,
                                        'kprq': kprq,
                                        'kjje': kjje,
                                        'cysj': yzmSj,
                                        'setText': setText
                                    };
                                    if (browser == "edge" || browser == "firefox") {
                                        // show_dialog(700, 400, "jgbyz.html", param);
                                    } else { //ie8无问题
                                        //window.showModalDialog('jgbyz.html', param, "dialogWidth:700px;dialogHeight:400px;center:yes;scroll:no");
                                    }
                                } else if (cyjgdm == "007") {
                                    show_yzm = "";
                                    jAlert("验证码失效!", "提示",
                            function (r) {
                                if (r) {
                                }
                            });
                                } else if (cyjgdm == "008") {
                                    show_yzm = "";
                                    jAlert("验证码错误!", "提示",
                            function (r) {
                                if (r) {
                                }
                            });
                                } else if (cyjgdm == "009") {
                                    show_yzm = "";
                                    setText = "查无此票";
                                    jAlert("查无此票!", "提示");
                                    param = {
                                        'fplx': fplx,
                                        'swjg': swjgmc,
                                        'fpdm': fpdm,
                                        'fphm': fphm,
                                        'kprq': kprq,
                                        'kjje': kjje,
                                        'cysj': yzmSj,
                                        'setText': setText
                                    };
                                    if (browser == "edge" || browser == "firefox") {
                                        //show_dialog(700, 400, "jgbyz.html", param);
                                    } else { //ie8无问题
                                        //window.showModalDialog('jgbyz.html', param, "dialogWidth:700px;dialogHeight:400px;center:yes;scroll:no");
                                    }
                                } else if (cyjgdm == "rqerr") {
                                    show_yzm = "";
                                    jAlert("当日开具发票可于次日进行查验！", "警告");
                                } else if (cyjgdm == "010") {
                                    show_yzm = "";
                                    var etype = jsonData.key2;
                                    if (etype == 'inredis') {
                                        etype = "(02)";
                                    } else if (etype == 'weberr') {
                                        etype = "(03)";
                                    }
                                    jAlert("网络超时，请重试！" + etype, "系统错误",
                            function (r) {
                                if (r) {
                                }
                            });
                                } else if (cyjgdm == "010_") {
                                    show_yzm = "";
                                    jAlert("网络超时，请重试！(05)", "系统错误",
                            function (r) {
                                if (r) { }
                            });
                                } else {
                                    show_yzm = "";
                                    jAlert("网络超时，请重试！(04)", "系统错误",
                            function (r) {
                                if (r) {
                                }
                            });
                                }
                                //$('#uncheckfp').hide();
                                // $('#checkfp').show();
                                yzmSj = "";

                            }
                        });
                    }
                }
            }

        });
        var retrycount = 0;
        function getYzmXx() {
            show_yzm = "1";
            //if (ip == "") {  //如果设置的是空地址，说明是通过数组获取相应的省局服务器地址，非开发及测试模式时
            var fpdm = $("#fpdm").val().trim();
            var swjginfo = getSwjg(fpdm, 0);
            ip = swjginfo[1];
            //}
            var url = ip + "/yzmQuery";
            delayMessage = "";
            showTime();
            var fpdmyzm = $("#fpdm").val().trim();
            var fphm = $("#fphm").val().trim();
            var kprq = $("#kprq").val().trim();
            var kjje = $("#kjje").val().trim();
            var rad = Math.random();
            var param = {
                'fpdm': fpdmyzm,
                'r': rad
            };
            $.ajaxSetup({
                cache: false
            });

            yzmFlag = 1;

            $.ajax({
                type: "post",
                url: url,
                data: param,
                dataType: "jsonp",
                jsonp: "callback",
                success: function (jsonData) {
                    delayFlag = "1";
                    var key1 = jsonData.key1;
                    var key2 = jsonData.key2;
                    var key3 = jsonData.key3;
                    var key4 = jsonData.key4;
                    if (key1 == "003") {
                        jAlert("验证码请求次数过于频繁，请1分钟后再试！", "警告");
                        $('#yzm_img').hide();
                        for (i = 0; i < lastlinenum; i++) {
                            $("#i" + i).remove();
                        }
                        //setTimeout(showYzm, 60 * 1000);
                    } else if (key1 == "005") {
                        divFadeAlert("非法请求", "2");
                        //jAlert("非法请求!", "警告");
                    } else if (key1 == "010") {
                        divFadeAlert("网络超时，请重试！(01)", "2");
                        //jAlert("网络超时，请重试！(01)", "警告");
                    } else if (key1 == "fpdmerr") {
                        divFadeAlert("请输入合法发票代码","2");
                        //jAlert("请输入合法发票代码!", "警告");
                    } else if (key1 == "024") {
                        jAlert("24小时内验证码请求太频繁，请稍后再试！", "警告");
                        $('#yzm_img').hide();
                        for (i = 0; i < lastlinenum; i++) {
                            $("#i" + i).remove();
                        }
                    } else if (key1 == "016") {
                        jAlert("服务器接收的请求太频繁，请稍后再试！", "警告");
                        $('#yzm_img').hide();
                        for (i = 0; i < lastlinenum; i++) {
                            $("#i" + i).remove();
                        }
                    } else if (key1 == "020") {
                        jAlert("由于查验行为异常，涉嫌违规，当前无法使用查验服务！", "提示",
                function (r) {
                    if (r) {
                        //$('#uncheckfp').hide();
                        //$('#checkfp').show();
                    }
                });
                    } else if (key1 != "") {
                        $("#yzm_img").attr("src", "data:image/png;base64," + key1);
                        $("#yzm_unuse_img").attr("src", "data:image/png;base64," + key1);

                        if (key4 == '00') {
                            $("#yzminfo").text("请输入验证码文字");
                        } else if (key4 == '01') {
                            $("#yzminfo").html("请输入验证码图片中<font color=\"red\" size=\"4\" style=\"background:#C0C0C0\">红色</font>文字");
                        } else if (key4 == '02') {
                            $("#yzminfo").html("请输入验证码图片中<font color=\"yellow\" size=\"4\" style=\"background:#C0C0C0\">黄色</font>文字");
                        } else if (key4 == '03') {
                            $("#yzminfo").html("请输入验证码图片中<font color=\"blue\" size=\"4\" style=\"background:#C0C0C0\">蓝色</font>文字");
                        }
                        drawline();
                        yzmSj = key2;
                        jmmy = key3;
                    }

                },
                //3秒后超时    
                timeout: 5000,
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    if (retrycount == 9) {
                        //jAlert("根证书未安装或与" + swjginfo[0] + "国税\r\n服务器之间的网络异常。", "警告");
                    } else {
                        retrycount = retrycount + 1;
                        //console.log("retrycount: " + retrycount);
                        getYzmXx();
                    }
                }
            });

            yzmWait = 2;
            yzmTime($('#yzm_img'));
        }
        window.onerror = function (msg, file, line) {
            return true; //true表示是否需要弹出错误提示。false 不需要。
        };
        function handleErr(msg, url, line) {
            var errorTxt = "";
            errorTxt += "Error: " + msg + "\n";
            errorTxt += "Line: " + line + "\n";
            errorTxt += "Url: " + url + "\n";
            //alert(errorTxt);
            return true;
        }
        var yzmWait = 2;
        function yzmTime(o) {
            if (yzmWait == 0) {
                $('#yzm_unuse_img').hide();
                $('#yzm_img').show();
                yzmWait = 60;
            } else {
                if (yzmWait == 2) {
                    $('#yzm_unuse_img').show();
                    $('#yzm_img').hide();
                }
                yzmWait--;
                setTimeout(function () {
                    yzmTime(o);
                },
        1000)
            }
        }

        function randint(n, m) {
            var c = m - n + 1;
            var num = Math.random() * c + n;
            return Math.floor(num);
        }

        var lastlinenum = 0;
        function drawline() {
        }

        function showTime() {
        }
        function divFadeAlert(str, typeInfo) {
            var hidvalue_str = 'font-size:20px; font-weight:bold; color:Green;';
            var divWidth = 200;
            var divHeight = 200;
            var iLeft = ($(window).width() - divWidth) / 2;
            var iTop = ($(window).height() - divHeight) / 2 + $(document).scrollTop();
            var divhtml;
            if (typeInfo == "1") {
                divhtml = $("<div style=' font-size:30px; font-weight:bold; color:Green; '>" + str + "</div>").css({ position: 'absolute', top: iTop + 'px', left: iLeft + 'px', display: 'none', width: divWidth + 'px', height: divHeight + 'px' });
                divhtml.appendTo('body').fadeIn();
                divhtml.appendTo('body').fadeOut(1500);
            }
            if (typeInfo == "2") {
                divhtml = $("<div style=' font-size:30px; font-weight:bold; color:Red; '>" + str + "</div>").css({ position: 'absolute', top: iTop + 'px', left: iLeft + 'px', display: 'none', width: divWidth + 'px', height: divHeight + 'px' });
                divhtml.appendTo('body').fadeIn();
                divhtml.appendTo('body').fadeOut(3000);
            }

        }
        function clearInfo() {
            $("#fpdm").val('');
            $("#fphm").val('');
            $("#kprq").val('');
            $("#kjje").val('');
            $("#fpsys").val('');
            $("#yzm").val('');
            $("#fpsys").focus();
        }

        $("#fpsys").focus();
    </script>
</body>
</html>
