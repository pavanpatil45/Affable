-- User Table
create table `user` (
	email varchar(100),
	name varchar(100) not null,
	phoneNumber varchar(10),
	password varchar(255) not null,
	verified int(1) not null,
	vkey varchar(255),
	primary key(email)
);

-- Category Table
create table category (
	categoryName varchar(100),
	description varchar(200) not null,
	primary key(categoryName)
);

-- UserQuestion Table
create table userquestion (
	questionid int auto_increment,
	category varchar(100),
	topic text not null,
	question text not null,
	email varchar(100),
	status varchar(100),
	primary key(questionid),
	foreign key (category) references category(categoryName)
);

-- Consultation Table
CREATE TABLE consultation (
	consultationId int AUTO_INCREMENT,
	clientEmailId varchar(100),
	smeEmailId varchar(100),
	questionId int,
	mode text,
	`date` date,
	fromTime time,
	toTime time,
	status varchar(100),
	PRIMARY KEY (consultationId),
	FOREIGN KEY (clientEmailId) REFERENCES user(email),
	FOREIGN KEY (smeEmailId) REFERENCES sme_profile(email),
	FOREIGN KEY (questionId) REFERENCES userquestion(questionid)
);

-- Declined Requests Table
CREATE TABLE declined_requests (
	declineId int AUTO_INCREMENT,
	questionid int,
	sme_email varchar(100),
	PRIMARY KEY (declineId),
	FOREIGN KEY (questionid) REFERENCES userquestion(questionid),
	FOREIGN KEY (sme_email) REFERENCES sme_profile(email)
);

-- Cancelled Consultations Table
CREATE table cancelled_consultations (
	cancelid int AUTO_INCREMENT,
    questionid int,
    sme_email varchar(100),
    reason text,
    PRIMARY KEY (cancelid),
    FOREIGN KEY (questionid) REFERENCES userquestion(questionid),
    FOREIGN KEY (sme_email) REFERENCES sme_profile(email)
);

-- Messages Table
CREATE TABLE messages (
	msgid int AUTO_INCREMENT,
	senderid varchar(100),
	recieverid varchar(100),
	questionid int,
	message text,
	isFile int(1),
	date_time datetime,
	PRIMARY KEY (msgid),
	FOREIGN KEY (questionid) REFERENCES userquestion(questionid)
);

-- Attachments Table
CREATE TABLE attachments (
	fileid int AUTO_INCREMENT,    
	msgid int,
	filename text,
	tempname text,
	PRIMARY KEY (fileid),
	FOREIGN KEY (msgid) REFERENCES messages(msgid)
);

-- Chats count Table
CREATE TABLE chats_count (
	chatid int AUTO_INCREMENT,
	user1id varchar(100),
	user2id varchar(100),
	questionid int,
	msgCount int,
	user1ClrCount int,
	user2ClrCount int,
	PRIMARY KEY (chatid),
	FOREIGN KEY (questionid) REFERENCES userquestion(questionid)
);



-- Category Table Sample Data
insert into category(categoryName, description) values('RealEstate', 'Civil, Construction, Land Disputes, Residential Complex');
insert into category(categoryName, description) values('IT', 'Software, Hardware, Training');
insert into category(categoryName, description) values('Health and Fitness', 'Physical Health, Mental Health, Therapies');
insert into category(categoryName, description) values('Entrepreneurship', 'Company laws, Legal matters, Mentorship');
insert into category(categoryName, description) values('Others', 'Psychology, art, sports');
