--Сделайте отбор по "Выведите", добавить первые строки и сохранить в файле "SELECT - many tables - problems.sql".

--Выражение "все данные" означает набор всех наиболее интересных полей из ВСЕХ таблиц без их дублирования.
--Во всех запросах выбирайте самую естественную (красивую) сортировку!

USE StudentsBaseSmall;

--Выведите всех студентов, находящихся в группах, с названиями групп и GroupID.
SELECT Students.IIN, Students.LastName, Students.FirstName, Groups.GroupName, Groups.GroupID
  FROM Groups INNER JOIN Students
    ON Groups.GroupID = Students.GroupID
  ORDER BY Students.LastName, Students.FirstName;

--Выведите всех студентов без групп.
SELECT StudentID, LastName, FirstName, GroupName
  FROM Students LEFT OUTER JOIN Groups
    ON Students.GroupID = Groups.GroupID
  WHERE GroupName IS NULL		
  ORDER BY LastName, FirstName;

--Выведите все группы co студентами.	
SELECT DISTINCT Groups.GroupID, GroupName
  FROM Groups INNER JOIN Students
    ON Groups.GroupID = Students.GroupID
  ORDER BY Groups.GroupID, GroupName;

--Выведите все группы без студентов.
SELECT DISTINCT Groups.GroupID, Groups.GroupName
  FROM Students RIGHT OUTER JOIN Groups
    ON Students.GroupID = Groups.GroupID
  WHERE StudentID IS NULL
  ORDER BY Groups.GroupID, Groups.GroupName;

--Выведите студентов, сдававших хоть один экзамен и причисленных к группе, с названием группы, курса, оценкой и датой экзамена.
SELECT Students.LastName, Students.FirstName, Groups.GroupName, Courses.CourseName, Exams.Grade, Exams.ExamDate
  FROM Courses INNER JOIN Exams
    ON Courses.CourseID = Exams.CourseID INNER JOIN Students
      ON Exams.StudentID = Students.StudentID INNER JOIN Groups
		ON Students.GroupID = Groups.GroupID
  ORDER BY Students.LastName, Students.FirstName;
  
--Выведите всех студентов (только StudentID, LastName, FirstName, Birthday), не сдававших ни одного экзамена. 
SELECT Students.StudentID, Students.LastName, Students.FirstName, Students.Birthday, Exams.Grade, Exams.ExamDate
FROM Students LEFT JOIN Exams
    ON Students.StudentID = Exams.StudentID LEFT JOIN Courses
      ON Exams.CourseID = Courses.CourseID 
		  WHERE Exams.StudentID is null
  ORDER BY Students.StudentID;

--Выведите всех студентов (только StudentID, LastName, FirstName, Birthday), сдававших хоть один экзамен
SELECT Students.StudentID, Students.LastName, Students.FirstName, Students.Birthday, Exams.Grade, Exams.ExamDate
  FROM Courses INNER JOIN Exams
    ON Courses.CourseID = Exams.CourseID INNER JOIN Students
      ON Exams.StudentID = Students.StudentID INNER JOIN Groups
        ON Students.GroupID = Groups.GroupID
  ORDER BY GroupName, LastName, FirstName;

--Выведите студентов, получивших 12 баллов хотя бы по одному экзамену, с названием группы, курса, оценкой и датой экзамена.
SELECT Students.StudentID, Students.LastName, Students.FirstName, Groups.GroupName, Exams.Grade, Exams.ExamDate
FROM Courses INNER JOIN Exams
    ON Courses.CourseID = Exams.CourseID INNER JOIN Students
      ON Exams.StudentID = Students.StudentID INNER JOIN Groups
		ON Students.GroupID = Groups.GroupID
		  WHERE Exams.Grade =12
  ORDER BY Students.LastName, Students.FirstName;

--Выведите все данные студентов, сдававших, но не сдавших экзамен(ы).
SELECT Students.StudentID, Students.LastName, Students.FirstName, Groups.GroupName, Exams.Grade, Exams.ExamDate
FROM Courses INNER JOIN Exams
    ON Courses.CourseID = Exams.CourseID INNER JOIN Students
      ON Exams.StudentID = Students.StudentID INNER JOIN Groups
		ON Students.GroupID = Groups.GroupID
		  WHERE Exams.Grade < 6
  ORDER BY Students.LastName, Students.FirstName;


--Выведите все данные по группе GroupID=147.
SELECT Students.IIN, Students.LastName, Students.FirstName, Groups.GroupName, Groups.GroupID
  FROM Groups INNER JOIN Students
    ON Groups.GroupID = Students.GroupID
	 WHERE Groups.GroupID = 147
  ORDER BY Students.LastName, Students.FirstName;

--Выведите все данные по группе c заданным названием.
SELECT Students.IIN, Students.LastName, Students.FirstName, Groups.GroupName
  FROM Groups INNER JOIN Students
    ON Groups.GroupID = Students.GroupID
	 WHERE Groups.GroupName = 'TYF-09'
  ORDER BY Students.LastName, Students.FirstName;

