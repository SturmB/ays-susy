<?php

// Menu --------------------------------------------------

  function getMenuItems($db, $showInactive) {

    // 2. Perform database query.
    $query  = "CALL ";
    $query .= "ACS_Menu_GetAllMenuItems(";
    $query .= "'{$showInactive}'";
    $query .= ");";
    $menu_result = mysqli_query($db, $query);
    // var_dump($menu_result);
    confirm_query($menu_result);

    // 3. Use returned data (if any).
    $menu_items = array();
    while ($menu_item = mysqli_fetch_assoc($menu_result)) {
      // Make a two-dimensional array from results
      //   to make recursive looping much easier
      $menu_items[] = array("category_name" => $menu_item["category_name"],
                            "subcategory_name" => $menu_item["subcategory_name"],
                            "method_name" => $menu_item["method_name"],
                            "category_short" => $menu_item["category_short"],
                            "subcategory_short" => $menu_item["subcategory_short"],
                            "method_short" => $menu_item["method_short"],
                            "method_description" => $menu_item["method_short_desc"]
      );
    }
    mysqli_free_result($menu_result);
    mysqli_next_result($db);

    return $menu_items;
  }

    function addMethodMenuItem($result, $short_cat_name, $short_subcat_name, $short_method_name, $long_method_name, $method_description)
    {
        $result .= "<li class='dropdown_parent'>";
        $result .= "<a href='product.php?category={$short_cat_name}&subcategory={$short_subcat_name}&printMethod={$short_method_name}' target='_self' title='{$long_method_name}'>";
        $result .= "<span>{$long_method_name}</span>";
        $result .= "</a>";

        $result .= "<ul class='dropdown_flyout_level'>";
        $result .= "<li>";
        $result .= $method_description;
        $result .= "</li>";
        $result .= "</ul>";

        $result .= "</li>";
        return $result;
    }

    function addSubMenuItem($item, $previous_cat_name, $previous_subcat_name, $previous_method_name, $result, $newCat)
    {
        $this_cat_name = $item["category_name"];
        $this_subcat_name = $item["subcategory_name"];
        $this_method_name = $item["method_name"];
        $short_cat_name = $item["category_short"];
        $short_subcat_name = $item["subcategory_short"];
        $short_method_name = $item["method_short"];

        $parent_class = "";
        if ($this_method_name !== null) {
            $parent_class = "dropdown_parent";
        }

        $pmUrl = $short_method_name !== null ? $short_method_name : "";
        $url = "product.php?category={$short_cat_name}&subcategory={$short_subcat_name}&printMethod={$pmUrl}";
//        $url = $this_method_name !== null ? "#" : "product.php?category={$short_cat_name}&subcategory={$short_subcat_name}&printMethod=";

        if ($this_subcat_name != $previous_subcat_name || $this_cat_name != $previous_cat_name) { // We have to create a new "subcategory" menu item
            if ($previous_subcat_name != null && !$newCat && $previous_method_name !== null) { // if this isn't the first subcategory menu item of the category.
                $result .= "</ul></li>";
            }
            $result .= "<li class='{$parent_class}'>";
            if ($this_method_name === null) {
                $result .= "<a href='{$url}'>";
            }
            $result .= "<span>{$this_subcat_name}</span>";
            if ($this_method_name === null) {
                $result .= "</a>";
            }
            if ($this_method_name !== null) {
                $result .= "<ul class='dropdown_flyout_level'>";
            }
        }

        if ($this_method_name !== null) {
            $result = addMethodMenuItem($result, $short_cat_name, $short_subcat_name, $short_method_name, $this_method_name, $item["method_description"]);
        }

        return $result;
    }

    function printMenu(array $items, $previous_cat_name, $result)
    {
        // $result .= "<ul>";
        $previous_subcat_name = null;
        $previous_method_name = null;
        foreach ($items as $item) {
            $newCat = false;
            $this_cat_name = $item["category_name"];
            $this_subcat_name = $item["subcategory_name"];
            $this_method_name = $item["method_name"];
            if ($this_cat_name != $previous_cat_name) {
                if ($previous_cat_name != null) { // if this isn't the very first top-level menu item.
                    // If this item is a new category, we need to first close up the previous item's Print Method and Subcategory.
                    $result .= "</ul></li>"; // Close previous item's Print Method.
                    $result .= "</ul></div></li>"; // Close previous item's Subcategory.
                    $newCat = true;
                }
                $result .= "<li><span>";
                $result .= $this_cat_name;
                $result .= "</span>";
                $result .= "<div class='flexinav_ddown flexinav_ddown_fly_out flexinav_ddown_240'>";
                $result .= "<ul class='dropdown_flyout'>";
            }
            $result = addSubMenuItem($item, $previous_cat_name, $previous_subcat_name, $previous_method_name, $result, $newCat);
            $previous_method_name = $this_method_name;
            $previous_subcat_name = $this_subcat_name;
            $previous_cat_name = $this_cat_name;
        }
        $result .= "</ul></li>";
        // $result .= "</ul>";

        return $result;
    }


// Clipart Menu Items --------------------------------------------------

function printClipartMenu() {

  $clipart_folder = "images/clipart/";
  $subfolders = glob($clipart_folder . '*', GLOB_ONLYDIR);

  $result = null;

  if (count($subfolders) > 0) {
    $result = "";
    foreach ($subfolders as $dirty_name) {
      $exploded_name = explode('/', $dirty_name);
      $folder_name = array_pop($exploded_name);
      $capped_name = ucwords($folder_name);
      $result .= "<li>";
      $result .= "<a href='clipart.php?type={$folder_name}' target='_self' title='{$capped_name}'>";
      $result .= $capped_name;
      $result .= "</a>";
      $result .= "</li>";
    }
  }

  return $result;

}


?>