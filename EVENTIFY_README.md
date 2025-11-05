# Eventify - Application de découverte d'événements

## 📱 Description
Eventify est une application Flutter permettant de découvrir des événements (concerts, expositions, festivals, etc.) à proximité grâce à l'API Ticketmaster.

## 🚀 Fonctionnalités

- ✅ **Recherche d'événements** par ville
- ✅ **Filtrage par catégorie** (Musique, Sports, Arts, Film, etc.)
- ✅ **Favoris** sauvegardés localement
- ✅ **Détails complets** des événements
- ✅ **Partage** d'événements
- ✅ **Réservation** via lien externe

## 📁 Architecture

```
lib/
├─ main.dart                    # Point d'entrée
├─ models/
│   └─ event.dart              # Modèle des événements
├─ services/
│   └─ api_service.dart        # Appels API Ticketmaster
├─ repositories/
│   └─ event_repository.dart   # Abstraction API
├─ providers/
│   └─ event_provider.dart     # Gestion d'état (Provider)
├─ screens/
│   ├─ home_screen.dart        # Écran principal
│   ├─ event_detail_screen.dart # Détails d'un événement
│   └─ favorites_screen.dart   # Liste des favoris
└─ widgets/
    └─ event_card.dart         # Widget carte d'événement
```

## 🔧 Configuration

### 1. Installer les dépendances
```bash
flutter pub get
```

### 2. Obtenir une clé API Ticketmaster

1. Créer un compte sur [Ticketmaster Developer Portal](https://developer.ticketmaster.com/)
2. Créer une application pour obtenir votre clé API
3. Remplacer `YOUR_TICKETMASTER_API_KEY` dans `lib/services/api_service.dart` par votre clé

```dart
static const String apiKey = 'VOTRE_CLE_API_ICI';
```

### 3. Lancer l'application
```bash
flutter run
```

## 📦 Dépendances

- **provider**: Gestion d'état
- **http**: Appels API
- **shared_preferences**: Stockage local des favoris
- **url_launcher**: Ouverture de liens externes
- **share_plus**: Partage d'événements

## 👥 Répartition du travail (4 devs)

- **Dev 1 - UI/UX**: HomeScreen, EventDetailScreen, FavoritesScreen, EventCard
- **Dev 2 - API**: ApiService, EventRepository, filtrage par catégorie
- **Dev 3 - Favoris**: Gestion des favoris avec shared_preferences
- **Dev 4 - Intégrations**: Partage (share_plus), réservation (url_launcher)

## 🎯 Utilisation

1. **Rechercher des événements**: Entrez une ville dans le champ de recherche
2. **Filtrer**: Sélectionnez une catégorie (Musique, Sports, Arts, etc.)
3. **Voir les détails**: Cliquez sur un événement
4. **Ajouter aux favoris**: Cliquez sur l'icône cœur
5. **Réserver**: Cliquez sur le bouton "Réserver" dans les détails
6. **Partager**: Utilisez l'icône de partage

## 🌟 Améliorations possibles

- Géolocalisation automatique avec `geolocator`
- Ajout au calendrier avec `device_calendar`
- Notifications pour les événements favoris
- Mode sombre
- Recherche par date
- Carte interactive des événements

## 📝 Notes

- L'API Ticketmaster gratuite a une limite de requêtes (5000/jour)
- Certains événements peuvent ne pas avoir d'image ou de description
- La disponibilité des événements dépend de la ville recherchée
