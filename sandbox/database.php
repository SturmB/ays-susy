<?php
  // 1. Create a database connection
  $dbhost = "skyfs";
  $dbuser = "ChrisAdmin";
  $dbpass = "siskoDS9";
  $dbname = "job_orders_2014";
  try {
    $conn = new PDO("dblib:host={$dbhost};dbname={$dbname}", "{$dbuser}", "{$dbpass}");
    $conn = null;
  } catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br>";
    die();
  }
?>
