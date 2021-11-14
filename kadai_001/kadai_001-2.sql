-- 寿司ネタが毎月何個売れているのか集計するクエリ
SELECT 
  DATE_FORMAT(purchase_datetime, '%Y-%m') AS '年月', 
  IP.name AS '名前', 
  SUM(OIP.number) AS '個数', 
FROM 
  orders_individual_products AS OIP 
  LEFT JOIN individual_products AS IP ON OIP.individual_product_id = IP.id 
  LEFT JOIN orders AS O ON OIP.order_id = O.id 
GROUP BY 
  (
    DATE_FORMAT(O.paid_at, '%Y-%m'), 
    IP.id
  )
;
