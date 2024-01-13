CREATE TABLE IF NOT EXISTS User (
  userId INTEGER NOT NULL UNIQUE PRIMARY KEY AUTOINCREMENT,
  userName TEXT default '',
  userEmail TEXT default '',
  userIsTeacher BOOLEAN default 0,
  userPassword TEXT NOT NULL,
  loggin TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Teacher(
    teacherId INTEGER UNIQUE,
    FOREIGN KEY(teacherId) REFERENCES User(userId)
);

CREATE TABLE IF NOT EXISTS Student(
  	studentId INTEGER UNIQUE,
    FOREIGN KEY (studentId) REFERENCES User(userId)
);
CREATE TABLE IF NOT EXISTS Course (
    courseId INTEGER NOT NULL UNIQUE PRIMARY KEY AUTOINCREMENT,
    courseName TEXT NOT NULL,
    courseDatesOfStudyStart datetime DEFAULT (DATETIME('now')),  
    courseDatesOfStudyFinish datetime DEFAULT (DATETIME('now')) 
);
CREATE TABLE IF NOT EXISTS Student_Course (
  	studentId INTEGER UNIQUE,
  	courseId INTEGER UNIQUE,
    FOREIGN KEY (studentId) REFERENCES Student(studentid),
    FOREIGN KEY (courseId) REFERENCES Course(courseId)
);
CREATE TABLE IF NOT EXISTS Teacher_Course (
  	teacherid INTEGER UNIQUE,
  	courseId INTEGER UNIQUE,
    FOREIGN KEY (teacherid) REFERENCES Teacher(teacherid),
    FOREIGN KEY (courseId) REFERENCES Course(courseId)
);
CREATE TABLE IF NOT EXISTS Lesson (
    lessonId INTEGER NOT NULL UNIQUE PRIMARY KEY AUTOINCREMENT,
    lessonName TEXT NOT NULL,
    lessonDatesOfStudyStart datetime DEFAULT (DATETIME('now')),  
    lessonDatesOfStudyFinish datetime DEFAULT (DATETIME('now')),
    lessonContent TEXT DEFAULT '',
  	courseId INTEGER UNIQUE,
    FOREIGN KEY (courseId) REFERENCES Course (courseId)  
);
CREATE TABLE IF NOT EXISTS Task (
    taskId INTEGER NOT NULL UNIQUE PRIMARY KEY AUTOINCREMENT,
    taskDatesOfStudyStart datetime DEFAULT (DATETIME('now')),  
    taskDatesOfStudyFinish datetime DEFAULT (DATETIME('now')),
    taskContent TEXT DEFAULT '', 
  	lessonId INTEGER UNIQUE,
    FOREIGN KEY (lessonId) REFERENCES Lesson (lessonId) 
);
CREATE TABLE IF NOT EXISTS Solution (
    solutionId INTEGER NOT NULL UNIQUE PRIMARY KEY AUTOINCREMENT,
    solutionProvided datetime DEFAULT (DATETIME('now')),
    solutionContent TEXT DEFAULT '',
    solutionMark INTEGER DEFAULT 0,
  	taskId INTEGER UNIQUE,
  	studentId INTEGER UNIQUE,
    FOREIGN KEY (taskId) REFERENCES Task (taskId),
    FOREIGN KEY (studentId) REFERENCES Student (studentId) 
);