
-- CREATE DATABASE OnlineLearningDB;

-- USE OnlineLearningDB;
-- SHOW DATABASES;
-- SELECT DATABASE();
-- USE OnlineLearningDB;

--  student_id INT AUTO_INCREMENT PRIMARY KEY,
--     student_name VARCHAR(100) NOT NULL,
--     email VARCHAR(100) NOT NULL UNIQUE,
--     password VARCHAR(255) NOT NULL,
--     registration_date DATE DEFAULT (CURRENT_DATE),
--     age INT,
--     CHECK (age IS NULL OR age >= 16)
-- );

-- DESCRIBE students;

-- USE OnlineLearningDB;

--  course_id INT AUTO_INCREMENT PRIMARY KEY,
--     course_name VARCHAR(150) NOT NULL,
--     course_description TEXT,
--     difficulty_level ENUM('Beginner', 'Intermediate', 'Advanced')
--         DEFAULT 'Beginner',
--     duration_weeks INT NOT NULL,
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     CHECK (duration_weeks > 0)
-- );

-- DESCRIBE courses;

-- USE OnlineLearningDB;

-- #CREATE TABLE modules (
--   #  module_id INT AUTO_INCREMENT PRIMARY KEY,
--    # course_id INT NOT NULL,
--    # module_title VARCHAR(150) NOT NULL,
--    # module_description TEXT,
--    # module_order INT NOT NULL,
--    # estimated_minutes INT DEFAULT 30,
--    #    REFERENCES courses(course_id)
--    #     ON DELETE CASCADE,
--    # CHECK (module_order > 0),
--    # CHECK (estimated_minutes > 0),
--    # UNIQUE (course_id, module_order)
-- #);

-- #DESCRIBE modules;

-- USE OnlineLearningDB;

-- #CREATE TABLE assessments (
--  #   assessment_id INT AUTO_INCREMENT PRIMARY KEY,
--   #  module_id INT NOT NULL,
--   #  assessment_title VARCHAR(150) NOT NULL,
--    # total_marks INT NOT NULL,
--    # passing_marks INT NOT NULL,
--    # created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

--    # FOREIGN KEY (module_id)
--     #   ON DELETE CASCADE,

--    # CHECK (total_marks > 0),
--    # CHECK (passing_marks > 0),
--    # CHECK (passing_marks <= total_marks)
-- #);

-- #DESCRIBE assessments;

-- USE OnlineLearningDB;

-- #CREATE TABLE learning_paths (
--  #   path_id INT AUTO_INCREMENT PRIMARY KEY,
--   #  path_name VARCHAR(150) NOT NULL,
--    # description TEXT,
--    # target_level ENUM('Beginner', 'Intermediate', 'Advanced')
--     #    DEFAULT 'Beginner',
--     #created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- #);

-- #DESCRIBE learning_paths;

-- USE OnlineLearningDB;

-- #CREATE TABLE learning_path_modules (
--  #   path_module_id INT AUTO_INCREMENT PRIMARY KEY,
--   #  path_id INT NOT NULL,
--   #  module_id INT NOT NULL,
--    # sequence_order INT NOT NULL,

--    # FOREIGN KEY (path_id)
--     #    REFERENCES learning_paths(path_id)
--       #  ON DELETE CASCADE,

--     #FOREIGN KEY (module_id)
--      #   REFERENCES modules(module_id)
--      #   ON DELETE CASCADE,

--    # CHECK (sequence_order > 0),
--    # UNIQUE (path_id, module_id),
--    # UNIQUE (path_id, sequence_order)
-- #);

-- #DESCRIBE learning_path_modules;

-- USE OnlineLearningDB;

-- CREATE TABLE enrollments (
--     enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
--     student_id INT NOT NULL,
--     course_id INT NOT NULL,
--     enrollment_date DATE DEFAULT (CURRENT_DATE),
--     completion_status ENUM('Enrolled', 'In Progress', 'Completed')
--         DEFAULT 'Enrolled',
--     completion_percentage DECIMAL(5,2) DEFAULT 0.00,

--     FOREIGN KEY (student_id)
--         REFERENCES students(student_id)
--         ON DELETE CASCADE,

--     FOREIGN KEY (course_id)
--         REFERENCES courses(course_id)
--         ON DELETE CASCADE,

--     CHECK (completion_percentage >= 0 AND completion_percentage <= 100),
--     UNIQUE (student_id, course_id)
-- );

