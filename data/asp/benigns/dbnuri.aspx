<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="dbnuri.aspx.vb" Inherits="TestTable.dbnuri" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
       <title>DataTables example - HTML5 export buttons</title>
    
<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="css/scroller.dataTables.min.css">
<script src="js/jquery-3.3.1.js"></script>

<style type="text/css">
    div.dt-buttons{
        position:relative;
        float:left;
    }
</style>

<!-- Them button -->
<script src="js/dataTables.buttons.min.js"></script>

<script src="js/datatables.min.js"></script>
<script src="js/dataTables.scroller.min.js"></script>

<link rel="stylesheet" type="text/css" href="js/datatables.min.css"/>
 

<script type="text/javascript" language="javascript" src="js/dataTables.scroller.min.js"></script>


<script src="js/dataTables.buttons.min.js"></script>
<script src="js/jszip.min.js"></script>
<script src="js/pdfmake.min.js"></script>
<script src="js/vfs_fonts.js"></script>
<script src="js/buttons.html5.min.js"></script>


<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.min.css" />
<link rel="stylesheet" type="text/css" href="css/buttons.dataTables.min.css" />
<script>
    //https://datatables.net/examples/server_side/scripts/server_processing.php
    var dataSet = <%=vJsonData%>;

    $(document).ready(function () {
        $('#example2').DataTable({
            dom: 'Bfrtip',
            buttons: [
                'copyHtml5',
                'excelHtml5',
                'csvHtml5'
            ],
            data: dataSet,
           "language": {
            "url": "VNLang.txt"
            },
            "columns": [
            <%=vJson%>
            ]
    });

    });


</script>

    <style type="text/css">
        #txtText {
            width: 742px;
            height: 186px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <textarea runat="server" id="txtText"></textarea> <br />
    <button runat="server" id="btnNURI">NURI</button> | <button runat="server" id="btnHHM">HHM</button><br /><br />
    <div>
    
    <table id="example2" class="display cell-border compact stripe" style="width:100%">
        <thead>
            <tr>
                <%=vHead%>
            </tr>
        </thead>
    </table>

    </div>
    </form>
</body>
</html>


