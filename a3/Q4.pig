-- LOADING UP
vdata = LOAD '/data/vaccination-data.csv' USING PigStorage(',') AS (country:CHARARRAY, iso3:CHARARRAY, who_region:CHARARRAY, persons_fully_vaccinated:INT);

-- GROUP BY WHO_REGION
region = group vdata by who_region;

-- SELECT DATA
select = foreach region generate ($0), COUNT($1) as numofcountries, SUM(vdata.persons_fully_vaccinated) as vaccinated;

-- ORDER
ordered = order select by group;

-- OUTPUT
dump ordered;
