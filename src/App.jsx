import{
  BrowserRouter as Router,
  Routes,
  Route,
  Link,
} from "react-router-dom";
import { ProductDetails } from "./pages/ProductDetails";
import { LandingPages } from "./pages/LandingPages";
import { Aviso } from "./pages/Aviso";
import { Privacidad } from "./pages/Privacidad";
import { Cookies } from "./pages/Cookies";
import { Login } from "./pages/Login";
import { Registro } from "./pages/Registro";

export function App() {
  return (
    <Router>
      <header className="navi">
      <Link to="/"><div className="logotipo"></div></Link>
        <div className="urlsNav">
          <Link to="/login" className="navHome">Login</Link>
          <Link to="/registro" className="navRegistro">Registro</Link>
        </div>
      </header>
      <Routes>
        <Route exact path="/producto/:productoId" element={<ProductDetails />}></Route>
        <Route path="/" element={<LandingPages />}></Route>
        <Route path="/aviso" element={<Aviso />}></Route>
        <Route path="/privacidad" element={<Privacidad />}></Route>
        <Route path="/cookies" element={<Cookies />}></Route>
        <Route path="/login" element={<Login />}></Route>
        <Route path="/registro" element={<Registro />}></Route>
      </Routes>
      <footer className="footer">
      <div className="flex3">
        <div className="izqLogo">
        <Link to="/"><div className="logotipo3"></div></Link>
        </div>
        <div className="derechaNAV">
          <Link to="/login" className="navHome2">Login</Link>
          <Link to="/registro" className="navRegistro2">Registro</Link>
        </div>
      </div>
          <div className="separador"></div>
          <div className="flex">
            <Link to="/aviso" class="aviso">Aviso Legal</Link>
            <Link to="/privacidad" class="privacidad">Política de privacidad</Link>
            <Link to="/cookies" class="cookies">Política de cookies</Link>
          </div>
      </footer>
    </Router>
  );
}
