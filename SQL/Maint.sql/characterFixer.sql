/* 
This deletes the Old character after having updated the new one.
Then sets the new character's guid to be the same as the old one and therefore keeps all spells, items, pets talents etc 
*/
SET @oldGuid := '106501';


SET @newGuid := '106499';

UPDATE characters
SET `level` = (
	SELECT
		*
	FROM
		(
			SELECT
				`level`
			FROM
				characters
			WHERE
				guid = @oldGuid
		) AS tmptable
)
WHERE
	guid = @newGuid;

UPDATE characters
SET `xp` = (
	SELECT
		*
	FROM
		(
			SELECT
				`xp`
			FROM
				characters
			WHERE
				guid = @oldGuid
		) AS tmptable
)
WHERE
	guid = @newGuid;

UPDATE characters
SET `money` = (
	SELECT
		*
	FROM
		(
			SELECT
				`money`
			FROM
				characters
			WHERE
				guid = @oldGuid
		) AS tmptable
)
WHERE
	guid = @newGuid;

UPDATE characters
SET `taximask` = (
	SELECT
		*
	FROM
		(
			SELECT
				`taximask`
			FROM
				characters
			WHERE
				guid = @oldGuid
		) AS tmptable
)
WHERE
	guid = @newGuid;

UPDATE characters
SET `totaltime` = (
	SELECT
		*
	FROM
		(
			SELECT
				`totaltime`
			FROM
				characters
			WHERE
				guid = @oldGuid
		) AS tmptable
)
WHERE
	guid = @newGuid;

UPDATE characters
SET `leveltime` = (
	SELECT
		*
	FROM
		(
			SELECT
				`leveltime`
			FROM
				characters
			WHERE
				guid = @oldGuid
		) AS tmptable
)
WHERE
	guid = @newGuid;

UPDATE characters
SET `rest_bonus` = (
	SELECT
		*
	FROM
		(
			SELECT
				`rest_bonus`
			FROM
				characters
			WHERE
				guid = @oldGuid
		) AS tmptable
)
WHERE
	guid = @newGuid;

UPDATE characters
SET `stable_slots` = (
	SELECT
		*
	FROM
		(
			SELECT
				`stable_slots`
			FROM
				characters
			WHERE
				guid = @oldGuid
		) AS tmptable
)
WHERE
	guid = @newGuid;

UPDATE characters
SET `arenaPoints` = (
	SELECT
		*
	FROM
		(
			SELECT
				`arenaPoints`
			FROM
				characters
			WHERE
				guid = @oldGuid
		) AS tmptable
)
WHERE
	guid = @newGuid;

UPDATE characters
SET `totalHonorPoints` = (
	SELECT
		*
	FROM
		(
			SELECT
				`totalHonorPoints`
			FROM
				characters
			WHERE
				guid = @oldGuid
		) AS tmptable
)
WHERE
	guid = @newGuid;

UPDATE characters
SET `totalkills` = (
	SELECT
		*
	FROM
		(
			SELECT
				`totalkills`
			FROM
				characters
			WHERE
				guid = @oldGuid
		) AS tmptable
)
WHERE
	guid = @newGuid;

UPDATE characters
SET `knownCurrencies` = (
	SELECT
		*
	FROM
		(
			SELECT
				`knownCurrencies`
			FROM
				characters
			WHERE
				guid = @oldGuid
		) AS tmptable
)
WHERE
	guid = @newGuid;

UPDATE characters
SET `speccount` = (
	SELECT
		*
	FROM
		(
			SELECT
				`speccount`
			FROM
				characters
			WHERE
				guid = @oldGuid
		) AS tmptable
)
WHERE
	guid = @newGuid;

UPDATE characters
SET `exploredZones` = (
	SELECT
		*
	FROM
		(
			SELECT
				`exploredZones`
			FROM
				characters
			WHERE
				guid = @oldGuid
		) AS tmptable
)
WHERE
	guid = @newGuid;

UPDATE characters
SET `knownTitles` = (
	SELECT
		*
	FROM
		(
			SELECT
				`knownTitles`
			FROM
				characters
			WHERE
				guid = @oldGuid
		) AS tmptable
)
WHERE
	guid = @newGuid;

/*
Delete from characters where guid = @oldGuid;
Update characters 
set guid = @oldGuid 
where guid = @newGuid;
*/
