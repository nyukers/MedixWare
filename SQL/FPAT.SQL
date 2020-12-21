DELETE FROM PAT.DBF a1
WHERE a1."PIBID" IN (
 SELECT distinct a2."PIBID"
 FROM PAT.DBF a2
 WHERE  a2."PIBID" NOT IN
        (SELECT distinct a3."PIBID"
         FROM PAT.DBF a3, PIB.DBF a4
         WHERE (a3."PIBID" = a4."PIBID")) )

