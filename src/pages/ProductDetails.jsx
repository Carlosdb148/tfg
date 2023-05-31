import React, { useEffect, useState } from "react";
import { useParams } from "react-router";
import styles from "./ProductDetails.module.css";

export function ProductDetails() {
  const { productoId } = useParams();
  // const token = localStorage.getItem("token");
  const [producto, setProducto] = useState(null);
  // const [isLoading, setIsLoading] = useState(true); //Estado de carga

  useEffect(() => {
    // if (token) {
      fetch("http://localhost:8000/api/price/" + productoId
      // , {
      //   headers: {
      //     Authorization: "Bearer " + token,
      //     "Content-Type": "application/json;charset=utf-8",
      //   },
      // }
      )
        .then((result) => result.json())
        .then((data) => {
          console.log(data.data);
          setProducto(data.data);
          // setIsLoading(false); // Cambia el estado de carga a falso
        });
    // }
  }, [productoId]);
  // [productoId, token]

  // if (isLoading) {
  //   return <div><p className="inicioMensaje">Necesitas iniciar sesión para ver información sobre los productos</p></div>;
  // }

  if (!producto) {
    return null;
  }

  return <div>
        {/* <img src={producto.foto} alt=""/> */}
        <div className={styles.detailsContainer}>
            <div className={styles.imagen}/>
            <div>
                <p className={styles.nombre}>{producto.nombre}</p>
                <p className={styles.descripcion}>{producto.descripcion}</p>
            </div>
        </div>
        <div className={styles.precioM}>
            <div className={styles.Mtitulo}>Media Markt</div>
            <div className={styles.Mprecio}>{producto.precio.MediaMarkt}€</div>
            <div className={styles.Murl}><a href={producto.urls.MediaMarkt}>Comprar</a></div>
        </div>
        <div className={styles.precioA}>
            <div className={styles.Mtitulo}>Amazon</div>
            <div className={styles.Mprecio}>{producto.precio.Amazon}€</div>
            <div className={styles.Murl}><a href={producto.urls.Amazon}>Comprar</a></div>
        </div>
        <div className={styles.precioP}>
            <div className={styles.Mtitulo}>Phone House</div>
            <div className={styles.Mprecio}>{producto.precio.PhoneHouse}€</div>
            <div className={styles.Murl}><a href={producto.urls.PhoneHouse}>Comprar</a></div>
        </div>
        <div className={styles.precioW}>
            <div className={styles.Mtitulo}>Worten</div>
            <div className={styles.Mprecio}>{producto.precio.Worten}€</div>
            <div className={styles.Murl}><a href={producto.urls.Worten}>Comprar</a></div>
        </div>
    </div>;
}