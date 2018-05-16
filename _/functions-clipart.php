<?php

// General --------------------------------------------------

  // Find the page chosen.
  function find_chosen_page() {
    global $clipart_type;
    
    $clipart_type = isset($_GET["type"]) ? $_GET["type"] : null;
  }


// Title --------------------------------------------------

  function displaySubTitle($db, $clipart_type) {
    $query  = "CALL ";
    $query .= "ACS_Clipart_GetInfoFromShortName(";
    $query .= "'{$clipart_type}'";
    $query .= ");";
    $clipart_result = mysqli_query($db, $query);
    confirm_query($clipart_result);
    $clipart_info = mysqli_fetch_assoc($clipart_result) or die(mysqli_error($db));

    mysqli_free_result($clipart_result);
    mysqli_next_result($db);
    
    return $clipart_info;
  }


?>