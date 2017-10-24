-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 24, 2017 at 03:58 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kmitl_subject_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `major`
--

CREATE TABLE `major` (
  `major_id` varchar(10) NOT NULL,
  `major_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `major`
--

INSERT INTO `major` (`major_id`, `major_name`) VALUES
('1', 'วิศวกรรมศาสตร์'),
('10', 'วิทยาลัยนวัตกรรมการผลิตขั้นสูง'),
('11', 'การบริหารและจัดการ'),
('12', 'วิทยาลัยอุตสาหกรรมการบินนานาชาติ'),
('13', 'ศิลปศาสตร์'),
('14', 'แพทยศาตร์'),
('2', 'สถาปัตยกรรมศาสตร์'),
('3', 'ครุศาสตร์อุตสาหกรรมและเทคโนโลยี'),
('4', 'เทคโนโลยีการเกษตร'),
('5', 'วิิทยาศาสตร์'),
('6', 'อุตสาหกรรมการเกษตร'),
('7', 'เทคโนโลยีสารสนเทศ'),
('8', 'วิทยาลัยนานาชาติ'),
('9', 'วิทยาลััยนาโนเทคโนโลยีพระจอมเกล้าลาดกระบัง');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `review_id` varchar(50) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `date` datetime NOT NULL,
  `score` int(5) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `subject_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`review_id`, `content`, `date`, `score`, `user_id`, `subject_id`) VALUES
('03228e59-824f-4a43-b754-d7b182283cde', '123', '2560-10-24 20:49:12', 1, 'ed56d00a-d322-494c-b716-f02a36714f7c', '90020008'),
('05746b8f-ca5e-4661-b65f-f6941667c935', '456', '2560-10-24 20:44:27', 5, 'ed56d00a-d322-494c-b716-f02a36714f7c', '90020008'),
('0f8f32c3-0126-4463-a987-d4b91d0f6d38', '123', '2560-10-24 20:50:59', 1, 'ed56d00a-d322-494c-b716-f02a36714f7c', '90020008'),
('123', 'ดีมาก', '2017-10-22 02:11:25', 5, '123', '90020008');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `subject_id` varchar(10) NOT NULL,
  `sj_name_eng` varchar(50) NOT NULL,
  `sj_name_thai` varchar(50) NOT NULL,
  `sj_description_eng` varchar(500) NOT NULL,
  `sj_description_thai` varchar(500) NOT NULL,
  `total_score` float NOT NULL,
  `type_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subject_id`, `sj_name_eng`, `sj_name_thai`, `sj_description_eng`, `sj_description_thai`, `total_score`, `type_id`) VALUES
