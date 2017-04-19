SELECT 
proration_ind, 

MIN(period_duration_days) AS min_period_days,
MAX(period_duration_days) AS max_period_days,
AVG(period_duration_days) AS avg_period_days,
STD(period_duration_days) AS std_period_days

FROM item_duration

GROUP BY proration_ind;
