CREATE TABLE activities_and_classes (
  id INTEGER PRIMARY KEY,
  date DATETIME,
  activity_id INTEGER,
  class_id INTEGER,
  CONSTRAINT FK_Activities_and_classesActivity FOREIGN KEY (activity_id) REFERENCES activities(id),
  CONSTRAINT FK_Activities_and_classesClass FOREIGN KEY (class_id) REFERENCES classes(id)
);