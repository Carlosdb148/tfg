import { ProductoCard } from "./ProductoCard";
import styles from "./ComparadorGrid.module.css";
import { useEffect, useState } from "react";
import { Search } from "./Search";
import { useQuery } from "./../hooks/useQuery";


export function ComparadorGrid() {

  const [productos, setProductos] = useState([]);
  
  const query = useQuery();
  const search = query.get("q");


  const puertoActual = window.location.port;
  useEffect(() => {
    const searchUrl = search ? "/api/getProducts?q=" + search : "/api/getProducts";
    if(puertoActual === "8000"){
      fetch("http://localhost:8000" + searchUrl).then(result => result.json()).then(data => {
        setProductos(data);
      });
    }else if(puertoActual === "8001"){
    fetch("http://localhost:8001" + searchUrl).then(result => result.json()).then(data => {
        setProductos(data);
      });
    }

  }, [search]);

  return (
  <div>
        <div className="imgHeader">
          <div className="cuadroAzul">
            <h2 className="nombreEmpresa">BIENVENIDO A TRAZIEM TECHNOLOGY</h2>
            <div className="logotipo2"></div>
          </div>
        </div>
        <div className="frase">Los mejores productos tecnológicos<br/>a precios más que lógicos</div>
        <div>
          <div><Search/></div>
          <div className="fraseProduct">Productos</div>

    <ul className={styles.comparadorGrid}>
      {productos.map((producto) => (
        <ProductoCard key={producto.id} producto={producto}/>
      ))}
    </ul>

    </div>
  </div>
  );
}
