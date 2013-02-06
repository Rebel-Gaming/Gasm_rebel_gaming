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

/* Update all spells except racial, armor, weapon */


REPLACE INTO playerspells
SELECT
	@newGuid,
	`SpellID`
FROM
	playerspells
WHERE
	`SpellID` NOT IN (
		SELECT
			`Spell`
		FROM
			`frostmourne-world`.playercreateinfo_spell
	)
AND GUID = @oldGuid;



/* Update items from old char to new */
DELETE FROM item_instance
WHERE
owner_guid in (Select * from item_instance where owner_guid = @newGuid);

update item_instance 
set owner_guid = @newGuid
where owner_guid = @oldGuid;



/*  update Achives and skills  */

UPDATE character_achievement
set guid = @newGuid
where guid = @ oldGuid;

Update character_achievement_progress
set guid = @newGuid
where guid = @ oldGuid;

UPDATE character_skills
set guid = @newGuid
where guid = @ oldGuid;
