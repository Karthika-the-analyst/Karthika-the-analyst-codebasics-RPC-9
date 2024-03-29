/*2.Generate a report that provides an overview of the number of stores in each city.
 The results will be sorted in descending order of store counts, allowing us to identify the cities with 
 the highest store presence. The report includes two essential fields: city and store count, which will assist in 
 optimizing our retail operations.*/
 
select 
	count(*) store_id,
    city
from dim_stores
group by city