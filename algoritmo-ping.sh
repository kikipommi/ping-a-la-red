#!/bin/bash
linea_default=$(ip route | grep '^default' | head -n 1)
datos_default=( $linea_default )
interfaz="${datos_default[4]}"

b=$(ip route | grep "dev $interfaz" | grep "proto kernel" | head -n 1)

red_completa="${b%% *}"

red="${red_completa%/*}"

mask="${red_completa#*/}"
prefijo_red="${red%.*}"

bits_host=$(( 32 - mask ))
hosts=$(( 2**bits_host - 2 ))

echo "[*] Red detectada: $red"
echo "[*] Mascara detectada: /$mask"
echo "[*] Hosts posibles: $hosts"

for i in $(seq 1 "$hosts");do
	ping -c 1 -W 1 -i 0.2 "$prefijo_red.$i" >/dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "--Detectado Host $prefijo_red.$i"
	fi
done

