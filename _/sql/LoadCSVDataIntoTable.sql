LOAD DATA LOCAL INFILE '~/Documents/features.csv'
	INTO TABLE subcategoriesmethodsfeatures
	FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES
