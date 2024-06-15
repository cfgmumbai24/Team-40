CREATE TABLE activities_and_classes (
  id INTEGER PRIMARY KEY,
  date DATETIME,
  activity_id INTEGER,
  class_id INTEGER,
  FOREIGN KEY (activity_id) REFERENCES activities(id),
  FOREIGN KEY (class_id) REFERENCES classes(id)
);