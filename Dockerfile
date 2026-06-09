# 1. Python ortamını hazırla
FROM python:3.11-slim

# 2. Gereksiz sistem paketlerini yükleme (gerekirse)
RUN apt-get update && apt-get install -y --no-install-recommends gcc && rm -rf /var/lib/apt/lists/*

# 3. Çalışma dizinini belirle
WORKDIR /app

# 4. Proje dosyalarını kopyala
COPY . .

# 5. Python bağımlılıklarını yükle
RUN pip install --no-cache-dir -r requirements.txt

# 6. (Tercihe bağlı) Eğer psutil gibi ekstra paketler gerekiyorsa
# RUN pip install psutil

# 7. Botu çalıştır (gölge ticaret / paper trading modu)
# Bu komut, botu paper trading modunda başlatır.
# İleride gerçek ticarete (live trading) geçmek için bu satırı değiştirmen gerekecek.
CMD ["python", "polymarket_sniper_live.py"]
