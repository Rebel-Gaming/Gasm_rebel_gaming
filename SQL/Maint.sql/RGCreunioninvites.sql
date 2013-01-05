UPDATE 
`nexus-characters`.`characters`
JOIN `nexus-characters`.`characters` 
	ON `nexus-booboo`.`characters`.guid = `nexus-characters`.`characters`.guid
SET `nexus-characters`.`characters`.logout_time = `nexus-booboo`.`characters`.guid;


select `username`,`email`
	From
	accounts.account 
	Where
		`entry` IN
		(select `guid` 
		From
			`nexus-characters`.characters as NCC	
		Where
			NCC.playedtime > $72 hours
		AND
			NCC.logouttime is > $3months prior to BBC
		)
; // repeat searches for Kara and FM Databases as well.
