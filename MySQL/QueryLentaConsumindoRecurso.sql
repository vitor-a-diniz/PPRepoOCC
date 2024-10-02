/*Consulta no Performance Schema para encontrar 
as consultas mais lentas e que estão consumindo mais recursos.*/


 SELECT 
    DIGEST_TEXT AS query,
    COUNT_STAR AS exec_count,
    SUM_TIMER_WAIT / 1000000000 AS total_time_sec
FROM 
    performance_schema.events_statements_summary_by_digest
ORDER BY 
    total_time_sec DESC
LIMIT 10;