# 📚 Index de la documentation - Eventify

Bienvenue dans le projet Eventify ! Voici un guide pour naviguer dans la documentation.

## 🚀 Pour commencer

1. **[QUICK_START.md](QUICK_START.md)** - Démarrage rapide (2 minutes)
   - Installation
   - Premier lancement
   - Utilisation de base

## 📖 Documentation principale

2. **[EVENTIFY_README.md](EVENTIFY_README.md)** - Documentation complète
   - Description du projet
   - Fonctionnalités détaillées
   - Configuration de l'API
   - Dépendances

3. **[ARCHITECTURE.md](ARCHITECTURE.md)** - Architecture technique
   - Structure du projet
   - Patterns utilisés
   - Flux de données
   - Points d'amélioration

4. **[PRESENTATION.md](PRESENTATION.md)** - Présentation du projet
   - Concept et fonctionnalités
   - Répartition du travail
   - Statistiques
   - Guide de présentation

5. **[COMMANDS.md](COMMANDS.md)** - Commandes utiles
   - Installation et lancement
   - Build et déploiement
   - Debugging
   - Raccourcis clavier

## 📁 Structure du code

```
lib/
├─ main.dart                    # Point d'entrée de l'application
│
├─ models/
│   └─ event.dart              # Modèle de données Event
│
├─ services/
│   ├─ api_service.dart        # Service API Ticketmaster
│   └─ mock_data.dart          # Données de démonstration
│
├─ repositories/
│   └─ event_repository.dart   # Abstraction de la source de données
│
├─ providers/
│   └─ event_provider.dart     # Gestion d'état avec Provider
│
├─ screens/
│   ├─ home_screen.dart        # Écran principal avec liste
│   ├─ event_detail_screen.dart # Détails d'un événement
│   └─ favorites_screen.dart   # Liste des favoris
│
└─ widgets/
    └─ event_card.dart         # Widget carte d'événement
```

## 🎯 Guides par rôle

### Pour les développeurs
1. Lire [ARCHITECTURE.md](ARCHITECTURE.md) pour comprendre la structure
2. Consulter [COMMANDS.md](COMMANDS.md) pour les commandes de développement
3. Explorer le code dans `lib/`

### Pour les testeurs
1. Suivre [QUICK_START.md](QUICK_START.md) pour installer
2. Tester les scénarios dans [PRESENTATION.md](PRESENTATION.md)
3. Utiliser [COMMANDS.md](COMMANDS.md) pour le debugging

### Pour la présentation
1. Lire [PRESENTATION.md](PRESENTATION.md) pour le pitch
2. Préparer la démo avec [QUICK_START.md](QUICK_START.md)
3. Référencer [EVENTIFY_README.md](EVENTIFY_README.md) pour les détails

## 🔑 Informations clés

### Clé API Ticketmaster
```
TwCKnl5Y8ycdiUsGL8jmAJiDqfhBxMpm
```
Déjà configurée dans `lib/services/api_service.dart`

### Dépendances principales
- **provider**: ^6.1.1 (State management)
- **http**: ^1.1.0 (API calls)
- **shared_preferences**: ^2.2.2 (Local storage)
- **url_launcher**: ^6.2.3 (External links)
- **share_plus**: ^7.2.2 (Native sharing)

### Commandes essentielles
```bash
flutter pub get          # Installer les dépendances
flutter run              # Lancer l'app
flutter analyze          # Analyser le code
flutter test             # Lancer les tests
```

## 📱 Fonctionnalités implémentées

✅ Recherche d'événements par ville  
✅ Filtrage par catégorie (Music, Sports, Arts, Film, Miscellaneous)  
✅ Système de favoris avec persistance locale  
✅ Détails complets des événements  
✅ Réservation via lien externe  
✅ Partage d'événements  
✅ Pull-to-refresh  
✅ Gestion des erreurs avec fallback sur données mockées  

## 🎓 Ressources d'apprentissage

### Flutter
- [Documentation officielle Flutter](https://docs.flutter.dev/)
- [Flutter Cookbook](https://docs.flutter.dev/cookbook)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)

### Packages utilisés
- [Provider](https://pub.dev/packages/provider)
- [HTTP](https://pub.dev/packages/http)
- [SharedPreferences](https://pub.dev/packages/shared_preferences)
- [URL Launcher](https://pub.dev/packages/url_launcher)
- [Share Plus](https://pub.dev/packages/share_plus)

### API
- [Ticketmaster Discovery API](https://developer.ticketmaster.com/products-and-docs/apis/discovery-api/v2/)

## 🐛 Résolution de problèmes

### Problème de compilation
```bash
flutter clean
flutter pub get
flutter run
```

### Pas d'événements affichés
- Vérifier la connexion internet
- L'app utilise automatiquement des données mockées en fallback
- Essayer une autre ville (ex: "New York", "London")

### Erreur de dépendances
```bash
rm pubspec.lock
flutter pub get
```

## 📞 Support

Pour toute question :
1. Consulter la documentation appropriée ci-dessus
2. Vérifier [COMMANDS.md](COMMANDS.md) pour les commandes de debugging
3. Lire les commentaires dans le code source

## 🎉 Démarrage rapide (TL;DR)

```bash
# 1. Installer
flutter pub get

# 2. Lancer
flutter run

# 3. Tester
# - Entrer une ville (ex: "Paris")
# - Filtrer par catégorie
# - Cliquer sur un événement
# - Ajouter aux favoris
# - Partager
```

---

**Bon développement avec Eventify ! 🚀**

*Dernière mise à jour : Janvier 2025*
