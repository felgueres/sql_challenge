-- 2. (3 points) Compute the minimum, maximum, average, and standard deviation of the period duration in days,
-- of the complete set of invoice items, grouping by whether or not the invoice item represented a prorated charge.
-- As before, only take into account the very last version of each invoice item. Show your answers in days.
--
-- ANSWER - 2-step:

-- A) CREATE VIEW WITH CALCULATED DURATION PERIOD IN DAYS (timestampdiff) AND PRORATED CHARGE AS INTERMIDIATE STEP TO AVOID LONG AND UNFACTORED QUERY

CREATE VIEW item_duration AS

SELECT

timestampdiff(day, item_sat.period_start_at, item_sat.period_end_at) AS period_duration_days,

proration_ind

FROM v_x_invoice_item_sat AS item_sat

-- B) DO CALCS AND GROUP BY FROM VIEW item_duration

SELECT
proration_ind,

MIN(period_duration_days) AS min_period_days,
MAX(period_duration_days) AS max_period_days,
AVG(period_duration_days) AS avg_period_days,
STD(period_duration_days) AS std_period_days

FROM item_duration

GROUP BY proration_ind;
