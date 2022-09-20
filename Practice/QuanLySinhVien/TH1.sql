-- Bước 1: Sử dụng câu lệnh Use QuanLySinhVien để sử dụng cơ sở dữ liệu:
USE l4_database_function;

-- Bước 2: Sử dụng hàm count để hiển thị số lượng sinh viên ở từng nơi
SELECT Address, COUNT(StudentId) AS 'Số lượng Học viên'
FROM student
GROUP BY Address;

-- Bước 3: Tính điểm trung bình các môn học của mỗi học viên bằng cách sử dụng hàm AVG
SELECT S.StudentID, S.StudentName, AVG(Mark)
FROM Student S JOIN Mark M 
ON S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName;

-- Bước 4: Hiển thị những bạn học viên co điểm trung bình các môn học lớn hoặc bằng 10
SELECT S.StudentId, S.StudentName, AVG(Mark)
FROM Student S JOIN Mark M
ON S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
HAVING AVG(Mark) >= 10;

-- Bước 5: Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
SELECT S.StudentId, S.StudentName, AVG(Mark)
FROM Student S JOIN Mark M
ON S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
HAVING AVG(Mark) >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.StudentId);


