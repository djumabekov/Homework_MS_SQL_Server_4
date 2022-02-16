--�������� ����� �� "��������", �������� ������ ������ � ��������� � ����� "SELECT - many tables - problems.sql".

--��������� "��� ������" �������� ����� ���� �������� ���������� ����� �� ���� ������ ��� �� ������������.
--�� ���� �������� ��������� ����� ������������ (��������) ����������!

USE StudentsBaseSmall;

--�������� ���� ���������, ����������� � �������, � ���������� ����� � GroupID.
SELECT Students.IIN, Students.LastName, Students.FirstName, Groups.GroupName, Groups.GroupID
  FROM Groups INNER JOIN Students
    ON Groups.GroupID = Students.GroupID
  ORDER BY Students.LastName, Students.FirstName;

--�������� ���� ��������� ��� �����.
SELECT StudentID, LastName, FirstName, GroupName
  FROM Students LEFT OUTER JOIN Groups
    ON Students.GroupID = Groups.GroupID
  WHERE GroupName IS NULL		
  ORDER BY LastName, FirstName;

--�������� ��� ������ co ����������.	
SELECT DISTINCT Groups.GroupID, GroupName
  FROM Groups INNER JOIN Students
    ON Groups.GroupID = Students.GroupID
  ORDER BY Groups.GroupID, GroupName;

--�������� ��� ������ ��� ���������.
SELECT DISTINCT Groups.GroupID, Groups.GroupName
  FROM Students RIGHT OUTER JOIN Groups
    ON Students.GroupID = Groups.GroupID
  WHERE StudentID IS NULL
  ORDER BY Groups.GroupID, Groups.GroupName;

--�������� ���������, ��������� ���� ���� ������� � ������������ � ������, � ��������� ������, �����, ������� � ����� ��������.
SELECT Students.LastName, Students.FirstName, Groups.GroupName, Courses.CourseName, Exams.Grade, Exams.ExamDate
  FROM Courses INNER JOIN Exams
    ON Courses.CourseID = Exams.CourseID INNER JOIN Students
      ON Exams.StudentID = Students.StudentID INNER JOIN Groups
		ON Students.GroupID = Groups.GroupID
  ORDER BY Students.LastName, Students.FirstName;
  
--�������� ���� ��������� (������ StudentID, LastName, FirstName, Birthday), �� ��������� �� ������ ��������. 
SELECT Students.StudentID, Students.LastName, Students.FirstName, Students.Birthday, Exams.Grade, Exams.ExamDate
FROM Students LEFT JOIN Exams
    ON Students.StudentID = Exams.StudentID LEFT JOIN Courses
      ON Exams.CourseID = Courses.CourseID 
		  WHERE Exams.StudentID is null
  ORDER BY Students.StudentID;

--�������� ���� ��������� (������ StudentID, LastName, FirstName, Birthday), ��������� ���� ���� �������
SELECT Students.StudentID, Students.LastName, Students.FirstName, Students.Birthday, Exams.Grade, Exams.ExamDate
  FROM Courses INNER JOIN Exams
    ON Courses.CourseID = Exams.CourseID INNER JOIN Students
      ON Exams.StudentID = Students.StudentID INNER JOIN Groups
        ON Students.GroupID = Groups.GroupID
  ORDER BY GroupName, LastName, FirstName;

--�������� ���������, ���������� 12 ������ ���� �� �� ������ ��������, � ��������� ������, �����, ������� � ����� ��������.
SELECT Students.StudentID, Students.LastName, Students.FirstName, Groups.GroupName, Exams.Grade, Exams.ExamDate
FROM Courses INNER JOIN Exams
    ON Courses.CourseID = Exams.CourseID INNER JOIN Students
      ON Exams.StudentID = Students.StudentID INNER JOIN Groups
		ON Students.GroupID = Groups.GroupID
		  WHERE Exams.Grade =12
  ORDER BY Students.LastName, Students.FirstName;

--�������� ��� ������ ���������, ���������, �� �� ������� �������(�).
SELECT Students.StudentID, Students.LastName, Students.FirstName, Groups.GroupName, Exams.Grade, Exams.ExamDate
FROM Courses INNER JOIN Exams
    ON Courses.CourseID = Exams.CourseID INNER JOIN Students
      ON Exams.StudentID = Students.StudentID INNER JOIN Groups
		ON Students.GroupID = Groups.GroupID
		  WHERE Exams.Grade < 6
  ORDER BY Students.LastName, Students.FirstName;


--�������� ��� ������ �� ������ GroupID=147.
SELECT Students.IIN, Students.LastName, Students.FirstName, Groups.GroupName, Groups.GroupID
  FROM Groups INNER JOIN Students
    ON Groups.GroupID = Students.GroupID
	 WHERE Groups.GroupID = 147
  ORDER BY Students.LastName, Students.FirstName;

