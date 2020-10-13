DELIMITER $$ 

CREATE FUNCTION addAgeStatus(Age INT)
RETURNS VARCHAR(400)
DETERMINISTIC
BEGIN
	DECLARE ageStatus VARCHAR(500);
	IF Age > 18 THEN
		SET ageStatus = 'major';
	ELSE
		SET ageStatus = 'minor';
	END IF;
	RETURN ageStatus;
	END

$$ DELIMITER ;



DELIMITER $$

CREATE TRIGGER follow_notification
    AFTER INSERT
    ON Follow FOR EACH ROW
BEGIN
  SET @text_d = 'You have been followed';
  SET @created_at_d = NOW();
  SET @frm_usr_id = NEW.Follower_User_ID;
  SET @to_usr_id = NEW.Followind_User_ID;
  
  INSERT mydb.Notification (Text, created_at, From_user_Id, To_User_ID) VALUES (@text_d, @created_at_d, @frm_usr_id, @to_usr_id);
  
  
END$$

DELIMITER ;



DELIMITER $$

CREATE TRIGGER like_notification
    AFTER INSERT
    ON mydb.Like FOR EACH ROW
BEGIN
  SET @text_d = 'Your post/comment was liked';
  SET @created_at_d = NOW();
  SET @frm_usr_id = NEW.User_User_ID;
  SET @to_usr_id = (SELECT Post.User_User_ID FROM Post WHERE Post.Post_ID = NEW.Post_Post_ID);
  
  INSERT mydb.Notification (Text, created_at, From_user_Id, To_User_ID) VALUES (@text_d, @created_at_d, @frm_usr_id, @to_usr_id);
  
  
END$$

DELIMITER ;


INSERT mydb.User (FirstName, LastName, Bio, Age, AgeStatus, Mobile, Created_at, Updated_at, DOB) VALUES ('Jake', 'Paul', 'Student', 24, mydb.addAgeStatus(24), 2395328458, '2003-10-23', '2017-12-25', '1993-02-13');
INSERT mydb.User (FirstName, LastName, Bio, Age, AgeStatus, Mobile, Created_at, Updated_at, DOB) VALUES ('Melissa', 'Vandela', 'Singer', 26, mydb.addAgeStatus(26), 9328745983, '2005-10-15', '2018-11-20', '1996-03-22');
INSERT mydb.User (FirstName, LastName, Bio, Age, AgeStatus, Mobile, Created_at, Updated_at, DOB) VALUES ('Mike', 'Loga', 'Driver', 29, mydb.addAgeStatus(29), 8457867435, '2007-01-23', '2017-11-12', '1998-07-01');
INSERT mydb.User (FirstName, LastName, Bio, Age, AgeStatus, Mobile, Created_at, Updated_at, DOB) VALUES ('Jynx', 'Pent', 'Data Analyst', 25, mydb.addAgeStatus(25), 3945983744, '2008-09-24', '2017-12-17', '2000-05-09');
INSERT mydb.User (FirstName, LastName, Bio, Age, AgeStatus, Mobile, Created_at, Updated_at, DOB) VALUES ('Paula', 'Abraham', 'Student', 18, mydb.addAgeStatus(18), 8937459834, '2008-08-24', '2018-10-15', '1997-01-11');
INSERT mydb.User (FirstName, LastName, Bio, Age, AgeStatus, Mobile, Created_at, Updated_at, DOB) VALUES ('Etha', 'Hunt', 'Cop', 32, mydb.addAgeStatus(32), 3987459873, '2005-07-21', '2017-01-12', '1996-09-17');
INSERT mydb.User (FirstName, LastName, Bio, Age, AgeStatus, Mobile, Created_at, Updated_at, DOB) VALUES ('Tom', 'Cruise', 'Actor', 52, mydb.addAgeStatus(52), 5757483946, '2006-10-14', '2018-08-11', '1996-12-18');
INSERT mydb.User (FirstName, LastName, Bio, Age, AgeStatus, Mobile, Created_at, Updated_at, DOB) VALUES ('Jennifer', 'Peralta', 'Student', 20, mydb.addAgeStatus(20), 5848393957, '2006-06-24', '2017-08-25', '1990-10-27');
INSERT mydb.User (FirstName, LastName, Bio, Age, AgeStatus, Mobile, Created_at, Updated_at, DOB) VALUES ('Clint', 'Dempsey', 'Soccer Player', 38, mydb.addAgeStatus(38), 4858593948, '2008-09-23', '2018-01-25', '1987-08-25');
INSERT mydb.User (FirstName, LastName, Bio, Age, AgeStatus, Mobile, Created_at, Updated_at, DOB) VALUES ('Paul', 'Wood', 'Architect', 28, mydb.addAgeStatus(28), 8365636574, '2006-05-24', '2018-04-05', '1991-04-09');




