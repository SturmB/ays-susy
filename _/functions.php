<?php

  // Just a simple redirect function.
  function redirect_to($new_location) {
    header("Location: " . $new_location);
    exit;
  }

  // Prepare a string for adding to the database.
  function mysql_prep($string) {
    global $db;
    
    $escaped_string = mysqli_real_escape_string($db, $string);
    return $escaped_string;
  }

  // Confirm that the db query worked okay.
  function confirm_query($result_set) {
    if (!$result_set) {
      die("Database query failed.");
    }
  }

  // Tells whether or not the request has been made via Ajax.
  function is_ajax_request() {
    return isset($_SERVER['HTTP_X_REQUESTED_WITH']) &&
      $_SERVER['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest';
  }

  // Automatic copyright year. (Thanks to CSS-Tricks!)
  // https://css-tricks.com/snippets/php/automatic-copyright-year/
  function auto_copyright($year = 'auto'){
    $returnval = "";
    
    if (intval($year) == 'auto') {
      $year = date('Y');
    }
    if (intval($year) == date('Y')) {
      $returnval = intval($year);
    }
    if (intval($year) < date('Y')) {
      $returnval = intval($year) . ' &ndash; ' . date('Y');
    }
    if (intval($year) > date('Y')) {
      $returnval = date('Y');
    }

    return $returnval;
  }


  function pretty_name_of($ugly_name)
  {
      return ucwords(preg_replace('/_/', ' ', $ugly_name));
  }


  abstract class Charges
  {
      // Make these constants equal to the column (field) names in the SubcategoriesMethodsQuantities database table.
      const ADDITIONAL_COLOR_CHARGE = 'additional_color_charge';
      const SECOND_SIDE_CHARGE = 'second_side_charge';
      const PROCESS_CHARGE = 'process_charge';
      const BLEED_CHARGE = 'bleed_charge';
      const WHITE_INK_CHARGE = 'white_ink_charge';
      const HOTSTAMP_CHARGE = 'hotstamp_charge';

      public static function iconNameOf($name)
      {
          $index = stripos($name, '_charge');
          return 'charge-' . strtolower(substr($name, 0, $index));
      }

      public static function prettyNameOf($name)
      {
          switch ($name) {
              case (self::ADDITIONAL_COLOR_CHARGE):
                  return "Additional Spot Color Charge";
              case (self::SECOND_SIDE_CHARGE):
                  return "2nd Side Imprint Charge";
              case (self::PROCESS_CHARGE):
                  return "4-Color Process Charge";
              case (self::BLEED_CHARGE):
                  return "Full Bleed Imprint Charge";
              case (self::WHITE_INK_CHARGE):
                  return "White Ink Imprint Charge";
              case (self::HOTSTAMP_CHARGE):
                  return "Hotstamp Imprint Charge";
              case ('quantity'):
//                  return "QTY";
              case ('price'):
                  return strtoupper(pretty_name_of($name));
              default:
                  return "Error: Unknown Charge Type";
          }
      }

      public static function symbolOf($name)
      {
          switch ($name) {
              case (self::ADDITIONAL_COLOR_CHARGE):
                  return "C";
              case (self::SECOND_SIDE_CHARGE):
                  return "S";
              case (self::PROCESS_CHARGE):
                  return "P";
              case (self::BLEED_CHARGE):
                  return "B";
              case (self::WHITE_INK_CHARGE):
                  return "W";
              case (self::HOTSTAMP_CHARGE):
                  return "H";
              case ('quantity'):
              case ('price'):
                  return pretty_name_of($name);
              default:
                  return "Error: Unknown Charge Type";
          }
      }
  }

// Found below function at: https://gist.github.com/stephenharris/5532899#file-color_luminance-php-L2
  /**
  * Lightens/darkens a given colour (hex format), returning the altered colour in hex format.7
  * @param string $hex Colour as hexadecimal (with or without hash);
  * @percent float $percent Decimal ( 0.2 = lighten by 20%(), -0.4 = darken by 40%() )
  * @return string Lightened/Darkend colour as hexadecimal (with hash);
  */
  function color_luminance( $hex, $percent ) {
    
    // validate hex string
    
    $hex = preg_replace( '/[^0-9a-f]/i', '', $hex );
    $new_hex = '#';
    
    if ( strlen( $hex ) < 6 ) {
      $hex = $hex[0] + $hex[0] + $hex[1] + $hex[1] + $hex[2] + $hex[2];
    }
    
    // convert to decimal and change luminosity
    for ($i = 0; $i < 3; $i++) {
      $dec = hexdec( substr( $hex, $i*2, 2 ) );
      $dec = min( max( 0, $dec + $dec * $percent ), 255 ); 
      $new_hex .= str_pad( dechex( $dec ) , 2, 0, STR_PAD_LEFT );
    }		
    
    return $new_hex;
  }

  // Thanks for this function go to "Pimp Trizkit." More info:
  // http://stackoverflow.com/questions/5560248/programmatically-lighten-or-darken-a-hex-color-or-rgb-and-blend-colors
  // Currently fails with "Notice: Undefined variable: G‌​ in /Users/apache/Sites/acs2017/_/functions.php on line 62" message.
  // Also returns the wrong color.
  function shadeColor2($color, $percent) {
      $color = str_replace("#", "", $color);
      $t=$percent<0?0:255;
      $p=$percent<0?$percent*-1:$percent;
      $RGB = str_split($color, 2);
      $R=hexdec($RGB[0]);
      $G=hexdec($RGB[1]);
      $B=hexdec($RGB[2]);
      return '#'.substr(dechex(0x1000000+(round(($t-$R)*$p)+$R)*0x10000+(round(($t-$G)*$p)+$G‌​)*0x100+(round(($t-$B)*$p)+$B)),1);
  }

  // function exec_query($query) {
  //   global $db;
    
  //   $result = mysqli_query($db, $query);
  //   confirm_query($result);
  //   return $result;
  // }


?>