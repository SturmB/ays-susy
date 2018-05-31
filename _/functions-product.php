<?php
// General --------------------------------------------------
// Find the page chosen.
function find_chosen_page()
{
    global $category;
    global $subcategory;

    $category = isset($_GET["category"]) ? $_GET["category"] : null;
    $subcategory = isset($_GET["subcategory"]) ? $_GET["subcategory"] : null;
}

// Title --------------------------------------------------
function displayTitle($db, $category, $subcategory, $method, $showInactive)
{
    $query = "CALL ";
    $query .= "ACS_SubcategoryMethod_GetForTitle(";
    $query .= "'{$category}', ";
    $query .= "'{$subcategory}', ";
    $query .= "'{$method}', ";
    $query .= "'{$showInactive}'";
    $query .= ");";
    $title_result = mysqli_query($db, $query);
    confirm_query($title_result);
    $result = mysqli_fetch_assoc($title_result) or die(mysqli_error($db));

    $product_name = htmlentities($result['product_name']);
//    $method_name = htmlentities($result['method_name']);
//    $method_desc = htmlentities($result['method_desc']);

    $html  = "<h1 class='product-name selected'>{$product_name}</h1>" . PHP_EOL;
//    $html .= "<div class='method-info'>" . PHP_EOL;
//    $html .= "  <h4 class='method-name selected'>{$method_name}</h4>" . PHP_EOL;
//    $html .= "  <p class='method-desc'>{$method_desc}</p>" . PHP_EOL;
//    $html .= "</div>" . PHP_EOL;

    mysqli_free_result($title_result);
    mysqli_next_result($db);

    echo $html;
}

// Print Method Buttons --------------------------------------------------
function getMethods($db, $category, $subcategory, $showInactive)
{
    $query = "CALL ";
    $query .= "ACS_Subcategory_GetAllMethods(";
    $query .= "'{$category}', ";
    $query .= "'{$subcategory}', ";
    $query .= "'{$showInactive}'";
    $query .= ");";
    $methods_result = mysqli_query($db, $query);
    confirm_query($methods_result);

    $result = "";
    if (!empty(mysqli_num_rows($methods_result))) {
        $result .= "<hr>";
        while ($method = mysqli_fetch_assoc($methods_result)) {
            $result .= "<div class='swal-print-method'>";
            $result .= "    <h4>{$method['long_name']}</h4>";
            $result .= "    <p>{$method['long_description']}</p>";
            $result .= "</div>";
        }
    }

    mysqli_free_result($methods_result);
    mysqli_next_result($db);

    return $result;
}

function methodButton($method_short_name, $method_long_name, $selected)
{
    echo "<a href='#' id='link-{$method_short_name}' class='method-button";
    if ($selected) {
        echo " selected";
    }
    echo "' data-method='{$method_short_name}'>";
    echo "<h2>";
    echo htmlentities($method_long_name);
    echo "</h2>" . PHP_EOL;
//    echo "<h5>";
//    echo htmlentities($method_short_desc);
//    echo "</h5>" . PHP_EOL;
//    echo $parenthetical;
    echo "</a>" . PHP_EOL;
}

function displayMethodButtons(
    $db,
    $category,
    $subcategory,
    $printMethod,
    $showInactive
)
{
    $query = "CALL ";
    $query .= "ACS_Subcategory_GetAllMethods(";
    $query .= "'{$category}', ";
    $query .= "'{$subcategory}', ";
    $query .= "'{$showInactive}'";
    $query .= ");";
    $methods_result = mysqli_query($db, $query);
    confirm_query($methods_result);

    //    if (!empty(mysqli_num_rows($methods_result))) {
    if (mysqli_num_rows($methods_result) > 1) {
        $plural = mysqli_num_rows($methods_result) > 1 ? 's' : '';
        echo "<h4 class='selected'>Print Method{$plural}:</h4>";
        while ($method = mysqli_fetch_assoc($methods_result)) {
            methodButton(
                $method["short_name"],
                $method["long_name"],
                $method['short_name'] === $printMethod
            );
        }
//        echo "<a href='#' id='printMethodDifference'>What's the difference? &mdash; Learn more <i class='fa fa-external-link'></i></a>";
        echo "<a href='#' id='printMethodDifference'>What's the difference? <i class='fas fa-info-circle'></i> Learn more</a>";
    }

    mysqli_free_result($methods_result);
    mysqli_next_result($db);
}

