import axios from 'axios';

export function Registro(){
    
    const handleSubmit = (event) => {
        event.preventDefault();
    
        const { nombre, apellidos, email, usuario, contraseña } = event.target.elements;
    
        const formData = {
          first_name: nombre.value,
          last_name: apellidos.value,
          email: email.value,
          username: usuario.value,
          password: contraseña.value
        };
    
        axios.post('http://localhost:8000/api/register', formData)
          .then(response => {
            console.log(response.data);
          })
          .catch(error => {
            console.error(error);
          });
      };

    return (
        <div>
            <form className="formRegistro" onSubmit={handleSubmit}>
                <p className="tituloRegistro">Registrate en Traziem Technology</p>
                <input type="text" className="registroNombre" placeholder="Nombre" name="nombre" id="nombre"></input>
                <input type="text" className="registroApellido" placeholder="Apellidos" name="apellidos" id="apellidos"></input>
                <input type="email" className="registroEmail" placeholder="Email" name="email" id="email"></input>
                <input type="text" className="registroUsuario" placeholder="Usuario" name="usuario" id="usuario"></input>
                <input type="text" className="registroContraseña" placeholder="Contraseña" name="contraseña" id="contraseña"></input>
                <input type="submit" className="registroBtn"></input>
            </form>
        </div>
    );
}