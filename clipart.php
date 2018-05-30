<?php require_once("_/session.php"); ?>
<?php require_once("_/db_connection.php"); ?>
<?php require_once("_/functions.php"); ?>
<?php require_once("_/functions-clipart.php"); ?>

<?php
find_chosen_page();

if (!$clipart_type) {
    // page ID was missing or invalid
    redirect_to("index.php");
}

$clipart_info = displaySubTitle($db, $clipart_type);
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <?php include_once("_/layouts/page_head.php"); ?>
</head>
<body>
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-N5HFWX"
                  height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

<div id="outer-shell">

    <?php include("_/layouts/header.php"); ?>

    <section id="general-content">

        <div id="title">
            <h1 class="selected clipart-title">Clip Art</h1>
            <h3 class="clipart-subtitle"><?php echo $clipart_info["long_name"]; ?></h3>
        </div>


        <div id="clipart-info">

            <div id="clipart-intro">
                <?php
                $clipart_category = $clipart_info["category"];
                if ($clipart_category == "theme") {
                    $clipart_category = "aircraft";
                }
                ?>
                <img src="images/clipart/clipart-sketch-<?php echo $clipart_category; ?>.svg" alt="Sample Sketch"
                     id="sample-sketch">
                <div id="clipart-instructions">
                    <?php if ($clipart_info["category"] == "aircraft") { ?>
                        <img src="images/clipart/clipart-combination-sample.svg" alt="Plane On Clouds"
                             id="img-clipart-combo"/>
                    <?php } ?>
                    <p>To create a design using our clip art and typestyles, sketch the layout of the design and label
                        the parts like the example to the right. Use additional pages if necessary. If a different
                        design is to be used on different items, use as many sketches as necessary and label each for
                        the particular item upon which it is to be used. We will size the art to the item to be
                        imprinted. If you have particular size requirements, we will follow your specifications. Should
                        you need a line drawing that is not here, call, and if we don’t have what you need, we can
                        probably create it for you.</p>
                </div>
            </div>


            <div id="clipart-gallery">
                <?php
                $imageFolder = "images/clipart/" . $clipart_type . "/";
                $allFiles = scandir($imageFolder);
                $images = preg_grep("/^[0-9A-Za-z].*\.(svg|png|jpg)$/", $allFiles);

                if (count($images) > 0) {
                    foreach ($images as $image) {
                        $currentImage = $imageFolder . $image;
                        $explodedName = explode(".", $image);
                        $cleanFilename = array_shift($explodedName);
                        echo "<div class=\"clipart-thumb\">";
                        echo "  <figure class=\"thumbnail\">";
                        echo "    <img src=\"$currentImage\" alt=\"$cleanFilename\">";
                        echo "  </figure>";
                        echo "  <p class=\"caption\">$cleanFilename</p>";
                        echo "</div>";
                    }
                }
                ?>
            </div>

        </div>


    </section>


    <?php include("_/layouts/footer.php"); ?>

</div> <!--#outer-shell-->


<?php include("_/layouts/javascripts.php"); ?>

</body>
</html>

<!--5. Close database connection-->
<?php
if (isset($db)) {
    mysqli_close($db);
}
?>


