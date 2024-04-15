-- Generate report showing total sale for each category each qtr (category,qtr,total_sale)


select * from tran_dtl;
select * from tran_hdr;
select 

 p.category, 
 
case
     when month(td.tran_dt) between 1 and 4 then 'first quarter'
	 when month(td.tran_dt) between 5 and 8 then 'second quarter'
	 when month(td.tran_dt) between 9 and 12 then 'third quarter'
     end as per_quarter,
      
     count(td.amt)   as total_sale 
      
from product p
join tran_dtl td on td.product_id=p.product_id

group by p.category,per_quarter

;