-- DESCRIBE enrollments;

-- USE OnlineLearningDB;

-- CREATE TABLE assessment_attempts (
--     attempt_id INT AUTO_INCREMENT PRIMARY KEY,
--     student_id INT NOT NULL,
--     assessment_id INT NOT NULL,
--     obtained_marks DECIMAL(5,2) NOT NULL,
--     attempt_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     passed BOOLEAN DEFAULT FALSE,

--     FOREIGN KEY (student_id)
--         REFERENCES students(student_id)
--         ON DELETE CASCADE,

--     FOREIGN KEY (assessment_id)
--         REFERENCES assessments(assessment_id)
--         ON DELETE CASCADE,

--     CHECK (obtained_marks >= 0)
-- );

-- DESCRIBE assessment_attempts;

-- USE OnlineLearningDB;

-- CREATE TABLE module_progress (
--     progress_id INT AUTO_INCREMENT PRIMARY KEY,
--     student_id INT NOT NULL,
--     module_id INT NOT NULL,
--     progress_percentage DECIMAL(5,2) DEFAULT 0.00,
--     completion_status ENUM('Not Started', 'In Progress', 'Completed')
--         DEFAULT 'Not Started',
--     last_accessed TIMESTAMP DEFAULT CURRENT_TIMESTAMP
--         ON UPDATE CURRENT_TIMESTAMP,

--     FOREIGN KEY (student_id)
--         REFERENCES students(student_id)
--         ON DELETE CASCADE,

--     FOREIGN KEY (module_id)
--         REFERENCES modules(module_id)
--         ON DELETE CASCADE,

--     CHECK (progress_percentage >= 0 AND progress_percentage <= 100),
--     UNIQUE (student_id, module_id)
-- );

-- DESCRIBE module_progress;

-- USE OnlineLearningDB;

-- CREATE TABLE student_learning_paths (
--     student_path_id INT AUTO_INCREMENT PRIMARY KEY,
--     student_id INT NOT NULL,
--     path_id INT NOT NULL,
--     assigned_date DATE DEFAULT (CURRENT_DATE),
--     path_status ENUM('Active', 'Completed', 'Paused')
--         DEFAULT 'Active',

--     FOREIGN KEY (student_id)
--         REFERENCES students(student_id)
--         ON DELETE CASCADE,

--     FOREIGN KEY (path_id)
--         REFERENCES learning_paths(path_id)
--         ON DELETE CASCADE,

--     UNIQUE (student_id, path_id)
-- );

-- DESCRIBE student_learning_paths;

#SHOW TABLES;

-- USE OnlineLearningDB;

-- INSERT INTO students
-- (student_name, email, password, age)
-- VALUES
-- ('Aarav Sharma', 'aarav@gmail.com', 'pass123', 20),
-- ('Priya Verma', 'priya@gmail.com', 'pass123', 21),
-- ('Rahul Singh', 'rahul@gmail.com', 'pass123', 19),
-- ('Sneha Patel', 'sneha@gmail.com', 'pass123', 22),
-- ('Arjun Mehta', 'arjun@gmail.com', 'pass123', 20);

-- SELECT * FROM students;

-- USE OnlineLearningDB;

-- INSERT INTO courses
-- (course_name, course_description, difficulty_level, duration_weeks)
-- VALUES
-- ('Python Programming', 'Learn Python from basics to advanced concepts.', 'Beginner', 8),
-- ('Database Management System', 'Learn SQL, database design and normalization.', 'Intermediate', 6),
-- ('Web Development', 'Learn HTML, CSS, JavaScript and web development.', 'Beginner', 10),
-- ('Data Science', 'Learn data analysis and machine learning.', 'Advanced', 12),
-- ('Artificial Intelligence', 'Learn AI concepts and intelligent systems.', 'Advanced', 10);

