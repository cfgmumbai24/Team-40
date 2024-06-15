import { useState } from "react";
import { Route, Routes } from "react-router-dom";
import Login from "./Components/Login";
import Student from "./Components/Student";
import Class from "./Components/Class";
import Classes from "./Components/Classes";
import AddActivity from "./Components/AddActivity";
import Activities from "./Components/Activities";
import Schools from "./Components/Schools";

function App() {
  const [count, setCount] = useState(0);

  return (
    <>
      <Routes>
        <Route path="/" element={<Login />} />
        <Route path="/schools" element={<Schools />} />
        <Route path="/schools/:SchoolId/classes" element={<Classes />} />
        <Route path="/schools/:SchoolId/classes/:id" element={<Class />} />
        <Route path="/dashboard/students/:id" element={<Student />} />
        <Route path="/add-activity" element={<AddActivity />} />
        <Route path="/activities" element={<Activities />} />
      </Routes>
    </>
  );
}

export default App;
