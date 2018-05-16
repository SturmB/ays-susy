<?php require_once("db_connection.php"); ?>
<?php require_once("functions.php"); ?>
<?php
  // You can simulate a slow server with sleep
  // sleep(2);

  $result = array(); // Create a JSON array to return.

  function is_ajax_request() {
    return isset($_SERVER['HTTP_X_REQUESTED_WITH']) &&
      $_SERVER['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest';
  }

  $category = isset($_POST["category"]) ? $_POST["category"] : "coaster";
  $subcategory = isset($_POST["subcategory"]) ? $_POST["subcategory"] : "budget";
  $method = isset($_POST["method"]) ? $_POST["method"] : "tradition";
  $subcatMethod = $category . "-" . $subcategory . "-" . $method;
  // $subcatMethod = isset($_POST["name"]) ? $_POST["name"] : "napkin-linen-digital";
  // var_dump($method);

  // 2. Perform database query.
  $query  = "CALL ";
  $query .= "ACS_Feature_GetList(";
  $query .= "'{$category}', ";
  $query .= "'{$subcategory}', ";
  $query .= "'{$method}'";
  $query .= ");";
  $feature_result = mysqli_query($db, $query);
  // var_dump($feature_result);
  confirm_query($feature_result);

  // 3. Use returned data (if any).
  $features = array();
  while ($feature = mysqli_fetch_assoc($feature_result)) {
    // Make a two-dimensional array from results
    //   to make recursive looping much easier
    $features[] = array("id" => $feature["id"],
                        "feature" => $feature["feature"],
                        "parent_id" => $feature["parent_id"]
    );
  }
  mysqli_free_result($feature_result);
  mysqli_next_result($db);

  // Where the data is sent back to the web page.
  if (is_ajax_request()) {
    // printFeatures($features, null);
    $result["features"] = printFeatures($features, null, "");

    // Add more items to the json object.
    $result["textnotes"] = displayTextNotes($db, $category, $subcategory, $method);
    $result["method"] = $method;

    echo json_encode($result);
    header('Content-Type: application/json');
  } else {
    exit;
  }

?>
