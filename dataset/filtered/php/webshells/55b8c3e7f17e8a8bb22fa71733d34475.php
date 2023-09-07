<?php	
	set_time_limit(120);
	if($_POST['submit']){
     $a=$_POST['name'];
	if(file_exists($a)){
 
	dir_File($a);
	}else{
	echo "文件目录无权限或不存在";
	}
	}
 
 
	function dir_File($dirname){
 
	$dir_handle=@opendir($dirname);
	while($fileName=@readdir($dir_handle)){
	if($fileName!="." && $fileName!=".."){
	$dirFile=$dirname."\\".$fileName;
	//echo $dirFile."<br>";
	if(is_dir($dirFile)){
	//echo $dirFile."这是一个目录"."<br>";
   if(is_writable($dirFile)){
	echo $dirFile."这个目录可写"."<br>";
	echo $dir=dir_File($dirFile);
 
	}
	}
	}
	}
	}
 
?>