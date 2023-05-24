export function Registro(){
    return (
        <div>
            <form className="formRegistro">
                <p className="tituloRegistro">Registrate en Traziem Technology</p>
                <input type="text" className="registroNombre" placeholder="Nombre"></input>
                <input type="text" className="registroApellido" placeholder="Apellidos"></input>
                <input type="email" className="registroEmail" placeholder="Email"></input>
                <input type="text" className="registroUsuario" placeholder="Usuario"></input>
                <input type="text" className="registroContraseña" placeholder="Contraseña"></input>
                <input type="submit" className="registroBtn"></input>
            </form>
        </div>
    );
}