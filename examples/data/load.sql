

\COPY CUSTOMERS FROM  'examples/data/cust/us_cust.csv' WITH DELIMITER   ',' 
\COPY CUSTOMERS FROM  'examples/data/cust/row_cust.csv' WITH DELIMITER  ',' 

\COPY ORDERS FROM 'examples/data/orders/jan_orders.csv' WITH DELIMITER ',' 
\COPY ORDERS FROM 'examples/data/orders/feb_orders.csv' WITH DELIMITER ',' 
\COPY ORDERS FROM 'examples/data/orders/mar_orders.csv' WITH DELIMITER ',' 
\COPY ORDERS FROM 'examples/data/orders/apr_orders.csv' WITH DELIMITER ',' 
\COPY ORDERS FROM 'examples/data/orders/may_orders.csv' WITH DELIMITER ',' 
\COPY ORDERS FROM 'examples/data/orders/jun_orders.csv' WITH DELIMITER ',' 
\COPY ORDERS FROM 'examples/data/orders/jul_orders.csv' WITH DELIMITER ',' 
\COPY ORDERS FROM 'examples/data/orders/aug_orders.csv' WITH DELIMITER ',' 
\COPY ORDERS FROM 'examples/data/orders/sep_orders.csv' WITH DELIMITER ',' 
\COPY ORDERS FROM 'examples/data/orders/oct_orders.csv' WITH DELIMITER ',' 
\COPY ORDERS FROM 'examples/data/orders/nov_orders.csv' WITH DELIMITER ',' 
\COPY ORDERS FROM 'examples/data/orders/dec_orders.csv' WITH DELIMITER ',' 

\COPY ORDERLINES FROM 'examples/data/orders/jan_orderlines.csv' WITH DELIMITER ','
\COPY ORDERLINES FROM 'examples/data/orders/feb_orderlines.csv' WITH DELIMITER ','
\COPY ORDERLINES FROM 'examples/data/orders/mar_orderlines.csv' WITH DELIMITER ','
\COPY ORDERLINES FROM 'examples/data/orders/apr_orderlines.csv' WITH DELIMITER ','
\COPY ORDERLINES FROM 'examples/data/orders/may_orderlines.csv' WITH DELIMITER ','
\COPY ORDERLINES FROM 'examples/data/orders/jun_orderlines.csv' WITH DELIMITER ','
\COPY ORDERLINES FROM 'examples/data/orders/jul_orderlines.csv' WITH DELIMITER ','
\COPY ORDERLINES FROM 'examples/data/orders/aug_orderlines.csv' WITH DELIMITER ','
\COPY ORDERLINES FROM 'examples/data/orders/sep_orderlines.csv' WITH DELIMITER ','
\COPY ORDERLINES FROM 'examples/data/orders/oct_orderlines.csv' WITH DELIMITER ','
\COPY ORDERLINES FROM 'examples/data/orders/nov_orderlines.csv' WITH DELIMITER ','
\COPY ORDERLINES FROM 'examples/data/orders/dec_orderlines.csv' WITH DELIMITER ','

\COPY CUST_HIST FROM 'examples/data/orders/jan_cust_hist.csv' WITH DELIMITER ',' 
\COPY CUST_HIST FROM 'examples/data/orders/feb_cust_hist.csv' WITH DELIMITER ',' 
\COPY CUST_HIST FROM 'data/orders/mar_cust_hist.csv' WITH DELIMITER ',' 
\COPY CUST_HIST FROM 'examples/data/orders/apr_cust_hist.csv' WITH DELIMITER ',' 
\COPY CUST_HIST FROM 'examples/data/orders/may_cust_hist.csv' WITH DELIMITER ',' 
\COPY CUST_HIST FROM 'examples/data/orders/jun_cust_hist.csv' WITH DELIMITER ',' 
\COPY CUST_HIST FROM 'examples/data/orders/jul_cust_hist.csv' WITH DELIMITER ',' 
\COPY CUST_HIST FROM 'examples/data/orders/aug_cust_hist.csv' WITH DELIMITER ',' 
\COPY CUST_HIST FROM 'examples/data/orders/sep_cust_hist.csv' WITH DELIMITER ',' 
\COPY CUST_HIST FROM 'examples/data/orders/oct_cust_hist.csv' WITH DELIMITER ',' 
\COPY CUST_HIST FROM 'examples/data/orders/nov_cust_hist.csv' WITH DELIMITER ',' 
\COPY CUST_HIST FROM 'examples/data/orders/dec_cust_hist.csv' WITH DELIMITER ',' 


\COPY PRODUCTS FROM  'examples/data/prod/prod.csv' WITH DELIMITER ',' 

\COPY INVENTORY FROM  'examples/data/prod/inv.csv' WITH DELIMITER ',' 

