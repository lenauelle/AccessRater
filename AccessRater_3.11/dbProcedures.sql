{\rtf1\ansi\ansicpg1252\cocoartf1187\cocoasubrtf400
{\fonttbl\f0\fmodern\fcharset0 Courier;}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab720
\pard\pardeftab720

\f0\fs24 \cf0 /*\
Name: dbProcedures.sql\
Date Created: 04 November 2013\
Last Modified: 10 November 2013\
\
Description: A script to define database procedures for AccessRater\
*/\
\
/*\
Description: Validates that a user's password matches that associated with their user name\
Precondition: The user has a registered account\
Postcondition: Sends the user's aid to the web server, if the password/user name combination is incorrect returns null\
*/\
CREATE PROCEDURE checkPword(IN name CHAR(20), IN pword CHAR(20))\
	RETURN\
		SELECT u.aid\
		FROM user_account u\
		WHERE name = u.name\
		AND pword = u.pword\
\
/*\
Description: When a user has forgotten their password, gets the users security question question\
Precondition: The user has a registered account\
Postcondition: Sends the user their security question, if the user name does not exist returns null\
*/\
CREATE PROCEDURE promptQuestion(IN name CHAR(20))\
	RETURN\
		SELECT u.security_question\
		FROM user_account u\
		WHERE name = u.name\
\
/*\
Description: When a user has forgotten their password, checks the answer to the security question against the stored answer\
Precondition: The user has been prompted with the security question\
Postcondition: If the answer is correct sends back the password, if the answer is incorrect sends back 'incorrect answer'\
*/\
CREATE PROCEDURE answerQuestion(IN name CHAR(20), IN answer CHAR(20))\
	DECLARE incorrect CHAR(16)\
	SET incorrect = 'Incorrect Answer'\
	IF answer = \
		SELECT u.answer\
		FROM user_account u\
		WHERE name = u.name\
	THEN RETURN \
		SELECT u2.pword\
		FROM user_account u2\
		WHERE name = u2.name\
	ELSE RETURN incorrect\
	END IF\
\
	\
/*\
Description: Changes the user's password to a new, specified value\
Precondition: The user is logged into the application\
Postcondition: The database holds the new password and does not hold the old password\
*/\
CREATE PROCEDURE changePword(IN aid INT, IN pword CHAR(20))\
	UPDATE user_account u\
		SET u.pword = pword\
		WHERE aid = u.aid\
\
/*\
Description: Creates a new account and returns true if successful\
Precondition: The user name does not already exist\
Postcondition: The new account is created, returns true if successful, false if the user name already exists\
*/\
CREATE PROCEDURE newAccount(IN name CHAR(20), IN pword CHAR(20), IN security_question CHAR(25), IN answer CHAR(20))\
	DECLARE valid BIT\
	SET valid = 0\
	IF name =\
		SELECT u.name\
		FROM user_account u\
		WHERE u.name = name\
	THEN valid = 0\
	ELSE valid = 1\
		INSERT INTO user_account\
			VALUES (name, pword, security_question, answer)\
	END IF\
	RETURN valid\
\
/*\
Description: Retrieves a location id for a given coordinate set\
Precondition: The location has already been added into the database\
Postcondition: Returns the lid if it exists, returns null if it does not\
*/\
CREATE PROCEDURE search(IN latitude FLOAT, IN longitude FLOAT)\
	RETURN\
		SELECT l.lid\
		FROM location l\
		WHERE latitude = l.latitude\
		AND longitude = l.longitude\
\
/*\
Description: Get a list of rating ids associated with a given location\
Precondition: The location has already been added into the database\
Postcondition: Returns a cursor with the set of ratings if it exists, returns null if it does not\
*/\
/* CREATE PROCEDURE getRating(IN lid INT) not implemented as a procedure, called as a script from server */\
\
/*\
Description: Returns the contents of a specified rating\
Precondition: The rating has already been added into the database\
*/\
CREATE PROCEDURE retrieveRating(IN lid INT, IN rid INT)\
	RETURN\
		SELECT aid, total,\
			/* data */\
			signage, s1, s2, s3,\
			parking, p1, p2, p3, p4,\
			exterior_access, ea1, ea2,\
			doors, d1, d2, d3, d4, d5,\
			elevator, e1, e2, e3, e4, e5, e6, e7,\
			stairs, s1, s2, s3, s4, s5,\
			washrooms, w1, w2, w3, w4, w5, w6, w7\
		FROM rating r\
		WHERE r.lid = lid\
		AND r.rid = rid\
\
/*\
Description: Get a list of comment ids associated with a given location\
Precondition: The location has already been added into the database\
Postcondition: Returns a cursor with the set of comments if it exists and there are comments, else returns null\
*/\
/* CREATE PROCEDURE getComment(IN lid INT) not implemented as a procedure, called as a script from server */\
\
/*\
Description: Returns a specific comment\
Precondition: The comment has already been added into the database\
*/\
CREATE PROCEDURE retrieveComment(IN lid INT, IN cid INT)\
	RETURN\
		SELECT c.text\
		FROM comments c\
		WHERE c.lid = lid\
		AND c.cid = cid\
\
/*\
Description: Get a list of photo ids associated with a given location\
Precondition: The location has already been added into the database\
Postcondition: Returns a cursor with the set of photos if it exists and there are photos, else returns null\
*/\
/* CREATE PROCEDURE getPhoto(IN lid INT) not implemented as a procedure, called as a script from server */\
\
/*\
Description: Returns the url of a specific photo\
Precondition: The url for the photo has already been added into the database\
*/\
CREATE PROCEDURE retrievePhoto(IN lid INT, IN pid INT)\
	RETURN\
		SELECT p.photo\
		FROM photo p\
		WHERE p.lid = lid\
		AND p.pid = pid\
\
/*\
Description: Enters a new location into the database as well as its first rating.\
Precondition: A user has entered data for a location and a rating for that location on the application.\
Postcondition: The location and its first rating available on the database\
*/\
CREATE PROCEDURE newLocation(IN latitude FLOAT, IN longitude FLOAT, IN address CHAR(100), IN aid INT,\
	/* data */\
	IN total INT,\
	IN s1 CHAR(1), IN s2 CHAR(1), IN s3 CHAR(1),\
	IN parking INT, IN p1 CHAR(1), IN p2 CHAR(1), IN p3 CHAR(1), IN p4 CHAR(1),\
	IN exterior_access INT, IN ea1 CHAR(1), IN ea2 CHAR(1),\
	IN doors INT, IN d1 CHAR(1), IN d2 CHAR(1), IN d3 CHAR(1), IN d4 CHAR(1), IN d5 CHAR(1),\
	IN elevator INT, IN e1 CHAR(1), IN e2 CHAR(1), IN e3 CHAR(1), IN e4 CHAR(1), IN e5 CHAR(1), IN e6 CHAR(1), IN e7 CHAR(1),\
	IN stairs INT, IN s1 INT, IN s2 CHAR(1), IN s3 CHAR(1), IN s4 CHAR(1), IN s5 CHAR(1),\
	IN washrooms INT, IN w1 CHAR(1), IN w2 CHAR(1), IN w3 CHAR(1), IN w4 CHAR(1), IN w5 CHAR(1), IN w6 CHAR(1), IN w7 CHAR(1))\
	INSERT INTO location\
		VALUES (latitude, longitude, address)\
	INSERT INTO rating\
		VALUES ((SELECT l.lid\
			FROM location l\
			WHERE l.latitude = latitude\
			AND l.longitude = longitude), aid, total,\
			/* data */\
			signage, s1, s2, s3,\
			parking, p1, p2, p3, p4,\
			exterior_access, ea1, ea2,\
			doors, d1, d2, d3, d4, d5,\
			elevator, e1, e2, e3, e4, e5, e6, e7,\
			stairs, s1, s2, s3, s4, s5,\
			washrooms, w1, w2, w3, w4, w5, w6, w7)\
\
/*\
Description: Enters a new rating into the database\
Precondition: A user has entered data for a rating and the location already exists in the database\
Postcondition: The rating is available on the database\
*/\
CREATE PROCEDURE newRating(IN lid INT, IN aid INT, \
	/* data */\
	IN total INT,\
	IN s1 CHAR(1), IN s2 CHAR(1), IN s3 CHAR(1),\
	IN parking INT, IN p1 CHAR(1), IN p2 CHAR(1), IN p3 CHAR(1), IN p4 CHAR(1),\
	IN exterior_access INT, IN ea1 CHAR(1), IN ea2 CHAR(1),\
	IN doors INT, IN d1 CHAR(1), IN d2 CHAR(1), IN d3 CHAR(1), IN d4 CHAR(1), IN d5 CHAR(1),\
	IN elevator INT, IN e1 CHAR(1), IN e2 CHAR(1), IN e3 CHAR(1), IN e4 CHAR(1), IN e5 CHAR(1), IN e6 CHAR(1), IN e7 CHAR(1),\
	IN stairs INT, IN s1 INT, IN s2 CHAR(1), IN s3 CHAR(1), IN s4 CHAR(1), IN s5 CHAR(1),\
	IN washrooms INT, IN w1 CHAR(1), IN w2 CHAR(1), IN w3 CHAR(1), IN w4 CHAR(1), IN w5 CHAR(1), IN w6 CHAR(1), IN w7 CHAR(1))\
	INSERT INTO ratings\
		VALUES (lid, aid, total,\
			/* data */\
			signage, s1, s2, s3,\
			parking, p1, p2, p3, p4,\
			exterior_access, ea1, ea2,\
			doors, d1, d2, d3, d4, d5,\
			elevator, e1, e2, e3, e4, e5, e6, e7,\
			stairs, s1, s2, s3, s4, s5,\
			washrooms, w1, w2, w3, w4, w5, w6, w7)\
\
/*\
Description: Enters a new photo URL into the database\
Precondition: A user has uploaded a picture to the server and the location already exists in the database\
Postcondition: The photo URL is available on the database\
*/\
CREATE PROCEDURE newPhoto(IN lid INT, IN aid INT, IN photo CHAR(400))\
	INSERT INTO photo\
		VALUES (lid, aid, photo)\
\
/*\
Description: Enters a new comment into the database\
Precondition: A user has entered the comment into the application and the location already exists in the database\
Postcondition: The comment is available on the database\
*/\
CREATE PROCEDURE newComment(IN lid INT, IN rid INT, IN text CHAR(500))\
	INSERT INTO comments\
		VALUES (lid, rid, text)\
}