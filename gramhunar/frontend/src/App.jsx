import { useState } from "react";
import { Route, Routes } from "react-router-dom";
import Login from "./Components/Login";
import Student from "./Components/Student";
import Class from "./Components/Class";

function App() {
  const [count, setCount] = useState(0);

  return (
    <>
      <Routes>
        <Route path="/" element={<Login />} />
        <Route path="/dashboard/student/:id" element={<Student />} />
        <Route path="/dashboard/class/:id" element={<Class />} />
      </Routes>
    </>
  );
}

export default App;
