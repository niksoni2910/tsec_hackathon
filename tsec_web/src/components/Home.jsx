import React from "react";

import styles from "../stylesheets/Homepage.module.css"

import Typewriter from "typewriter-effect";
import { useNavigate } from "react-router-dom";

const Home = () => {

    const navigate = useNavigate()

    const gotodashboard = async(e) => {
        e.preventDefault();
        navigate("/dashboard")
    }

  return (
    <div className={styles.maindiv}>
    <div className={styles.navbar}>
        <button onClick={gotodashboard}>Dashboard</button>
    </div>
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
    </div>
    <div className={styles.info}>
        <div className={styles.qouter}>
            <p className={styles.q}>Question 1 ?</p>
            <p className={styles.ans}>Lorem ipsut tempora earum alias architecto praesentium labore! Similique laboriosam molestiae voluptatem ipsa quis neque!</p>
        </div>
        <div className={styles.qouter}>
            <p className={styles.q}>Question 1 ?</p>
            <p className={styles.ans}>Lorem ipsut tempora earum alias architecto praesentium labore! Similique laboriosam molestiae voluptatem ipsa quis neque!</p>
        </div>
        <div className={styles.qouter}>
            <p className={styles.q}>Question 1 ?</p>
            <p className={styles.ans}>Lorem ipsut tempora earum alias architecto praesentium labore! Similique laboriosam molestiae voluptatem ipsa quis neque!</p>
        </div>
    </div>
    </div>
  );
};

export default Home;
