import logo from './logo.svg';
import './App.css';
import {useState, useEffect} from 'react';
import { HashRouter } from "react-router-dom";

function App() {
  const [data, setData] = useState(null);

  useEffect(() => {
    fetch('http://localhost:8000/test/')
      .then(res => res.json())
      .then(data => setData(data.data));
  })

  return (
    <HashRouter base="/">
      <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <h1>An Awesome Blog </h1>
        <h3>On Django, React, Postgres, and Docker </h3>

        <p>{data}</p>
      </header>
    </div>
    </HashRouter>
  );
}

export default App;