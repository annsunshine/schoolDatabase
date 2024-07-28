# School Database
## Description
I created this SQL project to have the most significant data taken from the School database. Therefore, the owner of the language school would have up to date pieces of information connected to the situation in the organisation. Thanks to that them could change or correct an offer of the language school.
</br>
</br>
```sql
/* Required for using School database */
use School;
```
___
```sql
/* I wanted to find students who started course on 1st of September to know what type of course and its length they chose. */
SELECT idStudent, courseLength, courseType
FROM dbo.Program
WHERE startDate= '01.09.2023'
```
![image](https://github.com/user-attachments/assets/c4e94a78-4513-4a6d-86c6-9521122e47e5)
___
```sql
/* My intention was to check types of course which are available at the school. */
SELECT DISTINCT (courseType)
FROM dbo.Program;
```
![image](https://github.com/user-attachments/assets/d89a66e2-fdf5-47ef-8a70-5bc927e1f219)
___
```sql
/* I wanted to check what length of course is preferred by the students. */
SELECT idStudent, courseLength
FROM dbo.Program
ORDER BY idProgramme
```
![image](https://github.com/user-attachments/assets/50cce243-3b65-4f8b-9bd6-c622272851b2)
___
```sql
/* My goal was to check how many students have chosen 144hours’ programme. */
SELECT idStudent
FROM dbo.Program
WHERE courseLength in (144);
````
![image](https://github.com/user-attachments/assets/7e3e331a-acc6-4543-a6fb-953d486b65d3)
___
```sql
/* I wanted to check for which language students are able to pay 14400PLN. */
SELECT Language
FROM dbo.Course
WHERE price= '14400'
ORDER BY idStudent;
```
![image](https://github.com/user-attachments/assets/bee3ab56-c018-4fae-bfdd-1c4fd1f84123)
___
```sql
/* I wanted to find out how many students are still studying. */
SELECT idStudent
FROM dbo.Course
WHERE stopDate is null
```
![image](https://github.com/user-attachments/assets/9d5b6e36-e174-4c6a-8946-7caad1b35e32)
___
```sql
/* I wanted to check how many students’ names start from ‘L’ letter. */
SELECT name, surname
FROM dbo.LevelOfLanguage
WHERE name like 'L%'
ORDER BY idStudent
```
![image](https://github.com/user-attachments/assets/eccb01f4-1681-41cc-811f-3698bd9408f1)
___
```sql
/* My aim was to find students who take classes on language level from A1 to B1. */
SELECT idStudent, name
FROM dbo.LevelOfLanguage
WHERE languageLevel between 'A1' and 'B1'
```
![image](https://github.com/user-attachments/assets/c3a5a609-d9a7-4922-8e18-ba3bc069b42c)
___
```sql
/* I wanted to be familiar with information when students started attending classes at school. */
SELECT min(dateStart) as 'The eldest start date of the course'
FROM dbo.OnlineCourse
GROUP BY idStudent
```
![image](https://github.com/user-attachments/assets/39bf9fe7-3fef-47a4-8cf3-7815dcdf3379)
___
```sql
/* I wanted to check how many students are studying online and which language they chose. */
SELECT Language
FROM dbo.OnlineCourse
WHERE status= 'active'
```
![image](https://github.com/user-attachments/assets/14e78db2-773f-496e-b052-3bb1adc51135)
___
```sql
/* I wanted to check how much the school has earned from in-person classes. */
SELECT sum(totalPrice)
FROM dbo.CoursePrice
WHERE courseType= 'in-person'
```
![image](https://github.com/user-attachments/assets/d7085b34-0a56-4884-a2c2-491f4f3caf45)
___
```sql
/* The intention was to find out in which language level students are interested in, if they choose the longest course and how much they are able to pay for it per hour. */
SELECT languageLevel, pricePerHour, min(courseLength)
FROM dbo.CoursePrice
GROUP BY languageLevel, pricePerHour
HAVING min(courseLength) = '144'
```
![image](https://github.com/user-attachments/assets/7ee9fe14-cef1-4649-9597-40de98df11c7)
___
```sql
/* The aim was to check which students started the adventure with learning a foreign language, to give them one hour of course for free, in a form of bonus. */
SELECT idProgramme, courseLength, pricePerHour,
    case when languageLevel='A1' then  courseLength + 1
	else courseLength
	end as 'bonus'
FROM dbo.CoursePrice
```
![image](https://github.com/user-attachments/assets/d0d45682-78bd-4470-b53f-a8305e81ea63)
___
```sql
/* Here I wanted to show the level of students’ linguistic skills  by introducing the common part of two tables, Course and Level of language. */
SELECT *
FROM dbo.Course as DC, dbo.LevelOfLanguage as DLL
WHERE DC.idStudent = DLL.idStudent
SELECT DC.language, DLL.languageLevel
FROM dbo.Course as DC
INNER JOIN dbo.LevelOfLanguage as DLL ON DC.idStudent = DLL.idStudent
```
![image](https://github.com/user-attachments/assets/826a0ba8-8797-42fa-8d75-fad9f3cea4e0)
___
```sql
/* The purpose was to connect data from table Student and table Type of language and have student’s status, type of course and surname combined in one results' table. */
SELECT *
FROM dbo.Student as DS, dbo.TypeOfLanguage as DTL
WHERE DS.idStudent = DTL.idStudent

SELECT DS.status, DTL.*
FROM dbo.Student as DS </br>
RIGHT JOIN dbo.TypeOfLanguage as DTL ON DS.idStudent = DTL.idStudent
```
![image](https://github.com/user-attachments/assets/30c9ed97-502b-4a18-89ca-a0b31e33feb9)
___
```sql
/* The goal was to merge table Teacher with table Course and check which language teach each teacher. */
SELECT DT.*, DC.language
FROM dbo.Teacher as DT
LEFT JOIN dbo.Course as DC ON DT.idTeacher = DC.idTeacher
ORDER BY idTeacher
```
![image](https://github.com/user-attachments/assets/9e299e61-dd7d-4c30-aa98-766b36b20777)
___
```sql
/* Here I wanted to check what type of course have chosen students who preferred 72hours course. */
SELECT courseType, courseLength
FROM dbo.CoursePrice
WHERE courseLength < (SELECT courseLength
                      FROM dbo.CoursePrice
		      WHERE idProgramme = 1)
ORDER BY idProgramme
```
![image](https://github.com/user-attachments/assets/7ab55bb2-0cbd-4b2e-97b5-9ba55094963e)
___
```sql
/* Here I wanted to find out what program preferred students who have chosen 72hours course with price per hour equal to 100. */
SELECT idProgramme, courseLength, pricePerHour
FROM dbo.CoursePrice
WHERE idProgramme IN (SELECT idProgramme
                      FROM dbo.CoursePrice
		      WHERE pricePerHour= '100')
AND courseLength <> 144
ORDER BY idProgramme
```
![image](https://github.com/user-attachments/assets/dd0751f7-e5aa-40c5-8225-95b2c1c6d8b2)
___
```sql
/* Here I wanted to check which students started course on 01.09.2023 and the programme they chose. */
SELECT startDate, idStudent, idProgramme
FROM dbo.Program
WHERE idStudent = ANY (SELECT idStudent
                       FROM dbo.Program
		       WHERE startDate='01.09.2023')
ORDER BY idProgramme
```
![image](https://github.com/user-attachments/assets/2025517d-355b-478a-b0cf-eb604f4ff0bd)
___
```sql
/* Here I wanted to know which students are studying in-person. */
SELECT idStudent, startDate, language
FROM dbo.Course
EXCEPT
SELECT idStudent, dateStart, language
FROM dbo.OnlineCourse
```
![image](https://github.com/user-attachments/assets/7b396caf-5c56-4814-a950-4fe57d07d493)
