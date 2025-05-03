
// Exercice 1 – Syntaxe de base en Dart

// Objectifs pédagogiques :
// - Comprendre la syntaxe Dart
// - Manipuler les classes, méthodes, listes, et opérateurs
// - Appliquer le contrôle de flux et structurer un programme complet

// ==================================================
// PARTIE 1 : STRUCTURES DE DONNÉES

// Classe Book :
// - Propriétés : title (String), author (String), year (int), isAvailable (bool)
// - Deux constructeurs : l’un classique, l’autre nommé Book.available()
//
// Classe Library :
// - Contient une liste privée de livres (_books)
// - addBook(Book) : ajoute un livre
// - borrowBook(String title) : met isAvailable à false si le titre existe
// - getAvailableBooks() : retourne les livres encore disponibles

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

// ==================================================
//  PARTIE 2 : FONCTIONS ET OPÉRATEURS

// displayBooks :
// Affiche les informations d’une liste de livres avec for-in et interpolation.
void displayBooks(List<Book> books) {
  for (var book in books) {
    print('Titre: ${book.title}, Auteur: ${book.author} (Année: ${book.year})');
  }
}

// ==================================================
//  PARTIE 3 : CONTRÔLE DE FLUX & MAIN()

void main() {
  // Création de 3 livres
  var book1 = Book.available('Dart pour les débutants', 'Alice Martin', 2021);
  var book2 = Book.available('Flutter en pratique', 'Bob Dupont', 2022);
  var book3 = Book('JavaScript moderne', 'Claire Dubois', 2020, false);

  // Création de la première bibliothèque
  var library1 = Library();
  library1.addBook(book1);
  library1.addBook(book2);
  library1.addBook(book3);

  // Emprunt d’un livre
  library1.borrowBook('Dart pour les débutants');

  // Affichage des livres disponibles
  print(' Livres disponibles après emprunt :');
  displayBooks(library1.getAvailableBooks());

  // Création d’une deuxième bibliothèque
  var library2 = Library();
  library2.addBook(Book.available('Python pour les nuls', 'David Lemaitre', 2023));

  // Fusion des deux bibliothèques
  var mergedLibrary = library1 + library2;

  print('\n Livres disponibles dans la bibliothèque fusionnée :');
  displayBooks(mergedLibrary.getAvailableBooks());
}

// ==================================================
// COMMENTAIRES ET COMPARAISONS

// En Java :
// - Les classes et objets ressemblent à Dart.
// - Les listes sont typées via List<Book> aussi.
// - Pas de surcharge d’opérateurs comme "+".

//  En JavaScript :
// - Pas de typage statique (sauf avec TypeScript)
// - Les objets peuvent être manipulés librement sans encapsulation stricte
// - Pas de constructeurs nommés (mais les classes ES6 se rapprochent)

//  Familiarité :
// - La logique de classe, les boucles for-in, les méthodes sont familières

// Nouveautés avec Dart :
// - Constructeurs nommés comme Book.available()
// - Surcharge d’opérateurs possible (!)
// - Encapsulation avec underscore (_) pour listes privées

// Résultat Visuel (extrait console)
![Résultat de l'exécution](resultat.PNG)
