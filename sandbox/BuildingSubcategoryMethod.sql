SELECT id FROM SubcategoriesMethods WHERE subcategory_id = (
	SELECT id FROM Product_Subcategories WHERE short_name = 'linen' AND category_id = (
		SELECT id FROM Product_Categories WHERE short_name = 'napkin' LIMIT 1
	) LIMIT 1
) AND method_id = (
	SELECT id FROM Print_Methods WHERE short_name = 'tradition' LIMIT 1
) LIMIT 1