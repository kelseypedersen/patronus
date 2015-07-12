<?php

require('../vendor/autoload.php');

$account_sid = "AC7f200476a71df6c7016f1dd7e37af78e"; // Your Twilio account sid
$auth_token = "70fd4cf9633a531d85e49ef94d1031d9"; // Your Twilio auth token
$client = new Services_Twilio($account_sid, $auth_token); 

	$servername = "173.194.236.82";
	$username = "nodeapp";
	$password = "nodeapp123$$$";
	$dbname = "patronus";

	$conn = new mysqli($servername, $username, $password, $dbname);

	$sql = "SELECT * FROM Survivors WHERE survivor_phone_number='".$_REQUEST['From']."'";
	$result = $conn->query($sql);

	$row = $result->fetch_assoc();

	$survivor_id = $row["id"];
	$survivor_name = $row["name"];
	$distraction_number = $row["attacker_phone_number"];
	$timenow = time();

	$client->account->calls->create('+18329812272', $distraction_number, 'http://twimlbin.com/939af572', array( 
	'Method' => 'GET',  
	'FallbackMethod' => 'GET',  
	'StatusCallbackMethod' => 'GET',    
	'Record' => 'false', 
));

	if ($row == "") {
		$sql2 = "INSERT INTO Survivors (survivor_phone_number) VALUES ('".$_REQUEST['From']."')";
		$result2 = $conn->query($sql2);
	}

	$sql3 = "INSERT INTO Incidents (survivor_id, text_message_body, date_time) VALUES ('".$survivor_id."','".$_REQUEST['Body']."',CURTIME())";
	$result3 = $conn->query($sql3);

	$sql4 = "SELECT * FROM Supporters WHERE survivor_id='".$survivor_id."'";
	$result4 = $conn->query($sql4);

	// now greet the sender
	header("content-type: text/xml");
	echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";

	// 		<Message to="<?php echo $row["attacker_phone_number"]>" >This is a test distraction</Message>

?>
<Response>
	<Message>thanks!</Message>
	<?php 
	while($row4 = $result4->fetch_assoc()) {
		echo "<Message to=\"".$row4["phone_number"]."\"".">".$survivor_name." is in distress!</Message>";
	}
	?>
</Response>

