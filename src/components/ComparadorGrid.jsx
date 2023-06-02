import React, { useEffect, useState } from "react";
import { ProductoCard } from "./ProductoCard";
import { Search } from "./Search";
import { useQuery } from "./../hooks/useQuery";
import styles from "./ComparadorGrid.module.css";
import { useNavigate } from "react-router-dom";

export function ComparadorGrid() {
  const [productos, setProductos] = useState([]);
  const [tipoFiltro, setTipoFiltro] = useState("");

  const query = useQuery();
  const search = query.get("q");

  const puertoActual = window.location.port;
  const navigate = useNavigate();

  useEffect(() => {
    let apiUrl = "/api/getProducts";
    const params = new URLSearchParams();

    if (search) {
      params.append("q", search);
    }
    if (tipoFiltro) {
      params.append("type", tipoFiltro);
    }

    if (params.toString()) {
      apiUrl += `?${params.toString()}`;
    }

    if (puertoActual === "8000") {
      fetch(`http://localhost:8000${apiUrl}`)
        .then((result) => result.json())
        .then((data) => {
          setProductos(data);
        });
    } else if (puertoActual === "8001") {
      fetch(`http://localhost:8001${apiUrl}`)
        .then((result) => result.json())
        .then((data) => {
          setProductos(data);
        });
    }
  }, [search, tipoFiltro]);

  const handleFiltrarPorTipo = (event) => {
    const tipoSeleccionado = event.target.value;
    setTipoFiltro(tipoSeleccionado);

    const params = new URLSearchParams(window.location.search);
    params.set("type", tipoSeleccionado);

    navigate(`?${params.toString()}`);
  };

  return (
    <div>
      <div className="imgHeader">
        <div className="cuadroAzul">
          <h2 className="nombreEmpresa">BIENVENIDO A TRAZIEM TECHNOLOGY</h2>
          <div className="logotipo2"></div>
        </div>
      </div>
      <div className="frase">
        Los mejores productos tecnológicos
        <br />
        a precios más que lógicos
      </div>
      <div>
        <div>
          <Search />
        </div>
        <div className="fraseProduct">Productos</div>

        <div className={styles.filtroContainer}>
          <select
            value={tipoFiltro}
            onChange={handleFiltrarPorTipo}
            className={styles.filtro}
          >
            <option value="">Todos</option>
            <option value="mobile">Móvil</option>
            <option value="computer">Ordenador</option>
            <option value="tablet">Tablet</option>
          </select>
        </div>

        <ul className={styles.comparadorGrid}>
          {productos.map((producto) => (
            <ProductoCard key={producto.id} producto={producto} />
          ))}
        </ul>
      </div>
    </div>
  );
};