INSERT mydb.Account (Email, Password, Status, User_User_ID) VALUES ('jake.p@gmail.com', 'jakep', 1, 1);
INSERT mydb.Account (Email, Password, Status, User_User_ID) VALUES ('melissa.v@gmail.com', 'melissava', 0, 2);
INSERT mydb.Account (Email, Password, Status, User_User_ID) VALUES ('mike.l@gmail.com', 'mikel', 1, 3);
INSERT mydb.Account (Email, Password, Status, User_User_ID) VALUES ('jynx.p@gmail.com', 'jynxp', 0, 4);
INSERT mydb.Account (Email, Password, Status, User_User_ID) VALUES ('paula.a@gmail.com', 'paulander', 1, 5);
INSERT mydb.Account (Email, Password, Status, User_User_ID) VALUES ('ethan.h@gmail.com', 'mi007jb', 0, 6);
INSERT mydb.Account (Email, Password, Status, User_User_ID) VALUES ('tom.c@gmail.com', 'kjf3keg', 1, 7);
INSERT mydb.Account (Email, Password, Status, User_User_ID) VALUES ('jennifer.p@gmail.com', 'kejf89jk', 0, 8);
INSERT mydb.Account (Email, Password, Status, User_User_ID) VALUES ('clint.d@gmail.com', 'ejfkdfv', 1, 9);
INSERT mydb.Account (Email, Password, Status, User_User_ID) VALUES ('paul.w@gmail.com', 'dfkng', 1, 10);



INSERT mydb.Post (Title, Description, Created_at, Updated_at, User_User_ID) VALUES ('Word', 'New England Pats for the win!', '2004-05-25', '2005-04-12', 1);
INSERT mydb.Post (Title, Description, Created_at, Updated_at, User_User_ID) VALUES ('Image', 'At maldives', '2006-05-28', '2006-05-28', 2);
INSERT mydb.Post (Title, Description, Created_at, Updated_at, User_User_ID) VALUES ('Activity', 'Started School at Northeaster', '2010-05-08', '2010-05-09', 3);
INSERT mydb.Post (Title, Description, Created_at, Updated_at, User_User_ID) VALUES ('Image', 'The cold weather!', '2007-08-25', '2007-08-25', 4);
INSERT mydb.Post (Title, Description, Created_at, Updated_at, User_User_ID) VALUES ('Image', 'At Provincetown!', '2011-10-25', '2012-04-12', 5);
INSERT mydb.Post (Title, Description, Created_at, Updated_at, User_User_ID) VALUES ('Word', 'Cricket or Football?', '2007-05-25', '2009-04-12', 1);
INSERT mydb.Post (Title, Description, Created_at, Updated_at, User_User_ID) VALUES('Feeling', 'Feeling Lonely at Bosto', '2008-05-12', '2008-05-12', 4);
INSERT mydb.Post (Title, Description, Created_at, Updated_at, User_User_ID) VALUES ('Activity', 'Watching MI-5 at Regal Cinemas', '2013-05-17', '2013-05-17', 6);
INSERT mydb.Post (Title, Description, Created_at, Updated_at, User_User_ID) VALUES ('Image', 'Happy Thanksgving', '2014-11-24', '2015-04-12', 8);
INSERT mydb.Post (Title, Description, Created_at, Updated_at, User_User_ID) VALUES ('Word', 'I lve data!', '2014-05-25', '2015-04-12', 1);