('90020008', 'ENGLISH FOR MARKETING', 'ภาษาอังกฤษเพื่อการตลาด', 'A study and practice of language structures, vocabulary and expressions in marketing contexts extracted from authentic marketing materials with an emphasis on reading comprehension, including the application of knowledge studied.', 'ศึกษาและฝึกใช้โครงสร้างภาษา  คำศัพท์และสำนวนจากบริบทที่เกี่ยวกับการตลาดซึ่งคัดเลือกเนื้อหาด้านการตลาดที่เป็นเนื้อหาจริงให้ฝึก  โดยเน้นทักษะการอ่านเพื่อความเข้าใจพร้อมทั้งประยุกต์ความรู้ที่ได้ศึกษามา', 0, '1'),
('90201003', 'ENGLISH FOR ACADEMIC PURPOSES', 'ภาษาอังกฤษเชิงวิชาการ', 'The development of language and study skills in English for academic purposes with an emphasis on reading texts related to students’ fields of subjects including language use for expressing definition, comparison, classification, purposes, functions, processes, cause and effect, etc.', 'พัฒนาทักษะทางภาษาและการเรียนภาษาอังกฤษเชิงวิชาการ โดยเน้นการอ่านที่มีเนื้อหาทาง วิชาชีพของนักศึกษา การใช้ภาษาเพื่อแสดงคำจำกัดความ การเปรียบเทียบ การจำแนกการแสดงจุดประสงค์ การแสดงหน้าที่การใช้งาน การอธิบายกระบวนการและการแสดงเหตุและผล เป็นต้น', 0, '1'),
('90201013', 'ENGLISH FOR MANAGEMENT', 'ภาษาอังกฤษเพื่อการตลาด', 'A study and practice of language structures, vocabulary and expressions in marketing contexts extracted from authentic marketing materials with an emphasis on reading comprehension, including the application of knowledge studied.', 'ศึกษาและฝึกใช้โครงสร้างภาษา คำศัพท์และสำนวนจากบริบทที่เกี่ยวกับการตลาดซึ่งคัดเลือกเนื้อหาด้านการตลาดที่เป็นเนื้อหาจริงให้ฝึก โดยเน้นทักษะการอ่านเพื่อความเข้าใจพร้อมทั้งประยุกต์ความรู้ที่ได้ศึกษามา', 0, '1'),
('90201016', 'ENGLISH FOR PROFESSIONAL COMMUNICATION', 'ภาษาอังกฤษเพื่อการสื่อสารทางวิชาชีพ', 'A practice in English communication skills emphasizing listening and speaking skills for various occasions, including the development of skills in conversation, discussion, exchanges of opinions, speech making and academic paper presentation in public.', 'ฝึกทักษะในการติดต่อสื่อความหมายภาษาอังกฤษ โดยเน้นทักษะในการฟังและการพูดในโอกาส ต่าง ๆ รวมทั้งพัฒนาทักษะการสนทนา การอภิปราย การแสดงความคิดเห็น การกล่าวสุนทรพจน์ และฝึกการ เสนอผลงานทางวิชาชีพต่อที่ประชุม', 0, '1'),
('90201017', 'ENGLISH FOR BUSINESS', 'ภาษาอังกฤษสำหรับธุรกิจ', 'A study and practice in the use of English for business communication, with emphasis on reading texts from various kinds of business, on vocabulary and expression usage in business contexts, on writing business letters, memos, and on listening and speaking in various situations of business.', 'ศึกษาและฝึกการใช้ภาษาอังกฤษเพื่อการสื่อสารทางธุรกิจ โดยเน้นความเข้าใจในการอ่านข้อเขียน ทางธุรกิจประเภทต่าง ๆ การใช้ศัพท์ สำนวน และภาษาในเชิงธุรกิจ การเขียนจดหมายบันทึกช่วยจำ รวมทั้ง การฝึกฟังและพูดในสถานการณ์ต่าง ๆ ทางธุรกิจ', 0, '1'),
('90201018', 'ENGLISH FOR COMMUNICATIVE WRITING', 'การเขียนภาษาอังกฤษเพื่อการสื่อสาร', 'The study and practice of communicative writing focusing on formal and informal letters, reports, instructions, manuals, personal data, and a description of things, places, events, and processes.', 'ศึกษาและฝึกการเขียนเพื่อการสื่อสาร โดยเน้นฝึกการเขียนจดหมายในลักษณะต่าง ๆ เขียนรายงาน คำสั่ง คู่มือการใช้ ประวัติส่วนตัว รวมทั้งการเขียนบรรยายสิ่งของ สถานที่ เหตุการณ์และกระบวนการ', 0, '1'),
('90201019', 'ENGLISH FOR DEVELOPING READING SKILLS', 'ภาษาอังกฤษเพื่อการพัฒนาทักษะการอ่าน', 'A study and practice in reading techniques through various sources of academic reading texts with practices in skimming, scanning, guessing meanings from contextual clues, and using a dictionary, including the study of vocabulary, expressions and language in contexts.', 'ศึกษาและฝึกเทคนิคการอ่านจากบทอ่านทางวิชาการในสาขาต่าง ๆ โดยฝึกการอ่านเก็บใจความสำคัญ การเดาคำศัพท์จากปริบท การใช้พจนานุกรม รวมทั้งการศึกษาศัพท์ สำนวน และการใช้ภาษาจากบทอ่าน', 0, '1'),
('90201020', 'ENGLISH FOR INDUSTRY', 'ภาษาอังกฤษเพื่อการอุตสาหกรรม', 'A study and practice in the use of English in different forms and functions related to industrial work, e.g. describing production process, explaining how to use instruments, or how to operate machines, including reading and writing manuals, instructions, and signs or warning signs.', 'ศึกษาและฝึกการใช้ภาษาอังกฤษในวงการอุตสาหกรรมในรูปแบบต่าง ๆ เช่น การบรรยาย กระบวนการผลิต การอธิบายการใช้อุปกรณ์ เครื่องมือ หรือการทำงานของเครื่องจักร การอ่านและเขียนคู่มือ คำสั่งและป้ายหรือสัญญาณเตือนภัยต่าง ๆ', 0, '1'),
('90201022', 'ENGLISH FOR FURTHER STUDIES', 'ภาษาอังกฤษเพื่อการศึกษาต่อ', 'A study and practice of English for further study level focusing on academic reading, summary writing, listening and note–taking, including a practice in doing various kinds of English test papers.', 'ศึกษาและฝึกการใช้ภาษาอังกฤษเพื่อการศึกษาต่อในระดับบัณฑิตโดยเน้นฝึกการอ่านข้อเขียนทางวิชาการ การย่อความ การฟังและการเขียนโน้ตย่อ รวมทั้งฝึกทำข้อทดสอบทางภาษาอังกฤษในรูปแบบต่าง ๆ', 0, '1'),
('90201024', 'ENGLISH FOR PROFESSIONAL PURPOSES', 'ภาษาอังกฤษเพื่อการประกอบอาชีพ', 'Development of language skills necessary for professional purposes : reading manuals, technical signs; writing job application letter, resumes, memos, reports, abstracts, emails, calls for meeeting, minutes and proceedings; practicing interviews, job discussion and work presentation.', 'พัฒนาทักษะการใช้ภาษาอังกฤษที่จำเป็นต่อการปฏิบัติงาน เช่น การอ่านคู่มือ เครื่องหมาย สัญลักษณ์ที่ใช้ในงานอาชีพ และบทความทางวิชาการต่างๆ การเขียนจดหมายสมัครงานหรือสมัครศึกษาต่อ การเขียนประวัติย่อ บันทึกข้อความ การเขียนรายงาน บทคัดย่อ จดหมายอิเลคทรอนิคส์ จดหมายเชิญประชุม บันทึกและรายงานการประชุม รวมทั้งฝึกการสัมภาษณ์ การเสนอผลงาน และการอภิปรายต่อที่ประชุม การสนทนาทางโทรศัพท์ และการพูดต่อหน้าชุมชนสำหรับโอกาสต่างๆ', 0, '1'),
('90201026', 'ENGLISH FOR COMMUNICATION', 'ภาษาอังกฤษเพื่อการสื่อสาร', 'The development of students’ ability to communicate in English by placing emphasis on listening and speaking skills for different purposes and practice in group discussion and presentation as well as the development of a reading skill by using various reading techniques such as reading for headings, reading for main ideas and details, reading for summarizing and writing reports.', 'การพัฒนาความสามารถในการติดต่อสื่อสารโดยใช้ภาษาอังกฤษ โดยเน้นทักษะในการฟังและการพูดที่ใช้ในโอกาสต่างๆ ฝึกการสนทนาเป็นกลุ่มและการนำเสนอผลงานทักษะการอ่านโดยใช้เทคนิคการอ่านที่หลากหลาย เช่นการอ่านเพื่อหาหัวเรื่อง การอ่านเพื่อจับใจความสำคัญและรายละเอียดเพื่อเขียนสรุปความ และเขียนรายงาน', 0, '1'),
('90201029', 'ENGLISH FOR TOURISM AND TRAVELLING', 'ภาษาอังกฤษเพื่อการท่องเที่ยวและการเดินทาง', 'A study of vocabulary and language used in travelling and tourism business, such as hotel, restaurant, airport, including a practice of the four skills in contexts as greeting, welcoming, travelling, introducing tourist attraction, planning trips, looking for and inquiring travelling information, dealing with customs and passport control as well as an explanation of general knowledge on tourism and travelling.', 'ศึกษาคำศัพท์และการใช้ภาษาเกี่ยวกับการเดินทาง ธุรกิจการท่องเที่ยว การโรงแรม ร้านอาหาร สนามบิน ฯลฯ พร้อมทั้งฝึกทักษะการฟัง การพูด การอ่านและการเขียนในบริบทดังกล่าว เช่น การทักทาย การต้อนรับ การเดินทาง การแนะนำสถานที่ท่องเที่ยว การวางแผน การหาและสอบถามข้อมูลการเดินทาง การถามทาง การผ่านด่านตรวจคนเข้าเมืองและศุลกากร ตลอดจนความรู้ทั่วไปในด้านการท่องเที่ยวและการเดินทาง', 0, '1'),
('90201030', 'ENGLISH FOR PROFESSIONAL PRESENTATION', 'ภาษาอังกฤษเพื่อการนำเสนอผลงานทางวิชาชีพ', 'A study and practice of communication and presentation skills with an emphasis on practical preparation and training of all theoretically gained knowledge such as the ability to present self-confidently and professionally, the ability to manage verbal and nonverbal parts of the speech, including the ability to deal with stage-fright and work with the audience.', 'ฝึกทักษะในการติดต่อสื่อความหมายและการพูดนำเสนอผลงานภาษาอังกฤษ  มุ่งเน้นการนำทฤษฎีไปใช้รวมทั้งการฝึกปฏิบัติจริง  อาทิเช่น  การพัฒนาทักษะทั้งการจัดเตรียมข้อมูล  การใช้สื่อประกอบการนำเสนอ การพัมนาบุคลิกภาพ  เพื่อการนำเสนอผลงานได้อย่างมีประสิทธิภาพ', 0, '1'),
('90201033', 'COMMUNICATIVE ENGLISH GRAMMAR', 'ไวยากรณ์ภาษาอังกฤษเพื่อการสื่อสาร', '-', 'ฝึกทักษะการใช้ไวยากรณ์ในการพัฒนาทักษะในการอ่าน  การเขียน  การพูด  การฟังเพื่อสื่อสารความหมายอย่างมีประสิทธิภาพโดยเน้นการส่งเสริมความมั่นใจในการติดต่อสื่อความหมายภาษาอังกฤษ  อภิปราย  แสดงความคิดเห็น  การเล่าเรื่อง  การพูดสรุปความ  ฝึกการเขียน  การอ่านบทความและการฟังเพื่อจับใจความ', 0, '1'),
('90201034', 'INTENSIVE ENGLISH', 'ภาษาอังกฤษแบบเข้ม', 'A study and practice of enhancing english proficiency in various aspects: vocabulary, grammar, reading, and writing for future English proficiency testing in certain organizations.', 'ศึกษา  ฝึกฝน  แลเพัฒนาประสิทธิภาพภาษาอังกฤษในด้านต่างๆ เช่น  การใช้คำศัพท์  ไวยากรณ์  การอ่านและการเขียน  เพื่อการสอบวัดประสิทธิภาพภาษาอังกฤษในองค์กรต่างๆ ในอนาคต', 0, '1'),
('90201036', 'ENGLISH SKILL DEVELOPMENT FOR LIFE-LONG LEARNING', 'การพัฒนาทักษะทางภาษาอังกฤษเพื่อการเรียนรู้ตลอดชีวิ', 'Development of English language skills based on topics of individual learners\' interest through active language learning activities customized for each learner to promote self-directed, life-long language learning skills.', 'ฝึกและพัฒนทักษะทางภาษาอังกฤษทั้ง 4 ทักษะ โดยเน้นเนื้อหาตามความสนใจของผู้เรียนแต่ละคนผ่านกิจกรรมการเรียนรู้ทางภาษาแบบอิสระ ทั้งในและนอกชั้นเรียนเพื่อส่งเสริมทักษะการเรียนรู้ภาษาอังกฤษตลอดชีวิตด้วยตนเอง', 0, '1'),
('90201037', 'BASIC ENGLISH PROUNUNCIATION', 'การออกเสียงภาษาอังกฤษเบื้องต้น', 'A study and practice of English sound systems and intonation, focusing on the proununciation of English vowel and consonanat sounds, word and sentence stress, intonation patterns in different types of sentences, as well as the study of phonetic alphabets and different accents in today\'s English.', 'กษาและฝึกฝนระบบเสียงและระดับเสียงในภาษาอังกฤษ  โดยเน้นการออกเสียงสระและพยัญชนะ  การเน้นเสียงในระดับคำและระดับประโยค  รูปแบบของระดับเสียงในประดยคลักษณะต่างๆ รวมไปถึงการศึกษา  ลัทอักษรในระบบเสียงภาษาอังกฤษเบื้องต้น  และสำเนียงภาษาอังกฤษในปัจจุบัน', 0, '1'),
('90201038', 'BASIC WRITING FOR PROFESSIONAL COMMUNICATION', 'พื้นฐานการเขียนเพื่อการสื่อความหมายทางวิชาชีพ', 'A study and practice of language structures and expressions in writing for professional communication in different contexts such as business letter, memorandum, business proposal, press release, and e-mail communication.', 'ฝึกทักษะโครงสร้างภาษา  คำศัพท์  สำนวน  และการเขียภาษาอังกฤษเพื่อการสื่อความหมายทางวิชาชีพในบริบทต่างๆ เช่น การเขียนจดหมายธุรกิจ  การเขียนบันทึกข้อความ  การเขียนโครงการ  การเขียนข่าวประกาศ  และติดต่อสื่อสารด้วยจดหมายอิเล็กทรอนิกส์', 0, '1'),
('90201039', 'ENGLISH FROM ENTERTAINMENT MEDIA', 'ภาษาอังกฤษจากสื่อบันเทิง', 'An analytical study of English and Western cultures through entertainment media, which are songs, movies, magazines and printed and television advertisement, focusing on language style, vocabulary and expressions, and slangs used in everyday communication. ', 'การศึกษาเชิงวิเคราะห์ภาษาอังกฤษและวัฒนธรรมตะวันตก  ผ่านสื่อบันเทิง  ได้แก่  เพลงภาพยนต์  นิตยสาร  และโฆษณา  โดยเน้นที่รูปแบบของภาษา  คำศัพท์  สำนวนและแสลงที่ใช้ในการสื่อสารในชีวิตประจำวัน', 0, '1'),
('90201040', 'ORAL ENGLISH COMMUNICATION AT WORK', 'การพูดภาษาอังกฤษเพื่อการสื่อสารในที่ทำงาน', 'A practice of English communication at work in various situations with an emphasis on expressing opinions on work-oriented context, discussing in a meeting, and giving a presentation.', 'ฝึกทักษะการพูดภาษาอังกฤษเพื่อการสื่อสารในที่ทำงานในสถานการณ์ต่างๆ เช่น การอภิปรายกลุ่มในที่ประชุม และการนำเสนอผลงาน', 0, '1'),
('90303005', 'INTRODUCTION TO PHYSICAL EDUCATION', 'การพลศึกษาเบื้องต้น', 'A study of definition and importance of physical education, basic knowledge of exercise and physical fitness, basic movements for health improvement and mental development, fundamental knowledge of the scope and types of physical education activities, sports activities both in individuals and teams, the organization of physical education activities and recreation activities, prevention and treatment of injuries prevalent in sports.', 'การศึกษาถึงความหมายและความสำคัญของพลศึกษา ความรู้เบื้องต้นของการออกกำลังกาย และสมรรถภาพของร่างกาย การเรียนรู้ทักษะการเคลื่อนไหวต่างๆ เพื่อส่งเสริมสุขภาพและพัฒนาจิตใจ ความรู้เกี่ยวกับขอบข่ายของกิจกรรมทางพลศึกษา กิจกรรมกีฬาทั้งประเภทบุคคลและประเภททีม การจัดกิจกรรมพลศึกษาและกิจกรรมเพื่อนันทนาการ การป้องกันการบาดเจ็บทางกีฬา ตลอดจนการปฐมพยาบาล (ทั้งภาคทฤษฎีและภาคปฏิบัติ)', 0, '2'),
('90303006', 'HEALTH MANAGEMENT', 'การจัดการสุขภาพ', 'A study of introduction to physical and mental health, the nature of healthy humans, rest and sleep, management, performance and test of physical and mental health, nutrition for health, disease protection, and medical services.', 'ศึกษาเกี่ยวกับความรู้เบื้องต้นเกี่ยวกับสุขภาพของร่างกายและจิตใจ ธรรมชาติของมนุษย์ที่มีสุขภาพดี การพักผ่อนและการนอนหลับ การจัดการ การปฏิบัติและการทดสอบทางสุขภาพ ร่างกายและจิตใจ โภชนาการเพื่อสุขภาพ โรคส่วนบุคคลและโรคติดต่อ การเลือกใช้บริการทางการแพทย์', 0, '2'),
('90303011', 'ENHANCEMENT OF QUALITY OF LIFE', 'การเสริมสร้างคุณภาพชีวิต', 'General knowledge about quality of life, quality of life in modern society focusing on enhancement, maintenance and health development in five aspects: physical, psychological, emotional, social, and intellectual based on principles and activities in hygiene, physical education and recreation.', 'ความรู้ทั่วไปเกี่ยวกับคุณภาพชีวิต คุณภาพชีวิตกับสังคมปัจจุบันโดยเน้นเรื่องการเสริมสร้าง การดูแลรักษาและการพัฒนาสุขภาพ ทางด้านร่างกาย จิตใจ อารมณ์ สังคม และสติปัญญา ให้มี ประสิทธิภาพ โดยอาศัยหลักการและกิจกรรมทางสุขศึกษา พลศึกษา และนันทนาการ', 0, '2'),
('90303012', 'HOLISTIC HEALTH DEVELOPMENT', 'การพัฒนาสุขภาพแบบองค์รวม', 'The study of the importance of maintaining physical and mental health, the elements of good development of physical and mental health, the development processes of physical and mental health using physical exercise, recreation and sport, factors affecting physical and mental health development, namely nutrition, personality, etc., the adjustment to living in harmony with others in the society, including study tours in organizations taking part in the physical and mental health development.', 'ศึกษาความสำคัญของการรักษาสุขภาพกายและสุขภาพจิต องค์ประกอบของการพัฒนาสุขภาพกายและสุขภาพจิตที่ดี กระบวนการพัฒนาสุขภาพกายและสุขภาพจิตโดยใช้หลักการบริหารกาย นันทนาการและกีฬา ปัจจัยที่มีผลต่อการพัฒนาสุขภาพกายและสุขภาพจิต อาทิ โภชนาการ บุคลิกภาพ และอื่นๆ การปรับตัวเพื่อการอยู่ร่วมกับผู้อื่นในสังคมอย่างเป็นสุข รวมทั้งการศึกษาดูงานนอกสถานที่ ในหน่วยงานและองค์กรที่มีส่วนร่วมในการพัฒนาสุขภาพกายและสุขภาพจิต', 0, '2'),
('90304001', 'LIBRARY USAGE AND INFORMATION', 'การใช้ห้องสมุดและสารนิเทศ', 'Basic knowledge of a library and information sources, library and information resources, arrangement and storage, information searching methods in a library and national and international information sources, term paper writing, and reference.', 'ความรู้เบื้องต้นเกี่ยวกับห้องสมุดและแหล่งสารนิเทศ ทรัพยากรห้องสมุดและสารนิเทศ วิธีการ จัดเก็บ การสืบค้นสารนิเทศจากห้องสมุด และแหล่งสารนิเทศทั้งในประเทศและต่างประเทศ การเขียนภาค นิพนธ์และการอ้างอิงตามหลักสากล', 0, '2'),
('90305004', 'GEOGRAPHY AND HISTORY FOR TOURISM', 'ภูมิประวัติศาสตร์เพื่อการท่องเที่ยว', 'A study of geography of Thailand, tapography, weather, natural resources as regional tourism resources leading to a study of history of Thai community adjusted and integrated with civilization which will be the factors in development to the state and religion, including a study of the identity of Thai civilization in the areas of politics, governing, economics, religion, philosophy, beliefs, traditions, literature, art and so on that can be seen from tourist spots of Thailand including outside s', 'ศึกษาภูมิศาสตร์ของประเทศไทย สภาพภูมิประเทศ ภูมิอากาศ ทรัพยากรธรรมชาติในฐานะที่เป็นทรัพยากรการท่องเที่ยวของแต่ละภาค ซึ่งนำไปสู่การศึกษาประวัติศาสตร์ของชุมชนที่มีการปรับตัวผสมผสานกับอารยธรรมอันเป็นปัจจัยในการพัฒนาไปสู่ความเป็นรัฐและอาณาจักรรวมทั้งศึกษาเอกลักษณ์ของอารยธรรมไทยทางด้านสถาบันการเมืองการปกครอง เศรษฐกิจ ศาสนา ปรัชญา ความเชื่อ ขนบธรรมเนียมประเพณี วรรณกรรม ศิลปกรรมและอื่นๆ ที่ปรากฎอยู่ตามแหล่งท่องเที่ยวที่สำคัญของประเทศ มีการศึกษานอกสถานที่', 0, '2'),
('90305005', 'HUMAN AND TOURISM', 'มนุษย์กับการท่องเที่ยว', 'A study of an importance and a definition of tourism, its background, trend, role and factors of tourism industry, including basic structure of tourism industry and factors influencing tourism industry : transportation, hotels, restaurants and facilities, souvenir shops and insurance for life and property of tourists including outside study tours.', 'ศึกษาความสำคัญและความหมายของการท่องเที่ยว ความเป็นมา แนวโน้มบทบาท และองค์ประกอบที่สำคัญของอุตสาหกรรมการท่องเที่ยว ศึกษาโครงสร้างพื้นฐานของอุตสาหกรรมการท่องเที่ยว ปัจจัยต่างๆ ที่มีอิทธิพลต่อการท่องเที่ยวได้แก่ การคมนาคม การขนส่ง ที่พักแรม ร้านอาหารและสวัสดิการ ร้านค้าของที่ระลึก ตลอดจนการให้ความปลอดภัยต่อชีวิต และทรัพย์สินของนักท่องเที่ยวมีการศึกษานอกสถานที่', 0, '2'),
('90305006', 'HUMAN AND ENVIRONMENT', 'มนุษย์กับสิ่งแวดล้อม', 'A study of basic principles of ecology in order to understand the relationship between human and environment, including problems of environment, trends in solving, ethics and relate laws, human and environment in the future.', 'ศึกษากฎเกณฑ์โดยทั่วไปของนิเวศวิทยาเพื่อให้เกิดความเข้าใจถึงความสัมพันธ์ระหว่างมนุษย์กับสิ่งแวดล้อม ปัญหาสิ่งแวดล้อมและแนวทางในการแก้ไขปัญหา รวมทั้งกฎหมายที่เกี่ยวข้องและจริยธรรมต่อสิ่งแวดล้อม ตลอดจนอนาคตของมนุษย์กับสิ่งแวดล้อม', 0, '2'),
('90306003', 'LIVING SKILLS', 'ทักษะการดำเนินชีวิต', 'A study of meaning, importance, and components of living skills, types of living skills essential and necessary for university students, practices of living skills activities.', 'ศึกษาความหมาย  ความสำคัญ  และองค์ประกอบของทักษะการดำเนินชีวิต  ประเภทของทักษะการดำเนินชีวิต  ทักษะการดำเนินชีวิตที่สำคัญและจำเป็นสำหรับนักศึกษา  และการฝึกปฏิบัติกิจกรรมเสริมสร้างทักษะการดำเนินชีวิตสำหรับนักศึกษา', 0, '2'),
('90306004', 'LOVING FAMILY', 'ครอบครัวอบอุ่น', 'A study of meaning, importance, elements and characteristics of loving family, principles of being a loving family including internal and external factors affecting happiness in family.', 'ศึกษาความหมาย  ความสำคัญ  องค์ประกอบและลักษณะของครอบครัวอบอุ่น  หลักการสร้างความอบอุ่นในครอบครัว รวมทั้งปัจจัยภายในและภายนอกครอบครัวที่มีผลต่อความสุขในครอบครัว', 0, '2'),
('90306005', 'THAI WISDOM', 'ภูมิปัญญาไทย', 'A study of terminology and definition of wisdom, geographic and socio-cultural environment in different regions of Thailand, as the basis of local knowledge in various fields, understanding of wisdoms gained in Thai culture and lifestyle as well as application of wisdom in the present and future situation. ', 'ความหมายและพัฒนาการของภุมิปัญญา  ลักษณะภูมิศาสตร์และสภาพแวดล้อมทางสังคมวัฒนธรรมในภูมิภาคต่างๆ ของไทยอันเป็นปัจจัยพื้นฐานของการก่อเกิดภูมิปัญญาท้องถิ่นในสาขาวิชาต่างๆ ความรู้ความเข้าใจในภูมิปัญญา-ปรีชาญาณสั่งสมในวัฒนธรรมไทยและในดำรงชีวิต  ตลอดจนการนำภูมิปัญญามาปรับใช้ในสถานการณ์ปัจจุบันและอนาคต', 0, '2'),
('90306006', 'KNOWLEDGE MANAGEMENT', 'การจัดการความรู้', 'Definition and importance of knowledge management, knowledge management processes, tools for knowledge management, knowledge management models, and application of knowledge management in various contexts.', 'ความหมายและความสำคัญของการจัดการความรู้ กระบวนการจัดการความรู้  เครื่องมือที่ใช้ในการจัดการความรู้  รูปแบบการจัดการความรู้ รูปแบบการจัดการความรู้  และการประยุกต์ใช้การจัดการความรู้ในในบริบทต่างๆ', 0, '2'),
('90306007', 'HAPPINESS SKILLS', 'ทักษะแห่งความสุข', 'A study of principles and strategies from Psychology, Humanities, and Social sciences. concerning the nature of happiness in physical, spcop-cultural, emotional and Cognitive domains.  A practice of stress management, self understanding and self development of happiness skills.', 'ศึกษาหลักการและวิะีการทางจิตวิทยา  มนุษย์ศาสตร์  และสังคมศาสตร์เกี่ยวกับความสุขในระดับต่างๆ ทั้งมิติทางกายภาพ  มิติทางสังคม  มิติทางอารมณ์  มิติทางจิตใจ  และมิติทางการรู้คิด  โดยมุ่งเน้นการฝึกปฏิบัติเพื่อบริหารความเครียด  การเข้าใจตนเอง  และการพัฒนาทักษะแห่งความสุข', 0, '2'),
('90306008', 'MEDITATION FOR LIFE DEVELOPMENT', 'สมาธิเพื่อพัฒนาชีวิต', 'Meaning of meditation, objectives, methods, the beginning, process characteristics of reciting and meditating, benefits of meditation, meditation resistances and applying meditation in daily life, meditation as related to education and working purposes, objectives, methods, characteristics of the states of absorption (jhana) and insight knowledge (Nana), Fundamental knowledge about insight meditation (Vipassana), differences between foundation meditation (Summata) and insight meditation (Vipassa', 'ความหมายของการทำสมาธิ  จุุดประสงค์   วิธีการ  ขั้นตอน  จุดเริ่มต้นของการทำสมาธิ  ลักษณะของการบริกรรมและการทำสมาธิ  ประโยชน์ของสมาธิ   ลักษณะอาการต่อต้านสมาธิ  และการนำสมาธิไปใช้ในชีวิตประจำวัน  สมาธิกับการเรียนและการทำงาน  ลักษณะ  ขั้นตอน  คุณสมบัติ  ประโยชน์ของฌานและญาณ  สิ่งที่ควรรู้เรื่องวิปัสสนา  ความแตกต่างระหว่างสมถะกับวิปัสสนา   แผนผังสมถะกับวิปัสสนา  ชาวโลกกับวิปัสสนา', 0, '2'),
('90307001', 'THAI USAGE FOR COMMUNICATION', 'ภาษาไทยเพื่อการสื่อสาร', 'A study of basic principles of effective communication, practice of four communication skills, namely listening, speaking, reading and writing in different situations such as listening for main ideas, public speaking, critical, reading of selected prose, and different genres of writing language.', 'ศึกษาหลักการพื้นฐานของการใช้ภาษาไทยเพื่อการสื่อสารอย่างมีประสิทธิภาพ  ฝึกทักษะทั้งสี่ที่ใช้เพื่อการสื่อสาร  ได้แก่  ทักษะการฟังการพูด  การอ่าน  และการเขียนในสถานการณ์ต่างๆ เช่น  การฟังเพื่อจับใจความสำคัญ  การพูดในที่ชุมชน  การอ่านเพื่อจับใจความ  การตีความ  การวิเคราะห์และวิจารณ์  และการเขียนงานรูปแบบต่างๆ', 0, '2'),
('90307004', 'LANGUAGE IN THAI SOCIETY', 'ภาษาในสังคมไทย', 'A study of language structure and varieties of languages used in Thai society, relationship between languages, social and cultural context;  characteristics of language and language change;  language development and the development of the nation.', 'ศึกษาโครงสร้างของภาษาและความหลากหลายของภาษาที่ใช้ในสังคมไทย  ความสัมพันธ์ระหว่างภาษา  บริบททางสัมและวัฒนธรรม  ธรรมชาติและการเปลี่ยนแปลงของภาษา  รวมทั้งการพัฒนาภาษากับการพัฒนาสังคมและประเทศชาติ', 0, '1'),
('90307005', 'LISTENING AND READING FOR IMPROVING LIFE QUALITY', 'การฟังและการอ่านเพื่อพัฒนาคุณภาพชีวิต', 'A study and practice of principle and perception skills, listening and reading for improving life quality to understand, experience enhancement, and imagination.  Development in ability of finding main ideas, analyzing messages for both academic and non-academic purposes.', 'หลักการรับสารอย่างมีวิจารณญาณ  ฝึกทักษะการฟังและการอ่านเพื่อพัฒนาคุณภาพชีวิตให้เกิดความรอบรู้  มีประสบการณ์และสร้างจินตนาการ  การพัฒนาความสามารถในการจับใจความสำคัญ  การสรุปประเด็น  การวิเคราะห์และประเมินค่าสารทั้งสาระความรู้และบันเทิงคดี', 0, '2'),
('90307007', 'SPEECH COMMUNICATION', 'วาทวิทยา', 'A study of human communication processes and the art of public speaking.  Practice of verbal and nonverbal communication in various settings, how to structure and organize information to present to a variety of audiences, and physical and vocal skills includes techniques in controlling speech anxiety.', 'ศึกษากระบวนการสื่อสารของมนุษย์  ศิลปะการพูดในที่สาธารณะ  ฝึกการใช้วัจนภาษา และอวยัจนภาษาในการสื่อสาร  หลักการเตรียมการพูดในสถานกาณ์ต่างๆ   การแก้ไขความวิตกกังวัลในการพูด  รวมทั้งเรียนรู้เทคนิคการใช้เสียง  ท่าทางและบุคลิกภาพที่เหมาะสม  เพื่อการนำเสนอที่มีประสิทธิภาพ', 0, '1'),
('90307008', 'LANGUAGE FOR MASS MEDIA', 'ภาษาเพื่อสื่อสารมวลชน', 'Techniques of Thai language use in mass media.  an analysis of the specific characteristics of mass media language especially in newspapers, radio, television, the internet and other media. ', 'เทคนิคการใช้ภาษาไทยในสื่อ  การวิเคราะห์ลักษณะเฉพาะของภาษาสื่อสารมวลชน  ที่ปรากฏทางสื่อหนังสือพิมพ์  สื่อวิทยุโทรทัศน์ สื่ออินเทอร์เน็ต  และสื่อมวลชนอื่นๆ', 0, '2'),
('90307009', 'THAI FOR TOURISM', 'ภาษาไทยเพื่อการท่องเที่ยว', '-', '-', 0, '1'),
('90307011', 'BASIC CHINESE', 'ภาษาจีนเบื้องต้น', '-', '-', 0, '1'),
('90595022', 'LISTENING AND READING FOR IMPROVING LIFE QUALITY', 'การฟังและการอ่านเพื่อพัฒนาคุณภาพชีวิต', 'Study and practice principle and perception skills, Media literacy skills. Listening and Reading for improving Life quality to understand, experience enhancement, and imagination. Development in ability of finding main ideas, analyzing and evaluating messages for both academic and non-academic purposes.', 'ศึกษาหลักการรับสารอย่างมีวิจารณญาณ รู้เท่าทันสื่อและการสื่อสาร ฝึกทักษะการฟังและการอ่านเพื่อพัฒนาคุณภาพชีวิต ให้เกิดความรอบรู้ มีประสบการณ์และสร้างจินตนาการ การพัฒนาความสามารถในการจับใจความสำคัญ การสรุปประเด็น การวิเคราะห์และประเมินค่าสารทั้งสาระความรู้และบันเทิงคดี', 0, '1'),
('90595024', 'WRITING IN WORKPLACE', 'การเขียนภาษาไทยในที่ทำงาน', 'Study Principles, formats and methods of writing Thai document types; correct use of the Thai language appropriate for each type of documents. Practice in document writing in accordance with working system in the workplace.', 'ศึกษาหลักเกณฑ์ รูปแบบและวิธีการเขียนงานเอกสารภาษาไทยประเภทต่าง ๆ ที่ใช้ทั่วไปในที่ทำงาน การใช้ภาษาที่ถูกต้องและเหมาะสมกับประเภทของเอกสาร ฝึกการเขียนเอกสารในระบบการทำงานสำนักงาน', 0, '1');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `type_id` varchar(10) NOT NULL,
  `type_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`type_id`, `type_name`) VALUES
('1', 'วิชาเลือกกลุ่มวิชาภาษา'),
('10', 'วิชาเลือกกลุ่มคุณค่าแห่งชีวิต'),
('11', 'วิชาเลือกกลุ่มวิิถีแห่งสังคม'),
('12', 'วิชาเลือกกลุ่มศาสตร์แห่งการคิด'),
('13', 'วิชาเลือกกลุ่มศิลปแห่งการจัดการ'),
('14', 'วิชาเลือกกลุ่มภาษาและการสื่อสาร'),
('2', 'วิชาเลือกกลุุ่่มวิชามนุษย์ศาสตร์'),
('3', 'วืชาเลือกกลุ่มวิิชาสังคมศาสตร์'),
('4', 'วิชาศึกษาทั่วไปกลุ่มวิชาวิทยาศาสตร์กับคณิตศาสตร์'),
('5', 'วิชาเลือกทางสาขา'),
('6', 'วิชาเลือกเสรี'),
('7', 'กลุ่มเวลาเรียนของรายวิชา'),
('8', 'วิชาภาาษาอังกฤษ'),
('9', 'วิชาวิทยาศาสตร์กับคณิตศาสตร์');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `email`, `password`, `role`) VALUES
('01d07c8f-3d98-4f6d-bb45-2041aac465b7', 'test1', 'test1@kmitl.ac.th', 'test1', 'teacher'),
('02d1456d-f900-4dbe-a62e-6441731d7403', 'test', 'test@kmitl.ac.th', 'test', 'teacher'),
('123', 'benny', '58070079@kmitl.ac.th', 'benny', 'student'),
('456', 'derm', '58070086@kmitl.ac.th', 'derm', 'student'),
('ed56d00a-d322-494c-b716-f02a36714f7c', 'aa', '00@kmitl.ac.th', '00', 'student');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `major`
--
ALTER TABLE `major`
  ADD PRIMARY KEY (`major_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
