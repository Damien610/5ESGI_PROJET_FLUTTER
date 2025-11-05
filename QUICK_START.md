# 🚀 Guide de démarrage rapide - Eventify

## ✅ Installation (2 minutes)

### 1. Installer les dépendances
```bash
cd Projet_flutter
flutter pub get
```

### 2. Lancer l'application
```bash
flutter run
```

L'application est prête ! La clé API Ticketmaster est déjà configurée.

## 📱 Utilisation

### Rechercher des événements
1. Entrez une ville dans le champ de recherche (ex: "Paris", "Lyon", "New York")
2. Appuyez sur Entrée
3. Les événements s'affichent automatiquement

### Filtrer par catégorie
- Cliquez sur les chips en haut de l'écran
- Catégories disponibles: Tous, Music, Sports, Arts, Film, Miscellaneous

### Ajouter aux favoris
- Cliquez sur l'icône ❤️ sur une carte d'événement
- Accédez aux favoris via l'icône ❤️ dans l'AppBar

### Voir les détails
- Cliquez sur une carte d'événement
- Vous verrez: image, description, lieu, date, catégorie
- Bouton "Réserver" pour ouvrir le lien de réservation
- Icône de partage pour partager l'événement

## 🎯 Fonctionnalités testées

✅ Recherche par ville  
✅ Filtrage par catégorie  
✅ Favoris persistants (sauvegardés localement)  
✅ Détails complets des événements  
✅ Réservation via lien externe  
✅ Partage d'événements  
✅ Pull-to-refresh  
✅ Données mockées en fallback  

## 🔧 Configuration avancée

### Changer la clé API
Éditez `lib/services/api_service.dart`:
```dart
static const String apiKey = 'VOTRE_NOUVELLE_CLE';
```

### Modifier les données mockées
Éditez `lib/services/mock_data.dart` pour ajouter/modifier les événements de démonstration.

### Personnaliser le thème
Éditez `lib/main.dart`:
```dart
theme: ThemeData(
  primarySwatch: Colors.purple, // Changez la couleur
  useMaterial3: true,
),
```

## 🐛 Résolution de problèmes

### Pas d'événements affichés
- Vérifiez votre connexion internet
- L'application utilise automatiquement des données mockées en cas d'erreur
- Essayez une autre ville (ex: "New York", "London")

### Erreur de compilation
```bash
flutter clean
flutter pub get
flutter run
```

### Images ne s'affichent pas
- Normal sur certains événements (pas d'image disponible)
- Une icône de remplacement s'affiche automatiquement

## 📊 Données de test

Villes recommandées pour tester:
- Paris
- New York
- London
- Los Angeles
- Tokyo

## 🎓 Pour les développeurs

### Structure du code
```
lib/
├─ main.dart              # Point d'entrée
├─ models/                # Modèles de données
├─ services/              # API et données mockées
├─ repositories/          # Abstraction des données
├─ providers/             # Gestion d'état
├─ screens/               # Écrans de l'app
└─ widgets/               # Composants réutilisables
```

### Ajouter une nouvelle fonctionnalité
1. Créer le modèle dans `models/`
2. Ajouter la logique dans `providers/`
3. Créer l'UI dans `screens/` ou `widgets/`
4. Mettre à jour le provider dans `main.dart` si nécessaire

### Tests
```bash
flutter test
```

## 📝 Notes importantes

- **Limite API**: 5000 requêtes/jour avec la clé gratuite
- **Données mockées**: Activées automatiquement en cas d'erreur API
- **Favoris**: Sauvegardés localement avec SharedPreferences
- **Compatibilité**: iOS, Android, Web

## 🌟 Prochaines étapes

1. Tester avec différentes villes
2. Ajouter des événements aux favoris
3. Explorer les détails et réserver
4. Partager un événement
5. Personnaliser le thème

Bon développement ! 🎉
