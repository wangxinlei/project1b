<html>
<body>
<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="get">
<TEXTAREA NAME = "query" ROWS = 5 COLS = 30>
</TEXTAREA>
<input type = "submit" name = "submit" value = "Submit">
</form>

<?php
$db_connection = mysql_connect("localhost", "cs143","");
if(!$db_connection){
	die("Could not connect: " . mysql_error());
}
//echo "Connected successfully";


$db_selected = mysql_select_db("TEST", $db_connection);
if(!$db_selected){
	die('Can\'t use database: '.mysql_error());
}
$que = $_GET["query"];
/*
$query = "select * from Student";
$rs = mysql_query($query, $db_connection);
if(!$rs){
	$message = "Invalid query: ".mysql_error()."\n";
	$message .= "Whole query :".$query;
	die($message);
}
*/


//$query = "update Student set email = CONCAT(email, '.edu')";
//mysql_query($query, $db_connection);
//$name = " 'John Doe ";
//$query = "select * from Student where name = '%s'";
if($que!=NULL){
$sanitized_que = mysql_real_escape_string($que, $db_connection);
$rs = mysql_query($sanitized_que, $db_connection);

while($row = mysql_fetch_row($rs)) {
    foreach ($row as $attr) {
    	echo $attr." ";
    }
    echo "<br/>";
}
}
mysql_close($db_connection);
?>
</html>
</body>