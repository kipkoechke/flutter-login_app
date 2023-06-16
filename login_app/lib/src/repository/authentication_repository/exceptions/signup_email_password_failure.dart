class SignUpWithEmailAndPasswordFailure {
  final String message;

  SignUpWithEmailAndPasswordFailure(
      [this.message = "An Unkown error occurred."]);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return SignUpWithEmailAndPasswordFailure(
            'Please enter a stornger password');
      case 'invalid-email':
        return SignUpWithEmailAndPasswordFailure(
            'Email is invalid or badly formatted.');
      case 'email-already-in-use':
        return SignUpWithEmailAndPasswordFailure(
            'An account already exists for that email.');
      case 'operation-not-allowed':
        return SignUpWithEmailAndPasswordFailure(
            'Operation is not allowed. Please contact support.');
      case 'user-disable':
        return SignUpWithEmailAndPasswordFailure(
            'This user has been disabled. Please contact support for help.');
      default:
        return SignUpWithEmailAndPasswordFailure();
    }
  }
}
