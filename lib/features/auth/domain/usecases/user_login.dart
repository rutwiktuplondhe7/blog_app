import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/core/common/entities/user.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/auth_repository.dart';

class UserLogin implements Usecase<User, UserLoginParms> {
  final AuthRepository authRepository;
  const UserLogin(this.authRepository);
  @override
  Future<Either<Failure, User>> call(UserLoginParms parms) async {
    return await authRepository.loginWithEmailAndPassword(
      email: parms.email,
      password: parms.password,
    );
  }
}

class UserLoginParms {
  final String email;
  final String password;

  UserLoginParms({required this.email, required this.password});
}
