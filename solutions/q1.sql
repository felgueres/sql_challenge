-- 1. (2 points)
-- Compute the minimum, maximum, average, and standard deviation of the charge amount of the complete
-- set of invoice items, but only take into account the very last version of each invoice item.
-- Show your answers in dollars, not cents. Hint: be sure to understand the relationship between the various
-- views and their non-view counterparts.

-- ANSWER:

SELECT

MIN(item_sat.charge_amt) / 100 AS min_invoice_item,
MAX(item_sat.charge_amt)/ 100 AS max_invoice_item,
AVG(item_sat.charge_amt)/ 100 AS avg_invoice_item,
STD(item_sat.charge_amt)/ 100 AS std_invoice_item

FROM v_x_invoice_item_sat AS item_sat;
