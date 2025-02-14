import 'package:cleanoauth2/core/errors/failure.dart';
import 'package:cleanoauth2/domain/entities/user.dart';
import 'package:cleanoauth2/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

import '../datasources/user_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDatasource datasource;

  UserRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, User>> getUser() async {
    try {
      final user = await datasource.getUser();
      return Right(user);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> createUser() {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteUser() {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<User>>> getListUsers() {
    // TODO: implement getListUsers
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> getUserBy() {
    // TODO: implement getUserBy
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> updateUser() {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