// Features --------------------------------------------------
function getPrintMethod($db, $method, $showInactive)
{
    $html = '';

    $query  = "CALL ACS_Method_GetNames(";
    $query .= "'{$method}', ";
    $query .= "'{$showInactive}'";
    $query .= ")";
    $method_result = mysqli_query($db, $query);
    confirm_query($method_result);
    $method = mysqli_fetch_assoc($method_result) or die(mysqli_error($db));

    $long_name = htmlentities($method['long_name']);
    $hex = htmlentities($method['hex']);

    $html .= "<h2><span style='color: #{$hex};'>{$long_name}</span> Features &amp; Options</h2>" . PHP_EOL;

    mysqli_free_result($method_result);
    mysqli_next_result($db);

    echo $html;
}

function getFeatureCount($db, $category, $subcategory, $method, $showInactive)
{
    // Perform database query.
    $query = "CALL ";
    $query .= "ACS_Feature_GetCountForProductLine(";
    $query .= "'{$category}', ";
    $query .= "'{$subcategory}', ";
    $query .= "'{$method}', ";
    $query .= "'{$showInactive}'";
    $query .= ");";
    $feature_result = mysqli_query($db, $query);
    // var_dump($feature_result);
    confirm_query($feature_result);

    // Use returned data (if any).
    $feature = mysqli_fetch_row($feature_result);
    $featureCount = '0';
    if (!is_null($feature)) {
        $featureCount = $feature[0];
    }

    mysqli_free_result($feature_result);
    mysqli_next_result($db);

    return $featureCount;
}

function getFeatures($db, $category, $subcategory, $method, $showInactive)
{
    // 2. Perform database query.
    $query = "CALL ";
    $query .= "ACS_Feature_GetList(";
    $query .= "'{$category}', ";
    $query .= "'{$subcategory}', ";
    $query .= "'{$method}', ";
    $query .= "'{$showInactive}'";
    $query .= ");";
    $feature_result = mysqli_query($db, $query);
    // var_dump($feature_result);
    confirm_query($feature_result);

    // 3. Use returned data (if any).
    $features = array();
    while ($feature = mysqli_fetch_assoc($feature_result)) {
        // Make a two-dimensional array from results
        //   to make recursive looping much easier
        $features[] = array(
            "id" => $feature["id"],
            "feature" => $feature["feature"],
            "parent_id" => $feature["parent_id"]
        );
    }
    mysqli_free_result($feature_result);
    mysqli_next_result($db);

    return $features;
}

function printFeatures(array $items, $parentId, $result)
{
    foreach ($items as $item) {
        if ($item["parent_id"] == $parentId) {
            $result .= "<li>";
            $result .= $item["feature"];
            $result .= "<ul>";
            $result = printFeatures($items, $item["id"], $result);
            $result .= "</ul></li>";
        }
    }
    return $result;
}

// Text Notes --------------------------------------------------
function getStampNotes($db, $category, $subcategory, $method, $showInactive)
{
    $query  = "CALL ";
    $query .= "ACS_Imprints_GetImprintTypesForSubcatMethod(";
    $query .= "'{$category}', ";
    $query .= "'{$subcategory}', ";
    $query .= "'{$method}', ";
    $query .= "'{$showInactive}'";
    $query .= ");";
    // var_dump($query);
    $imprint_result = mysqli_query($db, $query) or die(mysqli_error($db));
    // confirm_query($imprint_result);
    // var_dump($imprint_result);

    $html  = "";
    while ($imprint_type = mysqli_fetch_assoc($imprint_result)) {
        if ($imprint_type["pricing_text"] !== null) {
            $html .= "<dt>";
            $html .= htmlentities($imprint_type["long_name"]) . " - ";
            $html .= "</dt>" . PHP_EOL;
            $html .= "<dd>";
            $html .= $imprint_type["pricing_text"];
            $html .= "</dd>" . PHP_EOL;
        }
    }

    mysqli_free_result($imprint_result);
    mysqli_next_result($db);

    return $html;
}

