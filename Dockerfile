FROM python:3.11-slim
WORKDIR /app

run pip install webdavclient3 requests
run apt-get update && apt-get install -y wget git curl

run wget https://codeberg.org/forgejo/forgejo/releases/download/v11.0.0/forgejo-11.0.0-linux-amd64
run chmod +x forgejo-11.0.0-linux-amd64

copy sync_data.sh . 
copy start.sh .
run chmod +x sync_data.sh
run chmod +x start.sh
run chmod 777 /app
run chmod +x ./forgejo-11.0.0-linux-amd64

run mkdir -p --mode=0755 /usr/share/keyrings
run curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | tee /usr/share/keyrings/cloudflare-main.gpg >/dev/null
run echo 'deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared any main' | tee /etc/apt/sources.list.d/cloudflared.list
run apt-get update
run apt-get install cloudflared -y
run touch /etc/init.d/cloudflared
run chmod 777 /etc/init.d/cloudflared


RUN useradd -m -u 1000 git
USER git

cmd "./start.sh"