-- Due credit https://www.geekytidbits.com/performance-tuning-postgres/
-- Using pg_stat_statements To Find Slow Queries

-- Go to /etc/postgresql/*/main/postgresql.conf and set this variable:
`shared_preload_libraries = 'pg_stat_statements'`
-- restart PG
`sudo service postgresql restart`
-- enter this query in the psql console
SELECT queryid, query, calls, rows, total_time from pg_stat_statements ORDER BY total_time DESC;


-- Using Statistics Collector to find tables with more seq scans than index scans [probably need indexes]

SELECT relname,
       seq_scan-idx_scan AS too_much_seq,
       CASE
           WHEN seq_scan-idx_scan>0 THEN 'Missing Index?'
           ELSE 'OK'
       END,
       pg_relation_size(relname::regclass) AS rel_size,
       seq_scan,
       idx_scan
FROM pg_stat_all_tables
WHERE schemaname='public'
    AND pg_relation_size(relname::regclass)>80000
ORDER BY too_much_seq DESC;

-- Using Statistics Collector to find unused indexes [bad for writes, deletes and updates]
SELECT indexrelid::regclass AS INDEX,
       relid::regclass AS TABLE,
       'DROP INDEX ' || indexrelid::regclass || ';' AS drop_statement
FROM pg_stat_user_indexes
JOIN pg_index USING (indexrelid)
WHERE idx_scan = 0
    AND indisunique IS FALSE;