--�������� ��� ������ �� ������ c �������� ���������.
SELECT Students.IIN, Students.LastName, Students.FirstName, Groups.GroupName
  FROM Groups INNER JOIN Students
    ON Groups.GroupID = Students.GroupID
	 WHERE Groups.GroupName = 'TYF-09'
  ORDER BY Students.LastName, Students.FirstName;

--�������� ��� ������ �� ����� � �������� CourseID.
SELECT Courses.CourseName, Students.LastName, Students.FirstName, Groups.GroupName, Courses.CourseID
FROM Courses INNER JOIN Exams
    ON Courses.CourseID = Exams.CourseID INNER JOIN Students
      ON Exams.StudentID = Students.StudentID INNER JOIN Groups
		ON Students.GroupID = Groups.GroupID
		  WHERE Courses.CourseID = 13
  ORDER BY Students.LastName, Students.FirstName;

--�������� ��� ������ �� ����� "Database Systems".
SELECT Courses.CourseID, Courses.CourseName, Students.LastName, Students.FirstName, Groups.GroupName
FROM Courses INNER JOIN Exams
    ON Courses.CourseID = Exams.CourseID INNER JOIN Students
      ON Exams.StudentID = Students.StudentID INNER JOIN Groups
		ON Students.GroupID = Groups.GroupID
		  WHERE Courses.CourseName = 'Database Systems'
  ORDER BY Students.LastName, Students.FirstName;

--�������� ��� ������ �� �������� ������ � �����.
SELECT Courses.CourseID, Courses.CourseName, Students.LastName, Students.FirstName, Groups.GroupName
FROM Courses INNER JOIN Exams
    ON Courses.CourseID = Exams.CourseID INNER JOIN Students
      ON Exams.StudentID = Students.StudentID INNER JOIN Groups
		ON Students.GroupID = Groups.GroupID
		  WHERE Courses.CourseName = 'Database Systems' AND Groups.GroupName = 'WPE-04'
  ORDER BY Students.LastName, Students.FirstName;

--�������� ��� ������ �� �������� � �������� StudentID.
SELECT Students.IIN, Students.LastName, Students.FirstName, Groups.GroupName
  FROM Groups INNER JOIN Students
    ON Groups.GroupID = Students.GroupID
	 WHERE Students.StudentID = 147
  ORDER BY Students.LastName, Students.FirstName;

--�������� ��� ������ �� ���������, ��������� ���� ���� ������� � ������������ � �������, � �������� �������� � ������.
SELECT Students.LastName, Students.FirstName, Groups.GroupName, Courses.CourseName, Exams.Grade, Exams.ExamDate
  FROM Courses INNER JOIN Exams
    ON Courses.CourseID = Exams.CourseID INNER JOIN Students
      ON Exams.StudentID = Students.StudentID INNER JOIN Groups
		ON Students.GroupID = Groups.GroupID
		WHERE Students.LastName IN('Kozey', 'Abbott', 'Marvin') AND Students.FirstName IN ('Susie', 'Dan', 'Trevor') 
  ORDER BY Students.LastName, Students.FirstName;

--�������� ��� ������ �� ���������, ����������� � �������� ��������� ���.
SELECT Students.LastName, Students.FirstName, Courses.CourseName, Exams.Grade, Exams.ExamDate
  FROM Courses INNER JOIN	Exams
    ON Courses.CourseID = Exams.CourseID INNER JOIN Students
      ON Exams.StudentID = Students.StudentID
	  WHERE ExamDate >= '2017-07-17' AND ExamDate <= '2018-07-17'
  ORDER BY Exams.ExamDate;

--�������� ��� ������ �� ���������, ����������� � �������� ��������� ��� ��� �������� ������.
SELECT Students.LastName, Students.FirstName, Courses.CourseName, Groups.GroupName, Exams.Grade, Exams.ExamDate
  FROM Courses INNER JOIN	Exams
    ON Courses.CourseID = Exams.CourseID INNER JOIN Students
      ON Exams.StudentID = Students.StudentID INNER JOIN Groups
		ON Students.GroupID = Groups.GroupID
	  WHERE ExamDate >= '2017-07-17' AND ExamDate <= '2018-07-17' AND Groups.GroupName = 'WPE-04'
  ORDER BY Exams.ExamDate;

--�������� ��� ������ �� ���������, ����������� � �������� ��������� ��� ��� ��������� �����.
SELECT Students.LastName, Students.FirstName, Courses.CourseName, Groups.GroupName, Exams.Grade, Exams.ExamDate
  FROM Courses INNER JOIN	Exams
    ON Courses.CourseID = Exams.CourseID INNER JOIN Students
      ON Exams.StudentID = Students.StudentID INNER JOIN Groups
		ON Students.GroupID = Groups.GroupID
	  WHERE ExamDate >= '2017-01-01' AND ExamDate <= '2018-01-01' AND Courses.CourseName = 'Database Systems'
  ORDER BY Exams.ExamDate;

