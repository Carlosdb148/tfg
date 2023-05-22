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

export function App() {
  return (
    <Router>
      <header className="navi">
      <Link to="/"><div className="logotipo"></div></Link>
        <div className="urlsNav">
          <Link to="/" className="navHome">Inicio</Link>
          <Link to="/" className="navRegistro">Registro</Link>
        </div>
      </header>
      <Routes>
        <Route exact path="/producto/:productoId" element={<ProductDetails />}></Route>
        <Route path="/" element={<LandingPages />}></Route>
        <Route path="/aviso" element={<Aviso />}></Route>
        <Route path="/privacidad" element={<Privacidad />}></Route>
        <Route path="/cookies" element={<Cookies />}></Route>
      </Routes>
      <footer className="footer">
      <div className="flex3">
        <div className="izqLogo">
        <Link to="/"><div className="logotipo3"></div></Link>
        </div>
        <div className="derechaNAV">
          <Link to="/" className="navHome2">Inicio</Link>
          <Link to="/" className="navRegistro2">Registro</Link>
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
