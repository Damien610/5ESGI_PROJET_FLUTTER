# Architecture Eventify

## 📐 Structure du projet

### Modèles (models/)
- **event.dart**: Modèle de données pour les événements
  - Propriétés: id, name, imageUrl, description, venue, date, url, category
  - Méthodes: fromJson(), toJson()

### Services (services/)
- **api_service.dart**: Communication avec l'API Ticketmaster
  - fetchEvents(): Récupère les événements depuis l'API
  - Fallback sur données mockées en cas d'erreur
- **mock_data.dart**: Données de démonstration

### Repositories (repositories/)
- **event_repository.dart**: Couche d'abstraction entre les services et les providers
  - getEvents(): Interface unifiée pour récupérer les événements

### Providers (providers/)
- **event_provider.dart**: Gestion d'état avec Provider
  - États: events, favorites, isLoading, selectedCategory, city
  - Méthodes: fetchEvents(), toggleFavorite(), setCategory(), setCity()
  - Persistance des favoris avec SharedPreferences

### Écrans (screens/)
- **home_screen.dart**: Écran principal
  - Sélecteur de ville
  - Filtres par catégorie
  - Liste des événements
  - Pull-to-refresh
  
- **event_detail_screen.dart**: Détails d'un événement
  - Image, description, lieu, date
  - Bouton de réservation (url_launcher)
  - Partage (share_plus)
  - Toggle favori
  
- **favorites_screen.dart**: Liste des favoris
  - Affichage des événements favoris
  - Gestion vide state

### Widgets (widgets/)
- **event_card.dart**: Carte d'événement réutilisable
  - Image, titre, lieu, date, catégorie
  - Bouton favori
  - Gestion des erreurs d'image

## 🔄 Flux de données

```
User Action
    ↓
Screen (UI)
    ↓
Provider (State Management)
    ↓
Repository (Abstraction)
    ↓
Service (API/Mock)
    ↓
Model (Data)
    ↓
Provider (Update State)
    ↓
Screen (UI Update)
```

## 🎯 Patterns utilisés

1. **Provider Pattern**: Gestion d'état réactive
2. **Repository Pattern**: Abstraction de la source de données
3. **Model-View-ViewModel (MVVM)**: Séparation des responsabilités
4. **Dependency Injection**: Via Provider

## 📦 Dépendances clés

- **provider**: State management
- **http**: Requêtes HTTP
- **shared_preferences**: Stockage local
- **url_launcher**: Ouverture de liens
- **share_plus**: Partage natif

## 🔐 Sécurité

- Clé API stockée dans le code (à déplacer vers .env en production)
- Validation des données API
- Gestion des erreurs réseau
- Fallback sur données mockées

## 🚀 Points d'amélioration

1. **Géolocalisation**: Ajouter geolocator pour détecter la ville automatiquement
2. **Calendrier**: Intégrer device_calendar pour ajouter aux événements
3. **Cache**: Implémenter un cache local pour les événements
4. **Pagination**: Charger plus d'événements au scroll
5. **Recherche**: Ajouter une barre de recherche
6. **Notifications**: Rappels pour les événements favoris
7. **Mode hors ligne**: Améliorer l'expérience sans connexion
8. **Tests**: Ajouter des tests unitaires et d'intégration