--Выведите все данные по курсу с заданным CourseID.
SELECT Courses.CourseName, Students.LastName, Students.FirstName, Groups.GroupName, Courses.CourseID
FROM Courses INNER JOIN Exams
    ON Courses.CourseID = Exams.CourseID INNER JOIN Students
      ON Exams.StudentID = Students.StudentID INNER JOIN Groups
		ON Students.GroupID = Groups.GroupID
		  WHERE Courses.CourseID = 13
  ORDER BY Students.LastName, Students.FirstName;

--Выведите все данные по курсу "Database Systems".
SELECT Courses.CourseID, Courses.CourseName, Students.LastName, Students.FirstName, Groups.GroupName
FROM Courses INNER JOIN Exams
    ON Courses.CourseID = Exams.CourseID INNER JOIN Students
      ON Exams.StudentID = Students.StudentID INNER JOIN Groups
		ON Students.GroupID = Groups.GroupID
		  WHERE Courses.CourseName = 'Database Systems'
  ORDER BY Students.LastName, Students.FirstName;

--Выведите все данные по заданной группе и курсу.
SELECT Courses.CourseID, Courses.CourseName, Students.LastName, Students.FirstName, Groups.GroupName
FROM Courses INNER JOIN Exams
    ON Courses.CourseID = Exams.CourseID INNER JOIN Students
      ON Exams.StudentID = Students.StudentID INNER JOIN Groups
		ON Students.GroupID = Groups.GroupID
		  WHERE Courses.CourseName = 'Database Systems' AND Groups.GroupName = 'WPE-04'
  ORDER BY Students.LastName, Students.FirstName;

--Выведите все данные по студенту с заданным StudentID.
SELECT Students.IIN, Students.LastName, Students.FirstName, Groups.GroupName
  FROM Groups INNER JOIN Students
    ON Groups.GroupID = Students.GroupID
	 WHERE Students.StudentID = 147
  ORDER BY Students.LastName, Students.FirstName;

--Выведите все данные по студентам, сдававших хоть один экзамен и причисленных к группам, с заданной фамилией и именем.
SELECT Students.LastName, Students.FirstName, Groups.GroupName, Courses.CourseName, Exams.Grade, Exams.ExamDate
  FROM Courses INNER JOIN Exams
    ON Courses.CourseID = Exams.CourseID INNER JOIN Students
      ON Exams.StudentID = Students.StudentID INNER JOIN Groups
		ON Students.GroupID = Groups.GroupID
		WHERE Students.LastName IN('Kozey', 'Abbott', 'Marvin') AND Students.FirstName IN ('Susie', 'Dan', 'Trevor') 
  ORDER BY Students.LastName, Students.FirstName;

--Выведите все данные по экзаменам, сдававшимся в заданном интервале дат.
SELECT Students.LastName, Students.FirstName, Courses.CourseName, Exams.Grade, Exams.ExamDate
  FROM Courses INNER JOIN	Exams
    ON Courses.CourseID = Exams.CourseID INNER JOIN Students
      ON Exams.StudentID = Students.StudentID
	  WHERE ExamDate >= '2017-07-17' AND ExamDate <= '2018-07-17'
  ORDER BY Exams.ExamDate;

--Выведите все данные по экзаменам, сдававшимся в заданном интервале дат для заданной группы.
SELECT Students.LastName, Students.FirstName, Courses.CourseName, Groups.GroupName, Exams.Grade, Exams.ExamDate
  FROM Courses INNER JOIN	Exams
    ON Courses.CourseID = Exams.CourseID INNER JOIN Students
      ON Exams.StudentID = Students.StudentID INNER JOIN Groups
		ON Students.GroupID = Groups.GroupID
	  WHERE ExamDate >= '2017-07-17' AND ExamDate <= '2018-07-17' AND Groups.GroupName = 'WPE-04'
  ORDER BY Exams.ExamDate;

--Выведите все данные по экзаменам, сдававшимся в заданном интервале дат для заданного курса.
SELECT Students.LastName, Students.FirstName, Courses.CourseName, Groups.GroupName, Exams.Grade, Exams.ExamDate
  FROM Courses INNER JOIN	Exams
    ON Courses.CourseID = Exams.CourseID INNER JOIN Students
      ON Exams.StudentID = Students.StudentID INNER JOIN Groups
		ON Students.GroupID = Groups.GroupID
	  WHERE ExamDate >= '2017-01-01' AND ExamDate <= '2018-01-01' AND Courses.CourseName = 'Database Systems'
  ORDER BY Exams.ExamDate;