-- SELECT * FROM courses;

-- USE OnlineLearningDB;

-- INSERT INTO modules
-- (course_id, module_title, module_description, module_order, estimated_minutes)
-- VALUES
-- (1, 'Python Basics', 'Introduction to Python syntax and variables.', 1, 45),
-- (1, 'Python Control Structures', 'Learn loops and conditional statements.', 2, 60),

-- (2, 'Introduction to DBMS', 'Learn database fundamentals.', 1, 40),
-- (2, 'SQL Queries', 'Learn SQL commands and operations.', 2, 60),

-- (3, 'HTML Fundamentals', 'Learn HTML tags and webpage structure.', 1, 45),
-- (3, 'CSS Styling', 'Learn styling and webpage layouts.', 2, 60),

-- (4, 'Data Analysis Basics', 'Introduction to data analysis.', 1, 50),
-- (4, 'Machine Learning Basics', 'Introduction to machine learning algorithms.', 2, 75),

-- (5, 'Introduction to AI', 'Learn artificial intelligence fundamentals.', 1, 45),
-- (5, 'Neural Networks', 'Understand neural network concepts.', 2, 75);

-- SELECT * FROM modules;

-- USE OnlineLearningDB;

-- INSERT INTO assessments
-- (module_id, assessment_title, total_marks, passing_marks)
-- VALUES
-- (1, 'Python Basics Quiz', 100, 40),
-- (2, 'Python Control Structures Test', 100, 50),
-- (3, 'DBMS Fundamentals Quiz', 100, 40),
-- (4, 'SQL Queries Test', 100, 50),
-- (5, 'HTML Fundamentals Quiz', 100, 40),
-- (6, 'CSS Styling Test', 100, 50),
-- (7, 'Data Analysis Quiz', 100, 50),
-- (8, 'Machine Learning Test', 100, 60),
-- (9, 'AI Fundamentals Quiz', 100, 50),
-- (10, 'Neural Networks Test', 100, 60);

-- SELECT * FROM assessments;

-- USE OnlineLearningDB;

-- INSERT INTO learning_paths
-- (path_name, description, target_level)
-- VALUES
-- ('Python Beginner Path', 'A step-by-step path to learn Python programming.', 'Beginner'),
-- ('SQL Intermediate Path', 'A structured path for learning database management and SQL.', 'Intermediate'),
-- ('Web Development Beginner Path', 'A beginner-friendly path to frontend web development.', 'Beginner'),
-- ('Data Science Advanced Path', 'A path covering data analysis and machine learning.', 'Advanced'),
-- ('Artificial Intelligence Advanced Path', 'A path covering AI and neural networks.', 'Advanced');

-- SELECT * FROM learning_paths;
-- USE OnlineLearningDB;

-- INSERT INTO learning_path_modules
-- (path_id, module_id, sequence_order)
-- VALUES
-- (1, 1, 1),
-- (1, 2, 2),

-- (2, 3, 1),
-- (2, 4, 2),

-- (3, 5, 1),
-- (3, 6, 2),

-- (4, 7, 1),
-- (4, 8, 2),

-- (5, 9, 1),
-- (5, 10, 2);

-- SELECT * FROM learning_path_modules;

-- USE OnlineLearningDB;

-- INSERT INTO enrollments
-- (student_id, course_id, completion_status, completion_percentage)
-- VALUES
-- (1, 1, 'In Progress', 25.00),
-- (2, 2, 'In Progress', 50.00),
-- (3, 3, 'Enrolled', 0.00),
-- (4, 4, 'In Progress', 75.00),
-- (5, 5, 'Completed', 100.00),
-- (1, 2, 'In Progress', 40.00),
-- (2, 3, 'Enrolled', 0.00),
-- (3, 4, 'In Progress', 60.00);

-- SELECT * FROM enrollments;

-- USE OnlineLearningDB;

