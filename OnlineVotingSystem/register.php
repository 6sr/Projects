<!-- 
	https://stackoverflow.com/questions/55160821/contact-form-submits-without-checking-recaptcha
	<script src='https://www.google.com/recaptcha/api.js'></script>
-->
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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="jscript/validation.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<title>SR | Voting System - Register</title> 
</head> 

<body>
	<!-- Header section -->
	<div class="menu"> 
		<a href="index.php">HOME</a> 
		<a href="register.php" class="active">REGISTER</a> 
		<a href="about.php">ABOUT</a> 
		<div class="menu-log"> 
			<a href="login.php">LOGIN</a> 
		</div> 
	</div> 
	
	<!-- Body section --><br>
	<div class = "bodySection"> 
		<section id="Content"> 
            <strong> REGISTER </strong> <br>
            <center>
                <?php global $nam; echo $nam; ?> 
                <?php global $error; echo $error; ?>
                
                <font size="4" >
                    <form action= "RegAction.php" method= "post" id="myform" >
                        Firstname:
                        <input type="text" name="firstname" value="" autocomplete="off" />
                        <br><br>
                        Lastname: 
                        <input type="text" name="lastname" value="" autocomplete="off" />
                        <br><br>
                        Username: 
                        <input type="text" name="username" value="" autocomplete="off" />
                        <br><br>
                        Password: 
                        <input type="password" name="password" value="" autocomplete="off" />
                        <br><br>

                        <!--
                            <div class="g-recaptcha" data-sitekey=""></div>
                        -->

                        <input type="submit" name="register" value="REGISTER" style="border-radius: 10%;padding:10px;background: #00aa00;color: white;">
                    </form>
                </font>
            </center>
		</section> 
	</div> 
	
	<!-- Footer Section -->
	<footer>Footer</footer> 
    <script type= "text/javascript" >
        var frmvalidator = new Validator("myform"); 
        frmvalidator.addValidation("firstname","req","Please enter First Name"); 
        frmvalidator.addValidation("firstname","maxlen=50");
        frmvalidator.addValidation("lastname","req","Please enter Last Name"); 
        frmvalidator.addValidation("lastname","maxlen=50");
        frmvalidator.addValidation("username","req","Please enter username"); 
        frmvalidator.addValidation("username","maxlen=50");
        frmvalidator.addValidation("password","req","Please enter password"); 
        frmvalidator.addValidation("password","minlen=6","Password must not be less than 6 characters.");
    </script>
</body> 
</html>
