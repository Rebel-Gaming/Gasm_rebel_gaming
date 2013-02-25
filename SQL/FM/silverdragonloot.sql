-- silver dragon special loot

-- create 2 referances first for 1x D2 of Rebel token, second 1x D3 of Rebel Voucher
INSERT INTO `reference_loot_template` (`entry`, `item`,`groupid`, `maxcount`) VALUES ('15000', '22484','5','2');
INSERT INTO `reference_loot_template` (`entry`, `item`, `groupid`,`maxcount`) VALUES ('15001', '33455', '6','3');





INSERT INTO creature_loot_template
select DISTINCT creature_template.entry,
'22484','100','1','5','-15000','2'
from creature_template
join creature_loot_template on creature_template.lootid = creature_loot_template.entry
join item_template on creature_loot_template.item = item_template.entry
WHERE
creature_template.rank =2
or 
creature_template.rank =4;




INSERT INTO creature_loot_template
select DISTINCT creature_template.entry,
'33455','100','1','6','-15001','1'
from creature_template
join creature_loot_template on creature_template.lootid = creature_loot_template.entry
join item_template on creature_loot_template.item = item_template.entry
WHERE
creature_template.rank =2;


