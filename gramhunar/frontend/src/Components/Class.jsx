import React, { useEffect } from "react";
import Navbar from "./Navbar";
import Sidebar from "./Sidebar";
import activities from "../../data/activities";
// let activities = JSON.parse(localStorage.getItem("activities"));

import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  ArcElement,
  Legend,
} from "chart.js";
import { Line, Pie } from "react-chartjs-2";
import { useParams } from "react-router-dom";
// import activities from "../../data/activities";

ChartJS.register({ CategoryScale, LinearScale, PointElement, LineElement, ArcElement, Title, Tooltip, Legend });

const labels = activities.map((obj) => {
  return obj.name;
});

const datasets = [
  {
    label: "Activity",
    data: activities.map((obj) => {
      return obj.score1;
    }),
    borderColor: "red",
  },
  {
    label: "Activity",
    data: activities.map((obj) => {
      return obj.score2;
    }),
    borderColor: "green",
  },
];

const pieChartData = {
  labels: ["A", "B", "C", "D"],
  datasets: [
    {
      label: "Student Types",
      data: [13, 4, 20, 10],
      backgroundColor: ["pink", "yellow", "red", "orange"],
    },
  ],
};

const Class = () => {
  const { id } = useParams();

  return (
    <div>
      <Navbar />
      {/* <Sidebar /> */}
      <div className="relative ">
        <div className="w-[40%] h-[30%] absolute right-[45rem]">
          <Line style={{}} options={{}} data={{ labels, datasets }} />
          <div className="">
            <h1 className="mt-7 font-bold text-4xl">Learning Outcomes</h1>
            <ul className="my-3 text-xl">
              <li>1] {activities[0].description}</li>
              <li>2] {activities[1].description}</li>
              <li>3] {activities[2].description}</li>
              <li>4] {activities[3].description}</li>
              <li>5]{activities[4].description}</li>
            </ul>
          </div>
        </div>
        <div className="w-[40%] h-[30%] absolute right-[0rem]">
          <Pie style={{}} options={{}} data={pieChartData} />
        </div>
      </div>
    </div>
  );
};

export default Class;