-- INSERT INTO assessment_attempts
-- (student_id, assessment_id, obtained_marks, passed)
-- VALUES
-- (1, 1, 85, TRUE),
-- (1, 2, 45, FALSE),
-- (2, 3, 90, TRUE),
-- (2, 4, 75, TRUE),
-- (3, 5, 35, FALSE),
-- (3, 6, 55, TRUE),
-- (4, 7, 95, TRUE),
-- (4, 8, 40, FALSE),
-- (5, 9, 80, TRUE),
-- (5, 10, 90, TRUE);

-- SELECT * FROM assessment_attempts;

-- USE OnlineLearningDB;

-- INSERT INTO module_progress
-- (student_id, module_id, progress_percentage, completion_status)
-- VALUES
-- (1, 1, 100.00, 'Completed'),
-- (1, 2, 40.00, 'In Progress'),
-- (2, 3, 100.00, 'Completed'),
-- (2, 4, 70.00, 'In Progress'),
-- (3, 5, 20.00, 'In Progress'),
-- (3, 6, 0.00, 'Not Started'),
-- (4, 7, 100.00, 'Completed'),
-- (4, 8, 50.00, 'In Progress'),
-- (5, 9, 100.00, 'Completed'),
-- (5, 10, 100.00, 'Completed');

-- SELECT * FROM module_progress;

-- USE OnlineLearningDB;

-- INSERT INTO student_learning_paths
-- (student_id, path_id, path_status)
-- VALUES
-- (1, 1, 'Active'),
-- (2, 2, 'Active'),
-- (3, 3, 'Active'),
-- (4, 4, 'Active'),
-- (5, 5, 'Completed');

-- SELECT * FROM student_learning_paths;

-- SELECT
--     (SELECT COUNT(*) FROM students) AS Total_Students,
--     (SELECT COUNT(*) FROM courses) AS Total_Courses,
--     (SELECT COUNT(*) FROM modules) AS Total_Modules,
--     (SELECT COUNT(*) FROM assessments) AS Total_Assessments,
--     (SELECT COUNT(*) FROM learning_paths) AS Total_Learning_Paths,
--     (SELECT COUNT(*) FROM enrollments) AS Total_Enrollments,
--     (SELECT COUNT(*) FROM assessment_attempts) AS Total_Attempts,
--     (SELECT COUNT(*) FROM module_progress) AS Total_Progress_Records;

-- USE OnlineLearningDB;

-- SELECT * FROM students;

-- SELECT * FROM courses;

-- SELECT
--     m.module_id,
--     m.module_title,
--     c.course_name,
--     m.module_order,
--     m.estimated_minutes
-- FROM modules m
-- INNER JOIN courses c
-- ON m.course_id = c.course_id
-- ORDER BY c.course_id, m.module_order;

-- SELECT
--     s.student_id,
--     s.student_name,
--     c.course_name,
--     e.enrollment_date,
--     e.completion_status,
--     e.completion_percentage
-- FROM students s
-- INNER JOIN enrollments e
--     ON s.student_id = e.student_id
-- INNER JOIN courses c
--     ON e.course_id = c.course_id
-- ORDER BY s.student_id;

-- SELECT
--     s.student_name,
--     c.course_name,
--     e.completion_percentage,
--     e.completion_status,
--     CASE
--         WHEN e.completion_percentage = 100 THEN 'Course Completed'
--         WHEN e.completion_percentage >= 50 THEN 'Good Progress'
--         WHEN e.completion_percentage > 0 THEN 'Needs Improvement'
--         ELSE 'Not Started'
--     END AS progress_remark
-- FROM enrollments e
-- INNER JOIN students s
--     ON e.student_id = s.student_id
-- INNER JOIN courses c
--     ON e.course_id = c.course_id
-- ORDER BY e.completion_percentage DESC;

-- SELECT
--     s.student_id,
--     s.student_name,
--     COUNT(a.attempt_id) AS total_attempts,
--     ROUND(AVG(a.obtained_marks), 2) AS average_marks
-- FROM students s
-- INNER JOIN assessment_attempts a
--     ON s.student_id = a.student_id
-- GROUP BY
--     s.student_id,
--     s.student_name
-- ORDER BY average_marks DESC;

