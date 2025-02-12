import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/core/common/entities/user.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements Usecase<User, UserSignUpParms> {
  final AuthRepository authRepository;
  const UserSignUp(this.authRepository);
  @override
  Future<Either<Failure, User>> call(UserSignUpParms parms) async {
    return await authRepository.signUpWithEmailAndPassword(
      name: parms.name,
      email: parms.email,
      password: parms.password,
    );
  }
}

class UserSignUpParms {
  final String name;
  final String email;
  final String password;

  UserSignUpParms({
    required this.name,
    required this.email,
    required this.password,
  });
}
