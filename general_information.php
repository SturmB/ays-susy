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
            <h1 class="selected">General Information</h1>
        </div>

        <div id="general-info">

            <h4>Artwork:</h4>

            <p>We request camera ready art and will resize it appropriately, or will follow your instructions, if given.
                We have a <a href="clipart.php">large selection of clipart</a>. If what you need is not available, we
                business cards, brochures, etc. If you need our extra design assistance creating artwork, it is
                available at a reasonable charge. Artwork isn't limited to logos only. Sketch out a diagram of how you
                want the item to look. Remember that type can be placed on an arc, at angles, placed on either side of
                clip art, italicized, etc., to create a well balanced design. Use additional paper to sketch your
                designs and layouts. We reserve the right to determine what constitutes camera-ready vector art or
                high-resolution digital art. Digital proofs are sent via email for all new orders and reorders.</p>
            <p>Call our customer service representatives if you have questions concerning art at 1-800-932-9933. We're
                happy to help! You can also email us your artwork to the address below.</p>
            <p>Art email: <a href="mailto:customerservice@americancabin.com">customerservice@americancabin.com</a></p>

            <h5>Acceptable Digital Art:</h5>
            <ol>
                <li>We use digital vector (line art) files from these vector drawing programs: Corel Draw - (.cdr) files
                    (versions 3 through 2017). Adobe Illustrator - (.ai) or (.eps) (versions 3 through CC 2018). *All
                    .eps
                    files need to be saved as "vector" or "editable" .eps formats from vector programs; not to be
                    confused with a raster .eps from Photoshop or paint programs.
                </li>
                <li>All vector art containing fonts MUST BE CONVERTED TO CURVES OR OUTLINES.</li>
                <li>We accept monochrome (1 color-black) bitmap image files such as: .tif, .bmp, and .jpg. They must be
                    high-resolution (600ppi or greater) and BLACK ONLY.
                </li>
            </ol>
            <p>*Emailed artwork can be sent to: <a href="mailto:customerservice@americancabin.com">customerservice@americancabin.com</a>.
                Please reference all pertinent information: company name, phone &amp; fax numbers, and PO#. Also please
                name your artwork by PO# to help us match files.</p>

            <h5>Unacceptable Digital Art:</h5>
            <ol>
                <li>Web graphics (rgb 72ppi .jpgs are low-resolution raster).</li>
                <li>Vector graphics without the fonts converted to curves or outlines.</li>
            </ol>

            <p><span class="accent">Clip Art:</span> <a href="clipart.php">Clip art images are available.</a> Digital
                proof required.</p>

            <p><span class="accent">Typesetting:</span> We will typeset 5 lines of text or 75 characters free of charge
                on orders over $200. For orders under $200, an hourly art charge will apply at $50 per hour with a
                minimum charge of &frac12; hour. Please choose one of the <a href="typefaces.php">fonts available</a>.
                Written approval may be required. Digital proof is required.</p>

            <p><span class="accent">Art Charge:</span> We realize customers may not always have digital ready art and
                will make our Art Department available at $50 per hour, with a minimum charge of &frac12; hour. We will
                quote before
                any art is done and an approval may be required. Digital proof required.</p>

            <p><span class="accent">Art Work Retrieval Fee:</span> To retrieve and forward a digital copy of artwork
                from current or past orders there will be an artwork retrieval fee of $30.</p>

            <p><span class="accent">Trademarks:</span> All copy/art submitted by the customer will be accepted by the
                factory as being submitted in full compliance with all applicable laws regarding trademark, licensing,
                copyright, right of privacy, patent, or similar protection. Factory will be held harmless from all
                claims and cost arising from these issues. Trademarked, licensed, and copyrighted logos contained in
                this catalog are not for sale. They are for the illustration of printing capabilities only and do not
                represent endorsement from their respective owners. By placing an order, customer understands that
                overruns may be used for digital or print media illustrating factory's printing capability.</p>


            <h4>Printing Characteristics:</h4>

            <p><span class="accent">Screen Printing:</span> Screen Printing is the process for smaller quantities and
                the best quality image. Screened images are very sharp and crisp with good ink opacity, and even the
                ability to over print multiple colors to solve registration issues in some art. One disadvantage is that
                multiple colors must be printed and re-registered one at a time, making it costly, and is limited to one
                side only on cups. Multi-color registration may have a variation of approximately &frac18;".</p>

            <p><span class="accent">Pad Printing:</span> Pad Printing is a printing method which uses a silicon pad to
                pick up ink from a plate and transfer the ink directly onto the item being printed. This printing method
                is best suited for unusually-shaped items, imprints with fine detail, and halftones. Disadvantages of
                this printing method are the limited imprint area, ink opacity, and subtle tonal changes in the imprint
                on large solid areas. Due to the thin ink transfer and limited ink opacity, it is not recommended to
                print on dark substrates without first putting a white base down. This adds an additional color charge
                to the cost of the item being printed. On most of our items we are limited to 5 colors of imprint.</p>

            <p><span class="accent">4-Color Process:</span> Best for Photo or special effect reproduction. Process
                printing allows for less than full saturation of the primary colors; tiny dots (halftones) of each
                primary color are printed in a pattern small enough that it is perceived as a solid color. With half
                toning, a full continuous range of colors can be produced. Colors may not match exactly if you attempt
                to print spot color artwork as a CMYK job. We will simply change the colors to a CMYK equivalent in your
                original files. Keep in mind that spot colors will not convert exactly and may not match material that
                you've previously printed as spot color. It should be noted that the color created by 4-color process
                printing are not solid colors at all, but rather a series of dots. This is most noticeable in the
                photographs reproduced in your local newspaper. Four-color reproduction can utilize either vector-based
                or pixel-based versions of your artwork (as long as the image has adequate resolution). It's recommended
                that your digital files are no lower than 300ppi (absolutely not from the internet).</p>
            <p>Pros of 4-Color Process: Unlimited colors & color choices and special effect friendly (drop shadows,
                glows, and gradients).
            <p>Cons of 4-Color Process: Degraded color matching ability, loss of solid color integrity, gradients &
                tints only fade to 20%, and a loss of sharpness in photos or illustration quality.</p>

            <img src="images/info-cmyk.png" alt="4 Color Process Example" data-rjs="3" id="info-cmyk">

            <p><span class="accent">Emboss &amp; Deboss:</span> Embossing and debossing are printing methods which use
                heat and pressure to create a raised or recessed image into the product. This printing method is best
                suited for bold imprints without fine detail, halftones, nor reversed images. These imprint methods are
                available on all napkins. However please be aware that the image is not as crisp on the Almost Linen
                Napkins due to the thickness of the product.</p>

            <p><span class="accent">Hot Stamping:</span> Hot stamping is a printing method which uses heat and pressure
                to transfer a foil to the item being imprinted. Due to the softness of the napkin/coaster, a certain
                amount of bleeding and fill-in will occur with fine detail/reversed-out images. Logos with fine
                detail/reversed-out images are recommended to be screen printed. Please note that since foil is stamped
                on the napkin/coaster, large solid areas may flake during use. Halftone images are not able to be hot
                stamped. Foil color swatches available <a href="#info-inkcolors">further down on this page</a>.</p>


            <h4>Printing Disclaimers:</h4>

            <p><span class="accent">Maximum Imprint Area:</span> This is listed for each item. We recommend staying 20%
                under
                this area. Unless specified, we will enlarge or reduce your image to fit within these areas. Artwork is
                enlarged and reduced proportionally by both width and height. Therefore, if you request maximum imprint
                area, only one of the dimensions may be the maximum as stated in the catalog.</p>

            <p><span class="accent">Wrap Imprints:</span> Wrap imprints are available, however a complete wrap is
                unfeasible. There
                will be a gap of approx. &frac34;" on screen-printed cups and approximately &frac12;" on digital-printed
                cups.</p>

            <p><span class="accent">Halftones &amp; Screen Tints:</span> Halftones will not appear as smooth on printed
                products as they appear on a computer screen or printout unless the output device is set to print tints
                at 55 LPI (for screen-printed napkins), 65 LPI (for screen-printed cups), or 90 LPI (for pad-printed and
                process-printed items). (See graphic example below.) Tints below 20% at 65 LPI cannot be achieved and
                tints over 80% at 65 LPI will appear solid. Due to the coarseness of the halftones, our factory
                recommends that images be given a solid outline. (See graphic example below.)</p>

            <img src="images/info-halftones.png" alt="Halftones" data-rjs="3" id="info-halftones">

            <p><span class="accent">Thin Lines:</span> Our factory recommends you use 1pt line or thicker. Reversed-out
                lines require 2pts or thicker. (See graphic example below.) If recommendations are not followed, our
                factory can not be held responsible for the outcome.</p>

            <img src="images/info-linethickness.svg" alt="Line Thicknesses" id="info-linethickness">

            <p><span class="accent">Small Font:</span> Factory recommends using 8pt fonts or larger. Script and
                reversed-out fonts should be 10pts or larger. (See graphic example below.)</p>

            <img src="images/info-fontsizes.svg" alt="Font Sizes" id="info-fontsizes">

            <p><span class="accent">Standard Ink Colors:</span> If you do not have a PMS #, you may choose from the
                following color swatches. Please note we do not charge for PMS matching, so feel free to supply a
                Pantone&reg; color if it is available. 2X & 4-digit metallic PMS colors are not available. 800-series
                colors are limited to the PMS numbers shown. Asterisk (<sup>*</sup>) represents the default color when
                more than one choice is available.</p>

            <p><span class="accent">Ink Color Match:</span> We do not charge for PMS matching. We take great pride in
                our ability to match PMS colors. However, color match is only guaranteed +/- one shade on white/clear
                items. We cannot guarantee color match on dark-colored items. If purchase orders say to use a PMS #, and
                you describe the color, the factory is only responsible for the PMS #. We do not check to see if the PMS
                # provided is the color stated. 2X and 4-digit metallic PMS numbers are not available. 800-series colors
                are limited to the PMS # shown.</p>

            <img src="images/info-inkcolors.svg" alt="Ink Colors" id="info-inkcolors">

            <p><span class="accent">Ink Odor:</span> Paper products are printed with inks that must evaporate to dry.
                These vapors may be trapped in the plastic packaging before they have completely dissipated. The inks
                are dry, but there may be a residual odor in the package from these vapors. Some colors of ink have more
                odor than others, and the amount of ink coverage can also affect the amount of odor. This odor, should
                it be present, is not considered a defect. It is similar to painting a room in your home. The paint will
                be dry, but there will be an odor that remains for several days. Should this odor be a concern, remove
                the paper products from the plastic packaging and let them air to eliminate the odor. Normally, once the
                products are placed for use, any odor that remains will quickly dissipate.</p>

            <p><span class="accent">Ink Adhesion:</span> Plastic bottles, cups, and plates are sold as disposable and
                for one time use only. Some cups are stamped as residential top rack dishwasher safe. However, due to
                environmental variables beyond the factory's control the imprint is not guaranteed to stay on.</p>

            <p><span class="accent">Ink Changes:</span> Ink color changes are available only in increments of 50 pieces
                at $15 per change.</p>

            <p><span class="accent">Copy Changes:</span> Copy changes are not available.</p>

            <p><span class="accent">Combined Quantity:</span> Combined quantity pricing is not available.</p>

            <p><span class="accent">Over/Under Runs:</span> We make every effort to ship exact quantities ordered.
                However, over-/under-runs can be up to +/- 10%.</p>

            <p><span class="accent">Standard Layout:</span> Unless otherwise specified, we will default to our standard
                placement (marked in red). The gray areas on napkins indicate a ruffled edge. Cups are printed
                one-sided. (There is no charge for 2-sided or wrap imprint, but it must be specified.)</p>

            <img src="images/info-layouts-stacked.svg" alt="Standard Layouts" id="info-layouts">


            <h4>Proofs:</h4>

            <p>Digital proofs are emailed within 24 hours. One change can be made to a proof; thereafter, each change
                will be $10. Any change, including ink color, quantity, packaging, etc will require a new proof. If
                requesting a proof without factory's receipt of purchase order for printed items, there will be a $30
                charge per item and each additional change is $10. Your order will not be put into the production
                schedule until the final signed proof is received.</p>

            <p><span class="accent">All Proofs:</span> Your order is not given a ship date until the signed proof
                approval and any instructed pre-payments are received. After receipt of all signed proof approval &
                prepayments are received, you will receive a fax copy of the order acknowledgment showing ship date.
                Reorders will require a proof.</p>

            <!--            <p><span class="accent">Virtual Proof:</span> Emailed, 2 dimensional colored digital photo of item, showing
                            logo placement. Not to be used for color and print characteristic approval. Any change, including ink
                            color, requires new proof. Sent within 24 hours. 1st proof is $30, each additional is $10.</p>
            -->
            <p><span class="accent">Product Proof:</span> Actual printed product. Digital proof required first. Sent
                within 5 working days. If there are no changes in the final copy of the order, there will be no
                additional Set-Up charges. The charge for this proof is $25 per color & Set-Up fee per color. Please
                call customer service for details.</p>


            <h4>Production Time:</h4>

            <p>Normal production is 5 working days from receipt of signed proof approval. We're quite proud of our
                performance in providing quality work on time.</p>

            <p><span class="accent">Production Time:</span> Production does not begin until all written approvals and
                any instructed pre-payments are received. Approvals received after 2:00 pm EST will be treated as being
                received the following business day for production scheduling proposes. Orders received with in-hands
                date sooner than the standard production time will be treated as a rush job. Please see Rush Service
                below.</p>


            <h4>Rush Service:</h4>

            <p>Rush service is available at no extra charge and based on production &amp; inventory availability.
                However, your order will be required to ship via an AIR METHOD. If this is not acceptable, your order
                will be given standard production time. All rush orders must ship overnight to ensure you meet your
                deadline. Call our customer service representatives at 1-800-932-9933 for availability of rush service.
                Our hours are 8:30 a.m. until 5:00 p.m. EST Monday through Friday. Let us help you!</p>


            <h4>Shipping:</h4>

            <p>We ship via UPS and must have a complete street address (no PO Boxes) and zip code. Shipping charges to
                continental US addresses are 8% of order regardless of size, number of boxes, or weight. Minimum
                shipping charge is $5. Shipping of export, expedited, and other orders outside of the continental US
                will be billed at cost.</p>

            <p><span class="accent">FOB:</span> All products are shipped FOB. As such, our factory will not be held
                responsible for lost, damaged, or delayed products caused by the shipping carriers.</p>

            <p><span class="accent">Carriers:</span> UPS, Federal Express, Federal Express Ground, UPS Freight, and
                USPS.</p>

            <p><span class="accent">Split Shipments:</span> $7.50 per address and shipping method.</p>

            <p><span class="accent">Third Party Billing:</span> $2 per box. If over 100 boxes, the charge is $1 per box.
            </p>

            <p><span class="accent">COD Shipments:</span> Not available.</p>

            <p><span class="accent">U.S.P.S. Shipments:</span> $5 per box plus actual freight cost.</p>

            <p><span class="accent">Freight Quotes:</span> These are for estimating purposes only.</p>

            <p><span class="accent">Carriers Address Corrections:</span> These will be billed at cost and is customer's
                responsibility.</p>

            <p><span class="accent">International Shipments:</span> The customer is responsible for all duties, taxes,
                and fees on international shipments. Freight quotes will not be provided, and must ship on 3rd party
                account numbers.</p>

            <p><span class="accent">In-Hands Dates:</span> If there is an "in-hands date" listed, without specific or
                contradicting shipping information, our factory reserves the right to ship via an expedited method to
                meet the event date.</p>

            <p><span class="accent">Product Damage Claims:</span> All claims must be made within 5 days. Please note
                that you should expect a reasonable percentage of breakage on disposable plastic drinkware. If, after
                inspection of the entire shipment, you feel that a claim with the carrier is warranted, we will be happy
                to help in filing a claim on your behalf. We are not responsible for breakage or damage in transit.
                Should damage occur, you must save all boxes and packing material as well as broken items for possible
                inspection by the carrier on your premises. Without the box and packaging material, claims will be
                automatically denied. Call our customer service representatives and they will assist you in filing a
                claim.</p>

            <p><span class="accent">Returns:</span> We will gladly exchange any defective product or errors on our part
                within 30 days, but otherwise cannot accept returns of imprinted items.</p>


            <h4>Special Packaging:</h4>

            <p><span class="accent">Packaging:</span> Packaging is listed for each item and is subject to change, based
                on specific requirements and quantities. You may choose to package your products differently. For this
                service, a special packaging charge will apply. Below you will find general guidelines for pricing.
                Please be aware that changing the packaging count may require a new box. We recommend sending all
                specific packaging requirements in writing to C/S/R and we will be happy to quote the project. Packaging
                for unimprinted items may vary from the packaging listed on the product pages of this site.</p>

            <p><span class="accent">Custom Packaging:</span> $.30 per package.</p>

            <p><span class="accent">Custom Labeling:</span> $.30 per label.</p>

            <p><span class="accent">Custom Fulfillment:</span> We do offer custom fulfillment. Please submit a detailed
                request, including item numbers, quantity, packaging details, etc., and we will be happy to quote.</p>

            <p><span class="accent">Custom Collation:</span> We offer custom collation. Please submit a detailed
                request, including item numbers, quantity, and complete collation details, and we will be happy to
                quote.</p>

            <p><span class="accent">Custom Case Pack:</span> Minimum charge is $5 per box.</p>


            <h4>Disclaimers:</h4>

            <p><span class="accent">Pricing:</span> Every effort is made to verify the accuracy of this site and
                maintain pricing. However, our factory reserves the right to change pricing without notice.</p>

            <p><span class="accent">Product Information:</span> Every effort is made to verify the accuracy of the
                product information on this site. However, we cannot be held liable for erroneous information.</p>

            <p><span class="accent">Product Color:</span> Every effort is made to verify the color accuracy of the
                products on this site. However, due to printing and computer monitor limitations, we cannot be held
                liable for variations in color. If color is important, please order random samples or a product proof.
            </p>

            <p><span class="accent">Product Color Variation:</span> White napkins will vary in "brightness" from lot to
                lot. The paper of colored napkins is dyed to achieve its respective color. Therefore, each lot could
                appear as a slightly different shade. Napkin color could "bleed" when wet. Plastic product colors may
                vary in color from lot to lot as well. The above stated variation is not considered to be a defect.</p>

            <p><span class="accent">Product Count:</span> The product count has been verified several times throughout
                the manufacturing and packaging process. When questions arise, the actual shipping weight receipt,
                automatically generated from the shipping scale, will be used to verify count.</p>

            <p><span class="accent">Logo Placement Variation:</span> Your logo will be placed as shown on your proof.
                Understand that the placement can vary slightly during printing. This is not considered a defect.</p>

            <p><span class="accent">Scuffs &amp; Scratches:</span> It is the nature of plastic to scuff and scratch
                during stacking and shipping. Clear and dark-colored plastic items show this the most. The above stated
                variation is not considered to be a defect.</p>

            <p><span class="accent">Product Substitutions:</span> Factory reserves the right to substitute our products
                with one of a similar design and function. Notice may or may not be given at our factory's discretion.
            </p>

            <p><span class="accent">Order Cancellation:</span> Any cancellation to a processed order must be in writing
                and is subject to $30 charge in addition to any material/labor cost.</p>

            <p><span class="accent">Order Change:</span> Any change to a processed order must be submitted in writing
                and is subject to a $10 charge, in addition to any material/labor cost.</p>

            <p><span class="accent">Returns:</span> Must be pre-approved by the factory and in no event will be accepted
                after 30 days from date of delivery.</p>

            <p><span class="accent">Unimprinted Items:</span> To order unimprinted items, the cost is based on
                screen-printed pricing, less a 10% discount. Returns of unimprinted items will only be accepted if
                packages are unopened, and will be subject to a restocking fee of 25%. All freight charges will be the
                responsibility of the customer. Packaging for unimprinted items may vary from the packaging listed on
                the product pages on this site.</p>

            <p><span class="accent">Acknowledgements:</span> All orders are acknowledged with pricing information within
                24 hours. It is the customer's responsibility to check for discrepancies, as the order will be produced
                accordingly. Please note, after the paper proof is approved, you will receive another acknowledgment
                showing the ship date and method. Again, it is the responsibility of the customer to verify the
                information.</p>

            <p><span class="accent">Factory Compliance Policy:</span> The customer must make their own determination
                that their use of product(s) is safe, lawful, and technically suitable in their intended applications.
            </p>

            <p><span class="accent">QR Codes:</span> Our factory recommends a product proof for testing before placing
                an order with a QR code as part of the artwork. The minimum size for a QR code should be 1 inch or
                larger. This works best with dark ink on light items. The quality of smart phone and choice of QR Code
                reader app can affect scan ability.</p>


            <h4>Privacy Policy:</h4>

            <p>We know that your privacy on the Internet is very important to you. As a result, we have prepared this
                Privacy Policy to let you know there is no information-collecting cookies on American Cabin Supply's web
                site, reassuring you of your privacy while browsing our site. You have our word.</p>


            <p class="accent">It is understood that by submitting an order to the factory, the customer agrees to all of
                the factory's terms and conditions, regardless of what is on the customer's purchase order.</p>

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