-- SELECT
--     s.student_name,
--     a.assessment_id,
--     ass.assessment_title,
--     a.obtained_marks,
--     ass.passing_marks,
--     CASE
--         WHEN a.obtained_marks < ass.passing_marks
--         THEN 'Needs Additional Practice'
--         ELSE 'Passed'
--     END AS learning_recommendation
-- FROM assessment_attempts a
-- INNER JOIN students s
--     ON a.student_id = s.student_id
-- INNER JOIN assessments ass
--     ON a.assessment_id = ass.assessment_id
-- WHERE a.obtained_marks < ass.passing_marks;

-- SELECT
--     c.course_id,
--     c.course_name,
--     COUNT(e.enrollment_id) AS total_students,
--     ROUND(AVG(e.completion_percentage), 2)
--         AS average_completion
-- FROM courses c
-- LEFT JOIN enrollments e
--     ON c.course_id = e.course_id
-- GROUP BY
--     c.course_id,
--     c.course_name
-- ORDER BY average_completion DESC;

-- SELECT
--     s.student_id,
--     s.student_name,
--     ROUND(AVG(a.obtained_marks), 2) AS average_marks
-- FROM students s
-- INNER JOIN assessment_attempts a
--     ON s.student_id = a.student_id
-- GROUP BY
--     s.student_id,
--     s.student_name
-- ORDER BY average_marks DESC
-- LIMIT 3;

-- SELECT
--     s.student_id,
--     s.student_name,
--     ROUND(AVG(a.obtained_marks), 2) AS average_marks,
--     CASE
--         WHEN AVG(a.obtained_marks) >= 80
--             THEN 'Advanced Learning'
--         WHEN AVG(a.obtained_marks) >= 50
--             THEN 'Intermediate Learning'
--         ELSE 'Beginner Learning'
--     END AS recommended_level
-- FROM students s
-- INNER JOIN assessment_attempts a
--     ON s.student_id = a.student_id
-- GROUP BY
--     s.student_id,
--     s.student_name
-- ORDER BY average_marks DESC;

-- SELECT
--     s.student_name,
--     c.course_name,
--     m.module_title,
--     COALESCE(mp.progress_percentage, 0) AS current_progress,
--     CASE
--         WHEN mp.completion_status = 'In Progress'
--             THEN 'Continue This Module'
--         ELSE 'Start This Module'
--     END AS recommendation
-- FROM enrollments e
-- INNER JOIN students s
--     ON e.student_id = s.student_id
-- INNER JOIN courses c
--     ON e.course_id = c.course_id
-- INNER JOIN modules m
--     ON c.course_id = m.course_id
-- LEFT JOIN module_progress mp
--     ON mp.student_id = e.student_id
--     AND mp.module_id = m.module_id
-- WHERE
--     (mp.progress_id IS NULL
--      OR mp.completion_status <> 'Completed')
--     AND NOT EXISTS (
--         SELECT 1
--         FROM modules prev
--         LEFT JOIN module_progress prev_mp
--             ON prev_mp.student_id = e.student_id
--             AND prev_mp.module_id = prev.module_id
--         WHERE prev.course_id = e.course_id
--           AND prev.module_order < m.module_order
--           AND (
--               prev_mp.progress_id IS NULL
--               OR prev_mp.completion_status <> 'Completed'
--           )
--     )
-- ORDER BY s.student_name;

-- SELECT
--     s.student_name,
--     c.course_name,
--     m.module_title,
--     a.obtained_marks,
--     ass.passing_marks,
--     CASE
--         WHEN a.obtained_marks < ass.passing_marks
--             THEN 'Additional Practice Required'
--         WHEN a.obtained_marks < ass.passing_marks + 20
--             THEN 'Revision Recommended'
--         ELSE 'Good Performance'
--     END AS recommendation
-- FROM assessment_attempts a
-- INNER JOIN students s
--     ON a.student_id = s.student_id
-- INNER JOIN assessments ass
--     ON a.assessment_id = ass.assessment_id
-- INNER JOIN modules m
--     ON ass.module_id = m.module_id
-- INNER JOIN courses c
--     ON m.course_id = c.course_id
-- ORDER BY a.obtained_marks ASC;

