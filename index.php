<? 
$LastModified = gmdate("D d M Y H:i:s", filemtime($HTTP_SERVER_VARS[SCRIPT_FILENAME])); 
header("Last-Modified: $LastModified GMT"); 
header("ETag: \"$LastModified\""); 
?>

<html>
<head>

<title>�Ϳ� ��ǻ���� �̴� Ȩ������</title>

</head>




<frameset rows="0, 100%" border="0">
    <frame src="top_main.php" noresize scrolling="no">
    <frame src="center_main.php" scrolling="auto" noresize>
</frameset>

</html>