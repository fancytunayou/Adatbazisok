--1. Oktató óráinak száma (óraszám oktatónként)
SELECT okt.nev AS oktato, COUNT(*) AS orak_szama
FROM Ora o
JOIN Oktato okt ON o.oktato_fk = okt.oktato_id
GROUP BY okt.nev;

--2. Oktatókhoz tartozó járművek
SELECT k.nev AS oktato, j.rendszam, j.jarmutipus
FROM Jarmu j
JOIN Oktato k ON j.oktato_fk = k.oktato_id;

--3. Órák lebonyolításának időpontja és helyszíne oktatókkal
SELECT t.nev AS tanulo, okt.nev AS oktato, o.idopont, o.helyszin
FROM Ora o
JOIN Tanulo t ON o.tanulo_fk = t.tanulo_id
JOIN Oktato okt ON o.oktato_fk = okt.oktato_id
ORDER BY o.idopont;

--4. Tanulónként, hány sikeres/sikertelen vizsga
SELECT 
  t.nev,
  SUM(CASE WHEN vr.eredmeny = 1 THEN 1 ELSE 0 END) AS sikeres,
  SUM(CASE WHEN vr.eredmeny = 0 THEN 1 ELSE 0 END) AS sikertelen
FROM VizsgaReszvetel vr
JOIN Tanulo t ON vr.tanulo_pk = t.tanulo_id
GROUP BY t.nev;

--5. Tanulók hány vizsgán vettek részt
SELECT t.nev, COUNT(*) AS vizsgak_szama
FROM VizsgaReszvetel vr
JOIN Tanulo t ON vr.tanulo_pk = t.tanulo_id
GROUP BY t.nev;

--6. Minden tanuló, aki részt vett gyakorlati vizsgán
SELECT DISTINCT t.nev
FROM VizsgaReszvetel vr
JOIN Vizsga v ON vr.vizsga_pk = v.vizsga_id
JOIN Tanulo t ON vr.tanulo_pk = t.tanulo_id
WHERE v.vizsga_tipus = 'gyakorlati';

--7. Mely oktatók tartottak órát és hol
SELECT DISTINCT okt.nev AS oktato_nev, o.helyszin
FROM Ora o
JOIN Oktato okt ON o.oktato_fk = okt.oktato_id;

--8. Sikeres elméleti vizsgát tett tanulók listája
SELECT t.nev, v.vizsga_tipus
FROM VizsgaReszvetel vr
JOIN Vizsga v ON vr.vizsga_pk = v.vizsga_id
JOIN Tanulo t ON vr.tanulo_pk = t.tanulo_id
WHERE v.vizsga_tipus = 'elméleti' AND vr.eredmeny = 1;


