-- original: limit.test
-- credit:   http://www.sqlite.org/src/tree?ci=trunk&name=test

SELECT z FROM v13c LIMIT 1 OFFSET 5
;SELECT z FROM v13c LIMIT 2 OFFSET 5
;SELECT z FROM v13c LIMIT 3 OFFSET 5
;SELECT z FROM v13c LIMIT 4 OFFSET 5
;SELECT z FROM v13c LIMIT 1 OFFSET 6
;SELECT z FROM v13c LIMIT 2 OFFSET 6
;SELECT z FROM v13c LIMIT 3 OFFSET 6
;SELECT z FROM v13c LIMIT 1 OFFSET 7
;SELECT z FROM v13c LIMIT 2 OFFSET 7
;SELECT z FROM v13c LIMIT 1 OFFSET 8
;SELECT 123 LIMIT 1 OFFSET 0
;SELECT 123 LIMIT 1 OFFSET 1
;SELECT 123 LIMIT 0 OFFSET 0
;SELECT 123 LIMIT 0 OFFSET 1
;SELECT 123 LIMIT -1 OFFSET 0
;SELECT 123 LIMIT -1 OFFSET 1;