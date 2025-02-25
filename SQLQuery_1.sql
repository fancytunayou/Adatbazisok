SELECT USERNEV,
        NEV,
        UPPER (LEFT(NEV,1) + RIGHT(NEV,1)) as 'Monogram'
from Vendeg
WHERE RIGHT(EMAIL,3) = '.hu'

SELECT SZALLAS_ID,
        SZALLAS_NEV,
        HELY,
        DATEDIFF(DAY, ROGZ_IDO, GETDATE())
from szallashely
where TIPUS NOT IN ('panzió', 'vendégház')