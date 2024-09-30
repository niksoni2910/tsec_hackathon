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
            <p className={styles.companyname}>Company Name</p>
            <div className={styles.sidebtn} onClick={gotohome}>Home</div>
            <div className={styles.sidebtn} onClick={gotostats}>Stats</div>
        </div>

        <div className={styles.pageleft}>
            <div className={styles.leftop}>
                <div className={styles.topinside}>
                    <img src={swaparrow} className={styles.img} />
                    <p className={styles.num}>293823</p>
                    <p className={styles.caption}>Total Transactions</p>
                </div>
                <div className={styles.topinside}>
                <img src={flag} className={styles.img} />
                    <p className={styles.num}>18</p>
                    <p className={styles.caption}>Flagged Activites</p>
                </div>
                <div className={styles.topinside}>
                <img src={warning} className={styles.imgflag} />
                    <p className={styles.num}>3</p>
                    <p className={styles.caption}>High Risk Transactions</p>
                </div>
            </div>
            <div className={styles.leftbot}>
                <div className={styles.heading}>Recent Transactions</div>
                <div className={styles.headingrow}>
                    
                    <div className={styles.row}>
                        <div className={styles.leftrow}>
                            <div className={styles.colordiv}>
                                <img src={whitewarning} className={styles.whitewarning}/>
                            </div>
                            <div>
                                <p className={styles.id}>Transaction ID: #1223232323</p>
                                <p className={styles.graycolor}>High Risk</p>
                                <p className={styles.graycolor}>2024-06-10 {" "} 00:00:00:0000</p>
                            </div>
                        </div>
                        <div className={styles.nextdiv}>
                            <img src={next} className={styles.nextimg}/>
                        </div>
                    </div>

                    <div className={styles.row}>
                        <div className={styles.leftrow}>
                            <div className={styles.colordiv}>
                                <img src={whitewarning} className={styles.whitewarning}/>
                            </div>
                            <div>
                                <p className={styles.id}>Transaction ID: #1223232323</p>
                                <p className={styles.graycolor}>High Risk</p>
                                <p className={styles.graycolor}>2024-06-10 {" "} 00:00:00:0000</p>
                            </div>
                        </div>
                        <div className={styles.nextdiv}>
                            <img src={next} className={styles.nextimg}/>
                        </div>
                    </div>

                    <div className={styles.row}>
                        <div className={styles.leftrow}>
                            <div className={styles.colordiv}>
                                <img src={whitewarning} className={styles.whitewarning}/>
                            </div>
                            <div>
                                <p className={styles.id}>Transaction ID: #1223232323</p>
                                <p className={styles.graycolor}>High Risk</p>
                                <p className={styles.graycolor}>2024-06-10 {" "} 00:00:00:0000</p>
                            </div>
                        </div>
                        <div className={styles.nextdiv}>
                            <img src={next} className={styles.nextimg}/>
                        </div>
                    </div>

                    <div className={styles.row}>
                        <div className={styles.leftrow}>
                            <div className={styles.colordiv}>
                                <img src={whitewarning} className={styles.whitewarning}/>
                            </div>
                            <div>
                                <p className={styles.id}>Transaction ID: #1223232323</p>
                                <p className={styles.graycolor}>High Risk</p>
                                <p className={styles.graycolor}>2024-06-10 {" "} 00:00:00:0000</p>
                            </div>
                        </div>
                        <div className={styles.nextdiv}>
                            <img src={next} className={styles.nextimg}/>
                        </div>
                    </div>

                    <div className={styles.row}>
                        <div className={styles.leftrow}>
                            <div className={styles.colordiv}>
                                <img src={whitewarning} className={styles.whitewarning}/>
                            </div>
                            <div>
                                <p className={styles.id}>Transaction ID: #1223232323</p>
                                <p className={styles.graycolor}>High Risk</p>
                                <p className={styles.graycolor}>2024-06-10 {" "} 00:00:00:0000</p>
                            </div>
                        </div>
                        <div className={styles.nextdiv}>
                            <img src={next} className={styles.nextimg}/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
  )
}

export default Dashboard