INSERT mydb.Hashtag (Hashtag) VALUES ('Football');
INSERT mydb.Hashtag (Hashtag) VALUES ('Baseball');
INSERT mydb.Hashtag (Hashtag) VALUES ('Winter');
INSERT mydb.Hashtag (Hashtag) VALUES ('Summer');
INSERT mydb.Hashtag (Hashtag) VALUES ('Fall');
INSERT mydb.Hashtag (Hashtag) VALUES ('Pizza');
INSERT mydb.Hashtag (Hashtag) VALUES ('Ice-cream');
INSERT mydb.Hashtag (Hashtag) VALUES ('Thanksgiving2018');
INSERT mydb.Hashtag (Hashtag) VALUES ('Bosto');
INSERT mydb.Hashtag (Hashtag) VALUES ('Paris');


INSERT mydb.Like(User_User_ID, Post_Post_ID) VALUES (1, 3);
INSERT mydb.Like(User_User_ID, Post_Post_ID) VALUES (2, 5);
INSERT mydb.Like(User_User_ID, Post_Post_ID) VALUES (3, 1);
INSERT mydb.Like(User_User_ID, Post_Post_ID) VALUES (4, 7);
INSERT mydb.Like(User_User_ID, Post_Post_ID) VALUES (5, 7);
INSERT mydb.Like(User_User_ID, Post_Post_ID) VALUES (1, 1);
INSERT mydb.Like(User_User_ID, Post_Post_ID) VALUES (4, 2);
INSERT mydb.Like(User_User_ID, Post_Post_ID) VALUES (6, 8);
INSERT mydb.Like(User_User_ID, Post_Post_ID) VALUES (8, 3);
INSERT mydb.Like(User_User_ID, Post_Post_ID) VALUES (1, 4);



INSERT mydb.Page(Name, Description, Post_Post_ID) VALUES ('Football memes', 'Closed Page', 3);
INSERT mydb.Page(Name, Description, Post_Post_ID) VALUES ('English Music', 'Closed Page', 4);
INSERT mydb.Page(Name, Description, Post_Post_ID) VALUES ('80s Rock', 'Open Page', 6);
INSERT mydb.Page(Name, Description, Post_Post_ID) VALUES ('Fruits', 'Open Page', 8);
INSERT mydb.Page(Name, Description, Post_Post_ID) VALUES ('Gym for body', 'Closed Page', 5);
INSERT mydb.Page(Name, Description, Post_Post_ID) VALUES ('Data Students', 'Closed Page', 1);
INSERT mydb.Page(Name, Description, Post_Post_ID) VALUES ('Northeastern computers', 'Closed Page', 2);
INSERT mydb.Page(Name, Description, Post_Post_ID) VALUES ('Iowa Hawkeyes', 'Open Page', 9);
INSERT mydb.Page(Name, Description, Post_Post_ID) VALUES ('water blades', 'Open Page', 10);
INSERT mydb.Page(Name, Description, Post_Post_ID) VALUES ('Wine Tasting Bosto', 'Open Page', 7);



