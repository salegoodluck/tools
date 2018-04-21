

<?php

$t1 = microtime(true);


define("JAVA_HOSTS", "127.0.0.1:8080"); //设置javabridge监听端口，如果开启javabridge.jar设置的端口不是8080，可通过此语句更改

require_once("java/Java.inc"); //php调用java的接口，路径问题需要注意

$here=realpath(dirname($_SERVER["SCRIPT_FILENAME"]));


//java_set_library_path($here.PATH_SEPARATOR .'pictureCompare.jar'); //设置java开发包（class或jar文件）路径，多个路径就用PATH_SEPARATOR分隔，保证跨平的支持。
//java_set_file_encoding("GBK");      //设置JAVA编码。没试过其它的编码，也没深入研究如何能用其它的编码。

//前面是配置环境，下面开始真正的调用：

//$system = new Java("java.lang.System");//初始化JAVA下的类，主要操作就是创建Java类的实例，Java类的第一个参数是JAVA开发的类的名字包含包路径，路径表示按JAVA里导入包的格式。如果JAVA下的类需要使用构造函数，可以在使用第二个参数。
//echo  "Java version=".$system->getProperty("java.version")." /n";
//print "Java vendor=".$system->getProperty("java.vendor")." /r/n";
//print "OS=".$system->getProperty("os.name")." ".  $system->getProperty("os.version")." on ".$system->getProperty("os.arch")." /n";



$ta  = new java("test.CompareMain");

var_dump(java_values($ta->CompareMain("D:\\classtest\\1.jpg","D:\\classtest\\2.jpg")));//输出“from ts”

$t2 = microtime(true);
echo '耗时'.round($t2-$t1,3).'秒<br>';
echo 'Now memory_get_usage: ' . memory_get_usage() . '<br />';

//建议使用java_values函数处理从Java类的实例返回的值。

 
$props = java("java.lang.System")->getProperties();

  /* convert the result object into a PHP array */
  $array = java_values($props);
  foreach($array as $k=>$v) {
    //echo "$k=>$v"; echo "<br>\n";
  }
  //echo "<br>\n";


  /* create a PHP class which implements the Java toString() method */
  class MyClass {
    function toString() { return " PHP from Java!"; }
  }


$javaObject = java_closure(new MyClass());
  //echo "PHP says that Java says: "; echo $javaObject;  echo "<br>\n";
  //echo "<br>\n";
  //echo java("php.java.bridge.Util")->VERSION; echo "<br>\n";



?>