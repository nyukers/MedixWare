DELETE FROM PATDOS.DBF a1
WHERE a1."PATID" IN (
 SELECT distinct a2."PATID"
 FROM PATDOS.DBF a2
 WHERE  a2."PATID" NOT IN
        (SELECT distinct a3."PATID"
         FROM PATDOS.DBF a3, PAT.DBF a4
         WHERE (a3."PATID" = a4."PATID")) )

