/*запись на курсы*/
INSERT OR IGNORE INTO Student_Course(studentid, courseid) VALUES
 ((SELECT studentid
 FROM Student 
 WHERE studentid = (SELECT userid FROM User WHERE loggin = 'wee')), 
 (SELECT courseid
 FROM Course 
 WHERE courseid = (SELECT courseid FROM Course WHERE courseName = 'Course1')));

SELECT * FROM Student_Course;