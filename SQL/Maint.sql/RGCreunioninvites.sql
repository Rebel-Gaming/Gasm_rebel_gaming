/* scraping for 
acount name and email address 
from DB for acounts 
with active characters within 3 months 
prior to the Big Blizzard Scare of 2008 henceforth refered to as BBS, 
not to be confused with BBW. 
*/

SELECT
	(MainAC.email),
	MainAC.username,
	chrs.`name`,
	chrs.totaltime
INTO OUTFILE '/tmp/bt_invites.txt' FIELDS TERMINATED BY ', ' LINES TERMINATED BY '\n'
FROM
	accounts.account AS MainAC
JOIN `blacktemple-characters`.characters AS chrs ON MainAC.`id` = chrs.account
WHERE
 MainAC.id IN (
	SELECT
		`account`
	FROM
		`blacktemple-characters`.characters
	WHERE
		`blacktemple-characters`.characters.totaltime > 259200
	AND `blacktemple-characters`.characters.logout_time > 1217566800
		order by `blacktemple-characters`.characters.logout_time DESC
)
GROUP BY MainAC.email
ORDER BY chrs.totaltime DESC;

SELECT
	(MainAC.email),
	MainAC.username,
	chrs.`name`,
	chrs.totaltime
INTO OUTFILE '/tmp/nex_invites.txt' FIELDS TERMINATED BY ', ' LINES TERMINATED BY '\n'
FROM
	accounts.account AS MainAC
JOIN `nexus-characters`.characters AS chrs ON MainAC.`id` = chrs.account
WHERE
 MainAC.id IN (
	SELECT
		`account`
	FROM
		`nexus-characters`.characters
	WHERE
		`nexus-characters`.characters.totaltime > 259200
	AND `nexus-characters`.characters.logout_time > 1217566800
)
GROUP BY MainAC.email
ORDER BY chrs.totaltime DESC;

SELECT
	(MainAC.email),
	MainAC.username,
	chrs.`name`,
	chrs.totaltime
INTO OUTFILE '/tmp/fm_invites.txt' FIELDS TERMINATED BY ', ' LINES TERMINATED BY '\n'
FROM
	accounts.account AS MainAC
JOIN `blacktemple-characters`.characters AS chrs ON MainAC.`id` = chrs.account
WHERE
 MainAC.id IN (
	SELECT
		`account`
	FROM
		`frostmourne-characters`.characters
	WHERE
		`frostmourne-characters`.characters.totaltime > 259200
	AND `frostmourne-characters`.characters.logout_time > 1217566800
)
GROUP BY MainAC.email
ORDER BY chrs.totaltime DESC;

SELECT
	(MainAC.email),
	MainAC.username,
	chrs.`name`,
	chrs.totaltime
INTO OUTFILE '/tmp/kara_invites.txt' FIELDS TERMINATED BY ', ' LINES TERMINATED BY '\n'
FROM
	accounts.account AS MainAC
JOIN `karazhan-characters`.characters AS chrs ON MainAC.`id` = chrs.account
WHERE
 MainAC.id IN (
	SELECT
		`account`
	FROM
		`karazhan-characters`.characters
	WHERE
		`karazhan-characters`.characters.totaltime > 259200
	AND `karazhan-characters`.characters.logout_time > 1217566800
)
GROUP BY MainAC.email
ORDER BY chrs.totaltime DESC;



