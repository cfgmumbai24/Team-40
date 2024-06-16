CREATE TABLE access_control (
  username VARCHAR(255) PRIMARY KEY,
  password VARCHAR(255) NOT NULL,
  access_level VARCHAR(50) NOT NULL
);