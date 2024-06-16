CREATE TABLE classes (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  school_id INTEGER,
  teacher_id INTEGER,
  CONSTRAINT FK_ClassSchool FOREIGN KEY (school_id) REFERENCES schools(id),
  CONSTRAINT FK_ClassTeacher FOREIGN KEY (teacher_id) REFERENCES teachers(id)
);