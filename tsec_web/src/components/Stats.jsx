import React from 'react'

import sideStyles from "../stylesheets/Dashboard.module.css"
import styles from "../stylesheets/Stats.module.css"

import { useNavigate } from "react-router-dom";

import LineChart from './LineChart';
import BarChart from './BarChart';

const Stats = () => {

    const navigate = useNavigate()

    const gotohome = async(e) => {
        e.preventDefault();
        navigate("/")
    }

    const gotosdashboard = async(e) => {
        e.preventDefault();
        navigate("/dashboard")
    }

  return (
    <div className={sideStyles.container}>
        <div className={sideStyles.sidebar}>
            <p className={sideStyles.companyname}>EagleEye</p>
            <div className={sideStyles.sidebtn} onClick={gotohome}>Home</div>
            <div className={sideStyles.sidebtn} onClick={gotosdashboard}>Stats</div>
        </div>
        <div className={styles.outer}>
            <p className={styles.title}>Statistics</p>
            <div className={styles.graphouter}>
                <div className={styles.graphinner}>
                    <LineChart />
                    <p style={{textAlign:'center' , paddingTop: '0.1vh'}}>Graph Name 1</p>
                </div>
                <div className={styles.graphinner}>
                <LineChart />
                <p style={{textAlign:'center' , paddingTop: '0.1vh'}}>Graph Name 2</p>
                </div>
                <div className={styles.graphinner}>
                <LineChart />
                <p style={{textAlign:'center' , paddingTop: '0.1vh'}}>Graph Name 3</p>
                </div>
                <div className={styles.graphinner}>
                    <BarChart/>
                    <p style={{textAlign:'center' , paddingTop: '0.1vh'}}>Graph Name 4</p>
                </div>
            </div>
        </div>
    </div>
  )
}

export default Stats