<?php require_once("_/session.php"); ?>
<?php require_once("_/db_connection.php"); ?>
<?php require_once("_/functions.php"); ?>
<?php require_once("_/functions-product.php"); ?>

<?php
find_chosen_page();
// Change this in the future so that if only $category is set,
// then redirect to a Category only page, which shows subcategories
// from which to choose.
if (!$category && !$subcategory) {
    // page ID was missing or invalid
    redirect_to("index.php");
}

$printMethod = isset($_GET["printMethod"]) ? $_GET["printMethod"] : 'digital';
$catSubcat = $category . "-" . $subcategory;
$subcatMethod = $catSubcat . "-" . $printMethod;

$showInactive = isset($_SESSION["showInactive"]) ? $_SESSION["showInactive"] : 'false';
if (isset($_GET["showInactive"])) {
    $showInactive = $_GET["showInactive"];
    $_SESSION["showInactive"] = $showInactive;
}

// Get the number of Features & Options
// for determining whether or not to display them.
$featureCount = intval(getFeatureCount($db, $category, $subcategory, $printMethod, $showInactive));
$notesCount = $featureCount;
$showSidebar = $featureCount + $notesCount > 0;
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


    <section id="product-content">

        <div id="title">
            <?php displayTitle($db, $category, $subcategory, $printMethod, $showInactive); ?>
<!--            --><?php //displayMethodButtons($db, $category, $subcategory, $printMethod, $showInactive); ?>
        </div>


        <div id="images-content" class="<?php echo $showSidebar ? 'sidebar' : 'no-sidebar'; ?>">

            <div id="splash-image">
                <!-- This is filled in from Ajax call to database. -->
            </div>

        </div>


        <?php if ($showSidebar): ?>
            <div id="fo-column">
                <?php if ($featureCount > 0): ?>
                    <div id="features-options">
                        <?php getPrintMethod($db, $printMethod, $showInactive); ?>
                        <ul id="features-list">
                            <!-- This is filled in from Ajax call to database. -->
                        </ul>
                    </div>
                <?php endif; ?>
                <?php if ($notesCount > 0): ?>
                    <div id="text-notes">
                        <!-- This is filled in from Ajax call to database. -->
                    </div>
                <?php endif; ?>
            </div>
        <?php endif; ?>


        <div id="prices-content">
            <!-- This is filled in from Ajax call to database. -->
            <!--<img src="images/Print-Method_4CP.jpg" class="rotating-item">-->

            <!--      <div class="item-info singleton test-case-1">

                      <div class="itd">
                          <h4 class="item-number">ITEM NO.</h4>
                          <div class="item-thumb">
                              <div class="item-thumb-overlay">
                                  <h4>Sample</h4>
                                  <img class="thumbnail-image thumbnail-blank"
                                       src="images/products/blank-assets/thumbs/cup/paper-white/PC8-WHITE.png" data-rjs="3"
                                       alt="PC8-WHITE.jpg">
                                  <img class="thumbnail-image thumbnail-sample"
                                       src="images/products/blank-assets/thumbs/cup/paper-white/PC8-WHITE_sample.png" data-rjs="3"
                                       alt="PC8-WHITE.jpg"
                                       style="display: none;">
                              </div>
                          </div>
                          <h6 class="item-description">Item Description</h6>
                      </div>

                      <div class="item-pricing">
                          <table>
                              <thead>
                              <tr>
                                  <th class="main-column columns3">QUANTITY</th>
                                  <th class="numeric quantity">50</th>
                                  <th class="numeric quantity">100</th>
                                  <th class="numeric quantity">250</th>
                                  <th class="numeric quantity">500</th>
                                  <th class="numeric quantity">1,000</th>
                                  <th class="numeric quantity">2,500</th>
                                  <th class="numeric quantity">5,000</th>
                              </tr>
                              </thead>
                              <tbody>
                              <tr class="">
                                  <th class="main-column columns3">PRICE</th>
                                  <td class="numeric "><span class="sup">$</span>76</td>
                                  <td class="numeric "><span class="sup">$</span>89</td>
                                  <td class="numeric "><span class="sup">$</span>114</td>
                                  <td class="numeric "><span class="sup">$</span>162</td>
                                  <td class="numeric "><span class="sup">$</span>234</td>
                                  <td class="numeric "><span class="sup">$</span>186</td>
                                  <td class="numeric "><span class="sup">$</span>170</td>
                              </tr>
                              <tr class="even">
                                  <th class=" columns3">
                                      <span class='fa-layers fa-fw'>
                                          <i class='fas fa-circle'></i>
                                          <span class='fa-layers-text fa-inverse' data-fa-transform='shrink-4 down-1'>S</span>
                                      </span>
                                  </th>
                                  <td class="numeric charges"><span class="sup">$</span>73</td>
                                  <td class="numeric charges"><span class="sup">$</span>85</td>
                                  <td class="numeric charges"><span class="sup">$</span>108</td>
                                  <td class="numeric charges"><span class="sup">$</span>153</td>
                                  <td class="numeric charges"><span class="sup">$</span>216</td>
                                  <td class="numeric charges"><span class="sup">$</span>168</td>
                                  <td class="numeric charges"><span class="sup">$</span>152</td>
                              </tr>
                              </tbody>
                          </table>
                          <div class="product-notes">
                              <p>Prices for quantities 1,000 and above are calculated for every 1,000 items.</p>
                              <ul class="fa-ul">
                                  <li>
                                    <span class='fa-li fa-layers fa-fw'>
                                        <i class='fas fa-circle'></i>
                                        <span class='fa-layers-text fa-inverse' data-fa-transform='shrink-4 down-1'>S</span>
                                    </span>
                                      = 2nd Side Imprint Charge
                                  </li>
                              </ul>
                          </div>
                      </div>
                  </div>
            -->
        </div>


        <?php if (preg_match("/color/i", $subcategory)): ?>
            <div id="product-colors">
                <h6 class="swatch-title">Product Color Choices</h6>
                <div class="swatches" id="product-color-swatches">
                    <?php displayProductColorSwatches($db, $category, $subcategory, $showInactive); ?>
                </div>
            </div>
        <?php endif; ?>

        <div id="other-notes">
            <!-- This is filled in from Ajax call to database. -->

