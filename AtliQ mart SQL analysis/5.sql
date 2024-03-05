/*5.Create a report featuring the Top 5 products, ranked by Incremental Revenue Percentage (IR%), across all campaigns. 
The report will provide essential information including product name, category, and ir%. This analysis helps identify the most 
successful products in terms of incremental revenue across our campaigns, assisting in product optimization*/

select distinct (product_name), (category),
((base_price*(`quantity_sold(after_promo)`)) - (base_price*(`quantity_sold(before_promo)`) ) )*100 / (base_price*(`quantity_sold(before_promo)`) ) as 'IR%',
rank () over (order by ((base_price*(`quantity_sold(after_promo)`)) - (base_price*(`quantity_sold(before_promo)`) ) )*100 / (base_price*(`quantity_sold(before_promo)`) ) desc ) as 'rank'
from dim_products as p
join fact_events f using (product_code)
join dim_campaigns using (campaign_id)
limit 5