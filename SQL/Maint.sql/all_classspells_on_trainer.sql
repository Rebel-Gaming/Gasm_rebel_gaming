/* Paladin */
SELECT
	`Id`,
	RequiredClasses,
	RewardSpell,
	MinLevel
FROM
	quest_template
WHERE
	RewardSpell <> 0
AND RequiredClasses <> 0 /* or RewardSpellCast <> 0
AND RequiredClasses <> 0 */
GROUP BY
	RewardSpell
ORDER BY
	RequiredClasses ASC;

INSERT IGNORE INTO npc_trainer  SELECT
'-200004',
	`RewardSpell`,
	'1',
	'0',
	'0',
	MinLevel

FROM
	quest_template
WHERE
	RewardSpell <> 0
AND RequiredClasses = 2;

/* shaman */
INSERT IGNORE INTO npc_trainer  SELECT
'-200018',
	`RewardSpell`,
	'1',
	'0',
	'0',
	MinLevel

FROM
	quest_template
WHERE
	RewardSpell <> 0
AND RequiredClasses = 64;


INSERT IGNORE INTO npc_trainer  SELECT
'-200008',
	`RewardSpell`,
	'1',
	'0',
	'0',
	MinLevel

FROM
	quest_template
WHERE
	RewardSpell <> 0
AND RequiredClasses = 128;


/* warlock */
INSERT IGNORE INTO npc_trainer  SELECT
'-200010',
	`RewardSpell`,
	'1',
	'0',
	'0',
	MinLevel

FROM
	quest_template
WHERE
	RewardSpell <> 0
AND RequiredClasses = 256;