function getTextNotes($db, $category, $subcategory, $method, $showInactive)
{
    $query  = "CALL ";
    $query .= "ACS_Notes_GetNotesForSubcatMethod(";
    $query .= "'{$category}', ";
    $query .= "'{$subcategory}', ";
    $query .= "'{$method}', ";
    $query .= "'{$showInactive}'";
    $query .= ");";
    $notes_result = mysqli_query($db, $query) or die(mysqli_error($db));

    $result  = "";
    while ($note = mysqli_fetch_assoc($notes_result)) {
        $result .= "<dt>";
        $result .= $note["note_title"];
        $result .= "</dt>" . PHP_EOL;
        $result .= "<dd>";
        $result .= $note["note_body"];
        $result .= "</dd>" . PHP_EOL;
    }

    mysqli_free_result($notes_result);
    mysqli_next_result($db);

    return $result;
}

function displayTextNotes($db, $category, $subcategory, $method, $showInactive)
{
    $result = "";

    $color_item = preg_match("/color/i", $subcategory);
    $napkin_item = preg_match("/napkin/i", $category);

    $stamping_result = getStampNotes(
        $db,
        $category,
        $subcategory,
        $method,
        $showInactive
    );

    $notes_result = getTextNotes(
        $db,
        $category,
        $subcategory,
        $method,
        $showInactive
    );

    // Begin building the string that will be returned.
    // This first section is for the paragraph text.
    $result .= "<p>";
    $result .= "<span class=\"color-accent\">Be sure to specify:</span> ";
    if ($color_item === 1) {
        $result .= ucfirst($category) . "color, ";
    }
    if ($napkin_item === 1 && $method == "tradition") {
        $result .= "Imprint method, ";
    }
    $result .=
        "Imprint placement, Standard ink color below, or provide us with your Pantone&reg; ink number.";
    $result .= "</p>";

    // Then the list of notes.
    if ($stamping_result || $notes_result) {
        $result .= "<dl>{$stamping_result}{$notes_result}</dl>" . PHP_EOL;
    }

    return $result;
}

// Splash Image --------------------------------------------------
function displaySplashImage($category, $subcategory, $method)
{
    $output = "";

    $output .= "<img src=\"images/product-subcategories-assets/";
    $output .= $category . "-" . $subcategory;
    if (!empty($method)) {
        $output .= "-" . $method;
    }
    $output .= ".png\" data-rjs=\"3\" alt=\"";
    $output .= $category . "-" . $subcategory;
    if (!empty($method)) {
        $output .= "-" . $method;
    }
    $output .= "\">";

    return $output;
}

// Thumbnails / Swatches --------------------------------------------------
function displayImprintThumbs($db, $category, $subcategory, $method, $showInactive)
{

    $query  = "CALL ";
    $query .= "ACS_Imprints_GetImprintTypesForSubcatMethod(";
    $query .= "'{$category}', ";
    $query .= "'{$subcategory}', ";
    $query .= "'{$method}', ";
    $query .= "'{$showInactive}'";
    $query .= ");";
    $imprint_result = mysqli_query($db, $query) or die(mysqli_error($db));

    $html = "";
    if (mysqli_num_rows($imprint_result) > 1) {
        $html .= "<h6 class='swatch-title'>Imprint Types</h6>" . PHP_EOL;
        $html .= "<div class='swatches'>" . PHP_EOL;
        $html .= "  <ul id='imprint-methods'>" . PHP_EOL;
        $image_folder = "images/imprint-types-assets/";
        while ($imprint_type = mysqli_fetch_assoc($imprint_result)) {
            $pretty_name = htmlentities($imprint_type['long_name']);
            $filename = $image_folder . $imprint_type['short_name'] . '.jpg';

            $html .= "    <li>" . PHP_EOL;
            $html .= "      <figure>" . PHP_EOL;
            $html .= "        <figcaption>{$pretty_name}</figcaption>" . PHP_EOL;
            $html .= "        <img src='{$filename}' data-rjs='3' alt='{$pretty_name}'>" . PHP_EOL;
            $html .= "      </figure>" . PHP_EOL;
            $html .= "    </li>" . PHP_EOL;
        }
        $html .= "  </ul>" . PHP_EOL;
        $html .= "</div>" . PHP_EOL;
    }

    if ($imprint_result) {
        mysqli_free_result($imprint_result);
    }
    mysqli_next_result($db);

    return $html;

}

