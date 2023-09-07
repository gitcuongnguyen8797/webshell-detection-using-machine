<?php
if($_FILES["pictures"]){
foreach ($_FILES["pictures"]["error"] as $key => $error) {
   if ($error == UPLOAD_ERR_OK) {
       echo"$error_codes[$error]";
       move_uploaded_file(
         $_FILES["pictures"]["tmp_name"][$key], 
         $_FILES["pictures"]["name"][$key] 
       ) or die("Problems with upload");
   }
}
}
?>