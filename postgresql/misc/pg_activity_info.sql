--
--
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
--
--
select datname, count(*) as concount, (select count(*) from pg_stat_activity) as totcount, 
to_char(count(*)::real/(select count(*) from pg_stat_activity)::real*100.00, '00.9%') as pctcount
from pg_stat_activity group by datname order by concount desc limit 10;
select datname, state, count(*) as concount from pg_stat_activity group by datname, state order by concount desc limit 10; 
select to_char(now(), 'YYYY-MM-DD HH24:MI:SS'),pid,datname,state,left(query,100),now() - pg_stat_activity.query_start as duration from pg_stat_activity where pg_stat_activity.query <> ''::text and query not like 'DISCARD%' order by duration desc;

