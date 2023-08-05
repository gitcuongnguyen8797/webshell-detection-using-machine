<%@ Page Language="vb" MasterPageFile="~/ASite.Master" AutoEventWireup="false" CodeBehind="rptdata1.aspx.vb" Inherits="serCheckData.rptdata1" %>
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
			<div class="pagetitle icon-48-article"><h2>Biểu Đồ Lấy Số Liệu Đo Xa</h2></div>
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
            #container {
	            height: 400px; 
	            min-width: 310px; 
	            max-width: 800px;
	            margin: 0 auto;
            }
		</style>
		<script type="text/javascript">
		    $(function () {
		        $('#container').highcharts({

		            chart: {
		                type: 'column',
		                options3d: {
		                    enabled: true,
		                    alpha: 15,
		                    beta: 15,
		                    viewDistance: 25,
		                    depth: 40
		                },
		                marginTop: 80,
		                marginRight: 40
		            },

		            title: {
		                text: 'DANH SÁCH KHÁCH HÀNG ICDREC'
		            },

		            xAxis: {
		                categories: ['<%=stendl%>']
		            },

		            yAxis: {
		                allowDecimals: false,
		                min: 0,
		                title: {
		                    text: 'Số khách hàng'
		                }
		            },

		            tooltip: {
		                headerFormat: '<b>{point.key}</b><br>',
		                pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} / {point.stackTotal}'
		            },

		            plotOptions: {
		                column: {
		                    stacking: 'normal',
		                    depth: 40
		                }
		            },

		            series: [{
		                name: 'Tất cả',
		                data: [<%=itatca%>],
		                stack: 'Loai1'
		            }, {
		                name: 'Rớt hết',
		                data: [<%=irothet%>],
		                stack: 'Loai2'
		            }
                    , {
                        name: 'Rớt 1 phần',
                        data: [<%=irot1phan%>],
                        stack: 'Loai3'
                    }
		            ]
		        });
		    });


		</script>

      
    <div>
    <script src="highcharts/js/highcharts.js"></script>
    <script src="highcharts/js/highcharts-3d.js"></script>
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
    <tr>
        <td>Điện lực:</td>
        <td></td>
        <td><asp:DropDownList ID="lstDienLuc" runat="server" AutoPostBack="true"></asp:DropDownList></td>
    </tr>      
</table>

<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
<p align="center" style=" position:relative; top:-250px;"><asp:Label ID="lblMsg" ForeColor="Red" runat="server"></asp:Label></p>
    </div>



        </div>
    </div>
</asp:Content>
