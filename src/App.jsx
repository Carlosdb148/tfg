import { ComparadorGrid } from "./components/ComparadorGrid";
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
        <Link to="/" className="navHome">Home</Link>
        <Link to="/producto" className="navProd">Producto</Link>
      </header>
      <Routes>
        <Route exact path="/producto" element={<ProductDetails />}></Route>
        <Route path="/" element={<LandingPages />}></Route>
        <Route path="/aviso" element={<Aviso />}></Route>
        <Route path="/privacidad" element={<Privacidad />}></Route>
        <Route path="/cookies" element={<Cookies />}></Route>
      </Routes>
      <footer className="footer">
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
