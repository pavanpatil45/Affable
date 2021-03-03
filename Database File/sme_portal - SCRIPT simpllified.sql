

--DATABASE NAME - sme_portal 


CREATE TABLE attachments (
  fileid int(11) NOT NULL,
  msgid int(11),
  filename text,
  tempname text
);

-- --------------------------------------------------------

--
-- Table structure for table cancelled_consultations
--

CREATE TABLE cancelled_consultations (
  cancelid int(11) NOT NULL,
  questionid int(11),
  sme_email varchar(100),
  reason text
);

-- --------------------------------------------------------

--
-- Table structure for table category
--

CREATE TABLE category (
  categoryName varchar(100) NOT NULL,
  description varchar(200) NOT NULL
);

--
-- Dumping data for table category
--

INSERT INTO category (categoryName, description) VALUES
('Entrepreneurship', 'Company laws, Legal matters, Mentorship'),
('Health and Fitness', 'Physical Health, Mental Health, Therapies'),
('IT', 'Software, Hardware, Training'),
('Others', 'Psychology, art, sports'),
('RealEstate', 'Civil, Construction, Land Disputes, Residential Complex');

-- --------------------------------------------------------

--
-- Table structure for table chatbot_data
--

CREATE TABLE chatbot_data (
  id int(11) NOT NULL,
  user_type text,
  name text,
  email text,
  category text,
  request_details text
);

-- --------------------------------------------------------

--
-- Table structure for table chats_count
--

