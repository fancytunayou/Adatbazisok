erDiagram
      
"dbo.Raktar" {
    int RAKTAR_KOD "PK"
          nvarchar(255) RAKTAR_NEV ""
          nvarchar(255) RAKTAR_CIM ""
          
}
"dbo.Rendeles" {
    int SORSZAM "PK"
          nvarchar(255) LOGIN "FK"
          date REND_DATUM ""
          date SZALL_DATUM ""
          nvarchar(255) SZALL_CIM ""
          nvarchar(255) SZALL_MOD ""
          nvarchar(255) FIZ_MOD ""
          nvarchar(255) SZAMLA_CIM ""
          
}
"dbo.Rendeles_tetel" {
    int SORSZAM "PK, FK"
          nvarchar(255) TERMEKKOD "PK, FK"
          float EGYSEGAR ""
          float MENNYISEG ""
          
}
"dbo.Termek" {
    nvarchar(255) TERMEKKOD "PK"
          nvarchar(255) MEGNEVEZES ""
          int KAT_ID "FK"
          float LISTAAR ""
          nvarchar(255) LEIRAS ""
          int RAKTAR_KOD "FK"
          float KESZLET ""
          nvarchar(255) MEGYS ""
          nvarchar(255) FELVITTE ""
          date FELVITEL ""
          
}
"dbo.Termekkategoria" {
    int KAT_ID "PK"
          nvarchar(255) KAT_NEV ""
          int SZULO_KAT "FK"
          
}
"dbo.Ugyfel" {
    nvarchar(255) LOGIN "PK"
          nvarchar(255) EMAIL ""
          nvarchar(255) NEV ""
          int SZULEV ""
          nvarchar(1) NEM ""
          nvarchar(255) CIM ""
          
}
"dbo.sysdiagrams" {
    nvarchar(128) name ""
          int principal_id ""
          int diagram_id "PK"
          int version ""
          varbinary(-1) definition ""
          
}
"View: dbo.vwAru" {
    dbo_Termek TERMEKKOD ""
          dbo_Termek MEGNEVEZES ""
          dbo_Termek LISTAAR ""
          dbo_Termek KESZLET ""
          dbo_Termek MEGYS ""
          
}
      "dbo.Rendeles" |o--|{ "dbo.Ugyfel": "LOGIN"
"dbo.Rendeles_tetel" ||--|{ "dbo.Rendeles": "SORSZAM"
"dbo.Rendeles_tetel" ||--|{ "dbo.Termek": "TERMEKKOD"
"dbo.Termek" |o--|{ "dbo.Termekkategoria": "KAT_ID"
"dbo.Termekkategoria" |o--|{ "dbo.Termekkategoria": "KAT_ID"
"View: dbo.vwAru" ||--|| "dbo.Termek": "vwAru => Termek"
"View: dbo.vwAru" ||--|| "dbo.Termek": "vwAru => Termek"
"View: dbo.vwAru" ||--|| "dbo.Termek": "vwAru => Termek"
"View: dbo.vwAru" ||--|| "dbo.Termek": "vwAru => Termek"
"View: dbo.vwAru" ||--|| "dbo.Termek": "vwAru => Termek"
