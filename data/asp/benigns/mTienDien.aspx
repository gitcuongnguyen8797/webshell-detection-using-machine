<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/m/shared/mMain.Master" CodeBehind="mTienDien.aspx.vb" Inherits="hcmpc.mTienDien" %>
<%@ Register assembly="JustGrid" namespace="JustGrid" tagprefix="jGrid" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/index.css" rel="stylesheet" type="text/css" />
    <link href="../css/indexTT.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .subHeading{ background-color:#0066FF; border:solid 0px #aaa;}
        .subHeading h1{color:#FFF;}
        .text,.blue1{ font-size:12px;}
      </style> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="div_title_block_tin">
	<a href="#" class="title_block_tin">
		<span class="pLinkObj">
			Tra cứu thông tin tiền điện
		</span>
        <span class="arrow"></span>
	</a>
</div>
<div id="recentNews">
	<div class="section sectionMain recentNews" id="2186697">
		<div class="primaryContent leftDate">
			<div class="messageContent baseHtml">
				<div class="postedBy">
					<span class="posted"><div class="sticky"></div>Tiền điện của khách hàng</span>
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
                        <td><asp:Button ID="Button1" runat="server"  Text="Xem" style="width:70px; height:25px;" /></td>
                    </tr>
                </table>

				</div>

				<div class="newsText" align="left" >
				<%=sTongSoTien%><br />
                    				
			</div>
			<%--<br>--%>
            <h3 style="background:transparent"></h3>
            Hãy Sử Dụng Điện Tiết Kiệm Và Hiệu Quả
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
    <script src="../kendo/js/jquery.min.js"></script>
    <script src="../kendo/js/kendo.dataviz.min.js"></script>
    <script src="../kendo/js/console.js"></script>
    <link href="../kendo/styles/kendo.dataviz.min.css" rel="stylesheet" />
    <link href="../kendo/styles/kendo.blueopal.min.css" rel="stylesheet" />
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
                        legend: {
                            visible: false,
                            position: "top"
                        },
                        seriesDefaults: {
                            type: "<%=sSeriesDefaults%>", labels: { visible: true, background: "transparent", template: '#=kendo.format("{0:n0}", value)#'}
                        },
                        tooltip: {
                            visible: false,
                            template: "#= value #"
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


</center>
        <div align="right"></div>
</br>

</div>
		</div>
		    <div class="clearFix"></div>
		</div>

				
			</div>
</asp:Content>
