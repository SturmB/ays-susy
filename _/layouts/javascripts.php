<?php
/**
 * Created by PhpStorm.
 * User: apache
 * Date: 4/30/18
 * Time: 9:35 AM
 */
?>


<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<!--FlexiNav menu-->
<script src="_/vendor/flexinav/js/flexinav_plugins.js"></script>
<script src="_/vendor/flexinav/js/flexinav.min.js"></script>

<!--RetinaJS-->
<script src="_/vendor/retinajs/dist/retina.min.js"></script>

<!--Custom script-->
<script src="_/js/script.js" type="text/javascript"></script>

<script>
  $(function() {

    $(".feature").matchHeight();
    $(".mh").matchHeight();

    /* FlexiNav */
    $("#flexinav1").flexiNav({
      flexinav_effect: "flexinav_hover",
      flexinav_show_duration: 300,
      flexinav_hide_duration: 200,
      flexinav_show_delay: 200,
      flexinav_trigger: true,
      flexinav_hide: false,
      flexinav_scrollbars: false,
      flexinav_scrollbars_height: 500,
      flexinav_responsive: true
    });

    // Add the 'last' class to the last Subcategory of each Category.
    // This adds a bit of space to the bottom of the Category's flyout.
    $(".dropdown_flyout").children("li:last-child").addClass("last");

  });

</script>


<!--<script src="http://localhost:35729/livereload.js"></script>-->
