<?php
  define("DB_SERVER", "127.0.0.1");
//  define("DB_SERVER", "localhost");
  define("DB_USER", "skyweb");
  define("DB_PASS", "sky241");
  define("DB_NAME", "acs2017");

  // 1. Create a database connection.
  $db = mysqli_connect(DB_SERVER, DB_USER, DB_PASS, DB_NAME);
  // Test if connection occured.
  if (mysqli_connect_errno()) {
    die("Database connection failed: " .
          mysqli_connect_error() .
          " (" . mysqli_connect_errno() . ")"
    );
  }

  // printf("Initial character set: %s\n", mysqli_character_set_name($db));

  /* change character set to utf8 */
  if (!mysqli_set_charset($db, "utf8")) {
    // printf("Error loading character set utf8: %s\n", mysqli_error($db));
    exit();
  } else {
    // printf("Current character set: %s\n", mysqli_character_set_name($db));
  }

?>
