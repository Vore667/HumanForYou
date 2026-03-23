# 🚀 Projet IA : Environnement de Développement Réplicable

Bienvenue dans ce projet de développement IA. Pour garantir la cohérence des résultats et éviter les conflits de versions, nous utilisons **Docker** et les **Dev Containers** de VS Code.

---

## 🛠️ Pré-requis

Avant de commencer, assurez-vous d'avoir installé les outils suivants sur votre machine hôte (Windows, macOS ou Linux) :

1.  **Docker Desktop** (ou Docker Engine sur Linux) : [Télécharger ici](https://www.docker.com/products/docker-desktop/)
2.  **Visual Studio Code** : [Télécharger ici](https://code.visualstudio.com/)
3.  **Extension VS Code "Dev Containers"** : Recherchez `ms-vscode-remote.remote-containers` dans le marketplace.

---

## 💻 Installation Rapide (Step-by-Step)

Suivez ces étapes pour lancer l'environnement de travail en moins de 5 minutes :

1.  **Cloner le dépôt :**
    ```bash
    git clone [https://github.com/VOTRE_PSEUDO/VOTRE_PROJET.git](https://github.com/VOTRE_PSEUDO/VOTRE_PROJET.git)
    cd VOTRE_PROJET
    ```

2.  **Ouvrir avec VS Code :**
    ```bash
    code .
    ```

3.  **Lancer le conteneur :**
    * Une notification devrait apparaître en bas à droite : *"Folder contains a Dev Container configuration file. Reopen to folder to develop in a container?"*.
    * Cliquez sur **Reopen in Container**.
    * *Si la notification n'apparaît pas :* Cliquez sur le bouton bleu avec les flèches (`><`) en bas à gauche de la barre de statut et choisissez **"Reopen in Container"**.

4.  **Attendre la construction :** La première fois, Docker va construire l'image (téléchargement de Python, installation de PyTorch, etc.). Cela peut prendre quelques minutes selon votre connexion.

---

## 📁 Structure de l'Environnement

* **`.devcontainer/`** : Configuration de l'IDE et de Docker.
* **`data/`** : (Ignoré par Git) Emplacement pour vos datasets locaux.
* **`models/`** : (Ignoré par Git) Sauvegarde des poids des modèles entraînés.
* **`requirements.txt`** : Liste des dépendances Python gérées par le conteneur.

---

## 🧪 Tester l'Installation

Une fois le conteneur lancé (vérifiez la mention `Dev Container: IA-Dev-Env` en bas à gauche), ouvrez un terminal intégré dans VS Code et lancez :

```bash
python test.py