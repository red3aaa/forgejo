sudo cloudflared service install ${cloudflare_token}

if if [ -d "/app/data/data" ]; then
	mkdir -p /app/data/data
fi
sudo 777 /app/data/data

./sync_data.sh &
if [ "$DOWNLOAD_BACKUP" = "true" ]; then
	sleep 15
fi

cd data
../forgejo-11.0.0-linux-amd64