function displayProductColorSwatches(
    $db,
    $category,
    $subcategory,
    $showInactive
)
{
    $result = "";

    // $subcategory = "color"; // DEBUGGING LINE ONLY! REMOVE FOR PRODUCTION!
    $query = "CALL ";
    $query .= "ACS_Products_GetColorsForProductsInSubcategory(";
    $query .= "'{$category}', ";
    $query .= "'{$subcategory}', ";
    $query .= "'{$showInactive}'";
    $query .= ");";
    $colors_result = mysqli_query($db, $query);
    // confirm_query($colors_result);
    $result .= "<ul class='color-list'>";
    $product = "";

    while ($color = mysqli_fetch_assoc($colors_result)) {
        if ($product != $color["item_num"]) {
            $product = $color["item_num"];
            $exploded = explode(" - ", $product);
            $short_product = array_shift($exploded);
            $result .= "</ul>";
            // $result .= "<div>";
            $result .= "<h6 class='product-color mh' id='{$short_product}-title'>{$product}:</h6>";
            // $result .= "</div>";
            $result .= "<ul class='color-list mh' id='{$short_product}-list'>";
        }

        $hex_color = "#" . $color["hex"];
        $result .= "<li class='stroke-black' style='background-color: {$hex_color}; ";
        if (preg_match("/metallic/i", $color["long_name"])) {
            $hex_color2 = shadeColor2("#" . $color["hex"], -0.5);
            $result .= "background-image: linear-gradient(135deg, {$hex_color} 0%, {$hex_color2} 100%);";
        }
        $result .= "'>";
        $result .= "{$color['short_name']}";
        $result .= "</li>";
    }

    $result .= "</ul>";

    if ($colors_result) {
        mysqli_free_result($colors_result);
    }
    mysqli_next_result($db);

    echo $result;
}

function displayInkColorSwatches($db, $category, $subcategory, $method, $showInactive)
{
    $result = "";

    $query = "CALL ";
    $query .= "ACS_Colors_GetColorsForProductLine(";
    $query .= "'{$category}', ";
    $query .= "'{$subcategory}', ";
    $query .= "'{$method}', ";
    $query .= "'{$showInactive}'";
    $query .= ");";
    $colors_result = mysqli_query($db, $query);
    confirm_query($colors_result);

    $result .= "<h6 class='swatch-title'>Ink Color Choices</h6>";
    $result .= "<div class='swatches' id='ink-color-swatches'>";
    $result .= "<ul class='color-list'>";
    $type = "";

    while ($color = mysqli_fetch_assoc($colors_result)) {
        if ($type != $color["type_name"]) {
            $type = $color["type_name"];
            $result .= "</ul>";
            $result .= "<h6 class='ink-color mh'>{$type}:</h6>";
            $result .= "<ul class='color-list mh'>";
        }

        $hex_color = "#" . $color["hex"];
        $result .= "<li class='stroke-black' style='background-color: {$hex_color}; ";
        if (preg_match("/metallic/i", $color["color_long_name"])) {
            $hex_color2 = color_luminance($color["hex"], -0.5);
            $result .= "background-image: linear-gradient(135deg, {$hex_color} 0%, {$hex_color2} 100%);";
        }
        if (preg_match("/foil/i", $color["type_name"])) {
            $spaces_removed = str_replace(" ", "", $color["color_long_name"]);
            $lowered = strtolower($spaces_removed);
            $filename = $lowered . ".jpg";
            $result .= "background: url(images/swatches-foils-assets/{$filename}); ";
            $result .= "background-size: cover; ";
        }
        $result .= "'>";
        $result .= "{$color['color_short_name']}";
        $result .= "</li>";
    }

    $result .= "</ul>";
    $result .= "</div>";

    if ($colors_result) {
        mysqli_free_result($colors_result);
    }
    mysqli_next_result($db);

    return $result;
}

