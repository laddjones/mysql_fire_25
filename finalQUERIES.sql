-- Ladds -----------
#register visitor
INSERT INTO user (Username, Email, Password, UserType)
				VALUES("laddjones1", "laddjonesiv@gmaill.com", "laddsPASS", "VISITOR");



#search owner property
SELECT name, street, city, zip, size, PropertyType, isPublic, isCommercial, id, ApprovedBy, COUNT(username) as Visits, AVG(rating) as Avg_Rating
FROM property JOIN visit ON  visit.propertyID = property.id 
WHERE property.owner = '+OWNER+'
GROUP BY visit.PropertyID;

#general search by
SELECT name, street, city, zip, size, PropertyType, isPublic, isCommercial, id, ApprovedBy, COUNT(username) as Visits, AVG(rating) as Avg_Rating
FROM property JOIN visit ON  visit.propertyID = property.id 
WHERE property.owner = '+OWNER+' AND 'attribute' = '+chosenattribute+'
GROUP BY visit.PropertyID;
	
    
    
#Manage crops - admin can insert and delete immediately (without getting approved)
select name, type from FarmItem where IsApproved = True;
INSERT INTO farmItem (Name, IsApproved, Type)
				VALUES("newAnimal/CropName", 1, "FRUIT");
                
DELETE FROM farmItem 
				WHERE Name = "Apple";
                
SELECT * #could be name, isapproved, type
				FROM farmitem
                WHERE name = "Almond"; #could be name, isapproved, type



#Create Property - everything goes into the property table (just insert a flag value)
INSERT INTO property(id, name, street, city, zip, size, propertytype, owner, ispublic, iscommercial)
select max(id)+1,%, %, %, %, %, %, % , %, % from property; #owner and approvedBy must be legit already instanciated people
insert into Has (propertyID, ItemName) values (id, thing);

-- -----------------

-- Julie -----------
-- Julie -----------
###confirmed properties
create view CProperty as
SELECT Property.Name, Property.Street, Property.City, Property.Zip, Property.Size, Property.PropertyType,
Property.IsPublic, Property.IsCommercial, Property.ID, Property.ApprovedBy, avg(rating)
from Property join Visit
where Property.ApprovedBy <> "Null" and Property.ID=Visit.PropertyID
group by propertyid;

select * from CProperty;

select * from CProperty where ('+Searchby+' = '+Option+');


####unconfirmed properties
create view UCProperty as
SELECT Property.Name, Property.Street, Property.City, Property.Zip, Property.Size, Property.PropertyType,
Property.IsPublic, Property.IsCommercial, Property.ID, Property.owner
from Property
where (Property.ApprovedBy is NULL);

select * from UCProperty;

select * from UCProperty where ('+Searchby+' = '+Option+');

###Owner Manage Property
#select all attributes shown on screen
SELECT Property.Name, Street, City, Zip, Size, PropertyType, IsPublic, IsCommercial, ID, Has.ItemName
from Property join Has join FarmItem
where Property.ID = Has.PropertyID and Has.ItemName =FarmItem.Name;

#edit the attributes shown on screen
UPDATE Property SET '+changingat+'='+change+' where '+keyattribute+'='+whatever+';

#add a new crop 
select FarmItem.Name from FarmItem where FarmItem.IsApproved= True and FarmItem.Type <> 'Animal';
insert into Has(PropertyID,ItemName) values (%,%);

#request a new crop
Insert into FarmItem(Name, IsApproved, Type) values (%, %, %);


#delete crops 
Delete from Has where itemname="+cropname+";

#delete property 
Delete from property where id="+id+";

###Property Details
SELECT Property.Name, Property.Owner, User.Email, Property.Street, Property.City, Property.Zip, Property.Size,
Property.PropertyType, Property.IsPublic, Property.IsCommercial, Property.ID
from Property join User
where Property.owner = User.username and '+username+'= Property.owner;

#avg rating and visits
SELECT count(*), avg(rating) from Visit 
where '+PropertyID+'= PropertyID
group by PropertyID;

#crops
Select Has.ItemName from Has join FarmItem where FarmItem.Name=Has.ItemName and IsApproved=True and FarmItem.type <> 
'Animal' and '+propertyid+'= PropertyID; 

#animal
Select Has.ItemName from Has join FarmItem where FarmItem.Name=Has.ItemName and IsApproved=True and FarmItem.type = 
'Animal' and '+propertyid+'= PropertyID; 








-- -----------------

-- Andrea ----------

--Login
SELECT email,password FROM user WHERE email="+email+" AND password="+password+";

--New Owner Registration
INSERT INTO user(email, username, password, usertype ) values(%, %, %, “OWNER”);
INSERT INTO property(id, name, street, city, zip, size, propertytype, owner, ispublic, iscommercial)
select max(id)+1,%, %, %, %, %, %, % , %, % from property;
select name from farmitem where IsApproved=True and type = "Animal";
select name from farmitem where IsApproved=True and type <> "Animal";
INSERT INTO has(propertyID,itemname) values(%,%);

--View Public Properties
SELECT name,street,city,zip,size,propertytype,isPublic,isCommercial,ID, count(username),avg(rating) FROM Property join visit
WHERE property.ID=visit.propertyID AND IsPublic=TRUE
GROUP BY propertyID;

-- #sort by
SELECT name,street,city,zip,size,propertytype,isPublic,isCommercial,ID, count(username),avg(rating) FROM Property join visit
WHERE property.ID=visit.propertyID AND IsPublic=TRUE
GROUP BY propertyID
order by Property.Size;

