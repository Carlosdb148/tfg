import { ProductoCard } from "./ProductoCard";
import styles from "./ComparadorGrid.module.css";
import { useEffect, useState } from "react";


export function ComparadorGrid() {

  const [productos, setProductos] = useState([]);
  

  useEffect(() => {
    fetch("http://localhost:8000/api/getProducts").then(result => result.json()).then(data => {
      setProductos(data);
    });
  }, []);

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
