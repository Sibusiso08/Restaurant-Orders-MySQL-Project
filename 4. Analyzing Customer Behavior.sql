---			`ANALYZING CUSTOMER BEHAVIOR`             ---

--  1. Combine the menu_items and the order_details tables into a single table
SELECT * 
FROM menu_items;

SELECT * 
FROM order_details;

SELECT *
FROM order_details od LEFT JOIN menu_items mi
     ON od.item_id = mi.menu_item_id;

--  2. What were the least and the most ordered items? What catergories are they in?

SELECT item_name, category, COUNT(order_details_id) AS num_purchases
FROM order_details od LEFT JOIN menu_items mi
     ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_purchases;

--  3. What were the top 5 orders that spent the most money?

SELECT order_id, SUM(price) AS total_spend
FROM order_details od LEFT JOIN menu_items mi
     ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_spend DESC
LIMIT 5;

--  4. View the details of the highest spend orde.What insights can you gather from that?

SELECT category, COUNT(item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
     ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY category;

--  5. View the details of the top 5 highest spend orders.What insights can you gather from that?

SELECT order_id, category, COUNT(item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
     ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY order_id, category;

'440', '192.15'
'2075', '191.05'
'1957', '190.10'
'330', '189.70'
'2675', '185.10'


