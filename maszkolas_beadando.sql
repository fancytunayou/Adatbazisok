
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
SELECT [LOGIN], 
        EMAIL, 
        NEV, 
        SZULEV, 
        NEM, 
        CIM 
FROM dbo.Ugyfel


CREATE USER Maskuser WITHOUT LOGIN;
GRANT SELECT ON dbo.Ugyfel_Mask TO Maskuser


EXECUTE AS USER = 'Maskuser';
SELECT * 
FROM dbo.Ugyfel_Mask
REVERT

