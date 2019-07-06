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
	<title>SR | Voting System - Home</title> 
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head> 

<body>

	<!-- Header section -->
	<div class="menu">
		<a href="voter.php" class="active">HOME</a>
		<a href="profile.php">PROFILE</a>
		<a href="vote_results.php">VOTE RESULTS</a>
		<a href="change_password.php">CHANGE PASSWORD</a>
		<div class="menu-log">
			<a href="Logout.php">LOGOUT</a>
		</div>
	</div>
    <h1 style="text-align:center">Welcome <?php echo $_SESSION['SESS_NAME']; ?> </h1>

    <form action="SubmitVote.php" name="vote" method="post" id="myform" >
        <center>
        <font size='6'> What is your favorite language? <br>
            <table>
            <tr>
                <td><input type="radio" name="lan" value="c++"></td>
                <td>C++</td>
            </tr>
            <tr>
                <td><input type="radio" name="lan" value="python"></td>
                <td>PYTHON</td>
            </tr>
            <tr>
                <td><input type="radio" name="lan" value="php"></td>
                <td>PHP</td>
            </tr>
            <tr>
                <td><input type="radio" name="lan" value="java"></td>
                <td>JAVA</td>
            </tr>
            <tr>
                <td><input type="radio" name="lan" value=".net"></td>
                <td>.NET</td>
            </tr>
            </table>
        </font></center><br>
        
        <?php global $msg; echo $msg; ?>
        <?php global $error; echo $error; ?>
        
        <center><input type="submit" value="Submit Vote" name="submit" style="height:30px; width:100px" /></center>
        
    </form>

    <!-- Footer Section -->
    <footer>Footer</footer> 
</body> 
</html>	
