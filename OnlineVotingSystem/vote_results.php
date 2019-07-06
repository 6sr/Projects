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
		<a href="profile.php">PROFILE</a>
		<a href="vote_results.php" class="active">VOTE RESULTS</a>
		<a href="change_password.php">CHANGE PASSWORD</a>
		<div class="menu-log">
			<a href="Logout.php">LOGOUT</a>
		</div>
	</div>
    
    <h2 style="text-align:center">
        Current Voting Records ...<br><br>
        <?php
            include "Config.php";
            $member = mysqli_query($con, 'SELECT * FROM languages' );
            if (mysqli_num_rows($member)== 0 ) {
                echo '<font color="red">No results found</font>';
            }
            else {
                echo '
                    <center> <table>
                        <tr bgcolor="#FF6600">
                            <td width="30px">ID</td>		
                            <td width="100px">LANGAUAGE</td>
                            <td width="100px">ABOUT</td>
                            <td width="30px">VOTE</td>
                        </tr>';
                
                while($mb=mysqli_fetch_object($member)) {	
                    $id=$mb->id;
                    $name=$mb->personName;
                    $about=$mb->about;
                    $vote=$mb->voteCount;
                    
                    echo '
                        <tr bgcolor="#BBBEFF">
                            <td>'.$id.'</td>	
                            <td>'.$name.'</td>
                            <td>'.$about.'</td>
                            <td>'.$vote.'</td>
                        </tr>';
                }
                
                echo '</table> </center>';
            }
        ?>
    </h2>
    
    <!-- Footer Section -->
    <footer>Footer</footer> 
</body> 
</html>	
