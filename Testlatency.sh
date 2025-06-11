#!/bin/bash

# Solicitar el sitio web
website=$(osascript -e 'tell application "System Events" to display dialog "Enter website or IP to ping:" default answer ""' -e 'text returned of result')

# Preguntar modo
mode=$(osascript -e 'tell application "System Events" to display dialog "Ping 4 times or infinite? (type 4 or infinite):" default answer "4"' -e 'text returned of result')

# Ejecutar ping
if [ "$mode" = "4" ]; then
    result=$(ping -c 4 "$website")
else
    osascript -e 'display dialog "Ping infinito. Presiona Control + C en Terminal para detenerlo." buttons {"OK"}'
    open -a Terminal.app --args ping "$website"
    exit 0
fi

# Verificar si hay respuesta
if echo "$result" | grep -q "0 packets received"; then
    osascript -e "display dialog \"$website is unreachable (no response).\" buttons {\"OK\"} default button 1"
else
    # Extraer latencia promedio (macOS da esto al final del ping)
    avg_latency=$(echo "$result" | grep round-trip | awk -F'/' '{print $5}')
    osascript -e "display dialog \"$website is reachable!🌐
Avg latency: $avg_latency ms\" buttons {\"OK\"} default button 1"
fi
