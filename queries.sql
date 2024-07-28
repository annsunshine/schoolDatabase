/* Required for using School database */
use School;


/* Display all data from "Program" table */
SELECT *
FROM dbo.Program;


/* I wanted to find students who started course on 1st of September to know what type of course and its length they chose. */
SELECT idStudent, courseLength, courseType
FROM dbo.Program
WHERE startDate= '01.09.2023'


/* My intention was to check types of course which are available at the school. */
SELECT DISTINCT (courseType)
FROM dbo.Program;


/* I wanted to check what length of course is preferred by the students. */
SELECT idStudent, courseLength
FROM dbo.Program
ORDER BY idProgramme


/* My goal was to check how many students have chosen 144hours’ programme. */
SELECT idStudent 
FROM dbo.Program
WHERE courseLength in (144);


/* Display all data from "Course" table */
SELECT *
FROM Course;


/* I wanted to check for which language students are able to pay 14400PLN. */
SELECT Language
FROM dbo.Course
WHERE price= '14400'
ORDER BY idStudent;


/* I wanted to find out how many students are still studying. */
SELECT idStudent 
FROM dbo.Course
WHERE stopDate is null


/* Display all data from "LevelOfLanguage" table */
SELECT *
FROM dbo.LevelOfLanguage;


/* I wanted to check how many students’ names start from ‘L’ letter. */
SELECT name, surname
FROM dbo.LevelOfLanguage
WHERE name like 'L%'
ORDER BY idStudent


/* My aim was to find students who take classes on language level from A1 to B1. */
SELECT idStudent, name
FROM dbo.LevelOfLanguage
WHERE languageLevel between 'A1' and 'B1'


/* Display all data from "OnlineCourse" table */
SELECT *
FROM dbo.OnlineCourse


/* I wanted to be familiar with information when students started attending classes at school. */
SELECT min(dateStart) as 'The eldest start date of the course'
FROM dbo.OnlineCourse
GROUP BY idStudent


/* I wanted to check how many students are studying online and which language they chose. */
SELECT Language
FROM dbo.OnlineCourse
WHERE status= 'active'


/* Display all data from "CoursePrice" table */
SELECT *
FROM dbo.CoursePrice


/* I wanted to check how much the school has earned from in-person classes. */
SELECT sum(totalPrice)
FROM dbo.CoursePrice
WHERE courseType= 'in-person'


/* The intention was to find out in which language level students are interested in, if they choose the longest course and how much they are able to pay for it per hour. */
SELECT languageLevel, pricePerHour, min(courseLength)
FROM dbo.CoursePrice
GROUP BY languageLevel, pricePerHour
HAVING min(courseLength) = '144' 


/* The aim was to check which students started the adventure with learning a foreign language, to give them one hour of course for free, in a form of bonus. */
SELECT idProgramme, courseLength, pricePerHour,
    case when languageLevel='A1' then  courseLength + 1
	else courseLength
	end as 'bonus'
FROM dbo.CoursePrice


/* Here I wanted to show the level of students’ linguistic skills  by introducing the common part of two tables, Course and Level of language. */
SELECT *
FROM dbo.Course as DC, dbo.LevelOfLanguage as DLL
WHERE DC.idStudent = DLL.idStudent

SELECT DC.language, DLL.languageLevel
FROM dbo.Course as DC
INNER JOIN dbo.LevelOfLanguage as DLL ON DC.idStudent = DLL.idStudent


/* Display all data from "TypeOfLanguage" table */
SELECT *
FROM dbo.TypeOfLanguage


/* Display all data from "Student" table */
SELECT *
FROM dbo.Student


/* The purpose was to connect data from table Student and table Type of language and have student’s status, type of course and surname combined in one results' table. */
SELECT *.
FROM dbo.Student as DS, dbo.TypeOfLanguage as DTL
WHERE DS.idStudent = DTL.idStudent

SELECT DS.status, DTL.*
FROM dbo.Student as DS
RIGHT JOIN dbo.TypeOfLanguage as DTL ON DS.idStudent = DTL.idStudent


/* Display all data from "Teacher" table */
SELECT *
FROM dbo.Teacher


/* Display all data from "Course" table */
SELECT *
FROM dbo.Course


/* The goal was to merge table Teacher with table Course and check which language teach each teacher. */
SELECT DT.*, DC.language
FROM dbo.Teacher as DT
LEFT JOIN dbo.Course as DC ON DT.idTeacher = DC.idTeacher
ORDER BY idTeacher


/* Here I wanted to check what type of course have chosen students who preferred 72hours course. */
SELECT courseType, courseLength
FROM dbo.CoursePrice
WHERE courseLength < (SELECT courseLength
                      FROM dbo.CoursePrice
					  WHERE idProgramme = 1)
ORDER BY idProgramme


/* Here I wanted to find out what program preferred students who have chosen 72hours course with price per hour equal to 100. */
SELECT idProgramme, courseLength, pricePerHour
FROM dbo.CoursePrice
WHERE idProgramme IN (SELECT idProgramme
                      FROM dbo.CoursePrice
					  WHERE pricePerHour= '100')
				  AND courseLength <> 144
ORDER BY idProgramme


/* Here I wanted to check which students started course on 01.09.2023 and the programme they chose. */
SELECT startDate, idStudent, idProgramme
FROM dbo.Program
WHERE idStudent = ANY (SELECT idStudent
                         FROM dbo.Program
						 WHERE startDate='01.09.2023')
ORDER BY idProgramme


/* Here I wanted to know which students are studying in-person. */
SELECT idStudent, startDate, language
FROM dbo.Course
EXCEPT
SELECT idStudent, dateStart, language 
FROM dbo.OnlineCourse