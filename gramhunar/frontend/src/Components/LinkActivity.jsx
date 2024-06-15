import { useState } from "react";

const AddActivity = () => {
  const [activity, setActivity] = useState({});
  const handleSubmit = (e) => {
    e.preventDefault();
    const name = document.getElementById("activity-name").value;
    const description = document.getElementById("activity-desc").value;
    const score = document.getElementById("activity-score").value;
    console.log({ name, description, score });
    setActivity({
      name,
      description,
      score,
    });
  };
  return (
    <div>
      <>
        <div className="min-h-screen bg-gray-100 flex flex-col justify-center py-12 sm:px-6 lg:px-8">
          <div className="sm:mx-auto sm:w-full sm:max-w-md">
          <img className="mx-auto h-20 w-auto" src="https://www.gramurja.org/assets/images/logo/Gram%20Urja%20logo.png" alt="Gram Urja" />
            <h2 className="mt-6 text-center text-3xl font-extrabold text-gray-900">Enter Classes Data</h2>
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
                    Class Id 
                  </label>
                  <div className="mt-1">
                    <input
                      rows={4}
                      id="activity-desc"
                      name="activity-desc"
                      type="text"
                      autoComplete="activity-desc"
                      className="appearance-none rounded-md relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                      placeholder="Enter class id"
                    />
                  </div>
                </div>
                {/* score */}
                <div>
                  <label htmlFor="activity-name" className="block text-sm font-medium text-gray-700">
                    Activity Score
                  </label>
                  <div className="mt-1">
                    <input
                      id="activity-score"
                      name="activity-score"
                      type="activity-score"
                      autoComplete="activity-score"
                      className="appearance-none rounded-md relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                      placeholder="Enter activity score"
                    />
                  </div>
                </div>

                <div>
                  <button
                    type="submit"
                    className="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                    onClick={handleSubmit}
                  >
                    Add Class Details
                  </button>
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
