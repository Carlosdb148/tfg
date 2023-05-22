import producto from "./producto.json";
import styles from "./ProductDetails.module.css";

export function ProductDetails(){
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
            <div className={styles.Mprecio}>{producto.precioMediaMarkt}€</div>
            <div className={styles.Murl}><a href={producto.urlMediaMarkt}>Comprar</a></div>
        </div>
        <div className={styles.precioA}>
            <div className={styles.Mtitulo}>Amazon</div>
            <div className={styles.Mprecio}>{producto.precioAmazon}€</div>
            <div className={styles.Murl}><a href={producto.urlAmazon}>Comprar</a></div>
        </div>
        <div className={styles.precioP}>
            <div className={styles.Mtitulo}>Phone House</div>
            <div className={styles.Mprecio}>{producto.precioPhoneHouse}€</div>
            <div className={styles.Murl}><a href={producto.urlPhoneHouse}>Comprar</a></div>
        </div>
        <div className={styles.precioW}>
            <div className={styles.Mtitulo}>Worten</div>
            <div className={styles.Mprecio}>{producto.precioWorten}€</div>
            <div className={styles.Murl}><a href={producto.urlWorten}>Comprar</a></div>
        </div>
    </div>;
}