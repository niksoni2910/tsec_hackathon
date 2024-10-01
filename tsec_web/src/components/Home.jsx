import React, { useRef } from "react";

import styles from "../stylesheets/Homepage.module.css"

import Typewriter from "typewriter-effect";
import { useNavigate } from "react-router-dom";
import { useState, useEffect} from "react";

import { SyncLoader } from "react-spinners";

const Home = () => {

    const hiddenfileInput = useRef(null)
    const [vara , setvar] = useState(0)
    const [loading , setloading] = useState(false)

    useEffect(() => {
        setvar(0)
    },[])

    const navigate = useNavigate()

    const gotodashboard = async(e) => {
        e.preventDefault();
        navigate("/dashboard")
    }

    const increment1 = async(e) => {
        e.preventDefault();
        // setvar(vara + 1)
        setloading(true)
        setvar(1)
        setTimeout(() => {
            setloading(false)
            setvar(2)
        }, 3000)
    }

    const openfile = async(e) => {
        hiddenfileInput.current.click()

    }

  return (
    <div className={styles.maindiv}>
    {/* <div className={styles.navbar}>
        <button onClick={gotodashboard}>Dashboard</button>
    </div> */}
    <div className={styles.container}>
      <p className={styles.title}>
        <Typewriter
          options={{
            strings: ["EagleEye"],
            autoStart: true,
            deleteSpeed: Infinity,
          }}
        />
      </p>
      <p style={{paddingTop:'1vh' , fontSize:'1.1rem'}}>The Watchful Eye On Financial Eye</p>
      {vara == 0 && 
      <>
        <button onClick={openfile} style={{position:'absolute' , bottom:'30vh'}}>Upload Data</button>
        <input type="file" onChange={increment1} style={{display:"none"}} ref={hiddenfileInput}/>
      </>}
      {vara == 1 && <div style={{position:'absolute' , bottom:'30vh'}}>
        <SyncLoader
        color="#448aff"
        loading={loading}
        size={10}
      /></div>}
      {vara == 2 && <button onClick={gotodashboard} style={{position:'absolute' , bottom:'30vh'}}>Dashboard</button>}
      {/* <button onClick={gotodashboard} style={{position:'absolute' , bottom:'30vh'}}>Dashboard</button> */}
    </div>
    <div className={styles.info}>
        <div className={styles.qouter}>
            <p className={styles.q}>How does the system reduce false positives?</p>
            <p className={styles.ans}>It uses machine learning to identify genuine risks based on evolving patterns rather than fixed rules.</p>
        </div>
        <div className={styles.qouter}>
            <p className={styles.q}>What types of data does the system integrate?</p>
            <p className={styles.ans}>It combines transaction histories, customer profiles, and external databases for a comprehensive risk assessment.</p>
        </div>
        <div className={styles.qouter}>
            <p className={styles.q}>How does the system ensure regulatory compliance?</p>
            <p className={styles.ans}>It generates detailed reports and alerts that meet regulatory standards and provide actionable insights.</p>
        </div>
    </div>
    </div>
  );
};

export default Home;
