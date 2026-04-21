# ping-a-la-red
script basico para comprobar direcciones ip usadas en una red

algoritmo

1. buscar la ruta por defecto con ip route
2. conseguir el nombre de la interfaz
3. conseguir linea donde se especifica la red (la que dice "proto kernel")
4. extraer de esa linea la ip con formato x.x.x.x/x
5. calcular hosts
6. realizar bucle de ping con for
7. para cada iteracion se arma una direccion ip 
8. se envia un solo paquete a cada direccion
9. se comprueba la conexion
