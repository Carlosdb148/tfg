export function CrearProducto(){
    return <div>
    <form className="formRegistro">
      <p className="tituloRegistro">Crear Producto</p>
      <input type="text" className="registroNombre" placeholder="Nombre" name="nombre" />
      <input type="text" className="registroApellido" placeholder="Apellidos" name="apellidos" />
      <input type="email" className="registroEmail" placeholder="Email" name="email" />
      <input type="text" className="registroUsuario" placeholder="Usuario" name="usuario" />
      <input type="text" className="registroContrasenia" placeholder="Contraseña" name="contraseña" />
      <input type="submit" className="registroBtn" />
    </form>
  </div>;
}