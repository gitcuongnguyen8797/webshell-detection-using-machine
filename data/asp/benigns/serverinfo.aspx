<%@ Page Language="vb" MasterPageFile="~/ASite.Master" AutoEventWireup="false" CodeBehind="serverinfo.aspx.vb" Inherits="serCheckData.serverinfo" %>
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
			<div class="pagetitle icon-48-article"><h2>Biểu đồ số liệu Ram Server</h2></div>
		</div>
    </div>
    <div id="system-message-container">            
        <asp:PlaceHolder ID="msg" runat="server">                
        </asp:PlaceHolder> 
    </div>
    <div id="element-box">
        <div class="m">




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
		                text: 'RAM Server'
		            },
		            subtitle: {
		                text: 'Source: CNPM Data Check'
		            },
		            xAxis: {
		                categories: [
                            '01 H',
                            '02 H',
                            '03 H',
                            '04 H',
                            '05 H',
                            '06 H',
                            '07 H',
                            '08 H',
                            '09 H',
                            '10 H',
                            '11 H',
                            '12 H',
                            '13 H',
                            '14 H',
                            '15 H',
                            '16 H',
                            '17 H',
                            '18 H',
                            '19 H',
                            '20 H',
                            '21 H',
                            '22 H',
                            '23 H',
                            '24 H'
		                ],
		                crosshair: true
		            },
		            yAxis: {
		                min: 0,
		                title: {
		                    text: 'RAM Usage(%)'
		                }
		            },
		            tooltip: {
		                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
		                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                            '<td style="padding:0"><b>{point.y:.1f} %</b></td></tr>',
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
		            series: [<%=jsscript%>]
		        });
		    });
		</script>

       
    <div>
    <script src="highcharts/js/highcharts.js"></script>
<script src="highcharts/js/modules/exporting.js"></script>

 <table align="center">
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

<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
<p align="center" style=" position:relative; top:-250px;"><asp:Label ID="lblMsg" ForeColor="Red" runat="server"></asp:Label></p>
    


</div>
    </div>
</asp:Content>
