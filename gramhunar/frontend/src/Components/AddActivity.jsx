import { useState } from "react";
import { Link } from "react-router-dom";
import oldActivities from "../../data/activities";
import axios from "axios";

const AddActivity = () => {
  const schoolId = localStorage.getItem("school");
  const classId = localStorage.getItem("classId");
  console.log(classId);
  const [activity, setActivity] = useState({});
  const handleSubmit = async (e) => {
    const name = document.getElementById("activity-name").value;
    const description = document.getElementById("activity-desc").value;
    const score = document.getElementById("activity-score").value;
    const score2 = document.getElementById("activity-score2").value;
    console.log({ name, description, score });
    setActivity({
      name,
      description,
      score,
      score2,
    });

    const response = await axios.post("http://192.168.90.56:5000/activity", {
      id: Math.random() * 10000,
      name: name,
      description: description,
      numeric_weightage: score,
      literature_weightage: score2,
      emotional_weightage: 0,
    });

    console.log(response.data);
  };
  return (
    <div>
      <>
        <div className="min-h-screen bg-gray-100 flex flex-col justify-center py-12 sm:px-6 lg:px-8">
          <div className="sm:mx-auto sm:w-full sm:max-w-md">
            <img
              className="mx-auto h-20 w-auto"
              src="https://www.gramurja.org/assets/images/logo/Gram%20Urja%20logo.png"
              alt="Gram Urja"
            />
            <h2 className="mt-6 text-center text-3xl font-extrabold text-gray-900">Create an activity</h2>
          </div>

          <div className="mt-8 sm:mx-auto sm:w-full sm:max-w-md">
            <div className="bg-white py-8 px-4 shadow sm:rounded-lg sm:px-10">
              <form className="space-y-6">
                {/* name */}
                <div>
                  <label htmlFor="activity-name" className="block text-sm font-medium text-gray-700">
                    Activity Name
                  </label>
                  <div className="mt-1">
                    <input
                      id="activity-name"
                      name="activity-name"
                      type="text"
                      autoComplete="activity-name"
                      className="appearance-none rounded-md relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                      placeholder="Enter activity name"
                    />
                  </div>
                </div>
                {/* description */}
                <div>
                  <label htmlFor="activity-name" className="block text-sm font-medium text-gray-700">
                    Activity Description
                  </label>
                  <div className="mt-1">
                    <textarea
                      rows={4}
                      id="activity-desc"
                      name="activity-desc"
                      type="text"
                      autoComplete="activity-desc"
                      className="appearance-none rounded-md relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                      placeholder="Enter description..."
                    />
                  </div>
                </div>
                {/* score */}
                <div>
                  <label htmlFor="activity-name" className="block text-sm font-medium text-gray-700">
                    Literacy Score
                  </label>
                  <div className="mt-1">
                    <input
                      id="activity-score"
                      name="activity-score"
                      type="activity-score"
                      autoComplete="activity-score"
                      className="appearance-none rounded-md relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                      placeholder="Enter literacy score"
                    />
                  </div>
                </div>

                {/*  */}
                <div>
                  <label htmlFor="activity-name" className="block text-sm font-medium text-gray-700">
                    Literacy Score
                  </label>
                  <div className="mt-1">
                    <input
                      id="activity-score2"
                      name="activity-score"
                      type="activity-score"
                      autoComplete="activity-score"
                      className="appearance-none rounded-md relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                      placeholder="Enter numeracy score"
                    />
                  </div>
                </div>

                <div>
                  <Link to={"/schools/1/classes"}>
                    <button
                      className="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                      onClick={handleSubmit}
                    >
                      Add Activity
                    </button>
                  </Link>
                </div>
              </form>
            </div>
          </div>
        </div>
      </>
    </div>
  );
};
export default AddActivity;