INSERT mydb.Account_page(Account_Account_ID, Page_Page_ID) VALUES (1,1);
INSERT mydb.Account_page(Account_Account_ID, Page_Page_ID) VALUES (2,4);
INSERT mydb.Account_page(Account_Account_ID, Page_Page_ID) VALUES (3,3);
INSERT mydb.Account_page(Account_Account_ID, Page_Page_ID) VALUES (4,5);
INSERT mydb.Account_page(Account_Account_ID, Page_Page_ID) VALUES (5,2);
INSERT mydb.Account_page(Account_Account_ID, Page_Page_ID) VALUES (6,7);
INSERT mydb.Account_page(Account_Account_ID, Page_Page_ID) VALUES (7,8);
INSERT mydb.Account_page(Account_Account_ID, Page_Page_ID) VALUES (8,9);
INSERT mydb.Account_page(Account_Account_ID, Page_Page_ID) VALUES (9,6);
INSERT mydb.Account_page(Account_Account_ID, Page_Page_ID) VALUES (10,10);


INSERT mydb.Post_hashtag (Post_Post_ID, Hashtag_Hashtag_ID) VALUES (1,1);
INSERT mydb.Post_hashtag (Post_Post_ID, Hashtag_Hashtag_ID) VALUES (2,3);
INSERT mydb.Post_hashtag (Post_Post_ID, Hashtag_Hashtag_ID) VALUES (3,5);
INSERT mydb.Post_hashtag (Post_Post_ID, Hashtag_Hashtag_ID) VALUES (4,7);
INSERT mydb.Post_hashtag (Post_Post_ID, Hashtag_Hashtag_ID) VALUES (5,2);
INSERT mydb.Post_hashtag (Post_Post_ID, Hashtag_Hashtag_ID) VALUES (6,4);
INSERT mydb.Post_hashtag (Post_Post_ID, Hashtag_Hashtag_ID) VALUES (7,6);
INSERT mydb.Post_hashtag (Post_Post_ID, Hashtag_Hashtag_ID) VALUES (8,8);
INSERT mydb.Post_hashtag (Post_Post_ID, Hashtag_Hashtag_ID) VALUES (9,10);
INSERT mydb.Post_hashtag (Post_Post_ID, Hashtag_Hashtag_ID) VALUES (10,9);


INSERT mydb.Comment (Comment, User_User_ID, Post_Post_ID) VALUES ('I love it!', 1, 1);
INSERT mydb.Comment (Comment, User_User_ID, Post_Post_ID) VALUES ('Pats all the way', 2, 2);
INSERT mydb.Comment (Comment, User_User_ID, Post_Post_ID) VALUES ('Hahaha', 3, 3);
INSERT mydb.Comment (Comment, User_User_ID, Post_Post_ID) VALUES ('Miss you ma', 4, 4);
INSERT mydb.Comment (Comment, User_User_ID, Post_Post_ID) VALUES ('Come back soon!', 5, 1);
INSERT mydb.Comment (Comment, User_User_ID, Post_Post_ID) VALUES ('Congratulations', 1, 2);
INSERT mydb.Comment (Comment, User_User_ID, Post_Post_ID) VALUES ('That was too good', 6, 3);
INSERT mydb.Comment (Comment, User_User_ID, Post_Post_ID) VALUES ('Great Wi', 7, 1);
INSERT mydb.Comment (Comment, User_User_ID, Post_Post_ID) VALUES ('Liverpool is a joke', 2, 3);
INSERT mydb.Comment (Comment, User_User_ID, Post_Post_ID) VALUES ('Pep is a cheat', 8, 4);



