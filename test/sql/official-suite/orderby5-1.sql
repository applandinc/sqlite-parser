-- original: orderby5.test
-- credit:   http://www.sqlite.org/src/tree?ci=trunk&name=test

CREATE TABLE t1(a,b,c);
  CREATE INDEX t1bc ON t1(b,c);

  EXPLAIN QUERY PLAN
  SELECT DISTINCT a, b, c FROM t1 WHERE a=0
;EXPLAIN QUERY PLAN
  SELECT DISTINCT a, c, b FROM t1 WHERE a=0
;EXPLAIN QUERY PLAN
  SELECT DISTINCT a, c, b FROM t1 WHERE a='xyz' COLLATE nocase
;EXPLAIN QUERY PLAN
  SELECT DISTINCT a COLLATE nocase, c, b FROM t1 WHERE a='xyz'
;EXPLAIN QUERY PLAN
  SELECT DISTINCT a COLLATE nocase, c, b FROM t1 WHERE a='xyz' COLLATE nocase
;EXPLAIN QUERY PLAN
  SELECT DISTINCT b, a, c FROM t1 WHERE a=0
;EXPLAIN QUERY PLAN
  SELECT DISTINCT b, c, a FROM t1 WHERE a=0
;EXPLAIN QUERY PLAN
  SELECT DISTINCT c, a, b FROM t1 WHERE a=0
;EXPLAIN QUERY PLAN
  SELECT DISTINCT c, b, a FROM t1 WHERE a=0
;EXPLAIN QUERY PLAN
  SELECT DISTINCT c, b, a FROM t1 WHERE +a=0
;CREATE TABLE t2(a,b,c);
  CREATE INDEX t2bc ON t2(b,c);
  ANALYZE;
  INSERT INTO sqlite_stat1 VALUES('t1','t1bc','1000000 10 9');
  INSERT INTO sqlite_stat1 VALUES('t2','t2bc','100 10 5');
  ANALYZE sqlite_master;

  EXPLAIN QUERY PLAN
  SELECT * FROM t2 WHERE a=0 ORDER BY a, b, c
;EXPLAIN QUERY PLAN
  SELECT * FROM t1 WHERE likelihood(a=0, 0.05) ORDER BY a, b, c
;EXPLAIN QUERY PLAN
  SELECT * FROM t1 WHERE +a=0 ORDER BY a, b, c
;EXPLAIN QUERY PLAN
  SELECT * FROM t1 WHERE a=0 ORDER BY b, a, c
;EXPLAIN QUERY PLAN
  SELECT * FROM t1 WHERE a=0 ORDER BY b, c, a
;EXPLAIN QUERY PLAN
  SELECT * FROM t1 WHERE a=0 ORDER BY a, c, b
;EXPLAIN QUERY PLAN
  SELECT * FROM t1 WHERE a=0 ORDER BY c, a, b
;EXPLAIN QUERY PLAN
  SELECT * FROM t1 WHERE a=0 ORDER BY c, b, a
;CREATE TABLE t3(a INTEGER PRIMARY KEY, b, c, d, e, f);
  CREATE INDEX t3bcde ON t3(b, c, d, e);
  EXPLAIN QUERY PLAN
  SELECT a FROM t3 WHERE b=2 AND c=3 ORDER BY d DESC, e DESC, b, c, a DESC
;DROP TABLE t3;
  CREATE TABLE t3(a INTEGER PRIMARY KEY, b, c, d, e, f) WITHOUT rowid;
  CREATE INDEX t3bcde ON t3(b, c, d, e);
  EXPLAIN QUERY PLAN
  SELECT a FROM t3 WHERE b=2 AND c=3 ORDER BY d DESC, e DESC, b, c, a DESC;