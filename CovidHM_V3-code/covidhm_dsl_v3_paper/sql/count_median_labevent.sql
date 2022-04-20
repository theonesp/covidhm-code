CREATE OR REPLACE FUNCTION _final_median(numeric[])
RETURNS numeric AS
$$
SELECT AVG(val)
FROM (
SELECT val
FROM unnest($1) val
ORDER BY 1
LIMIT 2 - MOD(array_upper($1, 1), 2)
OFFSET CEIL(array_upper($1, 1) / 2.0) - 1
) sub;
$$
LANGUAGE 'sql' IMMUTABLE;

CREATE AGGREGATE median(numeric) (
SFUNC=array_append,
STYPE=numeric[],
FINALFUNC=_final_median,
INITCOND='{}'
);


SELECT median(labevent.count_labevent) as median_count_labevent
FROM(
	SELECT patient_id, COUNT(id_laboratory) as count_labevent
		FROM covidhm_dsl_v3.laboratory
		GROUP BY patient_id)
as labevent;