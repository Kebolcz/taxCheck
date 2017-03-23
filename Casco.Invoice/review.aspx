<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="review.aspx.cs" Inherits="Casco.Invoice.review" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>发票查验记录</title>
    <link rel="shortcut icon" type="image/x-icon" href="./images/favicon.ico" />
    <script charset='utf-8' type='text/javascript' src="Scripts/jquery.min.js"></script>
    <script charset='utf-8' type='text/javascript' src="Scripts/bootstrap.min.js"></script>
    <script charset='utf-8' type='text/javascript' src="Scripts/bootstrap-datetimepicker.min.js"></script>
    <script charset='utf-8' type='text/javascript' src="Scripts/bootstrap-datetimepicker.zh-CN.js"></script>
    <link type="text/css" rel="stylesheet" href="Scripts/bootstrap-datetimepicker.min.css" />
    <script language="javascript">
        document.write("<l" + "ink rel='stylesheet' type='text/css' href='https://inv-veri.chinatax.gov.cn/css/common.css?" + Math.random() + "' />");
        //document.write("<l" + "ink rel='stylesheet' type='text/css' href='https://inv-veri.chinatax.gov.cn/css/jquery.alerts.css?" + Math.random() + "' media='screen' />");
        //document.write("<l" + "ink rel='stylesheet' type='text/css' href='https://inv-veri.chinatax.gov.cn/css/bootstrap-datepicker.min.css' />");
    </script>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />
    <style>
        th {
            text-align: center;
        }

        input {
            color: #000;
        }

        a {
            color: #000;
        }

            a:hover {
                color: #CDDC39 !important;
                text-decoration: none !important;
            }

        .hide {
            display: none;
        }

        #GridView1 th {
            vertical-align: middle;
        }

        #GridView1 td {
            vertical-align: middle;
        }

        table td a {
            display: inline-block;
            padding: 6px 12px;
            margin-bottom: 0;
            font-size: 14px;
            font-weight: normal;
            line-height: 1.42857143;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            -ms-touch-action: manipulation;
            touch-action: manipulation;
            cursor: pointer;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            background-image: none;
            border: 1px solid transparent;
            border-radius: 4px;
            color: #fff;
            background-color: #d9534f;
            border-color: #d43f3a;
        }
        .radioBtn {
            position:absolute;
            top:50%;
            left:100px;
            margin-top:-10px;
        }

        input[type=checkbox] {
            margin:0;
            vertical-align:middle;
        }
    </style>
