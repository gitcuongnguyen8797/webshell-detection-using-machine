<%@ page language="C#" autoeventwireup="true" inherits="BieuDo, App_Web_5vhwmjkq" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Biểu Đồ Chi Tiết</title>
     <META HTTP-EQUIV="refresh" CONTENT="300">
    <link href="style.css" rel="stylesheet" type="text/css" />
    <script src="amcharts/amcharts.js" type="text/javascript"></script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
        function ShowCChart(ardatas, divid) {//show column chart
            AmCharts.ready(function () {
                // SERIAL CHART
                chart = new AmCharts.AmSerialChart();
                chart.dataProvider = ardatas;
                chart.categoryField = "country";
                // the following two lines makes chart 3D
                chart.depth3D = 20;
                chart.angle = 30;

                // AXES
                // category
                var categoryAxis = chart.categoryAxis;
                categoryAxis.labelRotation = 90;
                categoryAxis.dashLength = 5;
                categoryAxis.gridPosition = "start";

                // value
                var valueAxis = new AmCharts.ValueAxis();
                valueAxis.title = ""; // "Khách hàng mất điện";
                valueAxis.dashLength = 5;
                chart.addValueAxis(valueAxis);

                // GRAPH            
                var graph = new AmCharts.AmGraph();
                graph.valueField = "visits";
                graph.colorField = "color";
                graph.balloonText = "[[category]]: [[value]]";
                graph.type = "column";
                graph.lineAlpha = 0;
                graph.fillAlphas = 1;
                chart.addGraph(graph);

                // WRITE
                chart.write(divid);
            });
        }
        var options = { 
            chartArea: {
                left: 80,
                top: 30,
                width: 750,
                height: 600
            }
        };
    </script> 
</head>
<body style="margin:0; padding:0;">
    <form id="form1" runat="Server">
        <div id="chartdiv" style="width: 980px; height: 700px;"></div>
        <asp:Label ID="lblNgay" runat="Server" ForeColor="Red" Visible="false"></asp:Label>
    </form>
</body>
</html>