<!--            <h6 class="swatch-title">Imprint Types</h6>-->
<!--            <div class="swatches">-->
<!--                --><?php //displayImprintThumbs(); ?>
<!--            </div>-->
        </div>

        <?php if ($printMethod !== 'unprinted'): ?>
            <div id="ink-colors">
                <!-- This is filled in from Ajax call to database. -->
            </div>
        <?php endif; ?>


    </section>


    <?php include("_/layouts/footer.php"); ?>

</div> <!--#outer-shell-->


<?php include("_/layouts/javascripts.php"); ?>


<script src="_/js/sweetalert2.all.min.js"></script>
<script src="https://unpkg.com/promise-polyfill@7.1.0/dist/promise.min.js"></script>
<script>

  var methodButtons = document.getElementsByClassName("method-button");
  var category = "<?php echo $category; ?>";
  var subcategory = "<?php echo $subcategory; ?>";
  var method = "<?php echo $printMethod; ?>";
  var showInactive = "<?php echo $showInactive; ?>";

  function clearSelectedClass() {
    for (i = 0; i < methodButtons.length; i++) {
      if (methodButtons.item(i).classList.contains("selected")) {
        methodButtons.item(i).classList.remove("selected");
      }
    }
  }

  function hideImprints() {
    document.getElementById("other-notes").style.display = "none";
  }

  function showImprints() {
    document.getElementById("other-notes").style.display = "block";
  }

  function hideMethodInfo() {
    document.getElementById("fo-column").style.display = "none";
    document.getElementById("images-content").classList.add("span-all");
    document.getElementById("ink-colors").style.display = "none";
  }

  function buttonClicked() {
    var buttonMethod = this.getAttribute("data-method");

    clearSelectedClass();
    this.classList.add("selected");

    if (buttonMethod === "tradition"
      && /napkin/i.test(category)) {
      showImprints();
    } else {
      hideImprints();
    }

    loadData(category, subcategory, buttonMethod, showInactive);
  }

  function loadData(cat, subcat, meth, inact) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "_/ajax.php", true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
    xhr.onreadystatechange = function() {
      if (xhr.readyState === 4 && xhr.status === 200) {
        // var result = xhr.responseText;
        var json = JSON.parse(xhr.responseText);
        // console.log('Result: ' + result);
        // document.getElementById("features-list").innerHTML = result;
        if (!!document.getElementById("features-list")) {
          document.getElementById("features-list").innerHTML = json.features;
        }
        if (!!document.getElementById("text-notes")) {
          document.getElementById("text-notes").innerHTML = json.textnotes;
        }
        document.getElementById("splash-image").innerHTML = json.splashimage;
        // var priceDiv = document.createElement('div');
        // priceDiv.innerHTML = json.pricing;
        // document.getElementById("prices-content").appendChild(priceDiv);
        document.getElementById("prices-content").innerHTML = json.pricing;
        if (!!document.getElementById('ink-colors')) {
          document.getElementById("ink-colors").innerHTML = json.inks;
        }
        document.getElementById('other-notes').innerHTML = json.imprints;
        // console.log("Finished AJAX?");

        // Re-scan all images for retina-swapping.
        retinajs();

        // Re-apply the match-height code.
        $(".mh")
          .matchHeight("remove")
          .matchHeight();

        // Rotate images for color products.
        InfiniteRotator.init();

        // Set a .rollover class for _only_ those individual product images that _have_ a "Sample" version.
        $(".thumbnail-blank").each(function() {
          $(this)
            .parent(".item-thumb-overlay")
            .addClass("overlay-rollover")
            .children("h4")
            .addClass("text-rollover");
        });

        // Toggle the "Sample" image for the individual product images.
        $(".item-thumb-overlay").hover(function() {
          $(this).find(".thumbnail-image.thumbnail-blank").toggle();
          $(this).find(".thumbnail-image.thumbnail-sample").toggle();
        });

        // Expand out the "Ink Color Choices" section to fill the entire width if the "Imprint Types" section doesn't exist.
        if ($("#imprint-methods").length) {
          $("#ink-colors").addClass("share-width");
        }
      }
    };
    xhr.send("category=" + cat + "&subcategory=" + subcat + "&method=" + meth + "&showInactive=" + inact);
  }

  // Add a click event listener to the two print methods near the top of the page.
  // When they are clicked, highlight the appropriate one and replace all of the
  // necessary page elements.
  for (i = 0; i < methodButtons.length; i++) {
    methodButtons.item(i).addEventListener("click", buttonClicked);
  }

  window.onload = function() {

    // If this product is a Traditions Napkin, show the various imprint methods.
/*
    if (method === "tradition"
      && /napkin/i.test(category)) {
      showImprints();
    } else {
      hideImprints();
    }
*/

    if (method.length < 1) {
      hideMethodInfo();
    }
    loadData(category, subcategory, method, showInactive);

    // Show the detailed Print Method information when the link is clicked.
    if (!!document.getElementById("printMethodDifference")) {
      document.getElementById("printMethodDifference").onclick = function() {
        swal({
          title: "<i class='fas fa-info-circle'></i> Print Methods",
          // text: allPrintMethods.toString()
          html: "<?php echo getMethods($db, $category, $subcategory, $showInactive); ?>",
          grow: "row"
        });
      };
    }

  };

</script>


</body>
</html>

<!--5. Close database connection-->
<?php
if (isset($db)) {
    mysqli_close($db);
}
?>