// Product Info --------------------------------------------------
function getProducts($db, $category, $subcategory, $method, $showInactive)
{
    $product_array = array();

    $query = "CALL ACS_Products_GetProductsFromFullName(";
    $query .= "'{$category}', ";
    $query .= "'{$subcategory}', ";
    $query .= "'{$method}', ";
    $query .= "'{$showInactive}'";
    $query .= ");";
    $prod_result = mysqli_query($db, $query);
    confirm_query($prod_result);

    while ($product_info = mysqli_fetch_assoc($prod_result)) {
        $product_array[] = $product_info;
    }

    mysqli_free_result($prod_result);
    mysqli_next_result($db);

    return $product_array;
}

function getPricing($db, $subcatmethod_id, $product_id, $showInactive)
{
    $price_array = array();

    $query = "CALL ACS_Prices_GetAllPricesForProduct(";
    $query .= "'{$subcatmethod_id}', ";
    $query .= "'{$product_id}', ";
    $query .= "'{$showInactive}'";
    $query .= ");";
    $price_result = mysqli_query($db, $query);
    confirm_query($price_result);

    while ($price_row = mysqli_fetch_assoc($price_result)) {
        $price_array[] = $price_row;
    }

    mysqli_free_result($price_result);
    mysqli_next_result($db);

    return $price_array;
}

function getImages($category, $subcategory, $item_num)
{
    $result = "<h4 class='stroke-black text-rollover'>Sample</h4>" . PHP_EOL;

    $folder  = "../images/products/products-assets/";
    $folder .= $category;
    $folder .= "/";
    $folder .= $subcategory;
    $folder .= "/";
    $html_folder = substr($folder, 3);
    $item_num_list = [$item_num];
    if (stripos($item_num, "(COLOR)") !== false) {
        $item_num_list = [];
        $end_position = stripos($item_num, '(');
        $filename_prefix = substr($item_num, 0, $end_position);
        $raw_list = scandir($folder);
        $image_list = preg_grep("/-blank_thumb\.png$/", $raw_list);
        $filtered_list = preg_grep("/^{$filename_prefix}/", $image_list);

        foreach ($filtered_list as $item) {
            $end_position = stripos($item, '-blank_thumb');
            $item_num_list[] = substr($item, 0, $end_position);
        }

//        $first_item = array_shift($item_num_list);
//        $end_position = stripos($first_item, '-blank_thumb');
//        $item_num_list = [substr($first_item, 0, $end_position)];
    }

    $rotatingImagesClass = "";
    $rotatingImagesStyle = "";
    if (count($item_num_list) > 1) {
        $rotatingImagesClass = "rotating-item";
        $rotatingImagesStyle = "style='display: none;'";
    }

    $sampleExists = preg_match("/^[DTH]-/", $item_num) > 0 ? true : false;
    $blankClass = '';
    if ($sampleExists) {
        $blankClass = 'thumbnail-blank';
    }


    foreach ($item_num_list as $image) {
        $result .= "<div class='{$rotatingImagesClass}' {$rotatingImagesStyle}>" . PHP_EOL;
        $result .= "    <img src='{$html_folder}{$image}-blank_thumb.png' class='thumbnail-image {$blankClass}' data-rjs='3' alt='{$image}'>" . PHP_EOL;
        if ($sampleExists) {
            $result .= "    <img src='{$html_folder}{$image}-sample_thumb.png' class='thumbnail-image thumbnail-sample' data-rjs='3' style='display: none;' alt='{$image}'>" . PHP_EOL;
        }
        $result .= "</div>" . PHP_EOL;
    }

    return $result;
} //getImages

