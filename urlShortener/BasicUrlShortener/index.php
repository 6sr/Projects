<?php
	$con=mysqli_connect("localhost","root","") or die ("unable to connect");
	mysqli_select_db($con,"urlshortenerdb");
    function encodeToBase62($num) {     // $num is Base 10
        $currStr = "fPQg0bDsHItFuEv3jkq7SdUmMwxJKLN2O5VeGpyn6oC1czYATZ8WlRBh9ri4aX";
        $idx = array();
        $ansStr = "";
        for($i = 0;$i < 6;$i++) {
            $idx[$i] = $num % 62;
            $num /= 62;
        }
        for($i = 5;$i >= 0;$i--) {
            $ansStr = $ansStr.$currStr[$idx[$i]];
        }
        return $ansStr;
    }
?>

<!DOCTYPE html> 
<html lang="en">
    <head>
		<meta charset="utf-8">
		<title>SR | URL Shortener</title>
		<link rel="icon" type="image/jpg" href="SRLogo.jpg" />
		<link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body bgcolor="#00ff99">
		<h1 style="color:#660066;font-size:4em;text-align:center;">URL Shortener</h1>
        <form method="post" enctype="multipart/form-data" align="center">
			<input type="text" name="longUrl" placeholder="Enter your long URL here" autocomplete="off">
			<input type="submit" name="CreateUrl" value="Generate Short URL">
        </form>
    </body>

</html>

<?php
if(isset($_POST['CreateUrl'])){
	$longUrl = $_POST['longUrl'];
	if($longUrl) {
		
		$query = "select * from urlTable where longUrl='$longUrl'";
		$runqueryCheck = mysqli_query($con,$query);
		if(mysqli_num_rows($runqueryCheck) > 0) {
			$rowdata = mysqli_fetch_array($runqueryCheck);
			$shortUrl = $rowdata['shortUrl'];
			echo '<script>alert("URL already registered")</script>';
			echo "<style> p { display : block; } </style>";
			echo "<p>Short URL : $shortUrl</p>";
			//echo "<script type='text/javascript'> document.location = 'index.php'; </script>";
		}
		else {
			$shortUrlDomain = 'http://developersr.cu.ma/';
			
            $queryId = "select * from urlTable";
            $runqueryId = mysqli_query($con,$queryId);
            $currId = mysqli_num_rows($runqueryId);
            
			$shortUrl = encodeToBase62($currId + 1);
            mkdir("short/".$shortUrl, 0755, true);
            $newFile = fopen("short/".$shortUrl."/index.php",'w'); 
            $text = "<?php header('Location: $longUrl'); ?>";
            fwrite($newFile, $text);
            fclose($newFile);
			
			$query = "insert into urlTable (longUrl,shortUrl) values('$longUrl','$shortUrl')";
			$runquery = mysqli_query($con,$query);

			if($runquery) {
				echo'<script>alert("Short URL is created")</script>';
				echo "<style> p { display : block; } </style>";
                
                echo "<p>Short URL : ".$shortUrlDomain."/short/".$shortUrl." </p>";
				//echo "<p>Short URL : $shortUrl</p>";
                
				//echo "<script type='text/javascript'> document.location = 'index.php'; </script>";
				//echo "<a href='signin.php'>Go to sign in page</a>";
			}
			else {
				echo'<script>alert("Short URL could not be created")</script>';
			}
		}
	}
	else {
		echo'<script>alert("Please enter a URL")</script>';
		//echo "<script type='text/javascript'> document.location = 'index.php'; </script>";
	}
}


?>