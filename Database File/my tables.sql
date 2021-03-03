create table sme_profile(
  name varchar(255) NOT NULL,
  email varchar(255)primary key,
  phone bigint(20),
  password varchar(255) NOT NULL,
  pincode Text,
  postal_addr Varchar(200),
  categoryname varchar(100),
  experience int(2),
  skillset Varchar(200),
  sme_cert text,
  sme_language text,
  webinars boolean,
  sme_fees int,
  mode_of_cons text,
  photo_loc text,
  resume_loc text,
  review_rating double,
  FOREIGN KEY(categoryname) REFERENCES category(categoryname)
);


create table sme_answer(
id int AUTO_INCREMENT primary key,
questionid int references userquestion (questionid),
answered_by varchar(255)references sme_profile (email),
answer text
);


create table consultation_slots(
ID int AUTO_INCREMENT PRIMARY KEY,
sme_email varchar(255)references sme_profile(email),
client_email varchar(100)references user(email) ,
questionid int(11)references userquestion(questionid),
mode_of_cons text,
slot1_date date,
slot1_from_time time,
slot1_to_time time,
slot2_date date,
slot2_from_time time,
slot2_to_time time,
slot3_date date,
slot3_from_time time,
slot3_to_time time
);

create table sme_webinar(
webinar_id int AUTO_INCREMENT PRIMARY KEY,
sme_email varchar(255) references sme_profile(email),
webinar_topic varchar(255),
webinar_desc varchar(255),
who_attend varchar(255),
key_takeaways varchar(255),
webinar_fees int,
webinar_date date,
webinar_from_time time,
webinar_to_time time,
course_image text
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



create table testimonial(
testimonial_id int(10) primary key auto_increment,
sme_email varchar(255)references sme_profile(email),
att_photo text,
att_audio text,
att_name text,
att_desig text,
testimony text
);




create table chatbot_data (
id int primary key auto_increment,
user_type text,
name text,
email text,
category text,
request_detail text
);

create table followup{
id int(11) primary key auto_increment,
consultationid int(11) references consultation(consultationid),
followup_date text,
starttime text,
endtime text
}
