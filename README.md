# POC iOS depuis Linux

App SwiftUI minimale, développée sous Linux, compilée/signée/uploadée vers
TestFlight par GitHub Actions (runner macOS). Aucun Mac nécessaire pour le build.

## Ce que fait le workflow
1. `xcodegen` génère le projet Xcode depuis `project.yml`
2. `xcodebuild archive` + export IPA (signature Apple Distribution)
3. Upload TestFlight via `altool` (clé API App Store Connect)

## Secrets GitHub à créer (Settings → Secrets → Actions)
| Secret | Où le trouver |
|---|---|
| `DEVELOPMENT_TEAM` | App Store Connect → ton Team ID (10 caractères, https://developer.apple.com/account#MembershipDetailsCard) |
| `APPSTORE_KEY_ID` | App Store Connect → Utilisateurs et accès → Intégrations → Clés API App Store Connect (rôle **Developer** ou **App Manager**) |
| `APPSTORE_ISSUER_ID` | Même page, affiché au-dessus de la liste des clés |
| `APPSTORE_P8` | Contenu du fichier .p8 téléchargé, encodé base64 : `base64 -w0 AuthKey_XXXX.p8` |

## Étapes côté Apple (une seule fois)
1. Créer la clé API App Store Connect (si pas déjà fait pour ton app TestFlight précédente) — télécharger le .p8 (une seule fois possible !).
2. App Store Connect → Mes apps → **+** → Nouvelle app :
   - nom : `PocIos`, langue principale : Français, bundle ID : `fr.gatshub.pocios`, SKU : `pocios`.
   (Le bundle ID apparaîtra automatiquement dans la liste car l'app est d'abord créée côté développeur.)
3. Pousser ce repo sur GitHub (public ou privé), ajouter les 4 secrets.
4. Le workflow tourne à chaque push sur main → ~15 min → build dans TestFlight.
5. Sur le Mac saturé : installer l'app TestFlight depuis l'App Store (quelques dizaines de Mo),
   se connecter, l'app apparaît, la lancer.

## Local (Linux)
Le code Swift ne se compile pas ici (pas de SDK iOS), mais la syntaxe peut être
vérifiée avec `swiftc -parse` si swift est installé : `swiftc -parse Sources/App.swift`.
