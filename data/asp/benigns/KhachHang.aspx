<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterOne.Master" CodeBehind="KhachHang.aspx.vb" Inherits="DoDem.KhachHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type='text/javascript' src='https://www.google.com/jsapi'></script>
    <script type="text/javascript">
        function drawChart() { }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript">
    function popup(ngay, madd, tenkh) {
        var x = screen.width / 2 - 800 / 2;
        var y = screen.height / 2 - 400 / 2;
        //window.open('aj.aspx?ngay=' + ngay + '&madd=' + madd, 'Điện năng khách hàng chi tiết', 'height=600,width=1200,left=' + x + ',top=' + y);

        var oWnd = radopen('aj.aspx?ngay=' + ngay + '&madd=' + madd + '&tenkh=' + tenkh, "Điện năng khách hàng chi tiết", 800, 400, x, y);
    }

    $(document).ready(function () {

        $("#<%=txtTuNgay.ClientID %>").datepicker({
            dateFormat: "dd/mm/yy",
            /*maxDate: "dateToday",*/
            changeMonth: false,
            changeYear: false
        });

        $("#<%=txtDenNgay.ClientID %>").datepicker({
            dateFormat: "dd/mm/yy",
            /*maxDate: "dateToday",*/
            changeMonth: false,
            changeYear: false
        });
    });
 
    </script>
    <script language="javascript" type="text/javascript">
        var ss = [""];

        function scrollToNode() {
            var treeview = $find("<%= treeView.ClientID %>");
            if (treeview != null) {
                var node = treeview.get_selectedNode();
                if (node != null) {
                    var nodeElement = node.get_contentElement();
                    var treeViewElement = treeview.get_element();

                    var nodeOffsetTop = treeview._getTotalOffsetTop(nodeElement);
                    var treeOffsetTop = treeview._getTotalOffsetTop(treeViewElement);
                    var relativeOffsetTop = nodeOffsetTop - treeOffsetTop;

                    treeViewElement.scrollTop = relativeOffsetTop;
                }
            }
        }
        function selectNode(text) {
            var tree = $find("<%= treeView.ClientID %>");
            var allNodes = tree.get_nodes().getNode(0).get_allNodes();
            for (var i = 0; i < allNodes.length; i++) {
                var node = allNodes[i];
                if (node.get_text().toLowerCase().indexOf(text.toLowerCase()) != -1 && ss.indexOf(node.get_text()) == -1) {
                    text = node.get_text();
                    ss.push(node.get_text());
                }
                node.unhighlight
            }
            var node = tree.findNodeByText(text);
            if (node != null) {
                if (node.get_category() == 'TUYEN') {
                    node.get_parent().get_parent().expand();
                    node.get_parent().expand();

                }
                else if (node.get_category() == 'TRAM') {
                    node.get_parent().expand();

                }
                node.highlight();
                //node.select();
                //scroll to node

                var nodeElement = node.get_contentElement();
                var treeViewElement = tree.get_element();
                var nodeOffsetTop = tree._getTotalOffsetTop(nodeElement);
                var treeOffsetTop = tree._getTotalOffsetTop(treeViewElement);
                var relativeOffsetTop = nodeOffsetTop - treeOffsetTop;
                treeViewElement.scrollTop = relativeOffsetTop;
                $('#Left-home').scrollTop(relativeOffsetTop);
            }
            else {
                ss = [""];
                alert("Không tìm thấy!!!");
            }
        }
        
    </script>

    <table border="0" cellpadding="0" cellspacing="0" width="100%" style="height: 100%;">
        <tr>
            <td style="width: 290px;" valign="top" align="left">
                <div id="Left-home" style="max-height:800px; overflow-y: auto; ">
                    <telerik:RadTreeView ID="treeView" Runat="server"  Skin="Forest" 
                        Width="100%">
                    </telerik:RadTreeView>
                </div>
                
            </td>
            <td style="width: 100%" valign="top" align="left">
                <div id="right-content">
                    <div id="ContentPlaceHolder1_ctl00_divPanel" style="border:1px solid #E2C822;height:65px;background:#FFF9D7;line-height:38px;width:880px;">
                      <div style="margin-left: 1px; margin-right: 1px; margin-top: 5px;">
                            <div style="line-height: 30px;" class="displayinline">            
                                <div id="ContentPlaceHolder1_ctl00_Panel2" class="displayinline">	
                                        <div style="float: left; width: 100%; padding-left: 2px; height: 34px; padding-top:10px;">
                                            
                                             &nbsp;&nbsp;&nbsp;Từ ngày&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                    
                                            <asp:TextBox ID="txtTuNgay" class="text-box" style="width:95px;" runat="server"></asp:TextBox> 
                                             &nbsp;&nbsp;&nbsp;Đến ngày&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                    
                                            <asp:TextBox ID="txtDenNgay" class="text-box" style="width:95px;" runat="server"></asp:TextBox> 
                                            <asp:Button ID="btnThucHien" runat="server" Text="ThucHien" style="display:none"  />
                                            &nbsp;&nbsp;<a class="ifc-button ifc-button-submit" href="javascript:void(0)" onclick="document.getElementById('<%=btnThucHien.ClientID %>').click()"><span class="btn-icon-search"></span>Thực hiện</a>
                                            &nbsp;<asp:CheckBox ID="ckXem1Ngay" Checked="true" Text="Chỉ xem 1 ngày" runat="server" />
                                        </div>
            
                                 </div>                                
                            </div>
                       </div>
                    </div>
                    <table style="width: 100%;" border="0">
                        <tr>
                            <td>
                               <div style="vertical-align:top">                                
                                    <script type="text/javascript">
                                        google.load('visualization', '1', { packages: ['corechart'] });
                                        google.setOnLoadCallback(drawChart);
                                    </script>
                                    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                                        <ContentTemplate>                                            
                                            <asp:Literal ID="lt" runat="server" ></asp:Literal>
                                            <div id="chart_div"></div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="treeView" EventName="NodeClick" />
                                            <asp:AsyncPostBackTrigger ControlID="btnThucHien" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                               </div>
                            </td>
                           
                        </tr>
                        <tr>
                            <td>
                            <div id="Div1" style="border:1px solid #E2C822;height:30px;background:#FFF9D7;line-height:38px;width:880px;">
                                <center>
                                    <asp:Label ID="Label1" runat="server" Text="CHI TIẾT SẢN LƯỢNG" 
                                        Font-Bold="True" Font-Size="11pt" ForeColor="#BE4401"></asp:Label>
                                </center> 
                            </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" valign="top">                                
                                <asp:UpdatePanel ID="UpdatePanel3" UpdateMode="Conditional" runat="server">
                                    <ContentTemplate>                                        
                                
                                         <asp:Literal ID="frame" runat="server" ></asp:Literal>
                                         <telerik:RadGrid ID="gridList" Width="880" PageSize="50" AllowPaging="False" AllowSorting="False"
                                            Skin="WebBlue" AllowFilteringByColumn="False" CellSpacing="0" GridLines="None" runat="server" MasterTableView-NoMasterRecordsText="<center>Chưa có dữ liệu tìm thấy.</center>">
                                            <GroupingSettings CaseSensitive="false" />
                                            <MasterTableView AutoGenerateColumns="false">                                
                                                <Columns>
                                                     <telerik:GridDateTimeColumn DataField="NGAY" DataType="System.DateTime" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"
                                                        FilterControlAltText="Filter NGAY column" HeaderText="NGÀY"  DataFormatString="{0:dd/MM/yyyy}"
                                                        UniqueName="NGAY">
                                                    </telerik:GridDateTimeColumn>
                                                    <telerik:GridNumericColumn DataField="GIO" DecimalDigits="1" HeaderStyle-HorizontalAlign="Right"
                                                        FilterControlAltText="Filter GIO column" HeaderText="GIỜ (kWh)"
                                                        UniqueName="GIO" DataType="System.Integer">
                                                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                                    </telerik:GridNumericColumn>
                                                    <telerik:GridNumericColumn DataField="TONGGIAO" DecimalDigits="1" HeaderStyle-HorizontalAlign="Right"
                                                        FilterControlAltText="Filter TONGGIAO column" HeaderText="SẢN LƯỢNG GIAO (kWh)"
                                                        UniqueName="TONGGIAO" DataType="System.Decimal">
                                                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                                    </telerik:GridNumericColumn> 
                                                    <telerik:GridNumericColumn DataField="TONGNHAN" DecimalDigits="1" HeaderStyle-HorizontalAlign="Right"
                                                        FilterControlAltText="Filter TONGNHAN column" HeaderText="SẢN LƯỢNG NHẬN (kWh)"
                                                        UniqueName="TONGNHAN" DataType="System.Decimal">
                                                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                                    </telerik:GridNumericColumn>                                                  
                                                </Columns>
                                            </MasterTableView>                            
                                        </telerik:RadGrid>
                                
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="treeView" EventName="NodeClick" />
                                        <asp:AsyncPostBackTrigger ControlID="btnThucHien" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
