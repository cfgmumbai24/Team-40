CREATE TABLE teachers (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  class_id INTEGER,
  FOREIGN KEY (class_id) REFERENCES classes(id)
);