import React from 'react'

import styles from "../stylesheets/Dashboard.module.css"

import swaparrow from "../assets/swaparrow.png"
import flag from "../assets/flag.png"
import warning from "../assets/warning.png"
import whitewarning from "../assets/whitewarning.png"
import next from "../assets/next.png"

import { useNavigate } from "react-router-dom";

const Dashboard = () => {

    const navigate = useNavigate()

    const gotohome = async(e) => {
        e.preventDefault();
        navigate("/")
    }

    const gotostats = async(e) => {
        e.preventDefault();
        navigate("/stats")
    }

  return (
    <div className={styles.container}>
        <div className={styles.sidebar}>
            <p className={styles.companyname}>EagleEye</p>
            <div className={styles.sidebtn} onClick={gotohome}>Home</div>
            <div className={styles.sidebtn} onClick={gotostats}>Stats</div>
        </div>

        <div className={styles.pageleft}>
            <div className={styles.leftop}>
                <div className={styles.topinside}>
                    <img src={swaparrow} className={styles.img} />
                    <p className={styles.num}>29,3823</p>
                    <p className={styles.caption}>Total Transactions</p>
                </div>
                <div className={styles.topinside}>
                <img src={flag} className={styles.img} />
                    <p className={styles.num}>5</p>
                    <p className={styles.caption}>Flagged Activites</p>
                </div>
                {/* <div className={styles.topinside}>
                <img src={warning} className={styles.imgflag} />
                    <p className={styles.num}>3</p>
                    <p className={styles.caption}>High Risk Transactions</p>
                </div> */}
            </div>
            <div className={styles.leftbot}>
                <div className={styles.heading}>Recent Transactions</div>
                <div className={styles.headingrow}>
                    
                <div className={styles.row}>
    <div className={styles.leftrow}>
        <div className={styles.colordiv}>
            <img src={whitewarning} className={styles.whitewarning} alt="Warning" />
        </div>
        <div>
            <p className={styles.id}>Transaction ID: #1223232323</p>
            <p className={styles.graycolor}>High Risk</p>
            <p className={styles.graycolor}>2024-06-10 00:00:00:0000</p>
        </div>
    </div>
    <div className={styles.nextdiv}>
        <p className={styles.graycolor}>Payee Name: John Doe</p>
        <p className={styles.graycolor}>Account Number: 1093090</p>
        <p className={styles.graycolor}>Amount: 12,938</p>
    </div>
</div>

<div className={styles.row}>
    <div className={styles.leftrow}>
        <div className={styles.colordiv}>
            <img src={whitewarning} className={styles.whitewarning} alt="Warning" />
        </div>
        <div>
            <p className={styles.id}>Transaction ID: #1223232324</p>
            <p className={styles.graycolor}>High Risk</p>
            <p className={styles.graycolor}>2024-06-09 15:30:12:0000</p>
        </div>
    </div>
    <div className={styles.nextdiv}>
        <p className={styles.graycolor}>Payee Name: Jane Smith</p>
        <p className={styles.graycolor}>Account Number: 2093847</p>
        <p className={styles.graycolor}>Amount: 5,432</p>
    </div>
</div>

<div className={styles.row}>
    <div className={styles.leftrow}>
        <div className={styles.colordiv}>
            <img src={whitewarning} className={styles.whitewarning} alt="Warning" />
        </div>
        <div>
            <p className={styles.id}>Transaction ID: #1223232325</p>
            <p className={styles.graycolor}>High Risk</p>
            <p className={styles.graycolor}>2024-06-08 10:15:45:0000</p>
        </div>
    </div>
    <div className={styles.nextdiv}>
        <p className={styles.graycolor}>Payee Name: Alice Johnson</p>
        <p className={styles.graycolor}>Account Number: 3081294</p>
        <p className={styles.graycolor}>Amount: 8,245</p>
    </div>
</div>

<div className={styles.row}>
    <div className={styles.leftrow}>
        <div className={styles.colordiv}>
            <img src={whitewarning} className={styles.whitewarning} alt="Warning" />
        </div>
        <div>
            <p className={styles.id}>Transaction ID: #1223232326</p>
            <p className={styles.graycolor}>High Risk</p>
            <p className={styles.graycolor}>2024-06-07 22:05:30:0000</p>
        </div>
    </div>
    <div className={styles.nextdiv}>
        <p className={styles.graycolor}>Payee Name: Bob Brown</p>
        <p className={styles.graycolor}>Account Number: 4012345</p>
        <p className={styles.graycolor}>Amount: 19,876</p>
    </div>
</div>

<div className={styles.row}>
    <div className={styles.leftrow}>
        <div className={styles.colordiv}>
            <img src={whitewarning} className={styles.whitewarning} alt="Warning" />
        </div>
        <div>
            <p className={styles.id}>Transaction ID: #1223232327</p>
            <p className={styles.graycolor}>High Risk</p>
            <p className={styles.graycolor}>2024-06-06 18:00:00:0000</p>
        </div>
    </div>
    <div className={styles.nextdiv}>
        <p className={styles.graycolor}>Payee Name: Charlie White</p>
        <p className={styles.graycolor}>Account Number: 5098761</p>
        <p className={styles.graycolor}>Amount: 1,500</p>
    </div>
</div>

                </div>
            </div>
        </div>
    </div>
  )
}

export default Dashboard