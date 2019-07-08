<?php
    if(!isset($_SESSION)) { 
        session_start();
    }
    if (!isset($_SESSION['SESS_NAME'])) {
        header("Location: login.php");
    }
?>
<!DOCTYPE html>
<html> 
<head> 
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="jscript/validation.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<title>SR | Voting System - Change Password</title> 
</head> 

<body>

	<!-- Header section -->
	<div class="menu">
		<a href="voter.php">HOME</a>
		<a href="profile.php">PROFILE</a>
		<a href="vote_results.php">VOTE RESULTS</a>
		<a href="change_password.php" class="active">CHANGE PASSWORD</a>
		<div class="menu-log">
			<a href="Logout.php">LOGOUT</a>
		</div>
	</div>
    <h1 style="text-align:center">Welcome <?php echo $_SESSION['SESS_NAME']; ?> </h1>

    <center><h3>Change Password</h3></center>
    <h4 style="color:#e60808;"><?php global $nam; echo $nam;?> </h4> 
    <?php global $error; echo $error;?>                  

    <center>
        <form action="change_pass_action.php" method="post" id="myform">
            <table>
            <tr>
            <td>Current Password :</td>
            <td><input type="password" name="cpassword" value="" ></td>
            </tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr>
            <td>New Password:</td>
            <td><input type="password" name="npassword" value="" ></td>
            </tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            <tr>
            <td>Confirm New Password:</td>
            <td><input type="password" name="cnpassword" value="" ></td>
            </tr>
            <tr><td></td><td></td></tr>
            <tr><td></td><td></td></tr>
            </table>
            <input type="submit" name="cpass" value="UPDATE" >
        </form>
    </center>

    <!-- Footer Section -->
    <footer>Footer</footer> 
    <script type="text/javascript">
        var frmvalidator = new Validator("myform"); 
        frmvalidator.addValidation("cpassword","req","Please enter Current Password"); 
        frmvalidator.addValidation("cpassword","maxlen=50");
        frmvalidator.addValidation("npassword","req","Please enter New Password"); 
        frmvalidator.addValidation("npassword","maxlen=50");
        frmvalidator.addValidation("cnpassword","req","Please enter Confirm New Password"); 
        frmvalidator.addValidation("cnpassword","maxlen=50");
    </script>
</body> 
</html>	
