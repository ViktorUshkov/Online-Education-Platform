INSERT OR IGNORE INTO User (userName, useremail, userpassword) VALUES
    ("ФИО4", "fio5@somemail.com", "pass4."),
    ("ФИО5", "fio5@somemail.com", "pass5.");
UPDATE User 
SET useremail = "fio4@somemail.com"
WHERE userName="ФИО4";
SELECT * FROM User;

INSERT OR IGNORE INTO Course (courseName, datesStartOfStudy, datesEndOfStudy) VALUES
    ('course2', date('2023-02-02'), date('2023-08-01'));
UPDATE Course 
SET datesStartOfStudy = date('2023-02-01')
WHERE courseName='course2';
SELECT * FROM Course;

INSERT OR IGNORE INTO Contract (numContract, datesStartOfStudy, datesEndOfStudy, courseId) VALUES
    (1346, date('2023-03-01'), date('2023-08-01'), 2);
UPDATE Contract 
SET numContract=12346
WHERE contractId=2;
SELECT * FROM Contract;

INSERT OR IGNORE INTO Teacher (userId, courseId)
    SELECT userId, courseId
    FROM User, Course
    WHERE userName="ФИО5" AND courseName='course2';
SELECT * FROM Teacher;

INSERT OR IGNORE INTO Student (userId, contractId)
    SELECT userId, contractId
    FROM User, Contract
    WHERE userName="ФИО4" AND numContract=12346;
SELECT * FROM Student;

INSERT OR IGNORE INTO Lesson (courseId, lessonName, datesStartOfStudy, datesEndOfStudy, lessonContent) VALUES
    (2, 'Lorem ipsum', date('2023-02-01'), date('2023-03-01'), 'Lorem ipsum dolor sit amet, consectetur 
     adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
     veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
     irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
     sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
UPDATE Lesson 
SET lessonName='Lorem ipsum 3'
WHERE lessonName='Lorem ipsum' AND courseId = 2;
SELECT * FROM Lesson;

INSERT OR IGNORE INTO Task (lessonId, datesStartOfStudy, datesEndOfStudy, taskContent) VALUES
    (1, date('2023-02-01'), date('2023-03-01'), 'enim diam vulputate ut pharetra sit amet aliquam. Id velit
     ut tortor pretium. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Dui
     vivamus arcu felis bibendum ut tristique et egestas. Mauris in aliquam sem fringilla ut morbi tincidunt 
     augue interdum. Eu non diam phasellus vestibulum lorem sed. Congue eu consequat ac felis donec. Mauris 
     nunc congue nisi vitae. Etiam erat velit scelerisque in dictum. Molestie ac feugiat sed lectus.');
UPDATE Task 
sET datesEndOfStudy=date('2023-03-10'), lessonId=3
WHERE taskId=3;
SELECT * FROM Task;

INSERT OR IGNORE INTO Solution (taskId, solutionProvided, solutionChecked, solutionContent, solutionMark) VALUES
    (3, NULL, date('2023-04-02'), NULL, 0);
UPDATE Solution 
SET solutionProvided=date('2023-03-10'), solutionContent='answ1'
WHERE solutionId=3;
SELECT * FROM Solution;

