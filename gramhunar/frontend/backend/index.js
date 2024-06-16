const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.send("hello");
});

app.post("/login", (req, res) => {
  const { username, password } = req.body;
  if (!username || !password) throw new Error("Username and password needed");
});

app.listen(5000, console.log("hello"));
