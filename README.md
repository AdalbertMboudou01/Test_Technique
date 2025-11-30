# 📱 Test Technique — React Native + Flutter Module<br>

## Vue d'ensemble

Ce dépôt combine deux technologies :

1. **Une application mobile React Native** (`React_App`)
2. **Un module Flutter** (`azeoo_module_sdk`) intégré à l’application via les API natifs

L’application React Native permet :
- de saisir et enregistrer un identifiant utilisateur,
- de le stocker localement,
- puis d’appeler le module Flutter qui affiche les informations de l’utilisateur.

---

## Structure du dépôt


```
Test_Technique-main/
├── React_App/ # Application React Native
│ ├── App.tsx # Point d’entrée et navigation par onglets
│ ├── src/
│ │ ├── UserIdScreen.js # Saisie et sauvegarde de l’ID utilisateur via
AsyncStorage
│ │ └── ProfileScreen.js # Lecture de l’ID et appel du module Flutter via
NativeModules
│ ├── __tests__/ # Tests Jest (simple rendu de l’application)
│ └── android/ et ios/ # Projets natifs générés par React Native
└── azeoo_module_sdk/ # Module Flutter intégré
├── lib/
│ ├── src/core/network/ # Client HTTP basé sur Dio
│ ├── src/data/ # Data sources, modèles et repository
│ └── src/features/ # Présentation (controleur et écran profil)
└── pubspec.yaml # Dépendances Flutter (Riverpod, Dio, etc.)
```

---

## Choix techniques

### **React Native**
- **React Native 0.82.1**
- **Navigation** : `@react-navigation/native` + `@react-navigation/bottom-tabs`  
  → Solution fiable et flexible pour gérer la navigation par onglets
- **Stockage local** : `@react-native-async-storage/async-storage`  
  → Persistance simple et performante de l’identifiant utilisateur

### **Flutter**
- **flutter_riverpod**  
  → Gestion d’état moderne, testable et recommandée
- **dio**  
  → Client HTTP robuste offrant interceptors et gestion avancée des erreurs
- **Architecture modulaire (network / data / presentation)**  
  → Améliore la maintenabilité, la lisibilité et les tests unitaires

---

## Préparation de l’environnement


**1. Environnement mobile**
  - Emulateur Android<br>
    ou<br>
  - Un appareil Android connecté

**2. Installer le CLI React Native localement**
```bash
dans React_App (cd React_App) exécutez
npm install --save-dev @react-native-community/cli
npm install react-native@0.82.1
```
---

## Lancement de l'appli React

Démarrer Metro (bundler React Native) :
```bash
npm rustart      # ou yarn start (ou npx react-native start)
```
Dans un autre terminal (sans fermer Metro) :
```bash
npm run android   # Android (npx react-native run-android)
```
L’application se lance alors sur l’émulateur ou l’appareil connecté.

---

## Utilisation de l'appli

### Onglet User
- Entrer un identifiant utilisateur (ex : 1 ou `3`)  
- Appuyer sur Save

### Onglet Profile
- L’ID sauvegardé s’affiche  
- Appuyer sur Open Flutter Profile → affiche l'utilisateur Samuel Verdier

---

