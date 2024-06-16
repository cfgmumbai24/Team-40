import Navbar from "./Navbar";

// import schools from "../../data/schools";
import { Link } from "react-router-dom";
import { useEffect, useState } from "react";

const Schools = () => {
  const [schools, setSchools] = useState([]);
  useEffect(() => {
    const fetchdata = async () => {
      const response = await fetch("http://192.168.90.56:5000/school");
      const parsedData = await response.json();
      setSchools(parsedData.data);
    };
    fetchdata();
  }, []);
  return (
    <>
      <Navbar />
      <div className="container flex justify-center gap-4 mt-5 flex-wrap">
        {schools.map((school) => {
          return (
            <div class="max-w-sm bg-white border border-gray-200 rounded-lg shadow  " key={school.id}>
              <a href="#">
                <img
                  class="rounded-t-lg"
                  src="data:image/jpeg;base64,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"
                  alt=""
                />
              </a>
              <div class="p-5">
                <a href="#">
                  <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 ">{school.name}</h5>
                </a>
                <p class="mb-3 font-normal text-gray-700 "></p>
                <Link
                  onClick={() => {
                    localStorage.setItem("school", school.id);
                  }}
                  to={`/schools/${school.schoolId}/classes`}
                  class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
                >
                  Classes
                  <svg
                    class="rtl:rotate-180 w-3.5 h-3.5 ms-2"
                    aria-hidden="true"
                    xmlns="http://www.w3.org/2000/svg"
                    fill="none"
                    viewBox="0 0 14 10"
                  >
                    <path
                      stroke="currentColor"
                      strokeLinecap="round"
                      strokeLinejoin="round"
                      strokeWidth="2"
                      d="M1 5h12m0 0L9 1m4 4L9 9"
                    />
                  </svg>
                </Link>
              </div>
            </div>
          );
        })}
      </div>
    </>
  );
};
export default Schools;
