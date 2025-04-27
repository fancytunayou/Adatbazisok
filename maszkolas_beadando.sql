
CREATE TABLE dbo.Ugyfel_Mask 
(
    [LOGIN] nvarchar(255) PRIMARY KEY,
    EMAIL nvarchar(255) MASKED WITH (FUNCTION = 'email()'),
    NEV nvarchar(255) MASKED WITH (FUNCTION = 'partial(1,"***",1)'),
    SZULEV int MASKED WITH (FUNCTION = 'random(4000, 6000)'),
    NEM nvarchar(1),
    CIM nvarchar(255) MASKED WITH (FUNCTION = 'partial(2,"***",2)')
)

INSERT INTO dbo.Ugyfel_Mask ([LOGIN], EMAIL, NEV, SZULEV, NEM, CIM)
VALUES 
('adam1', 'ádám.kiss@mail.hu', 'Kiss Ádám', 1991, 'F', '5630 Békés, Szolnoki út 8.'),
('adam3', 'adam3@gmail.com', 'Barkóci Ádám', 1970, 'F', '3910 Tokaj, Dózsa György utca 37.'),
('adam4', 'ádám.bieniek@mail.hu', 'Bieniek Ádám', 1976, 'F', '8630 Balatonboglár, Juhászföldi út 1.'),
('agnes', 'agnes@gmail.com', 'Lengyel Ágnes', 1979, 'N', '5200 Törökszentmiklós, Deák Ferenc út 5.');


CREATE USER Maskuser WITHOUT LOGIN;
GRANT SELECT ON dbo.Ugyfel_Mask TO Maskuser


EXECUTE AS USER = 'Maskuser';
SELECT * 
FROM dbo.Ugyfel_Mask
REVERT

