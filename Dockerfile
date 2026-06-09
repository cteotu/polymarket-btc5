FROM python:3.11-slim

WORKDIR /app

# Gereksiz sistem paketlerini kur (gerekirse)
RUN apt-get update && apt-get install -y --no-install-recommends gcc && rm -rf /var/lib/apt/lists/*

# Proje dosyalarının tamamını kopyala
COPY . .

# Projeyi editable modda kur (bu, requirements.txt olmadan bağımlılıkları yükler)
RUN pip install --no-cache-dir -e .

# Paper trading modunda başlat (gölge ticaret)
CMD ["python", "polymarket_sniper_live.py"]
