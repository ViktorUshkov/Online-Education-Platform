/*предоставление решения на платформе*/
INSERT OR IGNORE INTO Solution(studentid, taskid, solutioncontent) VALUES
 ((SELECT studentid
 FROM Student 
 WHERE studentid = (SELECT userid FROM User WHERE loggin = 'wee')),
 (SELECT taskid
 FROM Task 
 WHERE taskid = 1), 'sol1');
 
 SELECT * FROM Solution;