CREATE TABLE chats_count (
  chatid int(11) NOT NULL,
  user1id varchar(100),
  user2id varchar(100),
  questionid int(11),
  msgCount int(11),
  user1ClrCount int(11),
  user2ClrCount int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table consultation
--

CREATE TABLE consultation (
  consultationId int(11) NOT NULL,
  clientEmailId varchar(100),
  smeEmailId varchar(100),
  questionId int(11),
  mode text,
  date date,
  fromTime time,
  toTime time,
  status varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table consultation_slots
--

CREATE TABLE consultation_slots (
  ID int(11) NOT NULL,
  sme_email varchar(255),
  client_email varchar(100),
  questionid int(11),
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


-- --------------------------------------------------------

--
-- Table structure for table declined_requests
--

CREATE TABLE declined_requests (
  declineId int(11) NOT NULL,
  questionid int(11),
  sme_email varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table followup
--

CREATE TABLE followup (
  followupid int(11) NOT NULL,
  followup_date text,
  starttime text,
  endtime text,
  consultationid int(11),
  sme_email varchar(100),
  client_email varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table forgot_password
--

CREATE TABLE forgot_password (
  email varchar(200) NOT NULL,
  temp_key varchar(200) NOT NULL,
  created timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);

-- --------------------------------------------------------

--
-- Table structure for table messages
--

CREATE TABLE messages (
  msgid int(11) NOT NULL,
  senderid varchar(100),
  recieverid varchar(100),
  questionid int(11),
  message text,
  isFile int(1),
  date_time datetime
);

-- --------------------------------------------------------

--
-- Table structure for table sme_answer
--

CREATE TABLE sme_answer (
  id int(11) NOT NULL,
  questionid int(11),
  answered_by varchar(255),
  answer text
);

-- --------------------------------------------------------

--
-- Table structure for table sme_profile
--

CREATE TABLE sme_profile (
  name varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  phone bigint(20),
  password varchar(255) NOT NULL,
  verified int(1) NOT NULL,
  vkey varchar(255),
  pincode text,
  postal_addr varchar(200),
  categoryname varchar(100),
  experience int(2),
  skillset varchar(200),
  sme_cert text,
  sme_language text,
  webinars varchar(5),
  sme_fees int(11),
  mode_of_cons text,
  photo_loc text,
  resume_loc text,
  review_rating double,
  ID int(5) NOT NULL,
  sme_code varchar(20) NOT NULL,
  sme_designation text,
  about_sme text
);


-- --------------------------------------------------------

--
-- Table structure for table sme_webinar
--

CREATE TABLE sme_webinar (
  webinar_id int(11) NOT NULL,
  webinar_topic varchar(255),
  webinar_desc varchar(255),
  who_attend varchar(255),
  key_takeaways varchar(255),
  webinar_fees int(11),
  webinar_date date,
  webinar_from_time time,
  webinar_to_time time,
  sme_email varchar(255),
  course_image text,
  webinar_venue text
);


-- --------------------------------------------------------

--
-- Table structure for table testimonial
--

CREATE TABLE testimonial (
  testimonial_id int(10) NOT NULL,
  sme_email varchar(255),
  att_photo text,
  att_audio text,
  att_name text,
  att_desig text,
  testimony text
);

-- --------------------------------------------------------

--
-- Table structure for table user
--

CREATE TABLE user (
  email varchar(100) NOT NULL,
  name varchar(100) NOT NULL,
  phoneNumber varchar(10),
  password varchar(255) NOT NULL,
  verified int(1) NOT NULL,
  vkey varchar(255)
);


-- --------------------------------------------------------

--
-- Table structure for table userquestion
--

CREATE TABLE userquestion (
  questionid int(11) NOT NULL,
  category varchar(100),
  topic text NOT NULL,
  question text NOT NULL,
  email varchar(100),
  status varchar(100)
);



--#############################################################################################################


--
-- Indexes for dumped tables
--

--
-- Indexes for table attachments
--
ALTER TABLE attachments
  ADD PRIMARY KEY (fileid),
  ADD KEY msgid (msgid);

--
-- Indexes for table cancelled_consultations
--
ALTER TABLE cancelled_consultations
  ADD PRIMARY KEY (cancelid),
  ADD KEY questionid (questionid),
  ADD KEY sme_email (sme_email);

--
-- Indexes for table category
--
ALTER TABLE category
  ADD PRIMARY KEY (categoryName);

--
-- Indexes for table chatbot_data
--
ALTER TABLE chatbot_data
  ADD PRIMARY KEY (id);

--
-- Indexes for table chats_count
--
ALTER TABLE chats_count
  ADD PRIMARY KEY (chatid),
  ADD KEY questionid (questionid);

--
-- Indexes for table consultation
--
ALTER TABLE consultation
  ADD PRIMARY KEY (consultationId),
  ADD KEY clientEmailId (clientEmailId),
  ADD KEY smeEmailId (smeEmailId),
  ADD KEY questionId (questionId);

--
-- Indexes for table consultation_slots
--
ALTER TABLE consultation_slots
  ADD PRIMARY KEY (ID);

--
-- Indexes for table declined_requests
--
ALTER TABLE declined_requests
  ADD PRIMARY KEY (declineId),
  ADD KEY questionid (questionid),
  ADD KEY sme_email (sme_email);

--
-- Indexes for table followup
--
ALTER TABLE followup
  ADD PRIMARY KEY (followupid);

--
-- Indexes for table forgot_password
--
ALTER TABLE forgot_password
  ADD KEY forget_password_ibfk_1 (email);

--
-- Indexes for table messages
--
ALTER TABLE messages
  ADD PRIMARY KEY (msgid),
  ADD KEY questionid (questionid);

--
-- Indexes for table sme_answer
--
ALTER TABLE sme_answer
  ADD PRIMARY KEY (id);

--
-- Indexes for table sme_profile
--
ALTER TABLE sme_profile
  ADD PRIMARY KEY (email),
  ADD UNIQUE KEY ID (ID),
  ADD KEY categoryname (categoryname);

--
-- Indexes for table sme_webinar
--
ALTER TABLE sme_webinar
  ADD PRIMARY KEY (webinar_id);

--
-- Indexes for table testimonial
--
ALTER TABLE testimonial
  ADD PRIMARY KEY (testimonial_id);

--
-- Indexes for table user
--
ALTER TABLE user
  ADD PRIMARY KEY (email);

--
-- Indexes for table userquestion
--
ALTER TABLE userquestion
  ADD PRIMARY KEY (questionid),
  ADD KEY category (category);




--#############################################################################################################




--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table attachments
--
ALTER TABLE attachments
  MODIFY fileid int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table cancelled_consultations
--
ALTER TABLE cancelled_consultations
  MODIFY cancelid int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table chatbot_data
--
ALTER TABLE chatbot_data
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table chats_count
--
ALTER TABLE chats_count
  MODIFY chatid int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table consultation
--
ALTER TABLE consultation
  MODIFY consultationId int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table consultation_slots
--
ALTER TABLE consultation_slots
  MODIFY ID int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table declined_requests
--
ALTER TABLE declined_requests
  MODIFY declineId int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table followup
--
ALTER TABLE followup
  MODIFY followupid int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table messages
--
ALTER TABLE messages
  MODIFY msgid int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table sme_answer
--
ALTER TABLE sme_answer
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table sme_profile
--
ALTER TABLE sme_profile
  MODIFY ID int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table sme_webinar
--
ALTER TABLE sme_webinar
  MODIFY webinar_id int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table testimonial
--
ALTER TABLE testimonial
  MODIFY testimonial_id int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table userquestion
--
ALTER TABLE userquestion
  MODIFY questionid int(11) NOT NULL AUTO_INCREMENT;




--#############################################################################################################




--
-- Constraints for dumped tables
--

--
-- Constraints for table attachments
--
ALTER TABLE attachments
  ADD CONSTRAINT attachments_ibfk_1 FOREIGN KEY (msgid) REFERENCES messages (msgid);

--
-- Constraints for table cancelled_consultations
--
ALTER TABLE cancelled_consultations
  ADD CONSTRAINT cancelled_consultations_ibfk_1 FOREIGN KEY (questionid) REFERENCES userquestion (questionid),
  ADD CONSTRAINT cancelled_consultations_ibfk_2 FOREIGN KEY (sme_email) REFERENCES sme_profile (email);

--
-- Constraints for table chats_count
--
ALTER TABLE chats_count
  ADD CONSTRAINT chats_count_ibfk_1 FOREIGN KEY (questionid) REFERENCES userquestion (questionid);

--
-- Constraints for table consultation
--
ALTER TABLE consultation
  ADD CONSTRAINT consultation_ibfk_1 FOREIGN KEY (clientEmailId) REFERENCES user (email),
  ADD CONSTRAINT consultation_ibfk_2 FOREIGN KEY (smeEmailId) REFERENCES sme_profile (email),
  ADD CONSTRAINT consultation_ibfk_3 FOREIGN KEY (questionId) REFERENCES userquestion (questionid);

--
-- Constraints for table declined_requests
--
ALTER TABLE declined_requests
  ADD CONSTRAINT declined_requests_ibfk_1 FOREIGN KEY (questionid) REFERENCES userquestion (questionid),
  ADD CONSTRAINT declined_requests_ibfk_2 FOREIGN KEY (sme_email) REFERENCES sme_profile (email);

--
-- Constraints for table forgot_password
--
ALTER TABLE forgot_password
  ADD CONSTRAINT forgot_password_ibfk_1 FOREIGN KEY (email) REFERENCES sme_profile (email);

--
-- Constraints for table messages
--
ALTER TABLE messages
  ADD CONSTRAINT messages_ibfk_1 FOREIGN KEY (questionid) REFERENCES userquestion (questionid);

--
-- Constraints for table sme_profile
--
ALTER TABLE sme_profile
  ADD CONSTRAINT sme_profile_ibfk_1 FOREIGN KEY (categoryname) REFERENCES category (categoryName);

--
-- Constraints for table userquestion
--
ALTER TABLE userquestion
  ADD CONSTRAINT userquestion_ibfk_1 FOREIGN KEY (category) REFERENCES category (categoryName);
COMMIT;


