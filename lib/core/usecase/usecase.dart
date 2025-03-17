abstract class UseCase<Type, Params> {
  Future<Type> call({required Params params});
}

abstract class UseCaseNoParams<Type> {
  Future<Type> call();
}