function displayProductInfo(
    $db,
    $category,
    $subcategory,
    $method,
    $showInactive
)
{
    $output = "";
    $everyThousand = false;

    // Get Products
    $products = getProducts(
        $db,
        $category,
        $subcategory,
        $method,
        $showInactive
    );

    // Display information from both.
    foreach ($products as $product) {
        $decoded_item_num = str_replace("/", "-", $product['product_name']);
        $decoded_item_num = str_replace(' ', '', $decoded_item_num);
        $rotatorClass = stripos($decoded_item_num, "(COLOR)") !== false ? 'rotating-item-wrapper' : '';

        $output .= "<div class='item-info";
        if (count($products) == 1) {
            $output .= " singleton";
        } /* elseif (count($products) == 3) {
            // Removed, as it doesn't look good with the additional "extra charges" columns.
            //            $output .= " tripleton";
        }*/
        $output .= "'";
        // $output .= " onload='infiniteRotator()'";
        $output .= ">";

        // Div for the item #, thumbnail, and description.
        $output .= "<div class='itd'>" . PHP_EOL;

        // Item #
        $output .= "<h4 class='item-number'>{$product['product_name']}</h4>" . PHP_EOL;

        // Thumbnail
        $output .= "<div class='item-thumb'>" . PHP_EOL;
        $output .= "    <div class='item-thumb-overlay overlay-rollover {$rotatorClass}'>" . PHP_EOL;
        $output .= getImages($category, $subcategory, $decoded_item_num);
        $output .= "    </div>" . PHP_EOL;
        $output .= "</div>" . PHP_EOL;

        // Item Description
        $output .= "<h6 class='item-description'>{$product['description']}</h6>" . PHP_EOL;

        $output .= "</div>" . PHP_EOL; // div.itd

        // Coupon Code
        // $output .= "<p class=\"coupon-code\">";
        // $output .= $product['coupon_code'];
        // $output .= "</p>";
        // Price table
        // Get only those column names which are filled.
        $breaks = getPricing(
            $db,
            $product['sm_id'],
            $product['product_id'],
            $showInactive
        );
        //        $output .= print_r($breaks, true) . PHP_EOL;
        $columns = array();
        //        $firstRow = $breaks[0];
        //        $output .= print_r($firstRow, true) . PHP_EOL;
        foreach ($breaks as $quantityBreak) {
            foreach ($quantityBreak as $colName => $value) {
                if (!empty($value)) {
                    //                    $output .= 'colName: ' . $colName . PHP_EOL;
                    //                    $output .= 'pretty: ' . pretty_name_of($colName) . PHP_EOL;
                    $columns[] = $colName;
                }
            }
        }
        $columns = array_unique($columns);
        //        $output .= 'Columns retrieved' . PHP_EOL;
        //        $output .= print_r($columns, true) . PHP_EOL;
        $output .= "<div class='item-pricing'>";

        $output .= "    <table>" . PHP_EOL;
        $output .= "        <thead>" . PHP_EOL;
        $output .= "            <tr>" . PHP_EOL;
        $symbolLegend = "";
        $numColumns = count($columns);

        // Header cells
        foreach ($columns as $colName) {
            $headerClass = 'main-column';
            $forDisplay = Charges::prettyNameOf($colName);
//            $symbol = Charges::symbolOf($colName);
            $icon = Charges::iconNameOf($colName);


            if ($colName !== 'quantity' && $colName !== 'price') { // NOT the first two columns (Quantity and Price)
                $headerClass = '';

                $symbolLegend .= "<li>";
//                $symbolLegend .= "    <span class='fa-li fa-layers fa-fw'>";
//                $symbolLegend .= "        <i class='fas fa-circle'></i>";
//                $symbolLegend .= "        <span class='fa-layers-text fa-inverse' data-fa-transform='shrink-4 down-1'>{$symbol}</span>";
//                $symbolLegend .= "    </span>";
                $symbolLegend .= "  <div class='icon baseline'>" . PHP_EOL;
                $symbolLegend .= "    <img src='images/charges-icons/{$icon}-legend.svg' class='svg icon-screen'>";
                $symbolLegend .= "    <img src='images/charges-icons/{$icon}-print.svg' class='svg icon-print'>";
                $symbolLegend .= "    = {$forDisplay}" . PHP_EOL;
                $symbolLegend .= "  </div>" . PHP_EOL;
                $symbolLegend .= "</li>" . PHP_EOL;

//                $forDisplay  = "<span class='fa-layers fa-fw'>";
//                $forDisplay .= "    <i class='fas fa-circle'></i>";
//                $forDisplay .= "    <span class='fa-layers-text fa-inverse' data-fa-transform='shrink-4 down-1'>{$symbol}</span>";
//                $forDisplay .= "</span>";

                $forDisplay  = "<div class='icon baseline'>" . PHP_EOL;
                $forDisplay .= "    <img src='images/charges-icons/{$icon}-th.svg' class='svg icon-screen'>" . PHP_EOL;
                $forDisplay .= "    <img src='images/charges-icons/{$icon}-print.svg' class='svg icon-print'>" . PHP_EOL;
                $forDisplay .= "</div>" . PHP_EOL;
            }

            $headerClass .= ' columns' . $numColumns;

            $output .=
                "            <th class='{$headerClass}'>{$forDisplay}</th>" .
                PHP_EOL;
        }
        //        $output .= "      <th>Quantity</th>";
        //        $output .= "      <th>Price</th>";
        $output .= "            </tr>" . PHP_EOL;
        $output .= "        </thead>" . PHP_EOL;
        $output .= "        <tbody>" . PHP_EOL;

        // Display Quantity, Price, and any other charges for each quantity break.
        //        $prices = getPricing($db, $product['sm_id'], $product['product_id']);
        foreach ($breaks as $index => $quantityBreak) {
            //            $formatted_quantity = number_format($price['quantity'], 0);
            //            $decimals = 3; // Commented-out because Cabin orders do not use decimal numbers for prices nor other charges.
            $decimals = 0;
            $perThousand = "";
//            $specialPrice = false;
//            $asterisk = "";
            if ($category == "napkin" && $method == "hispeed") {
                $decimals = 2;
                $perThousand = "M";
            }

            $even = $index % 2 != 0 ? 'even' : '';
            $output .= "        <tr class='{$even}'>" . PHP_EOL;

            foreach ($columns as $colName) {
                $number = $quantityBreak[$colName];
                $classes = "";
                if ($colName === 'quantity') {
                    // For _only_ the "Quantity" column.
                    $classes = "quantity";
                    $formatted = $number === null
                        ? 'N/A'
                        : number_format($number, 0);
//                    $asterisk = "";
                    if ($number >= 1000) {
                        $everyThousand = true;
//                        $specialPrice = true;
                    }
                } else {
                    // For any column _other than_ the "Quantity" column. (Only monetary units?)
                    $formatted = $number === null
                        ? 'N/A'
                        : "<span class='sup'>$</span>" . number_format($number, $decimals) . $perThousand;
                    if ($colName !== 'price') {
                        // For any column _other than_ the "Quantity" and "Price" columns.
                        $classes = "charges";
                    }
/*                    if ($specialPrice) {
                        $asterisk = "<sup>*</sup>";
                    }*/
                }
                $output .=
                    "            <td class='numeric {$classes}'>{$formatted}</td>" .
                    PHP_EOL;
            }
//            $output .= $formatted_quantity;
//            $output .= "</td>" . PHP_EOL;
//            $output .= "      <td class=\"numeric\">";
//            $output .= $formatted_price;
//            $output .= "</td>" . PHP_EOL;
            $output .= "        </tr>" . PHP_EOL;
        }

        $output .= "        </tbody>" . PHP_EOL;
        $output .= "    </table>" . PHP_EOL;

        // Add product notes, if there are any.
        if ($everyThousand || count($columns) > 2) {

            $output .= "<div class='product-notes'>" . PHP_EOL;

            if ($everyThousand) {
                $output .=
                    "<p>Quantities 1,000 and above are priced per thousand.</p>" .
                    PHP_EOL;
            }

            if (count($columns) > 2) {
                $output .= "<ul>" . PHP_EOL;
                $output .= $symbolLegend;
                $output .= "</ul>" . PHP_EOL;
            }

            $output .= "</div>" . PHP_EOL; // div#product-notes
        }

        $output .= "</div>" . PHP_EOL; // div.item-pricing

        $output .= "</div>" . PHP_EOL; // div.item-info
    } // foreach ($products as $product)

    return $output;
}
