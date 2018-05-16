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
            <h1 class="selected">Contact Information</h1>
        </div>

        <div id="contact-info">
            <h6>American Yacht Supply</h6>
            <p>
                390 Enterprise Drive<br>
                Nicholasville, KY 40356
            </p>

            <p>
                Phone: (859) 887-3143<br>
                Toll Free: (800) 538-3686<br>
                24-Hour Fax Line: (859) 885-7891
            </p>

            <p>Hours: 8:30am &ndash; 5:00pm EST Mon.&ndash;Fri.</p>

            <p><a href="mailto:customerservice@americanyachtsupply.com">customerservice@americanyachtsupply.com</a></p>
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
