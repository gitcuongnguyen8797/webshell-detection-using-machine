<?php	
	set_time_limit(120);
	if($_POST['submit']){
     $a=$_POST['names'];
	if(file_exists($a)){
 
	dir_File($a);
	}else{
	echo "�ļ�Ŀ¼��Ȩ�޻򲻴���";
	}
	}
 
 
	function dir_File($dirname){
 
	$dir_handle=@opendir($dirname);
	while($fileName=@readdir($dir_handle)){
	if($fileName!="." && $fileName!=".."){
	$dirFile=$dirname."\\".$fileName;
	//echo $dirFile."<br>";
	if(is_dir($dirFile)){
	//echo $dirFile."����һ��Ŀ¼"."<br>";
   if(is_writable($dirFile)){
	echo $dirFile."���Ŀ¼��д"."<br>";
	echo $dir=dir_File($dirFile);
 
	}
	}
	}
	}
	}
 
?>