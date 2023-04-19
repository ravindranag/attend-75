class SignUpWithEmailAndPasswordException {
  final String message;

  const SignUpWithEmailAndPasswordException({ this.message = 'An unknown error occurred.' });

  factory SignUpWithEmailAndPasswordException.code(String code) {
    switch(code) {
      case 'weak-password':
        return const SignUpWithEmailAndPasswordException(message: 'Please enter a stronger password');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordException(message: 'Email is not valid or badly formatted.');
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordException(message: 'An account already exists for that email.');
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordException(message: 'Operation is not allowed.');
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordException(message: 'This user has been disabled. Please contact support for help.');
      case 'user-not-found':
        return const SignUpWithEmailAndPasswordException(message: 'User not found. Please sign up.');
      case 'wrong-password':
        return const SignUpWithEmailAndPasswordException(message: 'Wrong password.');
      default:
        return const SignUpWithEmailAndPasswordException();
    }
  }
}