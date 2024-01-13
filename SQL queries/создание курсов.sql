/*создание курсов*/
INSERT OR IGNORE INTO Course(courseName) VALUES
("Course1");
INSERT OR IGNORE INTO Teacher_Course(teacherid, courseid) VALUES
 ((SELECT teacherid
 FROM Teacher 
 WHERE teacherid = (SELECT userid FROM User WHERE loggin = 'rrr')), 
 (SELECT courseid
 FROM Course 
 WHERE courseid = (SELECT courseid FROM Course WHERE courseName = 'Course1')));

SELECT * FROM Course;
SELECT * FROM Teacher_Course;
