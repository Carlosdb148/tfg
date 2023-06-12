<h2>Aplicación full stack Django+React</h2>
<h3>Comandos para iniciarla</h3>
<ul>
  <li>npm install</li>
  <li>npm run build</li>
  <li>docker compose up</li>
 </ul>
 <h3>Comandos para sacar un dump de la base de datos (con la aplicación arrancada)</h3>
docker exec -ti tfg-backend-1 /bin/sh <br>
python manage.py makemigrations<br>
python manage.py migrate<br>
docker exec postgres pg_dump postgres > latest.sql<br>

