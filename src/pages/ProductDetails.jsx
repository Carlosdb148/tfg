import React, { useEffect, useState } from "react";
import { useParams } from "react-router";
import styles from "./ProductDetails.module.css";

export function ProductDetails() {
  const { productoId } = useParams();
  const [producto, setProducto] = useState(null);
  const puertoActual = window.location.port;

  useEffect(() => {
    if(puertoActual === "8000"){
        fetch("http://localhost:8000/api/price/" + productoId)
        .then((result) => result.json())
        .then((data) => {
          console.log(data.data);
          setProducto(data.data);
        });
    }else if(puertoActual === "8001"){
        fetch("http://localhost:8001/api/price/" + productoId)
        .then((result) => result.json())
        .then((data) => {
          console.log(data.data);
          setProducto(data.data);
        });
    }
      
  }, [productoId]);

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
            <div className={styles.Mtitulo}><div className={styles.mediamarktImg}/></div>
            <div className={styles.Mprecio}>{producto.precio.MediaMarkt}€</div>
            <div className={styles.Murl}><a href={producto.urls.MediaMarkt}>Comprar</a></div>
        </div>
        <div className={styles.precioA}>
            <div className={styles.Mtitulo}><div className={styles.amazonImg}></div></div>
            <div className={styles.Mprecio}>{producto.precio.Amazon}€</div>
            <div className={styles.Murl}><a href={producto.urls.Amazon}>Comprar</a></div>
        </div>
        <div className={styles.precioP}>
            <div className={styles.Mtitulo}><div className={styles.phonehouseImg}/></div>
            <div className={styles.Mprecio}>{producto.precio.PhoneHouse}€</div>
            <div className={styles.Murl}><a href={producto.urls.PhoneHouse}>Comprar</a></div>
        </div>
        <div className={styles.precioW}>
            <div className={styles.Mtitulo}><div className={styles.wortenImg}/></div>
            <div className={styles.Mprecio}>{producto.precio.Worten}€</div>
            <div className={styles.Murl}><a href={producto.urls.Worten}>Comprar</a></div>
        </div>
    </div>;
}