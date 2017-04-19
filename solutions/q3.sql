-- 3. (5 points) Join the invoice items to their parent invoices and compute the min, max, average, and standard deviation of the distinct
-- number of invoice lines per invoice. As before, only take into account the very last version of each invoice item and parent invoice.
-- In addition, restrict the computation to invoice lines coming from a revenue source with reference code of "PRIMARY".
-- Do not take into account any parent invoices without invoice lines.

-- ANSWER:

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

-- COMMENTS:
-- I INTERPRET THAT BY INVOICE LINE IT MEANS AN INVOICE ITEM, THIS QUERY SHOWS THE STATS FOR INVOICES THAT HAVE MORE THAN ONE ITEM PLUS CONSTRAINTS.
-- USING TABLE VIEWS ASSURES TO BE USING DISTINCT VALUES AS WELL.
