-- Activity 1

use bank;

-- Get card_id and year_issued for all gold cards.
select card_id, substr(issued, 1, 2) as year_issued from card
where type = 'gold';

-- When was the first gold card issued? (Year)
select substr(issued, 1, 2) as year_issued from card
order by issued asc
limit 1;

-- Get issue date as:
	-- date_issued: 'November 7th, 1993'
	-- fecha_emision: '07 of November of 1993'
 --  NOT RESOLVED, RETURNS NULL   
select 
	date_format(convert(issued, date), '%M %D, %Y') as date_issued,
    date_format(convert(issued, date), '%D of %M of %Y') as date_issued
from card;

-- ------------------------------

-- Activity 3
-- Questions and Queries

-- Null or empty values are usually a problem. Think about why those null values can appear and think of ways of dealing with them.
-- They can appear when a field in a form has not been filled, or a space has been added insead of an actual string in a text input field.
-- We can deal with them in two ways:
	-- where COLUMN is not null or '' or ' '
    
-- Check for transactions with null or empty values for the column amount.
select count(amount) from trans
where amount is null or '' or ' '; -- there are none

-- Count how many transactions have empty and non-empty k_symbol (in one query).
-- NOT RESOLVED
SELECT 
    SUM(CASE WHEN k_symbol IS NULL THEN 1 ELSE 0 END) As null_num, 
    SUM(CASE WHEN k_symbol IS NOT NULL THEN 1 ELSE 0 END) AS not_null_num
FROM trans;





