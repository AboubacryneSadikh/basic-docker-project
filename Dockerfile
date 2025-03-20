# 1. Utiliser l’image officielle Python
FROM python:3.9-slim  

# 2. Définir le répertoire de travail
WORKDIR /app  

# 3. Copier le code source dans le conteneur
COPY app /app  

# 4. Exposer le port 8000 pour l’accès réseau
EXPOSE 8000  

# 5. Lancer le serveur HTTP
CMD ["python", "server.py"]
