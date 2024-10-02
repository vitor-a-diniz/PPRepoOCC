-- Verificando Locks Ativos
SELECT 
    dl.ENGINE_LOCK_ID,
    dl.LOCK_MODE,
    dl.LOCK_TYPE,
    dl.LOCK_STATUS,
    dl.OBJECT_SCHEMA,
    dl.OBJECT_NAME,
--    dl.OBJECT_TYPE,
    t.PROCESSLIST_ID,
    t.PROCESSLIST_USER,
    t.PROCESSLIST_HOST,
    t.PROCESSLIST_DB,
    t.PROCESSLIST_COMMAND,
    t.PROCESSLIST_TIME,
    t.PROCESSLIST_STATE,
    t.PROCESSLIST_INFO
FROM
    performance_schema.data_locks dl
    JOIN performance_schema.threads t ON dl.ENGINE_TRANSACTION_ID = t.THREAD_ID;
   
 --Verificando Espera de Locks  
  SELECT 
    lw.REQUESTING_ENGINE_LOCK_ID AS waiting_lock_id,
    lw.BLOCKING_ENGINE_LOCK_ID AS blocking_lock_id,
    t.PROCESSLIST_ID AS waiting_thread_id,
    t.PROCESSLIST_USER AS waiting_user,
    t.PROCESSLIST_HOST AS waiting_host,
    t.PROCESSLIST_DB AS waiting_db,
    t.PROCESSLIST_COMMAND AS waiting_command,
    t.PROCESSLIST_TIME AS waiting_time,
    t.PROCESSLIST_STATE AS waiting_state,
    t.PROCESSLIST_INFO AS waiting_query
FROM
    performance_schema.data_lock_waits lw
    JOIN performance_schema.threads t ON lw.REQUESTING_ENGINE_TRANSACTION_ID = t.THREAD_ID;
   
-- fornece informações sobre os locks atualmente ativos no sistema   
SELECT * FROM performance_schema.data_locks;
-- fornece informações sobre transações que estão esperando por locks, ou seja, transações que estão bloqueadas porque outra transação possui o lock que elas precisam
SELECT * FROM performance_schema.data_lock_waits;