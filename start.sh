sudo cloudflared service install ${cloudflare_token}

if [ ! -d "/app/data/data" ]; then
	sudo mkdir -p /app/data/data
fi
sudo chmod 777 /app/data/data
sudo chmod 777 /app
sudo chmod 777 /app/data

./sync_data.sh &
if [ "$DOWNLOAD_BACKUP" = "true" ]; then
	sleep 15
fi

./forgejo-13.0.1-linux-amd64 --work-path /app/data
