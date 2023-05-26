import React, { useState } from 'react';
import axios from 'axios';

export function Login() {
  const [usuario, setUsuario] = useState('');
  const [contraseña, setContraseña] = useState('');

  const handleSubmit = (event) => {
    event.preventDefault();

    const formData = {
      username: usuario,
      password: contraseña
    };

    axios.post('http://localhost:8000/api/login', formData)
      .then(response => {
        const token = response.data.token;
        // Aquí puedes manejar el token recibido, por ejemplo, almacenarlo en el almacenamiento local (localStorage)
        localStorage.setItem('token', token);
        console.log('Inicio de sesión exitoso');
      })
      .catch(error => {
        console.error(error);
      });
  };

  return (
    <div>
      <form className="formLogin" onSubmit={handleSubmit}>
        <p className="tituloRegistro">Logueate en Traziem Technology</p>
        <input type="text" className="loginUsuario" placeholder="Usuario" value={usuario} onChange={(e) => setUsuario(e.target.value)} />
        <input type="password" className="loginContraseña" placeholder="Contraseña" value={contraseña} onChange={(e) => setContraseña(e.target.value)} />
        <input type="submit" className="registroBtn" />
      </form>
    </div>
  );
}