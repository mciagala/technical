SELECT d.datname AS Name,  pg_catalog.pg_get_userbyid(d.datdba) AS Owner,
    CASE WHEN pg_catalog.has_database_privilege(d.datname, 'CONNECT')
        THEN pg_catalog.pg_database_size(d.datname)
        ELSE '0'
    END AS Size,
    CASE WHEN pg_catalog.has_database_privilege(d.datname, 'CONNECT')
        THEN pg_catalog.pg_database_size(d.datname)/(1024*1024)
        ELSE '0'
    END AS MB_Size,
    CASE WHEN pg_catalog.has_database_privilege(d.datname, 'CONNECT')
        THEN pg_catalog.pg_size_pretty(pg_catalog.pg_database_size(d.datname))
        ELSE 'No Access'
    END AS Pretty_Size
FROM pg_catalog.pg_database d
where d.datname not in ('bmuck',
'demo2',
'farnes',
'goodwin',
'jenny',
'jenny_sample',
'jenny_sample2',
'jlee',
'jlee2',
'jleeib',
'jleeib3',
'jleetemp',
'jojo',
'jparker',
'kate',
'pgbouncer_bench',
'sg_gains1',
'sg_gains2',
'sg_score1',
'sg_score2',
'sknight',
'temp01',
'test_jlee',
'test_rockwood_nwea_import',
'train_anoka',
'train_d214',
'train_district128',
'train_district211',
'train_district218',
'train_district230',
'train_elmhurst',
'train_indpraidistrict204',
'training_ip204',
'train_irondale',
'train_lasalle_peru',
'train_lex2',
'train_libertyunion',
'train_lphs',
'train_morpdc',
'train_naperville203',
'train_niles219',
'train_richtownship',
'train_rockwood',
'train_snakeriver',
'train_southland',
'train_sowashco',
'train_template',
'train_toddcounty',
'train_waltham',
'train_westbloomfield' )

    ORDER BY Name
--    ORDER BY
--    CASE WHEN pg_catalog.has_database_privilege(d.datname, 'CONNECT')
--        THEN pg_catalog.pg_database_size(d.datname)
--        ELSE NULL
--    END 
;