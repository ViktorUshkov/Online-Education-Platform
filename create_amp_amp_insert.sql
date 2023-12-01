CREATE TABLE IF NOT EXISTS User (
  userId INTEGER NOT NULL UNIQUE PRIMARY KEY,
  userName TEXT NOT NULL,
  userEmail TEXT NOT NULL UNIQUE,
  userPassword TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS Teacher (
  teacherId INTEGER NOT NULL UNIQUE PRIMARY KEY,
  userId INTEGER NOT NULL,
  courseId INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS Student (
  studentId INTEGER NOT NULL UNIQUE PRIMARY KEY,
  userId INTEGER NOT NULL,
  contractId INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS Contract(
    contractId INTEGER NOT NULL UNIQUE PRIMARY KEY,
    numContract INTEGER NOT NULL,
    datesStartOfStudy date NOT NULL,
    datesEndOfStudy date NOT NULL,
    courseId INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS Course (
    courseId INTEGER NOT NULL UNIQUE PRIMARY KEY,
    courseName TEXT NOT NULL,
    datesStartOfStudy date,
    datesEndOfStudy date 
);
CREATE TABLE IF NOT EXISTS Lesson (
    lessonId INTEGER NOT NULL UNIQUE PRIMARY KEY,
    courseId INTEGER NOT NULL,
    lessonName TEXT NOT NULL,
    datesStartOfStudy date,
    datesEndOfStudy date, 
    lessonContent TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS Task (
    taskId INTEGER NOT NULL UNIQUE PRIMARY KEY,
    lessonId INTEGER NOT NULL,
    datesStartOfStudy date,
    datesEndOfStudy date, 
    taskContent TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS Solution (
    solutionId INTEGER NOT NULL UNIQUE PRIMARY KEY,
    taskId INTEGER NOT NULL,
    solutionProvided date,
    solutionChecked date NOT NULL,
    solutionContent TEXT,
    solutionMark INTEGER NOT NULL
);

INSERT OR IGNORE INTO User (userName, userEmail, userPassword) VALUES
    ("ФИО1", "fio1@somemail.com", "pass1-"),
    ("ФИО2", "fio2@somemail.com", "pass2/"),
    ("ФИО3", "fio3@somemail.com", "pass3.");
INSERT OR IGNORE INTO Contract (numContract, datesStartOfStudy, datesEndOfStudy, courseId) VALUES
    (12345, date('2023-03-01'), date('2023-08-01'), 1);
INSERT OR IGNORE INTO Course (courseName, datesStartOfStudy, datesEndOfStudy) VALUES
    ('course1', date('2023-02-01'), date('2023-08-01'));
INSERT OR IGNORE INTO Teacher (userId, courseId)
    SELECT userId, courseId
    FROM User, Course
    WHERE userName="ФИО2" AND courseName='course1';
INSERT OR IGNORE INTO Student (userId, contractId)
    SELECT userId, contractId
    FROM User, Contract
    WHERE userName="ФИО3" AND numContract=12345;
INSERT OR IGNORE INTO Lesson (courseId, lessonName, datesStartOfStudy, datesEndOfStudy, lessonContent) VALUES
    (1, 'Lorem ipsum', date('2023-02-01'), date('2023-03-01'), 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
    (1, 'Lorem ipsum1', date('2023-03-01'), date('2023-04-01'), 'Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt, ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, qui dolorem eum fugiat, quo voluptas nulla pariatur? At vero eos et accusamus et iusto odio dignissimos ducimus, qui blanditiis praesentium voluptatum deleniti atque corrupti, quos dolores et quas molestias excepturi sint, obcaecati cupiditate non provident, similique sunt in culpa, qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio, cumque nihil impedit, quo minus id, quod maxime placeat, facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet, ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.');
INSERT OR IGNORE INTO Task (lessonId, datesStartOfStudy, datesEndOfStudy, taskContent) VALUES
    (1, date('2023-02-01'), date('2023-03-01'), 'Donec enim diam vulputate ut pharetra sit amet aliquam. Id velit ut tortor pretium. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. Dui vivamus arcu felis bibendum ut tristique et egestas. Mauris in aliquam sem fringilla ut morbi tincidunt augue interdum. Eu non diam phasellus vestibulum lorem sed. Congue eu consequat ac felis donec. Mauris nunc congue nisi vitae. Etiam erat velit scelerisque in dictum. Molestie ac feugiat sed lectus.'),
    (2, date('2023-03-01'), date('2023-04-01'), 'Facilisis magna etiam tempor orci. Et molestie ac feugiat sed lectus vestibulum mattis ullamcorper velit. Aliquam etiam erat velit scelerisque in. Augue lacus viverra vitae congue eu consequat ac felis. Vulputate sapien nec sagittis aliquam malesuada bibendum arcu. Ornare massa eget egestas purus viverra accumsan in. Feugiat in ante metus dictum at. Ultrices vitae auctor eu augue ut lectus arcu bibendum at. Venenatis a condimentum vitae sapien pellentesque habitant morbi. Morbi tristique senectus et netus et malesuada fames ac turpis. Nec ultrices dui sapien eget mi proin sed libero enim. Et netus et malesuada fames ac turpis egestas integer. Orci a scelerisque purus semper. Enim blandit volutpat maecenas volutpat. Odio pellentesque diam volutpat commodo sed egestas. Lectus urna duis convallis convallis. Fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate. Tincidunt arcu non sodales neque sodales ut etiam sit amet.');
INSERT OR IGNORE INTO Solution (taskId, solutionProvided, solutionChecked, solutionContent, solutionMark) VALUES
    (1, date('2023-02-10'), date('2023-03-02'), 'non', 80),
    (2, NULL, date('2023-04-02'), NULL, 0);
SELECT * FROM User;
SELECT * FROM Teacher;
SELECT * FROM Student;
SELECT * FROM Contract;
SELECT * FROM Course;
SELECT * FROM Lesson;
SELECT * FROM Task;
SELECT * FROM Solution;