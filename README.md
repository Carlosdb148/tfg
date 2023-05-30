<h2>Aplicación full stack Django+React</h2>
<h3>Comandos para iniciarla</h3>
<ul>
  <li>npm install</li>
  <li>npm run build</li>
  <li>docker compose up</li>
 </ul>
 <h3>Comandos para sacar un dump de la base de datos</h3>
docker exec tfg-backend-1 /bin/sh
python manage.py makemigations
python manage.py migrate
docker exec postgres pg_dump postgres > latest.sql (con la aplicación arrancada)

