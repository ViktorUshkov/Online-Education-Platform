/*регистрация*/
INSERT OR IGNORE INTO User(userpassword, loggin, userIsTeacher) VALUES 
("22ef", 'wee', 0),
("2234en", 'rrr', 1);
INSERT OR IGNORE INTO Teacher(teacherid) 
SELECT userid FROM User WHERE userIsTeacher = 1;
INSERT OR IGNORE INTO Student(studentid) 
SELECT userid FROM User WHERE userIsTeacher = 0;
SELECT * FROM Teacher;
SELECT * FROM Student;
SELECT * FROM User;
