<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/ASite.Master" CodeBehind="dash.aspx.vb" Inherits="serCheckData.dash" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">        
    </script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="toolbar-box">
	<div class="m">
		<div id="toolbar" class="toolbar-list">
            
            <div class="clr"></div>
            </div>
			<div class="pagetitle icon-48-article"><h2>Biểu Đồ Số Liệu Đo Xa</h2></div>
		</div>
    </div>
    <div id="system-message-container">            
        <asp:PlaceHolder ID="msg" runat="server">                
        </asp:PlaceHolder> 
    </div>
    <div id="element-box">
        <div class="m">



        <table width="90%" align="center">           
            <tr>
                <td align="center">
                    <table>
                         <tr>
                            <td>Ngày:</td>
                            <td style=" width:20">&nbsp;</td>
                            <td>
                                <telerik:RadDatePicker ID="dpTuNgay" Calendar-CultureInfo="vi-VN" AutoPostBack="true" ToolTip="Xem dữ liệu" runat="server">
                                    <DateInput DateFormat="dd/MM/yyyy"> 
                                    </DateInput>
                                </telerik:RadDatePicker>
                            </td>
                        </tr>  
                    </table>
                     
                </td>
            </tr>
            <tr>
                <td align="center">
                    <br />
                   <font color="blue"><asp:Label ID="lbMessageTotal" runat="server"></asp:Label></font>
                </td>
            </tr>
            <tr>
                <td>
                    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		            <style type="text/css">
                        ${demo.css}
		            </style>
		            <script type="text/javascript">
		                $(function () {
		                    $('#container').highcharts({
		                        chart: {
		                            type: 'column'
		                        },
		                        title: {
		                            text: 'BIỂU ĐỒ SỐ LIỆU ĐO XA'
		                        },
		                        subtitle: {
		                            text: 'Source: CNPM Data Check'
		                        },
		                        xAxis: {
		                            categories: [
                                        'Sài Gòn',
                                        'Phú Thọ',
                                        'Chợ Lớn',
                                        'Gia Định',
                                        'Gò Vấp',
                                        'Tân Thuận',
                                        'Bình Chánh',
                                        'Bình Phú',
                                        'Tân Phú',
                                        'Tân Bình',
                                        'Hóc Môn',
                                        'Củ Chi',
                                        'Thủ Đức',
                                        'Thủ Thiêm',
                                        'Duyên Hải',
                                        'An Phú Đông'
		                            ],
		                            crosshair: true
		                        },
		                        yAxis: {
		                            min: 0,
		                            title: {
		                                text: 'Số Khách hàng'
		                            }
		                        },
		                        tooltip: {
		                            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
		                            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                                        '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
		                            footerFormat: '</table>',
		                            shared: true,
		                            useHTML: true
		                        },
		                        plotOptions: {
		                            column: {
		                                pointPadding: 0.2,
		                                borderWidth: 0
		                            }
		                        },
		                        colors: [
                                   '#0000ff',
                                   '#ff0000',
                                   'yellow'
		                        ],
		                        series: [<%=jsscript%>]
		                    });
		                });
		            </script>

       
                <div>
                <script src="highcharts/js/highcharts.js"></script>
            <script src="highcharts/js/modules/exporting.js"></script>

                    <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
                </td>
            </tr>            
            <tr>
                <td align="center">
                    <br />
                    <asp:Label ID="lbMessage" runat="server"></asp:Label>
                </td>
            </tr>
        </table>


        
    
   </div>
    </div>
</asp:Content>
