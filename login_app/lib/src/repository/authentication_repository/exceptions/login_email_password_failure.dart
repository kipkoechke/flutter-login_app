class LoginWithEmailAndPasswordFailure {
  final String message;

  LoginWithEmailAndPasswordFailure(
      [this.message = "An unknown error occurred."]);

  factory LoginWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'invalid-email':
        return LoginWithEmailAndPasswordFailure(
            'Email is invalid or badly formatted.');
      case 'user-disabled':
        return LoginWithEmailAndPasswordFailure(
            'This user has been disabled. Please contact support for help.');
      case 'user-not-found':
        return LoginWithEmailAndPasswordFailure(
            'There is no user corresponding to the given email.');
      case 'wrong-password':
        return LoginWithEmailAndPasswordFailure(
            'The password is invalid for the given email.');
      default:
        return LoginWithEmailAndPasswordFailure();
    }
  }
}
