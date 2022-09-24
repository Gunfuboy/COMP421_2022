-- LOAD
pop = LOAD '/data/pop.csv' USING PigStorage(',') AS (country:CHARARRAY, population:INT);
vmeta = LOAD '/data/vaccination-metadata.csv' USING PigStorage(',') AS (iso3:CHARARRAY, vaccine_name:CHARARRAY, product_name:CHARARRAY, company_name:CHARARRAY);
vdata = LOAD '/data/vaccination-data.csv' USING PigStorage(',') AS (country:CHARARRAY, iso3:CHARARRAY, who_region:CHARARRAY, persons_fully_vaccinated:INT);

--get highest population
highpop = FILTER pop BY  population > 100000;

--JOIN ALL FILES TOGETHER
popvax = join highpop by country, vdata by country;
joined = join popvax by iso3, vmeta by iso3;
gen = group joined by popvax::highpop::country;

--parse inputs
parsed = foreach gen {pop= DISTINCT joined.popvax::highpop::population; vax= DISTINCT joined.popvax::vdata::persons_fully_vaccinated; product= DISTINCT joined.vmeta::product_name; generate group,pop,vax,product;};
update = join parsed by group, highpop by country;
updateB = join update by highpop::country, vdata by country;

--get result
result = foreach updateB {percent = ((vdata::persons_fully_vaccinated/(update::highpop::population*1000.00))*100.00); generate update::highpop::country, update::highpop::population, percent, COUNT(update::parsed::product) as uniqueproducts;};

--SORT
sorted = order result by update::highpop::population;

--DUMP
dump sorted;
