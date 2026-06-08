# Inventaire Matériel Informatique — Application Windows

## Structure du projet

```
inventaire-app/
├── main.js          ← Processus principal Electron
├── package.json     ← Configuration & dépendances
├── BUILD.bat        ← Script de compilation (double-clic)
├── src/
│   └── index.html   ← Interface de l'application
└── assets/
    ├── icon.ico     ← Icône Windows (à ajouter, voir ci-dessous)
    └── icon.png     ← Icône PNG (à ajouter)
```

## Compilation — Étapes

### Prérequis
- **Node.js** ≥ 18 — https://nodejs.org  
- **Connexion internet** pour le premier téléchargement d'Electron (~100 Mo)

### 1. Ajouter une icône (optionnel mais recommandé)

Placez dans le dossier `assets/` :
- `icon.ico` (256×256, format ICO Windows)
- `icon.png` (256×256)

Des convertisseurs gratuits : https://convertico.com

### 2. Lancer la compilation

Double-cliquez sur **`BUILD.bat`**

Le script :
1. Vérifie Node.js et npm
2. Installe les dépendances (`npm install`)
3. Compile l'installeur `.exe` (`npm run build`)
4. Ouvre automatiquement le dossier `dist\`

### 3. Résultat

Dans `dist\` vous trouverez :
- `Inventaire Informatique Setup 1.0.0.exe` — installeur Windows (NSIS)

L'installeur permet de :
- Choisir le dossier d'installation
- Créer un raccourci Bureau
- Désinstaller proprement via le Panneau de configuration

---

## Tester sans compiler

Pour tester l'application directement sans créer l'exe :

```bash
npm install
npm start
```

---

## Fonctionnalités

- ✅ Ajout / modification / suppression d'équipements
- ✅ N° inventaire unique par article
- ✅ Modèles prédéfinis par catégorie
- ✅ Recherche et filtres (catégorie, état)
- ✅ Tri par colonne
- ✅ Import depuis Excel (.xlsx / .xls / .csv)
- ✅ Export Excel
- ✅ Téléchargement du modèle Excel vierge
- ✅ Double-clic sur une ligne pour modifier
- ✅ Statistiques en temps réel

---

## Dépannage

| Problème | Solution |
|----------|----------|
| `node` non reconnu | Réinstaller Node.js et cocher "Add to PATH" |
| `npm install` lent | Connexion lente — attendre (Electron ~100 Mo) |
| Antivirus bloque le .exe | Whitelister le dossier `dist\` pendant le build |
| Icône manquante | Supprimer `"icon"` dans `package.json` build.win |
