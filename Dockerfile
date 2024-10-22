FROM python:3.9-slim

# Nastavení pracovního adresáře
WORKDIR /app

# Zkopíruj a nainstaluj Python závislosti
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Zkopíruj veškerý kód aplikace do kontejneru
COPY . .

# Nastav proměnné prostředí, aby Flask věděl, který soubor spustit
ENV FLASK_APP=flask_for_startups.py  # Zde odkazuješ na hlavní soubor aplikace
ENV FLASK_RUN_HOST=0.0.0.0

# Spusť Flask aplikaci
CMD ["flask", "run"]