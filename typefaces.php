<?php require_once("_/session.php"); ?>
<?php require_once("_/db_connection.php"); ?>
<?php require_once("_/functions.php"); ?>


<!DOCTYPE html>
<html lang="en">
<head>
    <?php include_once("_/layouts/page_head.php"); ?>
</head>
<body>
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-KC9V8S"
                  height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

<div id="outer-shell">

    <?php include("_/layouts/header.php"); ?>

    <section id="general-content">

        <div id="title">
            <h1 class="selected">Typefaces</h1>
        </div>

        <div id="typefaces-info">
            <?php
            $imageFolder = "images/fonts/";
            $allFiles = scandir($imageFolder);
            $images = preg_grep("/\.svg$/", $allFiles);
            if (count($images) > 0) {
                echo "<div id=\"typeface-gallery\">";
                foreach ($images as $image) {
                    $currentImage = $imageFolder . $image;
                    $explodedPeriodName = explode(".", $image);
                    $intermedFilename = array_shift($explodedPeriodName);
                    $explodedHyphenName = explode("-", $intermedFilename);
                    $cleanFilename = array_pop($explodedHyphenName);

                    echo "<div class=\"single-typeface\">";
                    echo "	<h4>$cleanFilename</h4>";
                    echo "	<img src=\"$currentImage\" class=\"typeface-thumb\" alt=\"$cleanFilename\">";
                    echo "</div>";
                }
                echo "</div>";
            }
            ?>
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
