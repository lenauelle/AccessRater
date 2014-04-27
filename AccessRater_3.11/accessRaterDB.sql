{\rtf1\ansi\ansicpg1252\cocoartf1187\cocoasubrtf400
{\fonttbl\f0\fmodern\fcharset0 Courier;}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab720
\pard\pardeftab720

\f0\fs24 \cf0 /*\
Name: accessRaterDB.sql\
Created: 31 October 2013\
Last Modified: 10 November 2013\
\
Description: A script to construct database tables for AccessRater\
*/\
\
CREATE TABLE location (\
	lid INT AUTO_INCREMENT,\
	latitude FLOAT,\
	longitude FLOAT,\
	address CHAR(100),\
	PRIMARY KEY (lid)\
)\
\
CREATE TABLE rating (\
	rid INT AUTO_INCREMENT,\
	lid INT, \
	aid INT,\
	/* data */\
	total INT,\
	signage INT,\
	s1 CHAR(1),\
	s2 CHAR(1),\
	s3 CHAR(1),\
	parking INT,\
	p1 CHAR(1),\
	p2 CHAR(1),\
	p3 CHAR(1),\
	p4 CHAR(1),\
	exterior_access INR,\
	ea1 CHAR(1),\
	ea2 CHAR(1),\
	doors INT,\
	d1 CHAR(1),\
	d2 CHAR(1),\
	d3 CHAR(1),\
	d4 CHAR(1),\
	d5 CHAR(1),\
	elevator INT,\
	e1 CHAR(1),\
	e2 CHAR(1),\
	e3 CHAR(1),\
	e4 CHAR(1),\
	e5 CHAR(1),\
	e6 CHAR(1),\
	e7 CHAR(1),\
	stairs INT,\
	s1 INT,\
	s2 CHAR(1),\
	s3 CHAR(1),\
	s4 CHAR(1),\
	s5 CHAR(1),\
	washrooms INT,\
	w1 CHAR(1),\
	w2 CHAR(1),\
	w3 CHAR(1),\
	w4 CHAR(1),\
	w5 CHAR(1),\
	w6 CHAR(1),\
	w7 CHAR(1),\
	\
	PRIMARY KEY (lid, rid),\
	FOREIGN KEY (lid) REFERENCES location(lid)\
		ON DELETE CASCADE\
	FOREIGN KEY (aid) REFERENCES user_account(aid)\
		/* ON DELETE SET NULL */\
)\
\
CREATE TABLE photo (\
	pid INT AUTO_INCREMENT,\
	lid INT,\
	aid INT,\
	photo CHAR(400), /* url for the photo on server */\
	PRIMARY KEY (lid, pid),\
	FOREIGN KEY (lid) REFERENCES location(lid)\
		ON DELETE CASCADE\
	FOREIGN KEY (aid) REFERENCES user_account(aid)\
		/* ON DELETE SET NULL */\
)\
\
CREATE TABLE user_account (\
	aid INT AUTO_INCREMENT,\
	name CHAR(20),\
	pword CHAR(20),\
	security_question CHAR(25),\
	answer CHAR(20),\
	PRIMARY KEY (aid),\
)\
\
CREATE TABLE comments (\
	cid INT AUTO_INCREMENT,\
	lid INT,\
	aid INT,\
	text CHAR(500),\
	PRIMARY KEY (lid, aid, cid),\
	FOREIGN KEY (aid) REFERENCES user_account(aid),\
		/* ON DELETE SET NULL */\
	FOREIGN KEY (lid) REFERENCES location(lid)\
		ON DELETE CASCADE\
)\
}