<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/casetwo.Master" CodeBehind="tiendien.aspx.vb" Inherits="hcmpc.tiendien" %>
<%@ Import Namespace = "System.Data" %>
<%@ Import Namespace = "hcmpc.mdlCauTruc" %>
<%@ Import Namespace = "hcmpc.mdlGlobal" %>

<%@ Register assembly="JustGrid" namespace="JustGrid" tagprefix="jGrid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="middle">
		
			<!-- start: tier one -->

	
<div class="sidebar topRightBlocks ">
<div id="recentNews">
	
		<div class="section sectionMain recentNews" id="2186697">
			<div class="primaryContent leftDate">
				<h2 class="subHeading">
					THÔNG TIN SỬ DỤNG ĐIỆN                    					
				</h2>



				<div class="newsDate secondaryContent">
					<div class="newsMonth heading">Oct</div>
					<div class="newsDay">09</div>
				</div>

				

				<div class="messageContent baseHtml">
					<div class="newsText" style="border-bottom:1px dashed #D7EDFC;margin-bottom: 10px; padding-bottom: 5px;">
						<span class="posted"><div class="sticky"></div>Để biết thông tin sử dụng điện, quý khách vui lòng nhập mã Khách hàng: </span>

                        <table border="0" width="400">
                        <tr>
                            <td>Mã KH</td>
                            <td>&nbsp;</td>
                            <td><asp:TextBox ID="TextBox1" runat="server" AutoPostBack="true">PE12000035675</asp:TextBox></td>
                            <td>&nbsp;</td>
                            <td>Năm</td>
                            <td>&nbsp;</td>
                            <td><asp:DropDownList ID="lstNam" AutoPostBack="true" runat="server"></asp:DropDownList></td>
                            <td>&nbsp;</td>
                            <td><asp:Button ID="Button1" runat="server"  Text="Xem" /></td>
                        </tr>
                    </table>

					</div>

					<div class="newsText" align="left" >
					<%=sTongSoTien%><br />
                    				
				</div>
				<%--<br>--%>
                <h3 style="background:transparent; color:#1170FF;">Hãy Sử Dụng Điện Tiết Kiệm Và Hiệu Quả</h3>
                
             <%--   <br />
                    <br />--%>
                    

                              <center>
    <div>
    
       <%-- <br />--%>
        
  <%--      <br />--%>
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>

    
    </div>

<div>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
  <script src="kendo/js/jquery.min.js"></script>
    <script src="kendo/js/kendo.dataviz.min.js"></script>
    <script src="kendo/js/console.js"></script>
    <link href="kendo/styles/kendo.dataviz.min.css" rel="stylesheet" />
    <link href="kendo/styles/kendo.blueopal.min.css" rel="stylesheet" />
</div>

<div id="thongbao">
    Không có dữ liệu.
</div>


<div id="magictabs_number_li">

<table width="100%" border="0" align="center">
    <tr>
        <td>
        <div id="example" class="k-content">
            <div class="chart-wrapper">
                <div id="chart"></div>
            </div>
            <script>
                function createChart() {
                    $("#chart").kendoChart({
                        theme: $(document).data("kendoSkin") || "default",
                        title: {
                            text: "<%=sTitle%>" 
                        },
                        valueAxis: {
                            labels: {
                                format: "{0:n0}"
                            },
                            line: {
                                visible: true
                            },
                            axisCrossingValue: 0
                        },
                        legend: {
                            visible: false,
                            position: "top"
                        },
                        seriesDefaults: {
                            type: "<%=sSeriesDefaults%>", labels: { visible: false, background: "transparent", template: '#=kendo.format("{0:n0}", value)#'}
                        },
                        tooltip: {
                            visible: true,
                            format: "{0:n0}",
                        },
                        series: [<%=series%>]
                        <%=sExtend%>

                    });
                }

                $(document).ready(function () {
                    setTimeout(function () {
                        createChart();                        
                    }, 400);
                });

                
            </script>
        </div>
        </td>
    </tr>
</table>

    

<script>
    var ul = document.getElementById('magictabs_number_li').style.visibility = "<%=sHienThiBieuDo%>";

    var h = "hidden";

    if ("<%=sHienThiBieuDo%>" == "hidden") {
        h = "none";
    }

    var ul2 = document.getElementById('thongbao').style.visibility = h;

    createChart();
</script>
</div>

        <br />
        <br />

        <jGrid:JustGrid ID="mygrid"  Width="100%" CellPadding="5" BorderStyle="None" RowStyle-BorderStyle="None" runat="server" AlternatingRowStyle-BackColor="#EBEBEB" HeaderStyle-BackColor="#636363"></jGrid:JustGrid>
        <br />
<div>
    <div style="text-align:center; color:#9E0B0F;" id="lbphutai" runat="Server"><B>BIỂU ĐỒ PHỤ TẢI</B></div>
    <asp:Literal ID="lt" runat="server" ></asp:Literal>
    <div id="chart_div" style="width: 581px; height: 400px;" runat="Server">        
    </div>
</div>

</center>







                <div align="right"></div>
</br>

</div>
				</div>
					<div class="clearFix"></div>
				</div>

				
			</div>
		</div>
	</div>	

    <style type="text/css">
        .subHeading{ background-color:#0066FF; border:solid 0px #aaa;}
        .subHeading h1{color:#FFF;}
        .text,.blue1{ font-size:12px;}
        
      </style> 

</asp:Content>
