sudo cloudflared service install ${cloudflare_token}

./sync_data.sh &
if [[ "${DOWNLOAD_BACKUP}" == "true" ]]; then
	sleep 15
fi
./forgejo-11.0.0-linux-amd64