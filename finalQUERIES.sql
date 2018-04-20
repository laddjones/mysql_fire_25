-- Ladds -----------



-- -----------------

-- Julie -----------



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
SELECT name,street as address,city,zip,size,propertytype,isPublic,isCommercial,ID, count(username),avg(rating) FROM Property join visit
WHERE property.ID=visit.propertyID AND IsPublic=TRUE
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
select * from ManageVisitors where Username = '+Username+' or email = '+email+';
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
  


-- -----------------
