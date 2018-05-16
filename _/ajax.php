<?php require_once("db_connection.php"); ?>
<?php require_once("functions.php"); ?>
<?php require_once("functions-product.php"); ?>
<?php
  // You can simulate a slow server with sleep
  // sleep(2);

  $result = array(); // Create a JSON array to return.

  $category = isset($_POST["category"]) ? $_POST["category"] : "coaster";
  $subcategory = isset($_POST["subcategory"]) ? $_POST["subcategory"] : "budget";
  $method = isset($_POST["method"]) ? $_POST["method"] : "tradition";
  $showInactive = isset($_POST["showInactive"]) ? $_POST["showInactive"] : "false";
  $subcatMethod = $category . "-" . $subcategory . "-" . $method;
  // $subcatMethod = isset($_POST["name"]) ? $_POST["name"] : "napkin-linen-digital";
  // var_dump($method);


  // Where the data is sent back to the web page.
  if (is_ajax_request()) {
    $features = getFeatures($db, $category, $subcategory, $method, $showInactive);
    $result["features"] = printFeatures($features, null, "");

    // Add more items to the json object.
    $result["textnotes"] = displayTextNotes($db, $category, $subcategory, $method, $showInactive);
    $result["splashimage"] = displaySplashImage($category, $subcategory, $method);
    $result["pricing"] = displayProductInfo($db, $category, $subcategory, $method, $showInactive);
    $result["inks"] = displayInkColorSwatches($db, $category, $subcategory, $method, $showInactive);
    $result['imprints'] = displayImprintThumbs($db, $category, $subcategory, $method, $showInactive);

    echo json_encode($result);
    // header('Content-Type: application/json');
  } else {
    exit;
  }

?>
