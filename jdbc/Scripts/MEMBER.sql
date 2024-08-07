DROP SEQUENCE SEQ_MEMBER;
CREATE SEQUENCE SEQ_MEMBER;

DROP TABLE TBL_MEMBER;
CREATE TABLE TBL_MEMBER(
   ID NUMBER CONSTRAINT PK_MEMBER PRIMARY KEY,
   MEMBER_EMAIL VARCHAR2(255) NOT NULL,
   MEMBER_PASSWORD VARCHAR2(255) NOT NULL,
   MEMBER_NAME VARCHAR2(255) NOT NULL,
   MEMBER_AGE NUMBER DEFAULT 0,
   MEMBER_GENDER NUMBER DEFAULT 3,
   CREATED_DATE DATE DEFAULT SYSDATE,
   UPDATED_DATE DATE DEFAULT SYSDATE
);

SELECT * FROM TBL_MEMBER;

INSERT INTO TBL_MEMBER
(ID, MEMBER_EMAIL, MEMBER_PASSWORD, MEMBER_NAME, MEMBER_AGE, MEMBER_GENDER, CREATED_DATE, UPDATED_DATE)
VALUES(SEQ_MEMBER.NEXTVAL, 'hgd@gamil.com', 'hdg1423', '홍길동', 22, 2, SYSDATE, SYSDATE
);

SELECT ID, POST_TITLE, POST_CONTENT, MEMBER_ID, CREATED_DATE, UPDATED_DATE
FROM TBL_POST;

CREATE TABLE TBL_POST(
	ID NUMBER CONSTRAINT PK_POST PRIMARY KEY,
	POST_TITLE VARCHAR2(255) NOT NULL,
	POST_CONTENT VARCHAR2(255) NOT NULL,
	MEMBER_ID NUMBER,
	CREATED_DATE DATE DEFAULT SYSDATE,
	UPDATED_DATE DATE DEFAULT SYSDATE,
	CONSTRAINT FK_POST_MEMBER FOREIGN KEY(MEMBER_ID)
	REFERENCES TBL_MEMBER (ID)
);


/***************************************************************************/
CREATE SEQUENCE SEQ_REPLY;

SELECT ID, REPLY_CONTENT, POST_ID, MEMBER_ID, CREATED_DATE, UPDATED_DATE
FROM TBL_REPLY;

CREATE TABLE TBL_REPLY(
	ID NUMBER CONSTRAINT PK_REPLY PRIMARY KEY,
	REPLY_CONTENT VARCHAR2(255) NOT NULL,
	POST_ID NUMBER,
	MEMBER_ID NUMBER,
	CREATED_DATE DATE DEFAULT SYSDATE,
	UPDATED_DATE DATE DEFAULT SYSDATE,
	CONSTRAINT FK_REPLY_POST FOREIGN KEY(POST_ID)
	REFERENCES TBL_POST(ID),
	CONSTRAINT FK_REPLY_MEMBER FOREIGN KEY(MEMBER_ID)
	REFERENCES TBL_MEMBER(ID)
);

CREATE SEQUENCE SEQ_LIKEBTN;

SELECT ID, RECEIVE_POST_ID, SENDER_ID
FROM TBL_LIKEBTN;

CREATE TABLE TBL_LIKEBTN(
	ID NUMBER CONSTRAINT PK_LIKEBTN PRIMARY KEY,
	RECEIVE_POST_ID NUMBER,
	SENDER_ID NUMBER,
	CONSTRAINT FK_LIKEBTN_POST FOREIGN KEY(RECEIVE_POST_ID)
	REFERENCES TBL_POST(ID),
	CONSTRAINT FK_LIKEBTN_MEMBER FOREIGN KEY(SENDER_ID)
	REFERENCES TBL_MEMBER(ID)
);

CREATE SEQUENCE SEQ_ANNOUNCEMENT;

CREATE TABLE TBL_ANNOUNCEMENT(
	ID NUMBER CONSTRAINT PK_ANNOUNCEMENT PRIMARY KEY,
	ANNOUNCEMENT_TITLE VARCHAR2(255) NOT NULL,
	ANNOUNCEMENT_CONTENT VARCHAR2(255) NOT NULL,
	ANNOUNCEMENT_ID NUMBER,
	CREATED_DATE DATE DEFAULT SYSDATE,
	UPDATED_DATE DATE DEFAULT SYSDATE,
	CONSTRAINT FK_ANNOUNCEMENT_MEMBER FOREIGN KEY(ANNOUNCEMENT_ID)
	REFERENCES TBL_MEMBER(ID)
);