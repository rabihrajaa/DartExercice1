import '../lib/book.dart';
import '../lib/library.dart';
import '../lib/utils.dart';

void main() {
  var book1 = Book.available('Dart pour les débutants', 'RABIH Rajaa', 2021);
  var book2 = Book.available('Flutter en pratique', 'ELBAL Asma', 2022);
  var book3 = Book('JavaScript moderne', 'Antigone', 2020, false);

  var library1 = Library();
  library1.addBook(book1);
  library1.addBook(book2);
  library1.addBook(book3);

  library1.borrowBook('Dart pour les débutants');

  print('Livres disponibles après emprunt :');
  displayBooks(library1.getAvailableBooks());

  var library2 = Library();
  library2.addBook(Book.available('Python python', 'KHATIM Rekia', 2023));

  var mergedLibrary = library1 + library2;

  print('\nLivres disponibles dans la bibliothèque fusionnée :');
  displayBooks(mergedLibrary.getAvailableBooks());
  
}
