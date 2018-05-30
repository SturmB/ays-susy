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
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-N5HFWX"
                  height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

<div id="outer-shell">

<?php include("_/layouts/header.php"); ?>


<section id="general-content">

  <div id="title">
    <h1 class="selected">Our Story</h1>
  </div>

  <div id="about-info">

    <img src="images/plane_N21T_onground.jpg" alt="N21T plane on ground" class="accent-image" id="about-image">

    <p class="bold">Dear Captain,</p>

    <p>As a professional mariner or business owner, have you ever tried to track down galley supplies for your yacht? You see them everywhere but no one seems to know where to get them, and when you find a source, it is 2&ndash;3 weeks before your product ships. This company represents the classic &ldquo;saw a need and filled it&rdquo; story.</p>

    <p>The year was 1985. My father was a corporate pilot and saw the need for a mail order catalog of custom imprinted galley supplies that a discerning customer like yourself could simply pick up the phone and order. So in a little town called Nicholasville, Kentucky, out of our basement, my parents created a catalog and set up a print operation. After 10 years of great success in the aviation industry, we branched out and created American Yacht Supply.</p>

    <p>Today, <?php echo date("Y") - 1985; ?> years later, American Yacht Supply is a bit bigger, a bit more diverse, but in many ways still the same. We're still in the same small Kentucky town. We're still on the vanguard of the drinkware business. And most important, we still thrive on the quality and service that my parents instilled upon the company. Our skilled craftsmen pride themselves on producing a quality product, within a 5 day turnaround time, that will appeal to our discerning customer, and is backed by the best guarantee available anywhere.</p>

    <img src="images/signature-ShawnClaggett-black.png" alt="Shawn Claggett" class="signature"/>
    
    <p class="bold">Shawn Claggett<br>
    President, 2nd Generation</p>

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


