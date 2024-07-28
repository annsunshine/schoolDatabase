# School Database
## Description
I created this SQL project to have the most significant data taken from the School database. Therefore, the owner of the language school would have up to date pieces of information connected to the situation in the organisation. Thanks to that them could change or correct an offer of the language school.
</br>
</br>
/* Required for using School database */ </br>
use School; </br>
</br>
/* I wanted to find students who started course on 1st of September to know what type of course and its length they chose. */  </br>
SELECT idStudent, courseLength, courseType  </br>
FROM dbo.Program  </br>
WHERE startDate= '01.09.2023'  </br>
![image](https://github.com/user-attachments/assets/c4e94a78-4513-4a6d-86c6-9521122e47e5)
</br>
/* My intention was to check types of course which are available at the school. */  </br>
SELECT DISTINCT (courseType)  </br>
FROM dbo.Program;  </br>
![image](https://github.com/user-attachments/assets/d89a66e2-fdf5-47ef-8a70-5bc927e1f219)
 </br>
/* I wanted to check what length of course is preferred by the students. */  </br>
SELECT idStudent, courseLength  </br>
FROM dbo.Program  </br>
ORDER BY idProgramme  </br>
![image](https://github.com/user-attachments/assets/50cce243-3b65-4f8b-9bd6-c622272851b2)
 </br>
/* My goal was to check how many students have chosen 144hours’ programme. */  </br>
SELECT idStudent  </br>
FROM dbo.Program </br>
WHERE courseLength in (144);  </br>
![image](https://github.com/user-attachments/assets/7e3e331a-acc6-4543-a6fb-953d486b65d3)
</br>
/* I wanted to check for which language students are able to pay 14400PLN. */ </br>
SELECT Language </br>
FROM dbo.Course </br>
WHERE price= '14400' </br>
ORDER BY idStudent; </br>
![image](https://github.com/user-attachments/assets/bee3ab56-c018-4fae-bfdd-1c4fd1f84123)
</br>
/* I wanted to find out how many students are still studying. */ </br>
SELECT idStudent </br>
FROM dbo.Course </br>
WHERE stopDate is null </br>
![image](https://github.com/user-attachments/assets/9d5b6e36-e174-4c6a-8946-7caad1b35e32)
</br>
/* I wanted to check how many students’ names start from ‘L’ letter. */ </br>
SELECT name, surname </br>
FROM dbo.LevelOfLanguage </br>
WHERE name like 'L%' </br>
ORDER BY idStudent </br>
![image](https://github.com/user-attachments/assets/eccb01f4-1681-41cc-811f-3698bd9408f1)
</br>
/* My aim was to find students who take classes on language level from A1 to B1. */ </br>
SELECT idStudent, name </br>
FROM dbo.LevelOfLanguage </br>
WHERE languageLevel between 'A1' and 'B1' </br>
![image](https://github.com/user-attachments/assets/c3a5a609-d9a7-4922-8e18-ba3bc069b42c)
</br>
/* I wanted to be familiar with information when students started attending classes at school. */ </br>
SELECT min(dateStart) as 'The eldest start date of the course' </br>
FROM dbo.OnlineCourse </br>
GROUP BY idStudent </br>
![image](https://github.com/user-attachments/assets/39bf9fe7-3fef-47a4-8cf3-7815dcdf3379)
</br>
/* I wanted to check how many students are studying online and which language they chose. */ </br>
SELECT Language </br>
FROM dbo.OnlineCourse </br>
WHERE status= 'active' </br>
![image](https://github.com/user-attachments/assets/14e78db2-773f-496e-b052-3bb1adc51135)
</br>
/* I wanted to check how much the school has earned from in-person classes. */ </br>
SELECT sum(totalPrice) </br>
FROM dbo.CoursePrice </br>
WHERE courseType= 'in-person' </br>
![image](https://github.com/user-attachments/assets/d7085b34-0a56-4884-a2c2-491f4f3caf45)
</br>
/* The intention was to find out in which language level students are interested in, if they choose the longest course and how much they are able to pay for it per hour. */ </br>
SELECT languageLevel, pricePerHour, min(courseLength) </br>
FROM dbo.CoursePrice </br>
GROUP BY languageLevel, pricePerHour </br>
HAVING min(courseLength) = '144' </br>
![image](https://github.com/user-attachments/assets/7ee9fe14-cef1-4649-9597-40de98df11c7)
</br>
/* The aim was to check which students started the adventure with learning a foreign language, to give them one hour of course for free, in a form of bonus. */ </br>
SELECT idProgramme, courseLength, pricePerHour, </br>
    case when languageLevel='A1' then  courseLength + 1 </br>
	else courseLength </br>
	end as 'bonus' </br>
FROM dbo.CoursePrice </br>
![image](https://github.com/user-attachments/assets/d0d45682-78bd-4470-b53f-a8305e81ea63)
</br>
/* Here I wanted to show the level of students’ linguistic skills  by introducing the common part of two tables, Course and Level of language. */ </br>
SELECT * </br>
FROM dbo.Course as DC, dbo.LevelOfLanguage as DLL </br>
WHERE DC.idStudent = DLL.idStudent </br>
SELECT DC.language, DLL.languageLevel </br>
FROM dbo.Course as DC </br>
INNER JOIN dbo.LevelOfLanguage as DLL ON DC.idStudent = DLL.idStudent </br>
![image](https://github.com/user-attachments/assets/826a0ba8-8797-42fa-8d75-fad9f3cea4e0)
</br>
/* The purpose was to connect data from table Student and table Type of language and have student’s status, type of course and surname combined in one results' table. */ </br>
SELECT *. </br>
FROM dbo.Student as DS, dbo.TypeOfLanguage as DTL </br>
WHERE DS.idStudent = DTL.idStudent </br>
</br>
SELECT DS.status, DTL.* </br>
FROM dbo.Student as DS </br>
RIGHT JOIN dbo.TypeOfLanguage as DTL ON DS.idStudent = DTL.idStudent </br>
![image](https://github.com/user-attachments/assets/30c9ed97-502b-4a18-89ca-a0b31e33feb9)
</br>
/* The goal was to merge table Teacher with table Course and check which language teach each teacher. */ </br>
SELECT DT.*, DC.language </br>
FROM dbo.Teacher as DT </br>
LEFT JOIN dbo.Course as DC ON DT.idTeacher = DC.idTeacher </br>
ORDER BY idTeacher </br>
![image](https://github.com/user-attachments/assets/9e299e61-dd7d-4c30-aa98-766b36b20777)
</br>
/* Here I wanted to check what type of course have chosen students who preferred 72hours course. */ </br>
SELECT courseType, courseLength </br>
FROM dbo.CoursePrice </br>
WHERE courseLength < (SELECT courseLength </br>
                      FROM dbo.CoursePrice </br>
					  WHERE idProgramme = 1) </br>
ORDER BY idProgramme </br>
![image](https://github.com/user-attachments/assets/7ab55bb2-0cbd-4b2e-97b5-9ba55094963e)
</br>
/* Here I wanted to find out what program preferred students who have chosen 72hours course with price per hour equal to 100. */ </br>
SELECT idProgramme, courseLength, pricePerHour </br>
FROM dbo.CoursePrice </br>
WHERE idProgramme IN (SELECT idProgramme </br>
                      FROM dbo.CoursePrice </br>
					  WHERE pricePerHour= '100') </br>
				  AND courseLength <> 144 </br>
ORDER BY idProgramme </br>
![image](https://github.com/user-attachments/assets/dd0751f7-e5aa-40c5-8225-95b2c1c6d8b2)
</br>
/* Here I wanted to check which students started course on 01.09.2023 and the programme they chose. */ </br>
SELECT startDate, idStudent, idProgramme </br>
FROM dbo.Program </br>
WHERE idStudent = ANY (SELECT idStudent </br>
                         FROM dbo.Program </br>
						 WHERE startDate='01.09.2023') </br>
ORDER BY idProgramme </br>
![image](https://github.com/user-attachments/assets/2025517d-355b-478a-b0cf-eb604f4ff0bd)
</br>
/* Here I wanted to know which students are studying in-person. */ </br>
SELECT idStudent, startDate, language </br>
FROM dbo.Course </br>
EXCEPT </br>
SELECT idStudent, dateStart, language </br>
FROM dbo.OnlineCourse </br>
![image](https://github.com/user-attachments/assets/7b396caf-5c56-4814-a950-4fe57d07d493)