INSERT mydb.Group(Name, Description, Created_at, Updated_at) VALUES ('USA_Football', 'Closed Group of 250', '2014-10-24', '2015-09-08');
INSERT mydb.Group(Name, Description, Created_at, Updated_at) VALUES ('Spain_Football', 'Closed Group of 360', '2015-10-15', '2016-09-08');
INSERT mydb.Group(Name, Description, Created_at, Updated_at)VALUES ('Boston Foodies', 'Open group', '2013-12-13', '2015-07-08');
INSERT mydb.Group(Name, Description, Created_at, Updated_at) VALUES ('MA Hikes', 'Open Group', '2014-07-24', '2015-01-08');
INSERT mydb.Group(Name, Description, Created_at, Updated_at) VALUES ('Cooks for childre', 'Closed Group of 47', '2015-10-21', '2015-11-21');
INSERT mydb.Group(Name, Description, Created_at, Updated_at) VALUES ('Data Students', 'Closed Group of 400', '2015-01-08', '2015-01-08');
INSERT mydb.Group(Name, Description, Created_at, Updated_at) VALUES ('Northeastern Housing', 'Closed Group of 2400', '2014-10-24', '2015-09-08');
INSERT mydb.Group(Name, Description, Created_at, Updated_at) VALUES ('Iowa Hawkeyes', 'Open Group', '2012-06-22', '2013-03-08');
INSERT mydb.Group(Name, Description, Created_at, Updated_at) VALUES ('Yankee Candles', 'Open Group', '2012-03-12', '2014-04-08');
INSERT mydb.Group(Name, Description, Created_at, Updated_at)VALUES ('Wine Tasting Bosto', 'Open Group', '2013-05-13', '2015-05-08');


INSERT mydb.Group_User (Group_Group_ID, User_User_ID) VALUES (1,2);
INSERT mydb.Group_User (Group_Group_ID, User_User_ID) VALUES (2,3);
INSERT mydb.Group_User (Group_Group_ID, User_User_ID) VALUES (3,1);
INSERT mydb.Group_User (Group_Group_ID, User_User_ID) VALUES (1,4);
INSERT mydb.Group_User (Group_Group_ID, User_User_ID) VALUES (2,5);
INSERT mydb.Group_User (Group_Group_ID, User_User_ID) VALUES (3,6);
INSERT mydb.Group_User (Group_Group_ID, User_User_ID) VALUES (4,7);
INSERT mydb.Group_User (Group_Group_ID, User_User_ID) VALUES (1,8);
INSERT mydb.Group_User (Group_Group_ID, User_User_ID) VALUES (4,9);
INSERT mydb.Group_User (Group_Group_ID, User_User_ID) VALUES (2,10);


INSERT mydb.Group_post(User_User_ID, Post_Post_ID) VALUES (1,1);
INSERT mydb.Group_post(User_User_ID, Post_Post_ID) VALUES (2,2);
INSERT mydb.Group_post(User_User_ID, Post_Post_ID) VALUES (3,3);
INSERT mydb.Group_post(User_User_ID, Post_Post_ID) VALUES (4,4);
INSERT mydb.Group_post(User_User_ID, Post_Post_ID) VALUES (5,5);
INSERT mydb.Group_post(User_User_ID, Post_Post_ID) VALUES (6,6);
INSERT mydb.Group_post(User_User_ID, Post_Post_ID) VALUES (7,7);
INSERT mydb.Group_post(User_User_ID, Post_Post_ID) VALUES (8,8);
INSERT mydb.Group_post(User_User_ID, Post_Post_ID) VALUES (9,9);
INSERT mydb.Group_post(User_User_ID, Post_Post_ID) VALUES (10,10);


INSERT mydb.Follow(Follower_User_ID, Followind_User_ID) VALUES (1,2);
INSERT mydb.Follow(Follower_User_ID, Followind_User_ID) VALUES (2,3);
INSERT mydb.Follow(Follower_User_ID, Followind_User_ID) VALUES (3,6);
INSERT mydb.Follow(Follower_User_ID, Followind_User_ID) VALUES (4,1);
INSERT mydb.Follow(Follower_User_ID, Followind_User_ID) VALUES (5,1);
INSERT mydb.Follow(Follower_User_ID, Followind_User_ID) VALUES (6,5);
INSERT mydb.Follow(Follower_User_ID, Followind_User_ID) VALUES (7,8);
INSERT mydb.Follow(Follower_User_ID, Followind_User_ID) VALUES (8,10);
INSERT mydb.Follow(Follower_User_ID, Followind_User_ID) VALUES (9,3);
INSERT mydb.Follow(Follower_User_ID, Followind_User_ID) VALUES (10,4);


