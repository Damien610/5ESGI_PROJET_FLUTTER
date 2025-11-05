# 🎉 Eventify - Découvrez les événements près de chez vous

[![Flutter](https://img.shields.io/badge/Flutter-3.8+-blue.svg)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.0+-blue.svg)](https://dart.dev/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

Application Flutter de découverte d'événements locaux (concerts, expositions, festivals, sports, etc.) avec l'API Ticketmaster.

## 🚀 Démarrage rapide

```bash
flutter pub get
flutter run
```

**C'est tout !** La clé API est déjà configurée.

## ✨ Fonctionnalités

- ✅ **Recherche par ville** - Trouvez des événements partout dans le monde
- ✅ **Filtrage par catégorie** - Music, Sports, Arts, Film, etc.
- ✅ **Favoris persistants** - Sauvegardez vos événements préférés
- ✅ **Détails complets** - Image, description, lieu, date
- ✅ **Réservation** - Lien direct vers la billetterie
- ✅ **Partage** - Partagez vos événements favoris

## 📱 Captures d'écran

| Accueil | Détails | Favoris |
|---------|---------|----------|
| Liste des événements | Informations complètes | Événements sauvegardés |

## 🏗️ Architecture

```
lib/
├─ main.dart              # Point d'entrée
├─ models/                # Modèles de données
├─ services/              # API et données mockées
├─ repositories/          # Abstraction des données
├─ providers/             # Gestion d'état (Provider)
├─ screens/               # Écrans de l'application
└─ widgets/               # Composants réutilisables
```

**Pattern** : MVVM + Repository Pattern

## 📦 Technologies

- **Flutter 3.8+** - Framework UI
- **Provider** - State management
- **Ticketmaster API** - Source de données
- **SharedPreferences** - Stockage local
- **url_launcher** - Liens externes
- **share_plus** - Partage natif

## 📚 Documentation

| Fichier | Description |
|---------|-------------|
| **[START_HERE.md](START_HERE.md)** | 🎯 Point d'entrée principal |
| **[QUICK_START.md](QUICK_START.md)** | 🚀 Guide de démarrage rapide |
| **[ARCHITECTURE.md](ARCHITECTURE.md)** | 🏗️ Architecture détaillée |
| **[PRESENTATION.md](PRESENTATION.md)** | 🎤 Guide de présentation |
| **[COMMANDS.md](COMMANDS.md)** | 🛠️ Commandes utiles |
| **[SUMMARY.md](SUMMARY.md)** | 📊 Résumé du projet |
| **[INDEX.md](INDEX.md)** | 📚 Navigation complète |

## 👥 Équipe

Projet réalisé par 4 développeurs :
- **Dev 1** : UI/UX & Navigation
- **Dev 2** : API & Filtrage
- **Dev 3** : Favoris & Persistance
- **Dev 4** : Intégrations & Tests

## 🎯 Statut

✅ **100% Complet et fonctionnel**

- ✅ Toutes les fonctionnalités implémentées
- ✅ Tests passants
- ✅ Documentation complète
- ✅ Code sans erreur ni warning
- ✅ Prêt pour la production

## 🚀 Commandes

```bash
# Installation
flutter pub get

# Lancement
flutter run

# Tests
flutter test

# Analyse
flutter analyze

# Build Android
flutter build apk
```

## 🔑 Configuration

La clé API Ticketmaster est déjà configurée dans `lib/services/api_service.dart`.

Pour utiliser votre propre clé :
1. Créer un compte sur [Ticketmaster Developer](https://developer.ticketmaster.com/)
2. Remplacer la clé dans `lib/services/api_service.dart`

## 🐛 Résolution de problèmes

```bash
flutter clean
flutter pub get
flutter run
```

Plus d'aide dans [COMMANDS.md](COMMANDS.md)

## 📄 Licence

MIT License - voir [LICENSE](LICENSE)

## 🌟 Remerciements

- [Flutter](https://flutter.dev/)
- [Ticketmaster API](https://developer.ticketmaster.com/)
- [Provider](https://pub.dev/packages/provider)

---

**Eventify** - Découvrez les événements près de chez vous ! 🎉

*Projet 5ESGI - Flutter*
