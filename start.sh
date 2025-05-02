sudo cloudflared service install ${cloudflare_token}

if [ ! -d "/app/data/data" ]; then
	sudo mkdir -p /app/data/data
	sudo mkdir -p /app/data/custom
fi
sudo chmod 777 /app/data/data
sudo chmod 777 /app/data/custom
sudo chmod 777 /app
sudo chmod 777 /app/data

./sync_data.sh &
if [ "$DOWNLOAD_BACKUP" = "true" ]; then
	sleep 15
fi

cd /app/data
../forgejo-11.0.0-linux-amd64 --config /app/data/custom/app.ini --data-path /app/data/data