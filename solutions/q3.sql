SELECT 
				 invoice_link.fk_x_invoice_hub_id as invoice_id,
				 MIN(item_sat.charge_amt) / 100 AS min_invoice,
				MAX(item_sat.charge_amt) / 100 AS max_invoice,
				AVG(item_sat.charge_amt) / 100 AS avg_invoice,
				STD(item_sat.charge_amt) / 100 AS std_invoice

FROM v_x_invoice_x_invoice_item_lnk AS invoice_link

INNER JOIN v_x_invoice_item_hub as item_hub
ON item_hub.sk_id = invoice_link.fk_x_invoice_item_hub_id

INNER JOIN v_x_invoice_item_sat as item_sat
ON invoice_link.fk_x_invoice_item_hub_id = item_sat.fk_x_invoice_item_hub_id

WHERE item_hub.fk_r_revenue_source_ref_cd = 'PRIMARY' 
 
GROUP BY invoice_link.fk_x_invoice_hub_id

HAVING count(*) > 1