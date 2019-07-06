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
	<title>SR | Voting System - Profile</title> 
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head> 

<body>

	<!-- Header section -->
	<div class="menu">
		<a href="voter.php">HOME</a>
		<a href="profile.php" class="active">PROFILE</a>
		<a href="vote_results.php">VOTE RESULTS</a>
		<a href="change_password.php">CHANGE PASSWORD</a>
		<div class="menu-log">
			<a href="Logout.php">LOGOUT</a>
		</div>
	</div>
    <h1 style="text-align:center">
        Welcome <?php echo $_SESSION['SESS_NAME']; ?>
        <br><br>
        <?php
            include "Config.php";
            $username = $_SESSION['SESS_NAME'];
            $query = 'SELECT status FROM voters WHERE username="'.$_SESSION['SESS_NAME'].'" AND status = "VOTED"';
            if ($result = mysqli_query($con,$query)) {
                if (mysqli_num_rows($result) > 0) {
                    $sql = mysqli_query($con, 'SELECT voted from voters WHERE username="'.$_SESSION['SESS_NAME'].'"');
                    $row = mysqli_fetch_assoc($sql);
                    echo "You have voted for: " . " " . $row['voted'];
                }
                else {
                    echo "You have not voted yet. Please submit your vote!";
                }
            }
        ?>
    </h1>

    <!-- Footer Section -->
    <footer>Footer</footer> 
</body> 
</html>	
