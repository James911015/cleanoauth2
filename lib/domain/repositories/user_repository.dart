import 'package:cleanoauth2/core/errors/failure.dart';
import 'package:cleanoauth2/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {

  Future<Either<Failure, User>> getUser();

  Future<Either<Failure, List<User>>> getListUsers();

  Future<Either<Failure, User>> getUserBy();

  Future<Either<Failure, User>> createUser();

  Future<Either<Failure, User>> updateUser();

  Future<Either<Failure, void>> deleteUser();
}
