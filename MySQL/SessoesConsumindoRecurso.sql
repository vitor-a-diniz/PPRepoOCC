-- Consulta para verificar sessões que estão consumindo mais recursos
SELECT 
    t.thread_id AS `ID`,
    t.processlist_user AS `Usuário`,
    t.processlist_host AS `Host`,
    t.processlist_db AS `Banco de Dados`,
    t.processlist_command AS `Comando`,
    t.processlist_time AS `Tempo (s)`,
    t.processlist_state AS `Estado`,
    t.processlist_info AS `Consulta`,
    s.timer_wait AS `Tempo de Execução (ns)`,
    s.sql_text AS `Consulta SQL`
FROM 
    performance_schema.threads t
JOIN 
    performance_schema.events_statements_current s
    ON t.thread_id = s.thread_id
ORDER BY 
    s.timer_wait DESC
LIMIT 15;

/*
thread_id: ID da thread.
processlist_user: Usuário que está executando a consulta.
processlist_host: Host que está executando a consulta.
processlist_db: Banco de dados usado.
processlist_command: Tipo de comando (SELECT, UPDATE, etc.).
processlist_time: Tempo que a consulta está em execução (em segundos).
processlist_state: Estado atual da consulta.
processlist_info: A consulta SQL atual.
timer_wait: Tempo de execução da consulta em nanosegundos.
sql_text: Texto da consulta SQL.
*/