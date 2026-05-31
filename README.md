# Application Flutter — Émissions de streaming

Application mobile affichant une liste d'émissions, avec navigation vers un écran de détail. Structurée en **MVC**.

---

## Structure MVC

### Modèle (`models/`)
Classes de données pures, sans aucun import Flutter.
- `emission.dart` — id, nom, chaîne, image
- `diffusion.dart` — date, durée, génération aléatoire

### Contrôleur (`controllers/`)
Fait le lien entre le modèle et la vue. Implémenté en `ChangeNotifier` avec Provider.
- `emission_controller.dart` — `loadEmissions()`, `getEmissions()`, `onEmissionSelected()`

### Vue (`views/`)
Widgets purement visuels, sans logique métier. Reçoivent les données via le constructeur ou le contrôleur.
- `home_page.dart`, `grille_emissions.dart`, `carte_emission.dart`, `detail_page.dart`

---

## Échanges entre les couches

```
Utilisateur
    │ onTap
    ▼
  Vue ──────────────► Contrôleur ──────────────► Modèle
          callback        │    loadEmissions()
                          │
                          └──► Vue (liste mise à jour via ValueNotifier)
```

---

## Lancer l'application

```bash
flutter pub get
flutter run
```

## Lancer les tests

```bash
flutter test
```
