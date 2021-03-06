insert into User values ('admin1','zuckerburg@fb.com','privacyLOL','ADMIN');
insert into User values ('admin2','michael@gmail.com','123456!','ADMIN');
insert into User values ('ceo','ceo@gatech.edu','choochoo','ADMIN');
insert into User values ('farmowner','farmerJoe@gmail.com','farming123','OWNER');
insert into User values ('gardenowner','gardenerSteve@hotmail.com','ilovegardening','OWNER');
insert into User values ('orchardowner','orchardOwen@myspace.com','wowwowwow','OWNER');
insert into User values ('billybob','bobbilly@harvard.edu','S3cur3P455w0rd!!%$#@','VISITOR');
insert into User values ('iloveflowers','flowerpower@gmail.com','rosesarered','VISITOR');
insert into User values ('greenguy','bill@yahoo.com','broccoli','VISITOR');
insert into User values ('lonelyowner','fake@gmail.com','idontownanything','OWNER');
insert into User values ('riyoy1996','yamada.riyo@navy.mil.com','Riyo4LIFE','VISITOR');
insert into User values ('kellis','kateellis@gatech.edu','martapassword','VISITOR');
insert into User values ('ashton.woods','awoods3@gatech.edu','2Factor','VISITOR');
insert into User values ('adinozzo','anthony.dinozzo@ncis.mil.gov','V3rySpecialAgent','VISITOR');

insert into Property values (00000,'Atwood Street Garden',1,FALSE,TRUE,'Atwood Street SW','Atlanta',30308,'GARDEN','gardenowner','admin1');
insert into Property values (00001,'East Lake Urban Farm',20,TRUE,FALSE,'2nd Avenue','Atlanta',30317,'FARM','farmowner',null);
insert into Property values (00002,'Georgia Tech Garden',0.5,FALSE,TRUE,'Spring Street SW','Atlanta',30308,'GARDEN','orchardowner','admin2');
insert into Property values (00003,'Georgia Tech Orchard',0.5,FALSE,TRUE,'Spring Street SW','Atlanta',30308,'ORCHARD','orchardowner','admin2');
insert into Property values (00004,'Woodstock Community Garden',5,FALSE,TRUE,'1804 Bouldercrest Road','Woodstock',30188,'GARDEN','gardenowner','admin1');
insert into Property values (00005,'Kenari Company Farm',3,TRUE,TRUE,'100 Hightower Road','Roswell',30076,'FARM','farmowner','ceo');

insert into Visit values ('billybob',00000,'2018-11-12 00:00:01',5);
insert into Visit values ('billybob',00003,'2017-10-23 16:21:49',3);
insert into Visit values ('billybob',00002,'2017-10-24 07:31:12',1);
insert into Visit values ('greenguy',00002,'2018-1-23 17:12:34',4);
insert into Visit values ('iloveflowers',00000,'2018-2-14 12:21:12',5);
insert into Visit values ('greenguy',00000,'2018-3-3 11:12:10',2);
insert into Visit values ('greenguy',00005,'2018-1-2 19:21:10',2);
insert into Visit values ('riyoy1996',00005,'2017-10-28 22:11:13',4);
insert into Visit values ('kellis',00005,'2017-10-27 09:40:11',2);
insert into Visit values ('ashton.woods',00002,'2017-10-27 04:31:30',5);
insert into Visit values ('adinozzo',00003,'2017-10-10 00:00:00',1);


insert into FarmItem values ('Apple',TRUE,'FRUIT');
insert into FarmItem values ('Banana',TRUE,'FRUIT');
insert into FarmItem values ('Orange',TRUE,'FRUIT');
insert into FarmItem values ('Peach',TRUE,'FRUIT');
insert into FarmItem values ('Peruvian Lily',TRUE,'FLOWER');
insert into FarmItem values ('Sunflower',TRUE,'FLOWER');
insert into FarmItem values ('Pineapple Sage',FALSE,'FLOWER');
insert into FarmItem values ('Daffodil',FALSE,'FLOWER');
insert into FarmItem values ('Onion',TRUE,'VEGETABLE');
insert into FarmItem values ('Garlic',TRUE,'VEGETABLE');
insert into FarmItem values ('Broccoli',TRUE,'VEGETABLE');
insert into FarmItem values ('Carrot',FALSE,'VEGETABLE');
insert into FarmItem values ('Corn',TRUE,'VEGETABLE');
insert into FarmItem values ('Salami',FALSE,'VEGETABLE');
insert into FarmItem values ('Peas',TRUE,'VEGETABLE');
insert into FarmItem values ('Rose',TRUE,'FLOWER');
insert into FarmItem values ('Daisy',TRUE,'FLOWER');
insert into FarmItem values ('Peanut',TRUE,'NUT');
insert into FarmItem values ('Cashew ',TRUE,'NUT');
insert into FarmItem values ('Almond',FALSE,'NUT');
insert into FarmItem values ('Fig',FALSE,'NUT');
insert into FarmItem values ('Pig',TRUE,'ANIMAL');
insert into FarmItem values ('Chicken',TRUE,'ANIMAL');
insert into FarmItem values ('Cow',TRUE,'ANIMAL');
insert into FarmItem values ('Mongoose',FALSE,'ANIMAL');
insert into FarmItem values ('Monkey',TRUE,'ANIMAL');
insert into FarmItem values ('Cheetah',FALSE,'ANIMAL');
insert into FarmItem values ('Pete',FALSE,'ANIMAL');
insert into FarmItem values ('Pineapple',FALSE,'FRUIT');
insert into FarmItem values ('Kiwi',TRUE,'FRUIT');
insert into FarmItem values ('Tomato',FALSE,'FRUIT');
insert into FarmItem values ('Goat',TRUE,'ANIMAL');


insert into Has values(00000,'Broccoli');
insert into Has values(00001,'Corn');
insert into Has values(00002,'Rose');
insert into Has values(00003,'Apple');
insert into Has values(00004,'Carrot');
insert into Has values(00005,'Chicken');
insert into Has values(00001,'Pig');
insert into Has values(00005,'Corn');
insert into Has values(00003,'Peanut');
insert into Has values(00002,'Peas');
insert into Has values(00002,'Peruvian Lily');
insert into Has values(00000,'Corn');
insert into Has values(00001,'Cow');
insert into Has values(00001,'Chicken');
insert into Has values(00000,'Onion');
insert into Has values(00000,'Daisy');
insert into Has values(00003,'Peach');
insert into Has values(00005,'Orange');
insert into Has values(00005,'Cashew');
insert into Has values(00005,'Cow');
insert into Has values(00005,'Sunflower');