import 'package:flutter/widgets.dart';

class BookstoreAuth extends ChangeNotifier {
  bool _signIn = false;

  bool get signedIn => _signIn;

  Future<void> signOut() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));

    // Sign out
    _signIn = false;
    notifyListeners();
  }

  Future<bool> signIn(String username, String password) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));

    // Sign in. Allow any password
    _signIn = true;
    notifyListeners();
    return _signIn;
  }

  @override
  bool operator ==(Object other) =>
      other is BookstoreAuth && other._signIn == _signIn;

  @override
  int get hashCode => _signIn.hashCode;
}

class BookstoreAuthScope extends InheritedNotifier<BookstoreAuth> {
  const BookstoreAuthScope({
    required super.notifier,
    required super.child,
    super.key,
  });

  static BookstoreAuth of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<BookstoreAuthScope>()!
      .notifier!;
}
