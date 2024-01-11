CREATE TABLE IF NOT EXISTS User (
  userId INTEGER NOT NULL UNIQUE PRIMARY KEY AUTOINCREMENT,
  userName TEXT NOT NULL,
  userEmail TEXT NOT NULL UNIQUE,
  userIsTeacher BOOLEAN NOT NULLб
  listOfCourses TEXT NOT NULL,
  listOfCoursesId INTEGER,
  FOREIGN KEY (listOfCoursesId) REFERENCES Course (courseId)
);

CREATE TABLE IF NOT EXISTS Teacher(
    teacherId INTEGER,
    FOREIGN KEY (teacherId) REFERENCES User (userId),
  	userPassword TEXT NOT NULL,
  	loggin TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Student(
    studentId INTEGER,
    FOREIGN KEY (studentId) REFERENCES User (userId),
  	userPassword TEXT NOT NULL,
  	loggin TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Course (
    courseId INTEGER NOT NULL UNIQUE PRIMARY KEY AUTOINCREMENT,
    courseName TEXT NOT NULL,
    courseDatesOfStudyStart date NOT NULL,  
    courseDatesOfStudyFinish date NOT NULL,
  	listOfLessonsId INTEGER,
    FOREIGN KEY (listOfLessonsId) REFERENCES Course (lessonId)  
);
CREATE TABLE IF NOT EXISTS Lesson (
    lessonId INTEGER NOT NULL UNIQUE PRIMARY KEY AUTOINCREMENT,
    lessonName TEXT NOT NULL,
    lessonDatesOfStudyStart date NOT NULL,  
    lessonDatesOfStudyFinish date NOT NULL
    lessonContent TEXT NOT NULL,
  	listOfTasksId INTEGER,
    FOREIGN KEY (listOfTasksId) REFERENCES Task (taskId)  
);
CREATE TABLE IF NOT EXISTS Task (
    Task INTEGER NOT NULL UNIQUE PRIMARY KEY AUTOINCREMENT,
    taskDatesOfStudyStart date NOT NULL,  
    taskDatesOfStudyFinish date NOT NULL
    taskContent TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS Solution (
    solutionId INTEGER NOT NULL UNIQUE PRIMARY KEY AUTOINCREMENT,
    solutionProvided date NOT NULL,
    solutionContent TEXT NOT NULL,
    solutionMark INTEGER NOT NULL
);