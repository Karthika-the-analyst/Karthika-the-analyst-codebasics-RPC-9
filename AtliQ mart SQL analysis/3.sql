/*3.Generate a report that displays each campaign along with the total revenue generated before and after the campaign? 
The report includes three key fields: campaign _name, total revenue(before_promotion), total revenue(after_promotion). 
This report should help in evaluating the financial impact of our promotional campaigns. (Display the values in millions)*/
select campaign_name,
round(sum(base_price*`quantity_sold(before_promo)`/1000000),2) as 'total revenue(before_promotion) in M',
round(sum((case
when promo_type = '25% OFF' then base_price/4*`quantity_sold(after_promo)`
when promo_type = '50% OFF' then base_price/2*`quantity_sold(after_promo)`
when promo_type = '33% OFF' then base_price/0.33*`quantity_sold(after_promo)`
when promo_type = 'BOGOF' then (base_price*`quantity_sold(after_promo)`)/2
when promo_type = '500 Cashback' then (base_price-500)*`quantity_sold(after_promo)`
else "no"
end)/1000000),2) as 'total revenue(after_promotion) in M'
from fact_events f
join dim_campaigns c
on f.campaign_id=c.campaign_id
group by campaign_name;