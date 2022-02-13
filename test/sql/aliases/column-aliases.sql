SELECT *
    FROM dblink('dbname=mydb', 'SELECT proname, prosrc FROM pg_proc')
      AS t1(proname name, prosrc text)
    WHERE proname LIKE 'bytea%';

SELECT * FROM f() AS t2;
SELECT * FROM f() AS (id int, title varchar(10));
SELECT * FROM f() t3 (id int, title text collate C);
SELECT * FROM f() t4;