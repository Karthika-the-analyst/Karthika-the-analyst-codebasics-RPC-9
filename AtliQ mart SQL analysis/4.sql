/*4.Produce a report that calculates the Incremental Sold Quantity (ISU%) for each category during the Diwali campaign. 
Additionally, provide rankings for the categories based on their ISU%. The report will include three key fields: 
category, isu%, and rank order. This information will assist in assessing the category-wise success and impact of the Diwali campaign
 on incremental sales.
Note: ISU% (Incremental Sold Quantity Percentage) is calculated as the percentage increase/decrease in 
quantity sold (after promo) compared to quantity sold (before promo)*/

select category,
ROUND(((sum(`quantity_sold(after_promo)`) - sum(`quantity_sold(before_promo)`) ) / sum(`quantity_sold(before_promo)`) )* 100,2) as 'ISU%',
rank () over (order by ((sum(`quantity_sold(after_promo)`)-sum(`quantity_sold(before_promo)`))/sum(`quantity_sold(before_promo)`))  desc) as 'rank'
from fact_events f 
join dim_products p
on f.product_code=p.product_code
where campaign_id = 'CAMP_DIW_01'
group by category;

