<?php
error_reporting(0);
header("Content-type:text/json;charset=utf-8");
header("Access-Control-Allow-Origin: *");//允许所有地址跨域请求
include("config.php");
$nowDate = date("Y-m-d H:i:s"); //获取当前系统时间


$url = parse_url("http://" . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI']);
$url = $url['scheme'] . "://" . $url['host'] . $url["path"];
//echo $url;
if (strpos($url, "updateAction") !== false) {
    //☆☆☆☆☆☆增删改☆☆☆☆☆☆☆☆☆☆☆
    //获得里面的值
    if ($_SERVER["REQUEST_METHOD"] === "POST") {
        $sql = $_POST["sql"];
    } else if ($_SERVER["REQUEST_METHOD"] === "GET") {
        $sql = $_GET["sql"];
    }
    $sql = str_replace("\'", "'", $sql);  //处理 \' 问题
    //查询数据库
    $query = mysqli_query($conn, $sql);
    //数据库查询结果保存为数组（注意第二个参数）
    // MYSQL_ASSOC - 关联数组
    // MYSQL_NUM - 数字数组
    // MYSQL_BOTH - 默认。同时产生关联和数字数组

    $result = array();
    $result["status"] = 200;
    $result["ok"] = null;
    $result["msg"] = "操作成功";
    $result["sql"] = $sql;
    $data = array();
    while ($rows = mysqli_fetch_array($query)) {
        $data[] = $rows;
    }
    $result["data"] = $data;

    echo(json_encode($result));
    mysqli_close($conn);

} else if (strpos($url, "selectPageAction") !== false) {
    //☆☆☆☆☆☆分页查询☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
    //获得里面的值
    $p = 1;
    $pageSize = 10;
    if ($_SERVER["REQUEST_METHOD"] === "POST") {
        $sql = $_POST["sql"];  //执行sql
        if ($_POST["p"]) {  //页数
            $p = $_POST["p"];
        }
        if ($_POST["pageSize"]) {  //每页条数
            $pageSize = $_POST["pageSize"];
        }
    } else if ($_SERVER["REQUEST_METHOD"] === "GET") {
        $sql = $_GET["sql"]; //执行sql
        if ($_GET["p"]) { //页数
            $p = $_GET["p"];
        }
        if ($_GET["pageSize"]) {  //每页条数
            $pageSize = $_GET["pageSize"];
        }
    }
    $sql = str_replace("\'", "'", $sql);  //处理 \' 问题
    //查询数据库
    $query = mysqli_query($conn, $sql);
    //数据库查询结果保存为数组（注意第二个参数）
    // MYSQL_ASSOC - 关联数组
    // MYSQL_NUM - 数字数组
    // MYSQL_BOTH - 默认。同时产生关联和数字数组
    $result = array();
    $result["status"] = 200;
    $result["ok"] = null;
    $result["msg"] = "查询成功";
    $result["sql"] = $sql;
    $data = array();
    while ($rows = mysqli_fetch_array($query)) {
        $data[] = $rows;
    }
    $dataResult = array();
    $total = count($data);  //总条数
    $pages = $total / $pageSize; //总页数
    if ($total % $pageSize != 0) { //页数计算
        $pages = $total / $pageSize + 1;
    }
    $dataResult["total"] = $total;
    $dataResult["pages"] = intval($pages);
    $dataResult["current"] = intval($p);
    $sqlTwo = $sql . " limit " . (($p - 1) * $pageSize) . "," . $pageSize;
    $records = array();
    $queryTwo = mysqli_query($conn, $sqlTwo);  //执行分页查询
    while ($rowsTwo = mysqli_fetch_array($queryTwo)) {
        $records[] = $rowsTwo;
    }
    $dataResult["records"] = $records;
    $result["data"] = $dataResult;
    $result["sqlTwo"] = $sqlTwo;
    echo(json_encode($result));
    mysqli_close($conn);
} else if (strpos($url, "selectAction") !== false) {
    //☆☆☆☆☆☆☆☆☆查询☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
    //获得里面的值
    if ($_SERVER["REQUEST_METHOD"] === "POST") {
        $sql = $_POST["sql"];
    } else if ($_SERVER["REQUEST_METHOD"] === "GET") {
        $sql = $_GET["sql"];
    }
    $sql = str_replace("\'", "'", $sql);  //处理 \' 问题
    //查询数据库
    $query = mysqli_query($conn, $sql);
    //数据库查询结果保存为数组（注意第二个参数）
    // MYSQL_ASSOC - 关联数组
    // MYSQL_NUM - 数字数组
    // MYSQL_BOTH - 默认。同时产生关联和数字数组
    $result = array();
    $result["status"] = 200;
    $result["ok"] = null;
    $result["msg"] = "查询成功";
    $result["sql"] = $sql;
    $data = array();
    while ($rows = mysqli_fetch_array($query)) {
        $data[] = $rows;
    }
    $result["data"] = $data;
    echo(json_encode($result));
    mysqli_close($conn);
} else if (strpos($url, "uploadFile") !== false) {
    //☆☆☆☆☆☆☆☆☆☆☆☆图片上传☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
    $nums = intval(microtime(true));  //获取时间毫秒数
    $fileName = iconv('utf-8', 'gb2312', "uploads/" . $nums . ".jpg");
    move_uploaded_file($_FILES["file"]["tmp_name"], $fileName);
    //echo "文件存储在: " . "upload/" . $_FILES["file"]["name"];
    // 梳理图片路径
    $pathImg = $_SERVER['REQUEST_SCHEME'] . '://' . $_SERVER['HTTP_HOST'] . "/" . dirname($_SERVER['PHP_SELF']);
    $pathImg = str_replace("/index.php", "", $pathImg);


    $picurl = $pathImg . "/uploads/" . $nums . ".jpg";
    $result = array();
    $result["status"] = 200;
    $result["ok"] = null;
    $result["msg"] = "OK";
    $data = array();
    $data["savePath"] = $fileName; //保存路径
    $data["src"] = $picurl; //网页路径
    $data["url"] = $picurl; //网页路径
    $result["data"] = $data;
    header('Content-Type: application/json');
    //这句是重点，它告诉接收数据的对象此页面输出的是json数据;
    echo(json_encode($result));
} else if (strpos($url, "algorithm") !== false) {
    //☆☆☆☆☆☆☆☆☆算法推荐☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆
    //获得里面的值
    $sql = "SELECT * FROM datainfo ORDER BY RAND() LIMIT 10 ";  //处理 \' 问题

    //数据库查询结果保存为数组（注意第二个参数）
    // MYSQL_ASSOC - 关联数组
    // MYSQL_NUM - 数字数组
    // MYSQL_BOTH - 默认。同时产生关联和数字数组
    $result = array();
    $result["status"] = 200;
    $result["ok"] = null;
    $result["msg"] = "查询成功";
    $result["sql"] = $sql;
    $data = array();
    //查询数据库
    $query = mysqli_query($conn, $sql);
    while ($rows = mysqli_fetch_array($query)) {
        $data[] = $rows;
    }
    $result["data"] = $data;
    echo(json_encode($result));
    mysqli_close($conn);
} else if (strpos($url, "code") !== false) {
    //验证码文件
//必须至于顶部,多服务器端记录验证码信息，便于用户输入后做校验
//默认返回的是黑色的照片
    $image = imagecreatetruecolor(100, 30);
//将背景设置为白色的
    $bgcolor = imagecolorallocate($image, 255, 255, 255);
//将白色铺满地图
    imagefill($image, 0, 0, $bgcolor);

//空字符串，每循环一次，追加到字符串后面
    $captch_code = '';

//验证码为随机四个数字
    for ($i = 0; $i < 4; $i++) {
        $fontsize = 10;
        $fontcolor = imagecolorallocate($image, rand(0, 120), rand(0, 120), rand(0, 120));

        //产生随机数字0-9
        $fontcontent = rand(0, 9);
        $captch_code .= $fontcontent;
        //数字的位置，0，0是左上角。不能重合显示不完全
        $x = ($i * 100 / 4) + rand(5, 10);
        $y = rand(5, 10);
        imagestring($image, $fontsize, $x, $y, $fontcontent, $fontcolor);
    }


    $_SESSION['authcode'] = $captch_code;
//为验证码增加干扰元素，控制好颜色，
//点
    for ($i = 0; $i < 200; $i++) {
        $pointcolor = imagecolorallocate($image, rand(50, 200), rand(50, 200), rand(50, 200));
        imagesetpixel($image, rand(1, 99), rand(1, 29), $pointcolor);
    }

//为验证码增加干扰元素
//线
    for ($i = 0; $i < 3; $i++) {
        $linecolor = imagecolorallocate($image, rand(80, 220), rand(80, 220), rand(80, 220));
        imageline($image, rand(1, 99), rand(1, 29), rand(1, 99), rand(1, 29), $linecolor);
    }

    header('content-type:image/png');
    // 保存图片到本地
    $name="code".intval(microtime(true)).'.png';
    imagepng($image,'../uploads/'.$name);

//销毁
    imagedestroy($image);
// 梳理图片路径
    $pathImg = $_SERVER['REQUEST_SCHEME'] . '://' . $_SERVER['HTTP_HOST'] . "/" . dirname($_SERVER['PHP_SELF']);
    $pathImg = str_replace("/api", "", $pathImg);
    $pathImg = str_replace("/index.php", "", $pathImg);

    $picurl = $pathImg . "/uploads/" . $name;
    $result = array();
    $result["status"] = 200;
    $result["ok"] = null;
    $result["msg"] = "OK";
    $data = array();
    $data["src"] = $picurl; //网页路径
    $data["url"] = $picurl; //网页路径
    $data["code"] = $captch_code;
    $result["data"] = $data;
    header('Content-Type: application/json');
    //这句是重点，它告诉接收数据的对象此页面输出的是json数据;
    echo(json_encode($result));
}

?>
