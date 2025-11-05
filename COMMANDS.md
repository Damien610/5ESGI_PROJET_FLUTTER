# 🛠️ Commandes utiles - Eventify

## 📦 Installation

```bash
# Installer les dépendances
flutter pub get

# Vérifier la configuration Flutter
flutter doctor
```

## 🚀 Lancement

```bash
# Lancer sur l'appareil par défaut
flutter run

# Lancer sur Chrome
flutter run -d chrome

# Lancer sur un émulateur Android
flutter run -d android

# Lancer sur un simulateur iOS
flutter run -d ios

# Lancer en mode release
flutter run --release
```

## 🔍 Analyse et tests

```bash
# Analyser le code
flutter analyze

# Lancer les tests
flutter test

# Lancer les tests avec couverture
flutter test --coverage

# Vérifier les dépendances obsolètes
flutter pub outdated
```

## 🧹 Nettoyage

```bash
# Nettoyer le projet
flutter clean

# Nettoyer et réinstaller
flutter clean && flutter pub get

# Supprimer le cache
flutter pub cache clean
```

## 📱 Build

```bash
# Build APK Android
flutter build apk

# Build APK Android (release)
flutter build apk --release

# Build App Bundle Android
flutter build appbundle

# Build iOS
flutter build ios

# Build Web
flutter build web
```

## 🔧 Développement

```bash
# Mode hot reload (automatique avec flutter run)
# Appuyez sur 'r' dans le terminal

# Mode hot restart
# Appuyez sur 'R' dans le terminal

# Ouvrir DevTools
flutter pub global activate devtools
flutter pub global run devtools

# Formater le code
flutter format lib/

# Générer les icônes
flutter pub run flutter_launcher_icons:main
```

## 📊 Debugging

```bash
# Lancer avec logs détaillés
flutter run -v

# Afficher les logs
flutter logs

# Inspecter l'app
flutter attach

# Profiler les performances
flutter run --profile
```

## 🔄 Mise à jour

```bash
# Mettre à jour Flutter
flutter upgrade

# Mettre à jour les dépendances
flutter pub upgrade

# Mettre à jour une dépendance spécifique
flutter pub upgrade provider
```

## 📝 Utilitaires

```bash
# Créer un nouveau widget
# Créer manuellement dans lib/widgets/

# Créer un nouveau screen
# Créer manuellement dans lib/screens/

# Lister les appareils disponibles
flutter devices

# Capturer une screenshot
flutter screenshot
```

## 🐛 Résolution de problèmes

```bash
# Problème de build
flutter clean
flutter pub get
flutter run

# Problème de dépendances
rm pubspec.lock
flutter pub get

# Problème de cache
flutter pub cache repair

# Réinitialiser complètement
flutter clean
rm -rf build/
rm pubspec.lock
flutter pub get
```

## 📚 Documentation

```bash
# Générer la documentation
dart doc .

# Ouvrir la documentation Flutter
flutter doctor -v
```

## 🎯 Commandes spécifiques au projet

```bash
# Lancer l'app avec la clé API
# La clé est déjà configurée dans lib/services/api_service.dart

# Tester avec des données mockées
# Les données mockées sont automatiquement utilisées en cas d'erreur API

# Réinitialiser les favoris
# Désinstaller et réinstaller l'app
```

## 💡 Raccourcis clavier (pendant flutter run)

- `r` : Hot reload
- `R` : Hot restart
- `h` : Aide
- `d` : Détacher
- `c` : Nettoyer la console
- `q` : Quitter
- `s` : Sauvegarder une capture d'écran
- `w` : Afficher le widget inspector
- `t` : Afficher le rendering tree
- `L` : Afficher les logs
- `S` : Afficher les statistiques de performance
- `U` : Afficher les statistiques de mémoire
- `i` : Toggle platform (iOS/Android)
- `o` : Toggle platform brightness
- `p` : Toggle debug painting
- `P` : Toggle performance overlay
- `a` : Toggle timeline events

## 🔐 Variables d'environnement

```bash
# Définir la clé API (optionnel)
export TICKETMASTER_API_KEY="votre_cle"

# Utiliser dans le code
# String.fromEnvironment('TICKETMASTER_API_KEY')
```

## 📱 Émulateurs

```bash
# Lister les émulateurs Android
flutter emulators

# Lancer un émulateur Android
flutter emulators --launch <emulator_id>

# Lister les simulateurs iOS (macOS uniquement)
xcrun simctl list devices

# Lancer un simulateur iOS (macOS uniquement)
open -a Simulator
```

## 🎨 Assets et ressources

```bash
# Ajouter des assets
# 1. Placer les fichiers dans assets/
# 2. Déclarer dans pubspec.yaml
# 3. flutter pub get

# Utiliser dans le code
# Image.asset('assets/image.png')
```

---

**Tip**: Gardez ce fichier à portée de main pendant le développement ! 🚀
