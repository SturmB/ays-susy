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

    <section id="jumbotron">
        <h1>Your Plane,<br>
            Our Product</h1>
        <img src="images/hero-02.jpg" data-rjs="3" alt="">
    </section>

    <section id="main-content">
        <article id="welcome-aboard-special">
            <h2>Welcome Aboard Special - $445<sup>*</sup></h2>
            <img src="images/welcome-aboard-special-photo_01.jpg" class="promo-photo" data-rjs="3"
                 alt="Welcome Aboard Special">
            <p>A great way to sample our products at a savings!</p>
            <h4>Here's what you'll get:</h4>
            <p>100 each of our 8oz Foam Cups, our shatter resistant 10oz FrostFlex Tumblers, and 250 of our White
                Beverage Napkins. Order Another Welcome Aboard Special at the same time for your Office, Boat, Farm,
                Ranch, or Vacation Home and get <span class="bold">10% off</span> the additional order!</p>
            <div>
                <div class="was-item"><img src="images/welcome-aboard-assets/S8.png" alt="Foam Cup" data-rjs="3">
                    <h4>100</h4>
                    <p>8oz Foam Cups</p>
                </div>
                <div class="was-item"><img src="images/welcome-aboard-assets/N10.png" alt="Beverage Napkin"
                                           data-rjs="3">
                    <h4>250</h4>
                    <p>White Beverage Napkins</p>
                </div>
                <div class="was-item"><img src="images/welcome-aboard-assets/P10.png" alt="Frost-Flex Cup"
                                           data-rjs="3">
                    <h4>100</h4>
                    <p>10oz Frost-Flex Tumblers</p>
                </div>
            </div>
            <p class="aside"><sup>*</sup>One special per logo please. Price includes one flat price, unlimited
                colors,
                digitally printed.</p>
        </article>
        <!--      <article id="product-categories">
                <h2>Product Categories:</h2>
                <div class="gallery-wrapper">
                  <a href="#" class="product-cat" id="napkins">
                    <figure>
                      <img src="images/product-categories-assets/napkins.png" data-rjs="3" alt="Napkins">
                    </figure>
                    Napkins
                  </a>
                  <a href="#" class="product-cat" id="coasters">
                    <figure>
                      <img src="images/product-categories-assets/coasters.png" data-rjs="3" alt="Coasters">
                    </figure>
                    Coasters
                  </a>
                  <a href="#" class="product-cat" id="stirpiks">
                    <figure>
                      <img src="images/product-categories-assets/stirpiks.png" data-rjs="3" alt="Drink Stirrers, Food Piks, &amp; Ice Cream Spoons">
                    </figure>
                    Stirrers &amp; Piks
                  </a>
                  <a href="#" class="product-cat" id="plates">
                    <figure>
                      <img src="images/product-categories-assets/plates.png" data-rjs="3" alt="Plates">
                    </figure>
                    Plates
                  </a>
                  <a href="#" class="product-cat" id="cups">
                    <figure>
                      <img src="images/product-categories-assets/cups.png" data-rjs="3" alt="Cups">
                    </figure>
                    Cups
                  </a>
                  <a href="#" class="product-cat" id="utensils">
                    <figure>
                      <img src="images/product-categories-assets/utensils.png" data-rjs="3" alt="Lids, Straws, &amp; Utensils">
                    </figure>
                    Lids &amp; Utensils
                  </a>
                </div>
              </article>
        -->
    </section>

    <section id="sidebar">
        <div class="feature">
            <h2>Personalization is the Key</h2>
            <p>As a professional pilot, you know that galley supplies add that &ldquo;Over the Top&rdquo; touch to
                your
                flight operations. Whether owner flown or company plane, your aircraft reflects the image of you and
                your company. Now it's time to make sure you personalize it, with custom imprinted Cups, Napkins,
                Plates, &amp; Coasters.<br>
                <br>
                Your personalized Drinkware is as easy as:</p>
            <ol>
                <li>Pick your aircraft from our vast clipart library.</li>
                <li>Provide text and/or &ldquo;N&rdquo; number with chosen font.</li>
                <li>Fill out our <a href="orderform.pdf" title="Order Form" target="_blank">order form<i
                                class="fas fa-download fa-inline" aria-hidden="true"></i></a>.
                </li>
                <li>Approve your proof provided to you within 1 business day.</li>
            </ol>
        </div>
        <div class="feature">
            <h2>A Pilot's Guide to Custom Imprinted Drinkware</h2>
            <p>As a professional pilot or business owner, have you ever tried to track down galley supplies for your
                airplane? You see them everywhere but no one seems to know where to get them, and when you find a
                source, it is 2&ndash;3 weeks before your product ships. This company represents the classic &ldquo;saw
                a need and filled it&rdquo; story. <a href="about.php" title="About Us" target="_self">More on our
                    story&hellip;</a>
            </p>
        </div>
        <div class="feature">
            <h2>Downloadable 2018 Catalog</h2>
            <a href="2018_American_Cabin_Supply_Catalog_OPT.pdf" target="_blank"><img
                        src="images/catalog-cover-2018.jpg" data-rjs="3" alt="Downloadable Catalog" id="cat-cover"/></a>
            <p>Why wait for the mail? Get our digital catalog instantly and be eco-friendly. Browse through our many
                products to see which ones are right for you. If you can’t decide, call customer service and ask for
                a
                free spec sample. We will gladly send you the actual item to see if it fits your cup holders as well
                as
                to see if you like the product.<br>
                <br>
                Download the catalog to refer to later on your laptop. 16 pages of top of the line customizable
                drinkware items waiting for your planes picture and N numbers.<br>
                <br>
                Created for pilots, by pilots. Happy Flying!</p>
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
