/*управление данными профиля*/
UPDATE User
SET userEmail = "fio3@somemail.com"
WHERE userid = (SELECT teacherid
               FROM Teacher);

UPDATE User
SET userName = "ФИО1"
WHERE userid = (SELECT studentid
               FROM Student) and loggin = 'wee';
SELECT * FROM User;