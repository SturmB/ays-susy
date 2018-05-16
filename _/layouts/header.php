<?php require_once("_/functions-header.php"); ?>

<header>
    <a href="index.php">
        <img src="images/logo/logo-ays-horizontal.svg" alt="American Yacht Supply">
    </a>
</header>

<nav>
    <div id="flexinav1" class="flexinav flexinav_ocean"> <!-- BEGIN FLEXINAV -->
        <div class="flexinav_wrapper"> <!-- Begin FlexiNav Container -->
            <ul class="flexinav_menu">

                <li class="flexinav_collapse"><span class="left"><i class="fas fa-bars"></i>Navigation</span><a
                            href="index.php"><span class="right"><i class="fas fa-home"></i></span></a></li>
                <?php
                $showInactive = isset($_POST["showInactive"]) ? $_POST["showInactive"] : "false";

                $menu = getMenuItems($db, $showInactive);
                echo printMenu($menu, null, "");
                ?>

                <li><span>Clip-Art</span>
                    <div class="flexinav_ddown flexinav_ddown_fly_out flexinav_ddown_240">
                        <ul class="dropdown_flyout">
                            <?php
                            echo printClipartMenu();
                            ?>
                        </ul>
                    </div>
                </li>

                <li><span>Information</span>
                    <div class="flexinav_ddown flexinav_ddown_fly_out flexinav_ddown_240">
                        <ul class="dropdown_flyout">
                            <li><a href="orderform.pdf" target="_blank" title="Order Form">Order Form</a></li>
                            <li><a href="typefaces.php" target="_self" title="Fonts">Typefaces</a></li>
                            <li><a href="general_information.php" target="_self" title="General Information">General
                                    Info</a></li>
                            <li><a href="about.php" target="_self" title="About Us">About Us</a></li>
                            <li><a href="contact.php" target="_self" title="Contact Information">Contact Info</a></li>
                        </ul>
                    </div>
                </li>

            </ul>
        </div> <!-- End FlexiNav Container -->
    </div> <!-- END FLEXINAV -->
</nav> <!-- End #flexinav1 container -->
