
CREATE OR REPLACE FUNCTION ft_set_commonopponent_20years()
 returns void
 AS $$
 DECLARE
 	 var_id integer;
     r record;
	BEGIN
		ALTER TABLE heads ADD COLUMN co20yearsId integer;
        EXCEPTION
            WHEN duplicate_column THEN RAISE NOTICE 'column co20yearsId already exists in heads.';
		FOR r in (SELECT heads.id as heads_id, atpworldtours.date as date, atpworldtours.winner as winner, atpworldtours.loser as loser FROM "heads"
				INNER JOIN "atpworldtours" ON atpworldtours."hashId" = "heads"."atpWorldTourId")
		LOOP
			insert into commonopponents select * from ft_diff_co(20, r.date::date, r.winner, r.loser)
				returning id into var_id;
			update heads set co20yearsId = var_id where heads.id = r.heads_id;
		END LOOP;
		RETURN;
	END;
 $$
LANGUAGE 'plpgsql';


CREATE OR REPLACE FUNCTION ft_set_commonopponent_20years_year(var_year varchar(255))
 returns void
 AS $$
 DECLARE
 	 var_id integer;
     r record;
	BEGIN
		ALTER TABLE heads ADD COLUMN co20yearsId integer;
        EXCEPTION
            WHEN duplicate_column THEN RAISE NOTICE 'column co20yearsId already exists in heads.';
		FOR r in (SELECT heads.id as heads_id, atpworldtours.date as date, atpworldtours.winner as winner, atpworldtours.loser as loser FROM "heads"
				INNER JOIN "atpworldtours" ON atpworldtours."hashId" = "heads"."atpWorldTourId" and atpworldtours.year = var_year)
		LOOP
			insert into commonopponents select * from ft_diff_co(20, r.date::date, r.winner, r.loser)
				returning id into var_id;
			update heads set co20yearsId = var_id where heads.id = r.heads_id;
		END LOOP;
		RETURN;
	END;
 $$
LANGUAGE 'plpgsql';
