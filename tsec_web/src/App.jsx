import './App.css'
import { BrowserRouter as Router, Routes, Route } from "react-router-dom"

import Home from './components/Home'
import Dashboard from './components/Dashboard'
import Stats from './components/Stats'

function App() {

  return (
    <>
      <Router>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/dashboard" element={<Dashboard />} />
          <Route path="/stats" element={<Stats />} />
        </Routes>
      </Router>
    </>
  )
}

export default App
