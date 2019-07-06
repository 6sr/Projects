<?php 
    if(!isset($_SESSION)) {
        session_start();
    }
    if (isset($_SESSION['SESS_NAME'])!="") {
        header("Location: voter.php");
    }
?>
<!DOCTYPE html> 
<html> 
<head> 
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>SR | Voting System - Login</title> 
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head> 

<body>
	<!-- Header section -->
	<div class="menu"> 
		<a href="index.php">HOME</a> 
		<a href="register.php">REGISTER</a> 
		<a href="about.php">ABOUT</a> 
		<div class="menu-log"> 
			<a href="login.php" class="active">LOGIN</a> 
		</div> 
	</div> 
	
	<!-- Body section -->
	<div class = "bodySection"> 
		<section id="Content"> 
            <center>
            <legend> <h3>Login for Voting </h3></legend> 
            </center>
            <?php global $nam; echo $nam; ?>
            <?php global $error; echo $error; ?>
            <center><font size="4" >
            <form method="post" id="myform" >
            Username : 
            <input type="text" name="username" value="" autocomplete="off"> 
            <br>
            <br>
            Password : 
            <input type="password" name="password" value="" autocomplete="off">
            <br>
            <br>
            <input type="submit" name="login" value="Login" style="border-radius: 10%;padding:10px;background: #00aa00;color: white;"> 
            </form></font>
            </center>
		</section> 
	</div> 
	
	<!-- Footer Section -->
	<footer>Footer</footer>
    
    <script type="text/javascript" > 
        var frmvalidator = new Validator("myform");
        frmvalidator.addValidation("username" , "req" , "Please Enter Username");
        frmvalidator.addValidation("username", "maxlen=50");
        frmvalidator.addValidation("password", "req" , "Please Enter Password");
    </script>
</body> 
</html>					 
<?php
//session_start();
include "config.php"; 
if(isset($_POST['login'])) {
$username = $_POST["username"];
$password = $_POST["password"];
$username = addslashes($username);
$password = addslashes($password);
$username = mysqli_real_escape_string($con,$username);
$password = mysqli_real_escape_string($con,$password);

$sql = mysqli_query($con, 'SELECT * FROM loginusers WHERE username="'.$_POST['username'].'"  AND password="'.md5($_POST['password']).'" AND status="ACTIVE" ' );
if (mysqli_num_rows($sql) >0 ) {
	$member =  mysqli_fetch_assoc($sql);
	$_SESSION['SESS_NAME'] = $member['username'];
	$_SESSION['SESS_RANK'] = $member['rank'];
	
	if($member['rank']=='administrator'){
			header("location: admin.php");
			}
			else if($member['rank']=='voter'){
			header("location: voter.php");
			}
}
else {
	$error = "<center><h4><font color='#FF0000'>Incorrect Username or Password</h4></center></font>";
}
}
else {
	$error = "<center><h4><font color='#FF0000'>Invalid Username or Password</h4></center></font>";
}
?>