-- SELECT
--     s.student_id,
--     s.student_name,
--     ROUND(AVG(a.obtained_marks), 2) AS average_marks,
--     RANK() OVER (
--         ORDER BY AVG(a.obtained_marks) DESC
--     ) AS student_rank
-- FROM students s
-- INNER JOIN assessment_attempts a
--     ON s.student_id = a.student_id
-- GROUP BY
--     s.student_id,
--     s.student_name;

-- SELECT
--     c.course_name,
--     COUNT(DISTINCT a.student_id) AS total_students,
--     COUNT(a.attempt_id) AS total_attempts,
--     ROUND(AVG(a.obtained_marks), 2) AS average_marks,
--     MAX(a.obtained_marks) AS highest_marks,
--     MIN(a.obtained_marks) AS lowest_marks
-- FROM courses c
-- INNER JOIN modules m
--     ON c.course_id = m.course_id
-- INNER JOIN assessments ass
--     ON m.module_id = ass.module_id
-- INNER JOIN assessment_attempts a
--     ON ass.assessment_id = a.assessment_id
-- GROUP BY c.course_id, c.course_name
-- ORDER BY average_marks DESC;

-- SELECT
--     s.student_name,
--     c.course_name,
--     COUNT(m.module_id) AS total_modules,
--     COUNT(
--         CASE
--             WHEN mp.completion_status = 'Completed'
--             THEN 1
--         END
--     ) AS completed_modules,
--     CASE
--         WHEN COUNT(m.module_id) =
--              COUNT(
--                  CASE
--                      WHEN mp.completion_status = 'Completed'
--                      THEN 1
--                  END
--              )
--         THEN 'Course Fully Completed'
--         ELSE 'Course In Progress'
--     END AS course_result
-- FROM enrollments e
-- INNER JOIN students s
--     ON e.student_id = s.student_id
-- INNER JOIN courses c
--     ON e.course_id = c.course_id
-- INNER JOIN modules m
--     ON c.course_id = m.course_id
-- LEFT JOIN module_progress mp
--     ON mp.student_id = e.student_id
--     AND mp.module_id = m.module_id
-- GROUP BY
--     s.student_id,
--     s.student_name,
--     c.course_id,
--     c.course_name;

-- CREATE OR REPLACE VIEW student_progress_view AS
-- SELECT
--     s.student_id,
--     s.student_name,
--     c.course_name,
--     e.enrollment_date,
--     e.completion_status,
--     e.completion_percentage
-- FROM students s
-- INNER JOIN enrollments e
--     ON s.student_id = e.student_id
-- INNER JOIN courses c
--     ON e.course_id = c.course_id;

-- SELECT * FROM student_progress_view;

-- CREATE OR REPLACE VIEW recommendation_view AS
-- SELECT
--     s.student_id,
--     s.student_name,
--     ROUND(AVG(a.obtained_marks), 2) AS average_marks,
--     CASE
--         WHEN AVG(a.obtained_marks) >= 80
--             THEN 'Advanced Learning'
--         WHEN AVG(a.obtained_marks) >= 50
--             THEN 'Intermediate Learning'
--         ELSE 'Beginner Learning'
--     END AS recommended_level
-- FROM students s
-- INNER JOIN assessment_attempts a
--     ON s.student_id = a.student_id
-- GROUP BY
--     s.student_id,
--     s.student_name;

-- SELECT * FROM recommendation_view;

-- CREATE INDEX idx_student_assessment_date
-- ON assessment_attempts
-- (student_id, assessment_id, attempt_date);

-- CREATE INDEX idx_course_student
-- ON enrollments
-- (course_id, student_id);

-- SHOW INDEX FROM assessment_attempts;

-- SHOW INDEX FROM enrollments;

-- EXPLAIN
-- SELECT *
-- FROM assessment_attempts
-- WHERE student_id = 1;

-- EXPLAIN
-- SELECT *
-- FROM enrollments
-- WHERE course_id = 1;

-- START TRANSACTION;

