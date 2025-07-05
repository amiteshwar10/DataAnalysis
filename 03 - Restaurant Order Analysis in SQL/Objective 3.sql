-- 1 combine the menu_items and order_detail tables into a single table.
SELECT * FROM menu_items;
SELECT * FROM order_details;

SELECT *
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id;

-- 2 what were the least and the most ordered items? what categories were they in?
SELECT item_id, category, COUNT(order_details_id) AS num_of_purchases
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
    GROUP BY item_id, category
    ORDER BY num_of_purchases; -- DESC

-- 3 what were the top 5 orders that spent the most money?
SELECT order_id, SUM(price) AS total_spend
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
    GROUP BY order_id
    ORDER BY total_spend DESC 
    LIMIT 5;

-- 4 view the details of highest spend order. what insights can you gather from the results?
SELECT *
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
    WHERE order_id = 440;
    
SELECT category, COUNT(order_id) AS num_of_items_ordered
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
    WHERE order_id = 440
    GROUP BY category;
    
-- 5 view the details of top 5 spend orders. what insights can you gather from the results?
SELECT category, COUNT(order_id) AS num_of_items_ordered
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
    WHERE order_id IN (440, 2075, 1957, 330, 2675)
	GROUP BY category;