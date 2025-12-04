<?php
session_start();
$mysql_host = "localhost:3306";    //链接地址
$mysql_user = "root";         //数据库用户名
$mysql_password = "123456";     //数据库登录密码
$mysql_database = "mooc";     //数据库名

/**********获取当前文件所在目录**********/
$folderPath = dirname($_SERVER['PHP_SELF']);
$mypath = $folderPath;


/*ob_start();
@session_start(); //开启缓存*/

//error_reporting(0);
$conn = mysqli_connect($mysql_host, $mysql_user, $mysql_password); //数据库账号 密码
mysqli_select_db($conn, $mysql_database); //数据库名称
if ($conn == null) {
    echo "数据库打开失败";
    exit; //数据库打开失败，退出
}

$conn->query("SET NAMES 'UTF8'"); //设置数据库编码
/** 获取项目路径 **/
//http://localhost
$ctx = $_SERVER['REQUEST_SCHEME'] . '://' . $_SERVER['HTTP_HOST'] . $mypath;
//http://localhost/house/test.php
$ctxPath = $_SERVER['REQUEST_SCHEME'] . '://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
?>

