USE customer_behavior;
SELECT * FROM customers;

-- Q1. Qual é a receita total gerada por clientes do sexo masculino em comparação com clientes do sexo feminino?
SELECT gender, SUM(purchase_amount) AS revenue
FROM customers
GROUP BY gender;

-- Q2. Quais clientes utilizaram um desconto, mas ainda assim gastaram mais do que o valor médio da compra?
SELECT customer_id, purchase_amount 
FROM customers
WHERE discount_applied = "Yes" AND purchase_amount >= (SELECT AVG(purchase_amount) FROM customers);

-- Q3. Quais são os 5 produtos com a melhor avaliação média?
SELECT item_purchased, ROUND(AVG(review_rating), 2) AS "AVERAGE PRODUCT RATING"
FROM customers
GROUP BY item_purchased
ORDER BY AVG(review_rating) DESC 
LIMIT 5;

-- Q4. Compare os valores médios de compra entre o frete padrão e o frete expresso.
SELECT shipping_type, ROUND(AVG(purchase_amount),2) AS "AVERAGE PURCHASE AMOUNT"
FROM customers
WHERE shipping_type in ("Standard", "Express")
GROUP BY shipping_type;

-- Q5. Os clientes assinantes gastam mais? Compare o gasto médio e a receita total entre assinantes e não assinantes.
SELECT subscription_status, 
COUNT(customer_id) AS "TOTAL CUSTOMERS", 
ROUND(AVG(purchase_amount),2) AS "AVERAGE PURCHASE AMOUNT",
ROUND(SUM(purchase_amount),2) AS "TOTAL REVENUE"
FROM customers
GROUP BY subscription_status;

-- Q6. Quais são os 5 produtos com a maior porcentagem de compras com descontos aplicados?
SELECT item_purchased, 
ROUND(100 * SUM(discount_applied = "Yes" )/ COUNT(*),2) AS DISCOUNT_RATE
FROM customers
GROUP BY item_purchased
ORDER BY DISCOUNT_RATE DESC LIMIT 5;

-- Q7. Segmente os clientes em Novos, Recorrentes e Fiéis com base no número total de compras anteriores e mostre a contagem de cada segmento.
WITH customer_type AS (
SELECT customer_id, previous_purchases,
CASE
    WHEN previous_purchases = 1 THEN "New"
    WHEN previous_purchases BETWEEN 2 AND 10 THEN "Returning"
    ELSE "Loyal"
    END AS customer_segment
FROM customers
)

SELECT customer_segment, COUNT(*) AS "NUMBER OF CUSTOMERS" 
FROM customer_type
GROUP BY customer_segment;

-- Q8. Quais são os 3 produtos mais comprados em cada categoria?
WITH item_counts AS (
  SELECT category, item_purchased,
  COUNT(customer_id) AS total_orders,
  ROW_NUMBER() OVER(PARTITION BY category ORDER BY COUNT(customer_id) DESC) AS item_rank
  FROM customers
  GROUP BY category, item_purchased
)
SELECT item_rank, category, item_purchased, total_orders
FROM item_counts
WHERE item_rank <= 3;

-- Q9. É provável que clientes que compram com frequência (mais de 5 compras anteriores) também assinem o serviço?
SELECT subscription_status,
COUNT(customer_id) AS repeat_buyers
FROM customers
WHERE previous_purchases > 5
GROUP BY subscription_status;

-- Q10. Qual é a contribuição de receita de cada faixa etária?
SELECT age_group,
SUM(purchase_amount) AS total_revenue
FROM customers
GROUP BY age_group
ORDER BY total_revenue DESC;