-- #sort by Average rating
SELECT * from (SELECT name,street,city,zip,size,propertytype,isPublic,isCommercial,ID, count(username) as Visits,avg(rating) as Average_Rating FROM Property join visit
WHERE property.ID=visit.propertyID AND IsPublic=TRUE
GROUP BY propertyID) AS Table1 where Table1.Average_Rating>2 and Table1.Average_Rating<4;

-- #search by Number of Visits
SELECT * from (SELECT name,street,city,zip,size,propertytype,isPublic,isCommercial,ID, count(username) as Visits,avg(rating) as Average_Rating FROM Property join visit
WHERE property.ID=visit.propertyID AND IsPublic=TRUE
GROUP BY propertyID) AS Table1 where Table1.Visits>1 and Table1.Visits<6;

-- #search by
SELECT name,street,city,zip,size,propertytype,isPublic,isCommercial,ID, count(username),avg(rating) FROM Property join visit
WHERE property.ID=visit.propertyID AND IsPublic=TRUE AND Property.Name = 'Georgia Tech Garden'
GROUP BY propertyID;


-- Sydney ----------
--Admin manage property
--selects the info to put on the page
select Name, Street, City, Zip, Size, PropertyType, IsPublic, IsCommercial, ID from Property where ID = '+ID+';
--the confirm changes
update property
set Name = '+Name+', Street = '+Street+', City = '+City+', Zip = '+Zip+', Size = '+Size+',
IsPublic = '+bool+', IsCommercial = '+bool+'
where ID = '+ID+';

--shows the animals it has
select FarmItem.Name from Has, FarmItem
where PropertyID = '+ID+' and FarmItem.Name = Has.ItemName and IsApproved = True
and Type = 'Animal';
--shows the crops it has
select FarmItem.Name from Has, FarmItem
where PropertyID = '+ID+' and FarmItem.Name = Has.ItemName and IsApproved = True
and Type <> 'Animal';

--approved animals in dropdown
select Name from FarmItem
where IsApproved = True and Type = 'Animal';
--adding the animal to the property
insert into Has (PropertyID, ItemName) values (%,%);
--approved crops in drop down
select Name from FarmItem
where IsApproved = True and Type <> 'Animal';
--adds the crop
insert into Has (PropertyID, ItemName) values (%,%);
--deletes item it has
delete from Has where PropertyID = '+ID+' and ItemName = '+ItemName+';
--deletes the property
delete from property where ID = '+ID+';

--manage visitors
create view ManageVisitors
as select Visit.Username, User.Email, count(*) as 'Logged Visits'
from User, Visit where User.Username = Visit.Username
group by Visit.Username;
--shows the table on the screen
select * from ManageVisitors;
--for the search by
select * from ManageVisitors where Username = '+Username+';
select * from ManageVisitors where email = '+email+';
--delete a visitor visit log
delete from Visit where Username = '+Username+';
--delete a vistor
delete from User where Username = '+Username+';

--Visitor manage details
--basic values to be shown on screen
select Name, Owner, Email, Street, City, Zip, Size,
PropertyType, IsPublic, IsCommercial, ID from Property join User
on Owner = Username where ID = '+ID+';

--to get number of visits and avg rating
select count(Username) as 'Visits', avg(Rating) as 'Avg Rating'
from Visit where PropertyID = '+ID+' group by PropertyID;
--to get the crops
select FarmItem.Name from Has, FarmItem
where PropertyID = '+ID+' and FarmItem.Name = Has.ItemName and IsApproved = True
and Type <> 'Animal';
--to get the animals
select FarmItem.Name from Has, FarmItem
where PropertyID = '+ID+' and FarmItem.Name = Has.ItemName and IsApproved = True
and Type = 'Animal';
--to log a visit
insert into Visit (Username, PropertyID, VisitDate, Rating) values (%,%,%,%);
--unlogging a visit
delete from Visit where Username = '+Username+' and PropertyID = '+ID+';


-- -----------------

-- Armando ---------
-- MANAGE OWNERS
-- #create view for Owner
create view Owner
as select User.Username, User.Email, count(Property.Name) as Number_of_Properties
from User join property on User.Username = Property.Owner
where UserType = 'OWNER'
group by User.username;
select * from Owner;
#delete owner
delete from Owner where Username = '+username+';

-- #search by
select * from Owner where Username = '+username+';
select * from Owner where Email = '+email+';
select * from Owner where Number_of_Properties = '+Number_of_Properties+';

-- APPROVE CROPS
-- # Create view Pending_Animals_Crops
create view Pending_Animals_Crops
as select Name,Type from FarmItem where IsApproved = 0;

-- #approve selection
update Pending_Animals_Crops set IsApproved = 1 where Name = '+Name+';

-- #delete selection
delete from Pending_Animals_Crops where Name = '+Name+';
 
 -- VIEW YOUR VISIT HISTORY

select Property.Name, Visit.VisitDate, avg(Visit.Rating) from Property join Visit on Property.ID = Visit.PropertyID where Visit.Username = '+username+' group by Property.ID;

-- SEARCH OTHER PROPERTIES
-- #view other properties not including their own properties
create view OtherProperties
as select *
from Property as P join Visit as V on P.ID = V.PropertyID
where P.ApprovedBy is not null and owner != '+username+';

-- #view certain attributes from this task screen that doesn't include owner's
select Name, Street, City, Zip, Size, PropertyType, IsPublic, IsCommercial, ID, count(ID), avg(Rating)
from OtherProperties
group by ID;
-- #sort by
select Name, Street, City, Zip, Size, PropertyType, IsPublic, IsCommercial, ID, count(ID), avg(Rating) from OtherProperties group by ID order by Size;

-- #search by
select Name, Street, City, Zip, Size, PropertyType, IsPublic, IsCommercial, ID, count(ID), avg(Rating) from OtherProperties where Name = 'Georgia Tech Garden';

-- -----------------
