SELECT 

MIN(item_sat.charge_amt) / 100 AS min_invoice_item,
MAX(item_sat.charge_amt)/ 100 AS max_invoice_item,
AVG(item_sat.charge_amt)/ 100 AS avg_invoice_item,
STD(item_sat.charge_amt)/ 100 AS std_invoice_item

FROM v_x_invoice_item_sat AS item_sat;