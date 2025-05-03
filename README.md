# Exercice 1 – Syntaxe de base en Dart

## Objectifs pédagogiques
- Comprendre la syntaxe Dart
- Manipuler les classes, méthodes, listes, et opérateurs
- Appliquer le contrôle de flux et structurer un programme complet

---

## Partie 1 : Structures de Données

### Classe Book
- **Propriétés** : 
  - `title` (String)
  - `author` (String)
  - `year` (int)
  - `isAvailable` (bool)
  
- **Constructeurs** :
  - Le constructeur classique
  - Le constructeur nommé `Book.available()` qui initialise `isAvailable` à `true`.

### Classe Library
- **Propriétés** : Liste privée de `Book` (_books).
- **Méthodes** :
  - `addBook(Book book)` : Ajoute un livre à la bibliothèque.
  - `borrowBook(String title)` : Marque un livre comme indisponible.
  - `getAvailableBooks()` : Retourne les livres disponibles.

### Code de la Partie 1

```dart
class Book {
  String title;
  String author;
  int year;
  bool isAvailable;

  Book(this.title, this.author, this.year, this.isAvailable);
  Book.available(this.title, this.author, this.year) : isAvailable = true;
}

class Library {
  final List<Book> _books = [];

  void addBook(Book book) {
    _books.add(book);
  }

  void borrowBook(String title) {
    for (var book in _books) {
      if (book.title == title && book.isAvailable) {
        book.isAvailable = false;
        break;
      }
    }
  }

  List<Book> getAvailableBooks() {
    return _books.where((book) => book.isAvailable).toList();
  }

  Library operator +(Library other) {
    var newLibrary = Library();
    newLibrary._books.addAll(_books);
    newLibrary._books.addAll(other._books);
    return newLibrary;
  }
}
````

---

## Partie 2 : Fonctions et Opérateurs

### Fonction `displayBooks`

Affiche les informations d’une liste de livres avec `for-in` et interpolation de chaînes.

### Code de la Partie 2

```dart
void displayBooks(List<Book> books) {
  for (var book in books) {
    print('Titre: ${book.title}, Auteur: ${book.author} (Année: ${book.year})');
  }
}
```

---

## Partie 3 : Contrôle de Flux et Main()

### Code principal (`main()`)

Dans la fonction `main()`, on crée des livres, les ajoute à des bibliothèques, puis on emprunte un livre et fusionne deux bibliothèques.

```dart
void main() {
  var book1 = Book.available('Dart pour les débutants', 'Alice Martin', 2021);
  var book2 = Book.available('Flutter en pratique', 'Bob Dupont', 2022);
  var book3 = Book('JavaScript moderne', 'Claire Dubois', 2020, false);

  var library1 = Library();
  library1.addBook(book1);
  library1.addBook(book2);
  library1.addBook(book3);

  library1.borrowBook('Dart pour les débutants');

  print('Livres disponibles après emprunt :');
  displayBooks(library1.getAvailableBooks());

  var library2 = Library();
  library2.addBook(Book.available('Python pour les nuls', 'David Lemaitre', 2023));

  var mergedLibrary = library1 + library2;

  print('\nLivres disponibles dans la bibliothèque fusionnée :');
  displayBooks(mergedLibrary.getAvailableBooks());
}
```

---

## Commentaires et Comparaisons

### En Java

* Les classes et objets ressemblent à Dart.
* Les listes sont typées via `List<Book>` aussi.
* Pas de surcharge d’opérateurs comme `+`.

### En JavaScript

* Pas de typage statique (sauf avec TypeScript).
* Les objets peuvent être manipulés librement sans encapsulation stricte.
* Pas de constructeurs nommés (mais les classes ES6 se rapprochent).

### Familiarité

* La logique de classe, les boucles `for-in`, les méthodes sont familières.

### Nouveautés avec Dart

* Constructeurs nommés comme `Book.available()`.
* Surcharge d’opérateurs possible.
* Encapsulation avec underscore (`_`) pour listes privées.

---

## Résultat Visuel

Voici une capture d'écran de l'exécution du programme :

<p align="center">
  <img src="resultat.PNG" width="500"/>
</p>

