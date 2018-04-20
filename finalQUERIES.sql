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
INSERT INTO has(propertyID,itemname) values(%,%);

--View Public Properties
SELECT name,street as address,city,zip,size,propertytype,isPublic,isCommercial,ID, count(username),avg(rating) FROM Property join visit
WHERE property.ID=visit.propertyID AND IsPublic=TRUE
GROUP BY propertyID;


-- Sydney ----------



-- -----------------

-- Armando ---------
  


-- -----------------
