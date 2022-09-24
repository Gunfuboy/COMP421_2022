--LOADING UP
vmeta = LOAD '/data/vaccination-metadata.csv' USING PigStorage(',') AS (iso3:CHARARRAY, vaccine_name:CHARARRAY, product_name:CHARARRAY, company_name:CHARARRAY);

--GROUP BY COMPANY
company = group vmeta by company_name;

--GET COUNTRY CODE AND NUMBER OF COUNTRIES
 gen = foreach company {unique = distinct vmeta.iso3; generate group, COUNT(unique) as countries;};

-- ORDER
ordered = order gen by countries DESC;

-- LIMIT TO TOP 10 RECORDS
top10 = limit ordered 10;

--OUTPUT
dump top10;

