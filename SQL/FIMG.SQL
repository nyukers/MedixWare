DELETE FROM PATIMG.DBF imga
WHERE imga."DIAGID" IN (
 SELECT distinct img."DIAGID"
 FROM PATIMG.DBF img
 WHERE  img."DIAGID" NOT IN
        (SELECT distinct im."DIAGID"
         FROM PATIMG.DBF im, PATDIAG.DBF diag
         WHERE
        (im."DIAGID" = diag."DIAGID")) )

