<?php 
    session_start();
    if (isset($_SESSION['SESS_NAME'])!="") {
        header("Location: voter.php");
    }
?>
<?php 
    global $msg; 
    echo $msg;
?>
<!DOCTYPE html> 
<html> 
<head> 
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>SR | Voting System - Home</title> 
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head> 

<body>
	<!-- Header section -->
	<div class="menu"> 
		<a href="index.php" class="active">HOME</a> 
		<a href="register.php">REGISTER</a> 
		<a href="about.php">ABOUT</a> 
		<div class="menu-log"> 
			<a href="login.php">LOGIN</a> 
		</div> 
	</div> 
	
	<!-- Body section -->
	<div class = "bodySection"> 
		<section id="Content"> 
            This system allows all registered users to vote for their favorite <strong>PROGRAMMING LANGUAGE</strong>.<br><br>
            In order to make a vote you have to register first and then login.
		</section> 
	</div> 
	
	<!-- Footer Section -->
	<footer>Footer</footer> 
</body> 
</html>					 
