/*дополнение курсов*/

INSERT OR IGNORE INTO Lesson(lessonname, courseid) VALUES
("Lesson1", (SELECT courseid
 FROM Course 
 WHERE courseName = 'Course1'));

SELECT * FROM Lesson;

