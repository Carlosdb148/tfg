export function Login(){
    return (
        <div>
            <form className="formLogin">
                <p className="tituloRegistro">Logueate en Traziem Technology</p>
                <input type="text" className="loginUsuario" placeholder="Usuario"></input>
                <input type="password" className="loginContraseña" placeholder="Contraseña"></input>
                <input type="submit" className="registroBtn"></input>
            </form>
        </div>
    );
}