--�������� ���� ��������� (������ StudentID, LastName, FirstName, Birthday), ��������� �������� � �������� ��������� ���.
SELECT Students.LastName, Students.FirstName, Students.Birthday, Exams.Grade, Exams.ExamDate
  FROM Courses INNER JOIN	Exams
    ON Courses.CourseID = Exams.CourseID INNER JOIN Students
      ON Exams.StudentID = Students.StudentID 
	  WHERE ExamDate >= '2017-01-01' AND ExamDate <= '2018-01-01' AND Exams.Grade >= 9
  ORDER BY Exams.ExamDate;

--�������� �����, �� ������� �� �������� �� ���� �������.                                                     -- ����������

DELETE FROM EXAMS WHERE CourseID = 1; --��� �������� ������ � EXAMS ���� ����
--SELECT * FROM EXAMS WHERE CourseID = 1;

SELECT Courses.CourseID, Courses.CourseName
FROM Courses LEFT JOIN Exams
    ON Courses.CourseID = Exams.CourseID 
	      WHERE Exams.CourseID is null
  ORDER BY Courses.CourseName;

--�������� �����, �� ������� �������� ���� �� ���� �������.
SELECT DISTINCT Courses.CourseID, Courses.CourseName
FROM Courses INNER JOIN Exams
    ON Courses.CourseID = Exams.CourseID 
  ORDER BY Courses.CourseName;

--�������� �����, �� ������� ��������� �������� ����������, ���������� � �������.
SELECT Courses.CourseID, Courses.CourseName, Students.LastName, Students.LastName, Groups.GroupName, Exams.ExamDate
FROM Courses INNER JOIN Exams
    ON Courses.CourseID = Exams.CourseID INNER JOIN Students
      ON Exams.StudentID = Students.StudentID INNER JOIN Groups
		ON Students.GroupID = Groups.GroupID
  ORDER BY Courses.CourseName;

--�������� �����, �� ������� ��������� �������� ���������� ��� �����.
SELECT Courses.CourseID, Courses.CourseName, Students.LastName, Students.LastName, Groups.GroupName, Exams.ExamDate
FROM Courses INNER JOIN Exams
    ON Courses.CourseID = Exams.CourseID RIGHT OUTER JOIN Students
      ON Exams.StudentID = Students.StudentID LEFT OUTER JOIN Groups
		ON Students.GroupID = Groups.GroupID
		 WHERE Students.GroupID IS NULL
  ORDER BY Courses.CourseName;


--�������� ���������, ��������� ���� ���� ������� � ������������ � ������, � ��������� ������, �����, ������� � ����� ��������.
SELECT Courses.CourseID, Courses.CourseName, Students.LastName, Students.LastName, Groups.GroupName, Exams.Grade, Exams.ExamDate
FROM Courses INNER JOIN Exams
    ON Courses.CourseID = Exams.CourseID INNER JOIN Students
      ON Exams.StudentID = Students.StudentID INNER JOIN Groups
		ON Students.GroupID = Groups.GroupID
  ORDER BY Courses.CourseName;


�������������� ������

--�������� ���������, ��������� ���� ���� �������, � ��������� ������ (NULL, ���� ��� ������), �����, ������� � ����� ��������.
SELECT Courses.CourseID, Courses.CourseName, Students.LastName, Students.LastName, Groups.GroupName, Exams.Grade, Exams.ExamDate
FROM Courses LEFT JOIN Exams
    ON Courses.CourseID = Exams.CourseID LEFT JOIN Students
      ON Exams.StudentID = Students.StudentID LEFT JOIN Groups
		ON Students.GroupID = Groups.GroupID
  ORDER BY Groups.GroupName;

--�������� GroupName (NULL � ������ ���������� ������ � ��������!),  StudentID, IIN, LastName, FirstName ���������, �� ��������� �� ������ ��������.
SELECT Students.StudentID, Students.LastName, Students.FirstName, Students.Birthday, Groups.GroupName, Exams.Grade, Exams.ExamDate
FROM Students LEFT JOIN Exams
    ON Students.StudentID = Exams.StudentID LEFT JOIN Courses
      ON Exams.CourseID = Courses.CourseID LEFT JOIN Groups
		ON Students.GroupID = Groups.GroupID
		  WHERE Exams.StudentID is null
  ORDER BY Students.StudentID;

--�������� ��� ������ �� ��������� � �������� �������� � ������.

SELECT Students.LastName, Students.FirstName, Groups.GroupName, Courses.CourseName, Exams.Grade, Exams.ExamDate
  FROM Courses INNER JOIN Exams
    ON Courses.CourseID = Exams.CourseID INNER JOIN Students
      ON Exams.StudentID = Students.StudentID INNER JOIN Groups
		ON Students.GroupID = Groups.GroupID
		WHERE Students.LastName IN('Kozey', 'Abbott', 'Marvin') AND Students.FirstName IN ('Susie', 'Dan', 'Trevor') 
  ORDER BY Students.LastName, Students.FirstName;
