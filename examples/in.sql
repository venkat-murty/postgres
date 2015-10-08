
select category, title, actor 
from products 
where category in (select category 
                     from categories 
                    where categoryname like '%a%')
order by category, title, actor;