INSERT mydb.Message (Text, User_User_ID, Sender_User_ID) VALUES ('Hey', 1, 4);
INSERT mydb.Message (Text, User_User_ID, Sender_User_ID) VALUES ('Hello', 2,1);
INSERT mydb.Message (Text, User_User_ID, Sender_User_ID) VALUES ('Whatsup', 3,2);
INSERT mydb.Message (Text, User_User_ID, Sender_User_ID) VALUES ('Check this out!', 4,1);
INSERT mydb.Message (Text, User_User_ID, Sender_User_ID) VALUES ('Bye', 5,2);
INSERT mydb.Message (Text, User_User_ID, Sender_User_ID) VALUES ('Take Care', 6,8);
INSERT mydb.Message (Text, User_User_ID, Sender_User_ID) VALUES ('Goodnight', 7,10);
INSERT mydb.Message (Text, User_User_ID, Sender_User_ID) VALUES ('I love you so much', 8,1);
INSERT mydb.Message (Text, User_User_ID, Sender_User_ID) VALUES ('Yeah sure', 9,2);
INSERT mydb.Message (Text, User_User_ID, Sender_User_ID) VALUES ('You should go',10,5);
INSERT mydb.Message (Text, User_User_ID, Sender_User_ID) VALUES ('So beautiful!', 2,1);
INSERT mydb.Message (Text, User_User_ID, Sender_User_ID) VALUES ('Probably not', 3,4);
INSERT mydb.Message (Text, User_User_ID, Sender_User_ID) VALUES ('Yep!!',6,4);


DELETE FROM mydb.Message WHERE Message_ID=13;


DELIMITER $$ 

CREATE FUNCTION most_messages (Usr_ID INT)
RETURNS VARCHAR(40)
DETERMINISTIC
BEGIN
	DECLARE rcvr_name VARCHAR(500);
	SET rcvr_name = (SELECT Reciever FROM 
    (SELECT COUNT(*) as count, Reciever
    FROM (SELECT c.User_User_ID as Reciever_ID, a.FirstName as Reciever, c.Text
	FROM mydb.Message as c
	INNER JOIN mydb.User as a ON a.User_ID = c.User_User_ID
	WHERE c.Sender_User_ID = Usr_ID) as d
    GROUP BY Reciever_ID
    ORDER BY count LIMIT 1) as e);
    
    RETURN rcvr_name;
    
END

$$ DELIMITER ;

SELECT most_messages(1);
SELECT most_messages(5);


DELIMITER $$ 

CREATE PROCEDURE group_members(IN grp_id INT) 
  BEGIN
  
SELECT a.FirstName as First_Name, a.LastName as Last_Name
FROM mydb.Group_User as c
INNER JOIN mydb.Group as b ON b.Group_ID = c.Group_Group_ID
INNER JOIN mydb.User as a ON a.User_ID = c.User_User_ID
Where b.Group_ID = grp_id;
 END

$$ DELIMITER ;

CALL group_members(3);
CALL group_members(1);


DELIMITER $$ 

CREATE PROCEDURE post_likes(IN pst_id INT) 
  BEGIN
  
SELECT a.FirstName, a.LastName FROM mydb.Like as b
INNER JOIN mydb.User as a ON a.User_ID = b.User_User_ID WHERE b.Post_Post_ID = pst_id;

 END

$$ DELIMITER ;

CALL post_likes(3);
CALL post_likes(2);

DROP EVENT 

DELIMITER $$ 

 CREATE EVENT birthday_wishes
    ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 DAY
    DO INSERT INTO Notification (Text, created_at, From_user_Id, To_User_ID)
    SELECT 'Happy birthday to you!', NOW(), User_ID, User_ID FROM mydb.User WHERE DATE_FORMAT(User.DOB,'%m-%d') =  DATE_FORMAT(NOW(),'%m-%d')
    
$$ DELIMITER ;

