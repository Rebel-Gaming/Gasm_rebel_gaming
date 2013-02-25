-- creature spawn fix

UPDATE `creature_template`
set rank = 3
where entry in (36853,	38265,	38266,	38267)
;