-- UPDATE enrollments
-- SET completion_percentage = 30.00
-- WHERE enrollment_id = 1;

-- SELECT * FROM enrollments
-- WHERE enrollment_id = 1;

-- ROLLBACK;

-- SELECT * FROM enrollments
-- WHERE enrollment_id = 1;

-- START TRANSACTION;

-- UPDATE enrollments
-- SET completion_percentage = 25.00
-- WHERE enrollment_id = 1;

-- COMMIT;

-- SELECT * FROM enrollments
-- WHERE enrollment_id = 1;

-- DELIMITER //

-- CREATE PROCEDURE GetStudentProgress(IN sid INT)
-- BEGIN
--     SELECT
--         s.student_id,
--         s.student_name,
--         c.course_name,
--         e.completion_percentage,
--         e.completion_status
--     FROM students s
--     JOIN enrollments e
--         ON s.student_id = e.student_id
--     JOIN courses c
--         ON e.course_id = c.course_id
--     WHERE s.student_id = sid;
-- END //

-- DELIMITER ;


-- CALL GetStudentProgress(1);

-- DELIMITER //

-- CREATE TRIGGER UpdateModuleStatus
-- BEFORE UPDATE ON module_progress
-- FOR EACH ROW
-- BEGIN
--     IF NEW.progress_percentage = 100 THEN
--         SET NEW.completion_status = 'Completed';
--     ELSEIF NEW.progress_percentage > 0 THEN
--         SET NEW.completion_status = 'In Progress';
--     ELSE
--         SET NEW.completion_status = 'Not Started';
--     END IF;
-- END //

-- DELIMITER ;

-- UPDATE module_progress
-- SET progress_percentage = 100
-- WHERE student_id = 1
-- AND module_id = 2;

-- SELECT *
-- FROM module_progress
-- WHERE student_id = 1
-- AND module_id = 2;

-- DELIMITER //

-- CREATE FUNCTION GetStudentAverage(sid INT)
-- RETURNS DECIMAL(5,2)
-- DETERMINISTIC
-- READS SQL DATA
-- BEGIN
--     DECLARE avg_marks DECIMAL(5,2);

--     SELECT ROUND(AVG(obtained_marks), 2)
--     INTO avg_marks
--     FROM assessment_attempts
--     WHERE student_id = sid;

--     RETURN IFNULL(avg_marks, 0);
-- END //

-- DELIMITER ;

-- SELECT
--     student_id,
--     student_name,
--     GetStudentAverage(student_id) AS average_marks
-- FROM students
-- ORDER BY average_marks DESC;

-- SELECT
--     student_id,
--     student_name
-- FROM students
-- WHERE student_id IN (
--     SELECT student_id
--     FROM assessment_attempts
--     GROUP BY student_id
--     HAVING AVG(obtained_marks) >
--     (
--         SELECT AVG(obtained_marks)
--         FROM assessment_attempts
--     )
-- );

-- WITH StudentPerformance AS (
--     SELECT
--         s.student_id,
--         s.student_name,
--         ROUND(AVG(a.obtained_marks), 2) AS average_marks
--     FROM students s
--     JOIN assessment_attempts a
--         ON s.student_id = a.student_id
--     GROUP BY s.student_id, s.student_name
-- )
-- SELECT *
-- FROM StudentPerformance
-- WHERE average_marks >= 70
-- ORDER BY average_marks DESC;

-- SELECT
--     s.student_id,
--     s.student_name,
--     ROUND(AVG(a.obtained_marks), 2) AS average_marks,
--     CASE
--         WHEN AVG(a.obtained_marks) >= 80
--             THEN 'Advanced Learning'
--         WHEN AVG(a.obtained_marks) >= 50
--             THEN 'Intermediate Learning'
--         ELSE 'Beginner Learning'
--     END AS recommended_learning_path
-- FROM students s
-- JOIN assessment_attempts a
--     ON s.student_id = a.student_id
-- GROUP BY s.student_id, s.student_name
-- ORDER BY average_marks DESC;

-- USE OnlineLearningDB;

-- SHOW TABLES;

SHOW FULL TABLES;