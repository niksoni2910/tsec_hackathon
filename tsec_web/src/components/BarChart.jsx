import React, { useEffect, useState } from "react";
import { Bar } from "react-chartjs-2";
import {Chart as ChartJS, BarElement, CategoryScale, LinearScale} from "chart.js";

ChartJS.register(CategoryScale, LinearScale, BarElement);

const BarChart = () => {
  const [datam, setdatam] = useState(15);
  const [dataf, setdataf] = useState(30);
  const [datao, setdatao] = useState(76);

  // useEffect(() => {
  //   const fetchData1 = async () => {
  //     try {
  //       const response = await fetch(
  //         `http://localhost:5000/gender/donations/${decoded.id}`,
  //         {
  //           method: "POST",
  //           headers: { "Content-Type": "application/json" },
  //         }
  //       );

  //       const json = await response.json();
  //       setdatam(json.male);
  //       setdataf(json.female);
  //       setdatao(json.others);
  //     } catch (error) {
  //       console.error("Error fetching data:", error.message);
  //     }
  //   };

  //   fetchData1();
  // }, [datam, dataf, datao]);

  return (
    <div style={{height:'100%' , width:'100%'}}>
      <Bar
        data={{
          labels: ["True", "False"],
          datasets: [
            {
              label: "Donations",
              data: [datam, dataf, datao],
              backgroundColor: [
                "rgba(255, 99, 132, 0.2)",
                "rgba(54, 162, 235, 0.2)",
              ],
              borderColor: ["rgba(255, 99, 132, 1)", "rgba(54, 162, 235, 1)"],
              borderWidth: 1,
            },
          ],
        }}
        options={{
          maintainAspectRatio: false,
          plugins: {
            title: {
              display: true,
              text: "Donation by Gender",
              font: {
                size: 23,
              },
            },
          },
          // scales: {
          //   yAxes: [
          //     {
          //       ticks: {
          //         beginAtZero: true,
          //       },
          //     },
          //   ],
          //   xAxes: [
          //     {
          //       type: "category",
          //       labels: ["Male", "Female", "Others"],
          //       ticks: {
          //         beginAtZero: true,
          //       },
          //     },
          //   ],
          // },
        }}
      />
    </div>
  );
};

export default BarChart;
