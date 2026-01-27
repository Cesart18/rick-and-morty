// ignore_for_file: one_member_abstracts

/// Interface that defines a use case with parameters.
///
/// This interface is used to define a use case that requires parameters to be
/// executed.
///
/// [T] is the return type of the use case. Which should be a Result type.
/// [P] is the type of the parameters required to execute the use case.
/// The params can be any type, but it is recommended to use a class to hold
/// the parameters in case it has more than one parameter.
///
/// The [execute] method should be implemented to execute the use case.
///
abstract class UseCaseWithParams<T, P> {
  Future<T> execute(P parameters);
}

/// Interface that defines a use case without parameters.
///
/// This interface is used to define a use case that does not require any
/// parameters to be executed.
///
/// [T] is the return type of the use case. Which should be a Result type.
///
/// The [execute] method should be implemented to execute the use case.
abstract class UseCaseWithoutParams<T> {
  Future<T> execute();
}
