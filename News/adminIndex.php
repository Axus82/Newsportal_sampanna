<?php

//calling connection page for connecting database to server.
include('connection.php');

//for fetching information from previous page
session_start();

//setting username to show on profile
$nameOfUser = $_SESSION["username"];

$number = 0;

//setting photo/user's image to display on profile
$userPhoto = $_SESSION["photo"];

// if session is not set, then user redirects to login page.
if (!$nameOfUser){
	header("Location:login.php");
}
?>

<!DOCTYPE html>
<html lang = "en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel = "stylesheet" type = "text/css" href = "styles.css">

		<!--Box icon css link (Reference: https://www.boxicons.com)-->
		<!-- 
			Boxicons, [n.d.]. High Quality Web Icons. [online] 
			Available at: https://www.https://boxicons.com/ [Accessed: 10 Sept 2022]

			All the icons used in the website was taken from boxicons site.
		 -->
		<link rel = "stylesheet" href = "https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css">
		<title>Elite News - Admin Home</title>
		<script src = "javascript.js"></script>
	</head>
	<body> 
		<header>
			<div class = "userinfo">
				<!-- setting image on header-->
				<img src = "./public/images/admins/<?php 
				//checking if the database have user's photo and showing it on the image field
				if ($userPhoto){
					echo $userPhoto;
				}

				// if there is no photo of user, then default placeholder photo is set.
				else{
					echo "character.jpg";
				}
				?>" alt = "User's Profile Picture" class = "userimage">

				<!-- displaying name of logged in user -->
				<p><?php echo  $nameOfUser; ?> </p>
			</div>

			<section>
				<h1>Elite News</h1>
				<h3>Global News Distributor</h3>
			</section>
			<!-- Shows current location of user (Reference: https://stackoverflow.com/questions/5398674/get-users-current-location)-->
			<!-- 
				stackoverflow, 2017. Get user's current location. [online]
				Available at: https://stackoverflow.com/questions/5398674/get-users-current-location/ [Accessed 12 Sept 2022]
			 -->
			<?php
                $getGeoLocation = @unserialize (file_get_contents('http://ip-api.com/php/'));
                if ($getGeoLocation && $getGeoLocation['status'] == 'success') {
                	echo "<div style = 'margin-right: 20px;'><i class='bx bx-current-location'></i>&nbsp;".$getGeoLocation['city'].', '.$getGeoLocation['country']."</div>";
                }else{
					echo "<div style = 'margin-right: 20px; color: red;'>Check your internet connection!</div>";
				}
        	?>
		</header>
		<!-- top menu -->
		<nav>
			<ul>
				<li><a href = "adminIndex.php" id = "sel"><i class='bx bxs-home'></i><span>&ensp;Home</span></a></li>
				<li><a href="#"><i class='bx bxs-category'></i>&ensp;Select Category</a>
					<ul>
					<?php
					// query for selecting all data from category table.
						$statemnt = $connection->prepare("SELECT * FROM `assignment1`.`category`");
						// executing the query
						$statemnt->execute();

						//fetching the data
						while ($result = $statemnt->fetch(PDO::FETCH_NUM)){

							//showing data
							echo "<li><a class='articleLink' href='adminCategory.php?ctgName=".$result[1]."'>". $result[1]."</a></li>";
						}
						?>
					</ul>
				</li>
				<li><a href = "adminProfile.php"><i class='bx bxs-user-rectangle'></i><span>&ensp;Profile</span></a></li>
				<li><a href = "logout.php"><i class='bx bx-log-out-circle'></i><span>&ensp;Log Out</span></a></li>
			</ul>
		</nav>
		<img src="images/banners/randombanner.php" alt = "Images"/>
		<main>
			<nav>
				<ul>
				<li><a href = "manageAdmins.php"><i class='bx bxs-user'></i><span>&ensp;Admins</span></a></li>
                <li><a href = "adminArticles.php"><i class='bx bxs-news' ></i><span>&ensp;News</span></a></li>
				<li><a href = "manageCategories.php"><i class='bx bx-category' ></i><span>&ensp;Category</span></a></li>
				<li><a href = "manageComments.php" ><i class='bx bxs-comment' ></i><span>&ensp;Comments</span></a></li>
				</ul>
			</nav>
			<section class = "news_list_container">
                <h2> LATEST ARTICLES </h2>
			</section>
			<div class = "title_contnr">
				
		   <?php
			// query for selecting all data from category table.
			$statemnt = $connection->prepare("SELECT * FROM `assignment1`.`article` ORDER BY publishDate desc LIMIT 10");

			// executing the query
			$statemnt->execute();
			
			// checking if table's row is more than zero...
			if($statemnt->rowCount()>0){
				while($result = $statemnt->fetch(PDO::FETCH_NUM)){
					$number+=1;
			?>

				<div class = "evr_titles">
					<!-- news date -->
					<em style = "float: right;"><?php echo $result[4]; ?></em>

					<!-- news published date -->
					<p>Category:&nbsp;<?php echo $result[3]; ?></p>

					<!-- news title (which is also a link for redirecting admin to specific full article) -->
					<h1><a href = "adminFullArticle.php?id=<?php echo $result[0]?>"><?php echo $result[1]; ?></a></h1>
				</div>

			<?php }}else{
				// if the article table is empty...
				echo "<div style = 'text-align: center;'>Currently, there are no articles!</div>";
			}?>
			

		</div>
		</main>
		<footer>
			&copy; Elite News 2024. All rights reserved.
		</footer>

	</body>
</html>
