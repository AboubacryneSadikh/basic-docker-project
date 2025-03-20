# Projet DevOps - Serveur HTTP avec Docker  

Ce projet est un serveur HTTP minimaliste en Python, 
contenant un Dockerfile pour la containerisation et un pipeline CI/CD pour automatiser le push sur DockerHub.

## 📌 Fonctionnalités
- Serveur HTTP simple en Python utilisant `http.server`
- Dockerisation complète avec un `Dockerfile`
- Lancement simplifié avec `docker-compose.yml`
- Pipeline CI/CD avec GitHub Actions pour automatiser le build et le push sur DockerHub

---

## 📂 Structure du projet

```
basic-docker-project/
├── app/  
│   ├── server.py  # Code du serveur HTTP
├── Dockerfile  # Configuration Docker
├── docker-compose.yml  # Lancement simplifié avec Docker Compose
├── .github/workflows/docker-publish.yml  # Pipeline CI/CD
└── README.md  # Documentation
```

---

## 📝 Création du serveur HTTP

📌 **Crée un fichier `server.py` dans un dossier `app/` :**  
```python
from http.server import HTTPServer, BaseHTTPRequestHandler  

class SimpleHandler(BaseHTTPRequestHandler):  
    def do_GET(self):  
        self.send_response(200)  
        self.send_header("Content-type", "text/html")  
        self.end_headers()  
        
        message = "<html><body><h1>Hello, Docker!</h1></body></html>"  
        self.wfile.write(message.encode("utf-8"))  

if __name__ == "__main__":  
    PORT = 8000  
    server_address = ("0.0.0.0", PORT)  
    httpd = HTTPServer(server_address, SimpleHandler)  
    print(f"Serving on port {PORT}...")  
    httpd.serve_forever()
```

---

## 🚀 Installation et exécution

### 1️⃣ Cloner le projet
```sh
git clone https://github.com/ton-repo.git
cd basic-docker-project
```

### 2️⃣ Construire l’image Docker
```sh
docker build -t monserveur .
```

### 3️⃣ Lancer le conteneur Docker
```sh
docker run -p 8000:8000 monserveur
```
📌 **Accéder à l’application** : Ouvrir [http://localhost:8000](http://localhost:8000)

### 4️⃣ Exécuter avec Docker Compose
```sh
docker-compose up
```
📌 **Ceci démarre automatiquement le conteneur** et le rend accessible sur [http://localhost:8000](http://localhost:8000)

---

## 📤 Déploiement sur DockerHub

### 1️⃣ Se connecter à DockerHub
```sh
docker login
```

### 2️⃣ Taguer l’image Docker
```sh
docker tag monserveur tondockerhub/monserveur:latest
```

### 3️⃣ Pousser l’image sur DockerHub
```sh
docker push tondockerhub/monserveur:latest
```

📌 **Vérifier sur DockerHub** : Aller sur [https://hub.docker.com/](https://hub.docker.com/) et rechercher `tondockerhub/monserveur`

---

## 🔄 Automatisation avec GitHub Actions (CI/CD)

Un pipeline GitHub Actions est configuré pour **automatiser le build et le push** sur DockerHub à chaque `git push`.

### 📜 Configuration du pipeline : `.github/workflows/docker-publish.yml`
- **Déclenchement** : À chaque push sur `main`
- **Actions** :
  1. Build l’image Docker
  2. Se connecte à DockerHub
  3. Pousse l’image sur DockerHub

### 📌 Exécuter le pipeline
1. **Ajouter le projet sur GitHub**
```sh
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/tonrepo.git
git push -u origin main
```

2. **Configurer les secrets GitHub**
- Aller sur **GitHub > Settings > Secrets and variables > Actions**
- Ajouter :
  - `DOCKERHUB_USERNAME`
  - `DOCKERHUB_PASSWORD`

3. **Lancer le pipeline (push sur main)**
```sh
git commit -m "Mise à jour"
git push origin main
```

📌 **Vérifier le pipeline** : Aller sur GitHub > Onglet `Actions`

---

## ✅ Tests et validation

### Tester en local
```sh
curl http://localhost:8000
```
Si tout fonctionne, la réponse sera :
```
<html><body><h1>Hello, Docker!</h1></body></html>
```

---

## 🏁 Conclusion
🎯 Ce projet permet de comprendre les bases de **Docker, Docker Compose et CI/CD** avec GitHub Actions.

📌 **Prochaines améliorations possibles :**
- Ajouter des logs avancés 📜
- Déployer sur un service cloud (AWS, GCP) 🌍
- Sécuriser l’accès avec HTTPS 🔒

---

✉️ **Besoin d’aide ?** Ouvre une issue sur GitHub ou envoie un message ! 🚀

