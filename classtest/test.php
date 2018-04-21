

<?php

$t1 = microtime(true);


define("JAVA_HOSTS", "127.0.0.1:8080"); //����javabridge�����˿ڣ��������javabridge.jar���õĶ˿ڲ���8080����ͨ����������

require_once("java/Java.inc"); //php����java�Ľӿڣ�·��������Ҫע��

$here=realpath(dirname($_SERVER["SCRIPT_FILENAME"]));


//java_set_library_path($here.PATH_SEPARATOR .'pictureCompare.jar'); //����java��������class��jar�ļ���·�������·������PATH_SEPARATOR�ָ�����֤��ƽ��֧�֡�
//java_set_file_encoding("GBK");      //����JAVA���롣û�Թ������ı��룬Ҳû�����о�������������ı��롣

//ǰ�������û��������濪ʼ�����ĵ��ã�

//$system = new Java("java.lang.System");//��ʼ��JAVA�µ��࣬��Ҫ�������Ǵ���Java���ʵ����Java��ĵ�һ��������JAVA������������ְ�����·����·����ʾ��JAVA�ﵼ����ĸ�ʽ�����JAVA�µ�����Ҫʹ�ù��캯����������ʹ�õڶ���������
//echo  "Java version=".$system->getProperty("java.version")." /n";
//print "Java vendor=".$system->getProperty("java.vendor")." /r/n";
//print "OS=".$system->getProperty("os.name")." ".  $system->getProperty("os.version")." on ".$system->getProperty("os.arch")." /n";



$ta  = new java("test.CompareMain");

var_dump(java_values($ta->CompareMain("D:\\classtest\\1.jpg","D:\\classtest\\2.jpg")));//�����from ts��

$t2 = microtime(true);
echo '��ʱ'.round($t2-$t1,3).'��<br>';
echo 'Now memory_get_usage: ' . memory_get_usage() . '<br />';

//����ʹ��java_values���������Java���ʵ�����ص�ֵ��

 
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