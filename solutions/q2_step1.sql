CREATE VIEW item_duration AS 

SELECT 

timestampdiff(day, item_sat.period_start_at, item_sat.period_end_at) AS period_duration_days,

proration_ind

FROM v_x_invoice_item_sat AS item_sat