</head>
<body>
    <form runat="server">
        <div id="top">
            <!--header begin-->
            <div id="headerbox">
                <div id="header">
                    <div class="logo" style="background: url(../images/logo.png) no-repeat left center; padding-left: 170px">
                        增值税发票查验平台
                    </div>
                    <span id="Hotnews" style="left: 170px">支持增值税专用发票、增值税普通发票（含电子普通发票、卷式发票）在线查验</span>
                    <span style="left: 170px; display: none;">支持增值税专用发票、增值税普通发票（含电子普通发票、卷式发票）、机动车销售统一发票、货物运输业增值税专用发票在线查验</span>
                </div>
            </div>
            <!--header end-->
        </div>
        <div class="container" style="margin-top: 15px;position:relative;">
            <div class="radioBtn">
                <label>
                  <input type="checkbox" id="posCBBtn" > 精确查询
                </label>
            </div>
            <div class="form-inline search1">
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                    <asp:ListItem Selected="True" Value="0">所有</asp:ListItem>
                    <asp:ListItem Value="01">专票</asp:ListItem>
                    <asp:ListItem Value="04">普票</asp:ListItem>
                </asp:DropDownList>
                <div class="form-group">
                    <label for="startDate">起始日期:    </label>
                    <asp:TextBox CssClass="form-control" ID="startDate" name="startDate" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="endDate">结束日期:    </label>
                    <asp:TextBox CssClass="form-control" ID="endDate" name="endDate" runat="server"></asp:TextBox>
                </div>
                <asp:Button ID="search" runat="server" Text="查询" CssClass="btn btn-primary" OnClick="search_Click" />
                <asp:Button ID="export" runat="server" Text="导出" CssClass="btn btn-info" OnClick="export_Click" />
            </div>
            <div class="form-inline search2" style="display:none;">
                <div class="form-group">
                    <label for="djsys">业务单号:    </label>
                    <asp:TextBox CssClass="form-control" ID="djsys" name="djsys" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="invoiceNum">发票号码:    </label>
                    <asp:TextBox CssClass="form-control" ID="invoiceNum" name="invoiceNum" runat="server"></asp:TextBox>
                </div>
                <asp:Button ID="positioning" runat="server" Text="精确查询" CssClass="btn btn-success" OnClick="positioning_Click" />
            </div>
        </div>
        <div class="container" id="grid" style="margin-top: 25px;">

            <%--<div>--%>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" CssClass="table table-condensed table-bordered" AutoGenerateColumns="False" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" OnRowDeleting="GridView1_RowDeleting" OnRowDataBound="GridView1_RowDataBound">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="编号" ReadOnly="True" />
                    <asp:BoundField DataField="InvoiceType" HeaderText="发票类型" />
                    <asp:BoundField DataField="InvoiceCode" HeaderText="发票代码" />
                    <asp:BoundField DataField="InvoiceNumber" HeaderText="发票号码" />
                    <asp:BoundField DataField="Djsys" HeaderText="业务单号" />
                    <asp:BoundField DataField="InvoiceDate" HeaderText="开票日期" />
                    <asp:BoundField DataField="GIdentificationCode" HeaderText="购买方识别号"><HeaderStyle CssClass="hide" /><ItemStyle  CssClass="hide" /><FooterStyle CssClass="hide" /></asp:BoundField>
                    <asp:BoundField DataField="GName" HeaderText="购买方名称"><HeaderStyle CssClass="hide" /><ItemStyle  CssClass="hide" /><FooterStyle CssClass="hide" /></asp:BoundField>
                    <asp:BoundField DataField="XIdentificationCode" HeaderText="销售方识别号"><HeaderStyle CssClass="hide" /><ItemStyle  CssClass="hide" /><FooterStyle CssClass="hide" /></asp:BoundField>
                    <asp:BoundField DataField="XName" HeaderText="销售方名称" />
                    <asp:BoundField DataField="TotalPriceS" HeaderText="价税合计" />
                    <asp:BoundField DataField="Total" HeaderText="金额(不含税)" />
                    <asp:BoundField DataField="TotalTax" HeaderText="税额" />
                    <asp:BoundField DataField="OperatorID" HeaderText="操作人ID" />
                    <asp:BoundField DataField="InspectionTime" HeaderText="操作日期" />
                    <asp:BoundField DataField="IsChecked" HeaderText="校验状态" />
                    <asp:ButtonField CommandName="Delete" HeaderText="操作" ShowHeader="True" Text="删除" />
                </Columns>
                <PagerTemplate>
                    当前第:
                <%--((GridView)Container.NamingContainer)就是为了得到当前的控件--%>
                    <asp:Label ID="LabelCurrentPage" runat="server" Text="<%# ((GridView)Container.NamingContainer).PageIndex + 1 %>"></asp:Label>
                    页/共:
                <%--得到分页页面的总数--%>
                    <asp:Label ID="LabelPageCount" runat="server" Text="<%# ((GridView)Container.NamingContainer).PageCount %>"></asp:Label>
                    页
                 <%--如果该分页是首分页，那么该连接就不会显示了.同时对应了自带识别的命令参数CommandArgument--%>
                    <asp:LinkButton ID="LinkButtonFirstPage" runat="server" CommandArgument="First" CommandName="Page"
                        Visible='<%#((GridView)Container.NamingContainer).PageIndex != 0 %>'>首页</asp:LinkButton>
                    <asp:LinkButton ID="LinkButtonPreviousPage" runat="server" CommandArgument="Prev"
                        CommandName="Page" Visible='<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>'>上一页</asp:LinkButton>
                    <%--如果该分页是尾页，那么该连接就不会显示了--%>
                    <asp:LinkButton ID="LinkButtonNextPage" runat="server" CommandArgument="Next" CommandName="Page"
                        Visible='<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>'>下一页</asp:LinkButton>
                    <asp:LinkButton ID="LinkButtonLastPage" runat="server" CommandArgument="Last" CommandName="Page"
                        Visible='<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>'>尾页</asp:LinkButton>
                    转到第
                <asp:TextBox ID="txtNewPageIndex" runat="server" Width="20px" Text='<%# ((GridView)Container.Parent.Parent).PageIndex + 1 %>' />页
                <%--这里将CommandArgument即使点击该按钮e.newIndex 值为3--%>
                    <asp:LinkButton ID="btnGo" runat="server" CausesValidation="False" CommandArgument="-2"
                        CommandName="Page" Text="GO" />
                </PagerTemplate>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            </asp:GridView>

            <asp:GridView ID="GridView2" runat="server" CssClass="hide table table-condensed table-bordered" AutoGenerateColumns="False" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" EnableModelValidation="True" OnRowDataBound="GridView2_RowDataBound">
                <Columns>
                    <asp:BoundField HeaderText="编号" ReadOnly="True" />
                    <asp:BoundField DataField="InvoiceType" HeaderText="发票类型" />
                    <asp:BoundField DataField="InvoiceCode" HeaderText="发票代码" />
                    <asp:BoundField DataField="InvoiceNumber" HeaderText="发票号码" />
                    <asp:BoundField DataField="GoodsName" HeaderText="类目名称" />
                    <asp:BoundField DataField="SpecificationModel" HeaderText="类目规格" />
                    <asp:BoundField DataField="Unit" HeaderText="单位" />
                    <asp:BoundField DataField="Quantity" HeaderText="数量" />
                    <asp:BoundField DataField="UnitPrice" HeaderText="单价" />
                    <asp:BoundField DataField="Money" HeaderText="金额" />
                    <asp:BoundField DataField="TaxRate" HeaderText="税率" />
                    <asp:BoundField DataField="Tax" HeaderText="税额" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            <%--</div>--%>
            <%--<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EnableModelValidation="True" Height="169px" Width="707px">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td>发票代码：    <%#Eval("InvoiceCode") %>
                                    </td>
                                    <td>发票号码：    <%#Eval("InvoiceNumber") %>
                                    </td>
                                    <td>开票日期：    <%#Eval("InvoiceDate") %>
                                    </td>
                                    <td>购买方名称：    <%#Eval("GName") %>
                                    </td>
                                    <td>总金额：    <%#Eval("TotalPriceS") %>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="8">
                                        <asp:GridView ID="GridView2" runat="server" DataSource='<%# ((System.Data.DataRowView)Container.DataItem).CreateChildView("details") %>'  DataMember="InvoiceNumber" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableModelValidation="True">
                                            <Columns>
                                                <asp:BoundField DataField="NO" HeaderText="分类号" />
                                                <asp:BoundField DataField="GoodsName" HeaderText="类目名称" />
                                                <asp:BoundField DataField="Unit" HeaderText="单位" />
                                                <asp:BoundField DataField="Quantity" HeaderText="数量" />
                                                <asp:BoundField DataField="UnitPrice" HeaderText="单价" />
                                                <asp:BoundField DataField="Money" HeaderText="金额" />
                                                <asp:BoundField DataField="TaxRate" HeaderText="税率" />
                                                <asp:BoundField DataField="Tax" HeaderText="税额" />
                                            </Columns>
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>--%>
        </div>
    </form>
    <script charset="utf-8" type="text/javascript">
        function nowDate() {
            //若要显示:当前日期加时间(如:2009-06-12 12:00)
            var now = new Date();
            var year = now.getFullYear();
            //年
            var month = now.getMonth() + 1;
            //月
            var day = now.getDate();
            //日
            var clock = year + '-';
            if (month < 10) {
                clock += "0";
            }
            clock += month + '-';

            if (day < 10) {
                clock += "0";
            }
            clock += day;

            return clock;
        }

        /*
         * 自动填充当前月的第一天和最后一天
         */
        var date_ = new Date();
        var firstdate = "";
        var year_ = date_.getFullYear();
        firstdate += year_ + '-';
        var month_ = date_.getMonth() + 1;
        if (month_ < 10) {
            firstdate += "0";
        }
        firstdate += month_;
        firstdate += '-01';
        var day = new Date(year_, month_, 0);
        //var lastdate = year_ + '-' + month_ + '-' + day.getDate();
        var lastdate = "";
        lastdate += year_ + '-';
        if (month_ < 10) {
            lastdate += "0";
        }
        lastdate += month_ + '-' + day.getDate();

        //初次加载时,查询日期赋值当月第一天和最后一天
        var IsPostBack = "<%=IsPostBack%>";
        if (IsPostBack == "False") {
            $("#startDate").val(firstdate);
            $("#endDate").val(lastdate);
        }

        $("#startDate").datetimepicker({
            format: 'yyyy-mm-dd',
            minView: 'month',
            language: 'zh-CN',
            initialDate: new Date(),
            autoclose: true,
        }).on("click", function () {
            $("#startDate").datetimepicker("setEndDate", $("#endDate").val())
        });
        $("#endDate").datetimepicker({
            format: 'yyyy-mm-dd',
            minView: 'month',
            language: 'zh-CN',
            initialDate: new Date(),
            autoclose: true,
        }).on("click", function () {
            $("#endDate").datetimepicker("setStartDate", $("#startDate").val())
        });

        $("#startDate").blur(function () {
            if ($("#startDate").val() != "" && $("#endDate").val() != "" && $("#startDate").val() > $("#endDate").val()) {
                alert("查询起始时间不能晚于结束时间!");
                $("#startDate").val(nowDate());
            }
        });

        $("#endDate").blur(function () {
            if ($("#startDate").val() != "" && $("#endDate").val() != "" && $("#endDate").val() < $("#startDate").val()) {
                alert("查询结束时间不能早于起始时间!");
                $("#endDate").val(nowDate());
            }
        });

        $("#posCBBtn").on("click", function () {
            if (this.checked) {
                $(".search1").hide();
                $(".search2").show();
            } else {
                $(".search2").hide();
                $(".search1").show();
            }
        });
    </script>
</body>
</html>
