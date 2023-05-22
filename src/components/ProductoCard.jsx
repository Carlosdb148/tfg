import {Link} from "react-router-dom";
import styles from "./ProductoCard.module.css"

export function ProductoCard({ producto }) {
  return (
    <li className={styles.productoCard}>
      <Link to={"/producto/" + producto.id}>
      <div className={styles.tarjeta}>
        <div className={styles.imagen}/>
        <div className={styles.nombre}>{producto.nombre}</div>
      </div>
      </Link>
  </li>
  )
}
