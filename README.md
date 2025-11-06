# 🎥 SwiftCineApp

## Introduction

**SwiftCineApp** est une application mobile développée en **SwiftUI** visant à offrir une expérience de navigation et de découverte de films riche et moderne.

Le projet a été conçu pour présenter une architecture SwiftUI propre, en intégrant notamment un **Design System (DS)** et une gestion avancée de l'état de l'application, y compris la gestion des favoris (Bookmarks/Favorites) pour les données récupérées via l'**API OMDb**.

---

## 🌟 Fonctionnalités Clés

* **Affichage Détaillé des Films :** Chargement asynchrone des informations et des affiches de films (posters) en utilisant un `ViewModel`.
* **Gestion des Favoris (`FavoritesManager`) :** Implémentation d'un système de marque-pages persistant et global utilisant `@EnvironmentObject`.
* **Composant Réutilisable :** Utilisation d'un bouton de favoris (`BookmarkButton`) issu du `DesignSystem` qui met à jour l'état des données de manière réactive.
* **Architecture Modulaire :** Séparation des préoccupations en utilisant les patterns **MVVM** et la gestion d'état de SwiftUI.
* **Requêtes Asynchrones (Combine) :** Utilisation de l'API OMDb avec le framework **Combine** pour la gestion des appels réseau uniques et multiples (pour la liste des favoris).

---

## 🧑‍💻 Équipe de Développement

Ce projet a été réalisé en collaboration par :
* [Anthony LOPES](https://github.com/AnthxnyL)
* [Alyssia LORSOLD PRADON](https://github.com/alyssialopr)


### Note (Selon Alyssia et Anthony)
14,5/20
