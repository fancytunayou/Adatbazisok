# 8. gyakorlat

## Előkészületek
+ ezt a fájlt, ha previewba akarod látni, ctrl + shift + v
### MongoDB
+ Regisztráljunk a MongoDB Atlas oldalán (https://www.mongodb.com/cloud/atlas/register)
+ Telepítsük fel a MongoDB Compass programot (csak saját magunknak)

+ Opcionálisan: A VS CODE-ban adjuk hozzá a MongoDB for VS Code bővítményt

A megoldásokat - ahol kódot kell írni - másoljuk be a ```js és a ``` közötti részbe


## Feladatok


1.	Lépjen be a MongoPlayground oldalára, majd a melléklet 1. pontjában szereplő gyűjteményt másolja be a Configuration részbe!
a Készítsen lekérdezést, amely csak az user_id, firstName és lastname oszlopokat jeleníti meg!

```js
db.collection.find({},
{
  _id: 0,
  user_id: 1,
  firstName: 1,
  lastname: 1
})
```


2.	A MongoPlayground-on az előző feladatban létrehozott gyűjteményből kérdezze le a Grace keresztnevű felhasználó email-címét és jelszavát (csak ez a két mező jelenjen meg)! (a szűrőfeltételeket, az első kapcsos zárójelbe kell rakni!)

```js
db.collection.find({
  firstName: "Grace"
},
{
  _id: 0,
  email: 1,
  password: 1
})
```


3. Lépjen be a MongoDB Atlas-ba, majd értelemszerűen hozzon létre új szervezetet, projektet és cluster-t! Válasszuk a **Free** lehetőséget!
   
a. A Load sample Dataset lehetőség legyen bejelölve    (A dataset betöltése több percet is igénybe vehet) b. Kattintson a Browse Collections gombra!c. Ha nem jelenik meg a sample_training adatbázis, akkor a MongoDB Compass-ban hozzuk létre, és importáljuk a grades.json és a trips.json gyűjteményeket!

OPCIONÁLISAN: a feladat a MongoDB Compass-ból vagy a VS Code-ból kiidulva is megoldható

4.  A sample_training adatbázis grades gyűjteményből kérdezze le a 339-es azonosítójú osztály eredményeit!

a. A listában csak azok a dokumentumok jelenjenek meg, ahol a tanuló azonosítója 100 alatt van!

   
```js
{"student_id": {"$gte":0, "$lte":200}, "class_id":339}
```

OPCIONÁLISAN: a feladat a MongoDB Compass-ban, a VS Code-ban vagy a MongoDB Shell-ben is megoldható

5. A MongoDB Atlas-ban a + Create Database gomb lenyomásával  hozzunk létre új adatbázist Gyak8 néven, azon belül pedig egy új gyűjteményt szemelyek néven! A létrehozás után tegye aktuálissá a Gyak8.szemelyek gyűjteményt!
   
a. Az Insert Document gomb lenyomása után szúrjunk be új dokumentumot a szemelyek gyűjteménybe a következő tartalommal (értéknek mindenhova a saját adatait adja meg):  neptunkod, nev,  evfolyam
b. A neptunkod legyen string típusú
c. A név két mezőből álljon: vezeteknev és keresztnev (Object típus)
d. Az evfolyam egész szám legyen (Int32)

```js
{
"neptun_kod":"opweru",   #string lesz
"nev":                 #object lesz, benne a ket nev
{
"veznev": "Szabó",
"keresztnev": "Olaf"    
},
"evfolyam": 1 #int lesz
}
```
Több doksit is létre lehet egyszerre hozni, csak az egészet []-be tenni és a külön doksikat a {}-ban vesszővel elválasztani.

OPCIONÁLISAN: a feladat a MongoDB Compass-ban, a VS Code-ban vagy a MongoDB Shell-ben is megoldható. (Egyszerre több dokumentumot is létrehozhatunk az insertMany([dokumentumok]) utasítás segítségével. Ilyenkor a dokumentumokat vesszővel elválasztva kell megadni.)

```js
db.szemelyek.insertOne({neptunkod:"hds6ep", nev:{veznev: "Velez", keresztnev: "Veronika"}, evfolyam: 2})
```

```js
db.szemelyek.insertMany([{neptunkod:"hds6ep", nev:{veznev: "Velez", keresztnev: "Veronika"}, evfolyam: 2},{neptunkod:"fhgdsz", nev:{veznev: "Polgár", keresztnev: "Judit"}, evfolyam: 2}])
```


6. Indítsa el a MongoDB Compass alkalmazást, majd csatlakozzon a MongoDB cluster-hez! 


Ha korábban sikerült a kapcsolódás, akkor baloldalt a Recent részben kiválaszthatja a kapcsolatot
Sikertelen kapcsolat esetén a baloldalon lévő Network Access részben adja hozzá az aktuális IP-címét a tűzfal kivételekhez!
a. Hozzon létre új adatbázist Gyak_compass néven, azon belül egy új gyújteményt receptek néven!
b. A receptek gyűjteménybe importálja be a 2. melléklet tartalmát (Add data / Import File, majd Select File, végül Import)!

OPCIONÁLISAN: a feladat a VS Code-ban is megoldható


7. A MongoDB Compass segítségével kérdezze le az előző feladatban létrehozott receptek gyűjtemény azon dokumentumait, amelyre teljesül:

a. A lájkok száma több, mint 2!
b.  A lista legyen sorbarendezve a főzési idő szerint csökkenő sorrendben! (A rendezés funkció az Options gomb lenyomása után érhető el)
c. A listában ne jelenjenek meg az ingredients és a rating mezők (Project szakasznál kell beállítani)!

```js
{likes_count: {$gt: 2}}
{cook_time: -1} #a sort-hoz
```

OPCIONÁLISAN: a feladat a VS Code-ban vagy a MongoDB Shell-ben is megoldható

```js
db.receptek.find({"likes_count": {$gt: 2}}).sort({"cook_time": -1})
```

8. Az előző feladatban létrehozott lekérdezésre hajtsa végre az Explain Plan funkciót!

```js
db.receptek.find({"likes_count": {$gt: 2}}).sort({"cook_time": -1}).explain("executionStats")
```

OPCIONÁLISAN: a feladat a VS Code-ban vagy a MongoDB Shell-ben is megoldható

9. A MongoDB Compass-ban készítsen új indexet a 7. feladatban importált receptek gyűjteményhez az Indexes rész Create Index funkciójának segítségével!

a. Az index neve legyen i_title, és a title mező szerint csökkenő legyen
b. Az index  egyedi (unique) legyen (Options rész)!

OPCIONÁLISAN: a feladat a VS Code-ban vagy a MongoDB Shell-ben is megoldható

```js
db.receptek.createIndex({i_title:-1})
```

10. A MongoDB Compass-ban nyissunk egy parancssort (MongoDB shell)!
a. Adjuk ki a show dbs parancsot!
b. Csatlakozzunk a gyak_compass adatbázishoz!

```js
show dbs
use gyak_compass
```
11. Array lekérdezések (receptek):

a. A tags array között legyen a "sweets"
```js
db.receptek.find({"tags": "sweets"})
```

b. A tags array-ben a "sweets" legyen az első elem
```js
db.receptek.find({"tags.0": "sweets"})
```

c. A tags array-ben csak "sweets" legyen
```js
db.receptek.find({"tags": ["sweets"]})
```

d. A tags array-ben legyen benne a "quick" és az "easy", de lehet más is
```js
db.receptek.find({"tags": {$all: ["quick", "easy"]}})
```

e. Minden olyan recept, amelybe kell tojás. (az ingredients array-ben objectek vannak és abban "name" alatt vannak a hozzávalók )
```js
db.receptek.find({"ingredients.name": "egg"})
```

12. A mongo shellben kérdezzük le, hogy a receptek gyűjteményben mely dokumentumoknál szerepel a recept nevében (title) a Tacos szó!

a. A megjelenés kellően szép (json-szerű) legyen!
```js
db.receptek.find({"title":{$regex: /Tacos/}}).pretty()
```

13. A mongo shell-ben kérdezzük le, hogy a receptek gyűjteményben hány olyan dokumentum van, ahol:

a. A recept 4 főre szól (servings) ÉS a tag-ek között szerepel a "quick" VAGY az "easy" (legalább az egyik)

```js
db.receptek.find({$and: [{"servings": 4}, {$or: [{"tags": {$regex: /quick/}}, {"tags": {$regex: /easy/}}]}]})
```

```js
db.receptek.find({"servings": 4, "tags": {$in: ["quick", "easy"]}}).count()
```

b. A recept 8 főre szól (servings) VAGY a likes_count 3

```js
db.receptek.find({$or: [{"likes_count": 3}, {"servings": 8}]}).count()
```
14. A mongo shell-ben kérdezzük le, hogy recept  típusonként (type) mennyi a főzési idők (cook_time) összege!

```js
db.receptek.aggregate([{$group: {_id:"$type", total: {$sum: "$cook_time"}}}])
```
+recept típusok:
```js
db.receptek.distinct("type")
```
+sort-olni így lehet:
```js
db.receptek.aggregate([{$group: {_id:"$type", total: {$sum: "$cook_time"}}},{$sort:{total:-1}}])
```
+match-el:
```js
db.receptek.aggregate([{$match: {"likes_count": 3}},{$group: {_id:"$type", total: {$sum: "$cook_time"}}},{"$sort":{total:1}}])
```
```js
db.receptek.aggregate([{$match: {tags: {$in: ["quick", "easy"]}}},{$group: {_id:"$type", total: {$sum: "$cook_time"}}},{$sort:{total:1}}])
```
[$push] Ha meg akarunk még vmit jelentetni.
```js
db.receptek.aggregate([
{$match: {tags: {$in: ["quick", "easy"]}}},
{$group: {_id:"$type", tags:{$push: "$tags"}, total: {$sum: "$cook_time"}}},
{$sort:{total:1}}
])
```
15. [$add] Adjunk hozzá az összes cook_time-hoz 5 percet!
```js
db.receptek.aggregate([
  {$project: {_id:0, title:1, plus_time:{$add: ["$cook_time", 5]}}}
])
```
16. [$cond] Az 30 perc feletti receptek legyenek hosszúak, a többiek rövidek!

```js
([
{$project: {_id: 0, title: 1, result: {$cond:
{if: {$gt: ["$cook_time", 30]},
then: "hosszu", else: "rovid"}}}}
])
```

17. [$switch]+[case] Ugyanazt csak $switch operátorral és legyen középkategória is
```js
db.receptek.aggregate([
{$project: {_id: 0, title: 1,
result:
{$switch: { branches:
[
{case: {$gt: ["$cook_time", 40]}, then: "hosszú"},
{case: {$lte: ["$cook_time", 30]}, then: "rövid"}
],
default: "közepes"}
}
}
}])
```

18. [$set] A mongo shell-ben a receptek gyűjteményben a ObjectId("5e878f5220a4f574c0aa56db") azonosítójú dokumentum esetén módosítsuk a főzési időt (cook_time) 33 percre!

```js
db.receptek.updateOne({"_id": ObjectId("5e878f5220a4f574c0aa56db")}, {$set:{"cook_time": 33}})
```

19. [$push] A mongo shell-ben adjunk hozzá a ObjectId("5e5e9c470d33e9e8e3891b35") azonosítójú dokumentum likes tömbjéhez még egy értéket, mégpedig a 200-at!

```js
db.receptek.updateOne({"_id": ObjectId("5e5e9c470d33e9e8e3891b35")}, {$push:{"likes": 200}})
```

ZH GYAK FELADATOK
1. 
```js
db.users.find(
{"email": {$regex: /.com/}},
{_id:0, name:1, email:1})
```

2. 
```js
db.movies.find(
  {$and: [{"genres.0": "Short"}, {"year": {$gte: 1945, $lte: 1970}}]},
  {_id:0, title:1, year:1}
).sort({"year":1, "title":-1})
```

3. 
```js
db.movies.aggregate([
  {$match: {"runtime": {$gt:50, $lt:100}}},
  {$group: {_id:"$year", AVG: {$avg: "$num_mflix_comments"}}},
  {$sort:{_id:1}}
])
```
ZH GYAK 4 FELADATOK
1. A MongoDB Atlas sample_mflix adatbazis comments gyujtemenyebol
kérdezzük le, hogy mely felhasználók (email) írtak 10-nél több
kommentet?
```js
db.comments.aggregate([
  {
    $group: {
      _id: "$email",
      count: { $sum: 1 }
    }
  },
  {
    $match: {
      count: { $gt: 10 }
    }
  }
]);
```
