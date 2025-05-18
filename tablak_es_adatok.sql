CREATE TABLE Tanulo (
  tanulo_id INT PRIMARY KEY,
  nev VARCHAR(100),
  szuletesi_datum DATE,
  telefonszam VARCHAR(20),
  email VARCHAR(100)
);

CREATE TABLE Oktato (
  oktato_id INT PRIMARY KEY,
  nev VARCHAR(100),
  jogositvany_szam VARCHAR(50),
  telefonszam VARCHAR(20)
);

CREATE TABLE Jarmu (
  jarmu_id INT PRIMARY KEY,
  rendszam VARCHAR(20),
  jarmutipus VARCHAR(30),
  oktato_fk INT REFERENCES Oktato(oktato_id)
);

CREATE TABLE Ora (
  ora_id INT PRIMARY KEY,
  tanulo_fk INT REFERENCES Tanulo(tanulo_id),
  oktato_fk INT REFERENCES Oktato(oktato_id),
  jarmu_fk INT REFERENCES Jarmu(jarmu_id),
  idopont DATETIME,
  helyszin VARCHAR(100)
);

CREATE TABLE Vizsga (
  vizsga_id INT PRIMARY KEY,
  vizsga_tipus VARCHAR(50),
  idopont DATETIME
);

CREATE TABLE VizsgaReszvetel (
  vizsga_pk INT REFERENCES Vizsga(vizsga_id),
  tanulo_pk INT REFERENCES Tanulo(tanulo_id),
  eredmeny BIT,
  PRIMARY KEY (vizsga_pk, tanulo_pk)
);


INSERT INTO Tanulo (tanulo_id, nev, szuletesi_datum, telefonszam, email) VALUES
(1, 'Farkas Piroska', '2001-08-14', '06201234567', 'piroska.farkas@gmail.com'),
(2, 'Major Anna', '2003-12-03', '06301239876', 'anna.major@gmail.com'),
(3, 'Tarka Réka', '2004-04-04', '06703725876', 'reka.tarka@gmail.com'),
(4, 'Ének Elek', '2001-02-09', '06301264476', 'elek.enek@gmail.com'),
(5, 'Erdei Virág', '2005-08-18', '06205639976', 'virag.erdei@gmail.com'),
(6, 'Kiss Botond', '2002-11-25', '06203123456', 'botond.kiss@gmail.com'),
(7, 'Balogh Nóra', '2003-01-15', '06702349876', 'nora.balogh@gmail.com'),
(8, 'Szűcs Levente', '2004-09-07', '06305432112', 'levente.szucs@gmail.com'),
(9, 'Pintér Júlia', '2001-06-19', '06204785963', 'julia.pinter@gmail.com'),
(10, 'Szalai Gergő', '2005-03-03', '06708965231', 'gergo.szalai@gmail.com'),
(11, 'Mészáros Eszter', '2002-10-12', '06206784512', 'eszter.meszaros@gmail.com'),
(12, 'Oláh Bence', '2003-05-30', '06308875421', 'bence.olah@gmail.com'),
(13, 'Tóth Patrícia', '2004-08-22', '06705412378', 'patricia.toth@gmail.com'),
(14, 'Simon Dávid', '2005-12-14', '06207652341', 'david.simon@gmail.com'),
(15, 'Fehér Zsófia', '2001-11-01', '06301267890', 'zsofia.feher@gmail.com');

INSERT INTO Oktato (oktato_id, nev, jogositvany_szam, telefonszam) VALUES
(1, 'Kerék Eszter', 'KE123456', '06701230008'),
(2, 'Skoda Máté',   'SM654321', '06701230009'),
(3, 'Kocsi Enikő',  'KE112233', '06701230010'),
(4, 'Kuplung Ákos', 'KA445566', '06701230011'),
(5, 'Fék Lilla',    'FL778899', '06701230012');


INSERT INTO Jarmu (jarmu_id, rendszam, jarmutipus, oktato_fk) VALUES

(1, 'XTR101', 'személyautó', 1),
(2,'XYZ999', 'motor', 2),
(3,'RMN303', 'személyautó', 3),
(4,'KMK012', 'motor', 4),        
(5,'JTY505', 'teherautó', 5);


INSERT INTO Ora (ora_id, tanulo_fk, oktato_fk, jarmu_fk, idopont, helyszin) VALUES
(1, 1, 2, 2, '2025-06-01 08:00:00', 'Budapest, Oktató u. 1.'),
(2, 2, 3, 3, '2025-06-05 13:00:00', 'Budapest, Vezető tér 5.'),
(3, 3, 1, 1, '2025-06-06 10:15:00', 'Budapest, Tanuló krt. 10.'),
(4, 4, 5, 5, '2025-06-06 09:30:00', 'Budapest, Kipufogó u. 12.'),
(5, 6, 2, 2, '2025-06-08 09:00:00', 'Budapest, Vizsga utca 1.'),
(6, 7, 3, 3, '2025-06-08 14:00:00', 'Budapest, Oktató tér 11.'),
(7, 9, 1, 1, '2025-06-09 07:45:00', 'Budapest, Tanpálya u. 7.'),
(8, 12, 5, 5, '2025-06-04 15:00:00', 'Budapest, Vizsga tér 13.'),
(9, 13, 1, 1, '2025-06-09 08:00:00', 'Budapest, Duda utca 2.'),
(10, 14, 2, 2, '2025-06-06 09:30:00', 'Budapest, Jármű utca 1.');

INSERT INTO Vizsga (vizsga_id, vizsga_tipus, idopont) VALUES
(1, 'elméleti', '2025-06-05 09:00:00'),
(2, 'elméleti', '2025-06-05 10:00:00'),
(3, 'elméleti', '2025-06-07 09:00:00'),
(4, 'gyakorlati', '2025-06-07 10:00:00'),
(5, 'gyakorlati', '2025-06-09 09:00:00'),
(6, 'gyakorlati', '2025-06-10 10:00:00'),
(7, 'gyakorlati', '2025-06-11 11:00:00'),
(8, 'gyakorlati', '2025-06-12 10:00:00'),
(9, 'gyakorlati', '2025-06-14 10:00:00'),
(10, 'gyakorlati', '2025-06-16 10:00:00');

INSERT INTO VizsgaReszvetel (vizsga_pk, tanulo_pk, eredmeny) VALUES
(1, 2, 1),
(1, 4, 1),
(1, 6, 0),
(2, 14, 1),
(2, 1, 0),
(2, 3, 1),
(3, 7, 1),
(3, 9, 1),
(3, 13, 1),
(3, 6, 1),
(4, 5, 1),
(5, 10, 0),
(6, 8, 1),
(7, 12, 0),
(8, 15, 1),
(9, 11, 1),
(10, 10, 1);