--Выведите всех студентов (только StudentID, LastName, FirstName, Birthday), сдававшим экзамены в заданном интервале дат.
SELECT Students.LastName, Students.FirstName, Students.Birthday, Exams.Grade, Exams.ExamDate
  FROM Courses INNER JOIN	Exams
    ON Courses.CourseID = Exams.CourseID INNER JOIN Students
      ON Exams.StudentID = Students.StudentID 
	  WHERE ExamDate >= '2017-01-01' AND ExamDate <= '2018-01-01' AND Exams.Grade >= 9
  ORDER BY Exams.ExamDate;

--Выведите курсы, по которым не сдавался ни один экзамен.                                                     -- доработать

DELETE FROM EXAMS WHERE CourseID = 1; --для проверки удалим с EXAMS один курс
--SELECT * FROM EXAMS WHERE CourseID = 1;

SELECT Courses.CourseID, Courses.CourseName
FROM Courses LEFT JOIN Exams
    ON Courses.CourseID = Exams.CourseID 
	      WHERE Exams.CourseID is null
  ORDER BY Courses.CourseName;

--Выведите курсы, по которым сдавался хотя бы один экзамен.
SELECT DISTINCT Courses.CourseID, Courses.CourseName
FROM Courses INNER JOIN Exams
    ON Courses.CourseID = Exams.CourseID 
  ORDER BY Courses.CourseName;

--Выведите курсы, по которым сдавались экзамены студентами, состоящими в группах.
SELECT Courses.CourseID, Courses.CourseName, Students.LastName, Students.LastName, Groups.GroupName, Exams.ExamDate
FROM Courses INNER JOIN Exams
    ON Courses.CourseID = Exams.CourseID INNER JOIN Students
      ON Exams.StudentID = Students.StudentID INNER JOIN Groups
		ON Students.GroupID = Groups.GroupID
  ORDER BY Courses.CourseName;

--Выведите курсы, по которым сдавались экзамены студентами без групп.
SELECT Courses.CourseID, Courses.CourseName, Students.LastName, Students.LastName, Groups.GroupName, Exams.ExamDate
FROM Courses INNER JOIN Exams
    ON Courses.CourseID = Exams.CourseID RIGHT OUTER JOIN Students
      ON Exams.StudentID = Students.StudentID LEFT OUTER JOIN Groups
		ON Students.GroupID = Groups.GroupID
		 WHERE Students.GroupID IS NULL
  ORDER BY Courses.CourseName;


--Выведите студентов, сдававших хоть один экзамен и причисленных к группе, с названием группы, курса, оценкой и датой экзамена.
SELECT Courses.CourseID, Courses.CourseName, Students.LastName, Students.LastName, Groups.GroupName, Exams.Grade, Exams.ExamDate
FROM Courses INNER JOIN Exams
    ON Courses.CourseID = Exams.CourseID INNER JOIN Students
      ON Exams.StudentID = Students.StudentID INNER JOIN Groups
		ON Students.GroupID = Groups.GroupID
  ORDER BY Courses.CourseName;


ДОПОЛНИТЕЛЬНЫЕ ЗАДАЧИ

--Выведите студентов, сдававших хоть один экзамен, с названием группы (NULL, если нет группы), курса, оценкой и датой экзамена.
SELECT Courses.CourseID, Courses.CourseName, Students.LastName, Students.LastName, Groups.GroupName, Exams.Grade, Exams.ExamDate
FROM Courses LEFT JOIN Exams
    ON Courses.CourseID = Exams.CourseID LEFT JOIN Students
      ON Exams.StudentID = Students.StudentID LEFT JOIN Groups
		ON Students.GroupID = Groups.GroupID
  ORDER BY Groups.GroupName;

--Выведите GroupName (NULL в случае отсутствия группы у студента!),  StudentID, IIN, LastName, FirstName студентов, не сдававших ни одного экзамена.
SELECT Students.StudentID, Students.LastName, Students.FirstName, Students.Birthday, Groups.GroupName, Exams.Grade, Exams.ExamDate
FROM Students LEFT JOIN Exams
    ON Students.StudentID = Exams.StudentID LEFT JOIN Courses
      ON Exams.CourseID = Courses.CourseID LEFT JOIN Groups
		ON Students.GroupID = Groups.GroupID
		  WHERE Exams.StudentID is null
  ORDER BY Students.StudentID;

--Выведите все данные по студентам с заданной фамилией и именем.

SELECT Students.LastName, Students.FirstName, Groups.GroupName, Courses.CourseName, Exams.Grade, Exams.ExamDate
  FROM Courses INNER JOIN Exams
    ON Courses.CourseID = Exams.CourseID INNER JOIN Students
      ON Exams.StudentID = Students.StudentID INNER JOIN Groups
		ON Students.GroupID = Groups.GroupID
		WHERE Students.LastName IN('Kozey', 'Abbott', 'Marvin') AND Students.FirstName IN ('Susie', 'Dan', 'Trevor') 
  ORDER BY Students.LastName, Students.FirstName;
