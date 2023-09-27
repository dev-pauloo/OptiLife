import '../errors/app_errors.dart';

enum StateEnum { initial, loading, success, error }

class PageState<T> {
  StateEnum currentState = StateEnum.initial;
  T data;
  AppError? error;

  PageState({required this.currentState,required this.data, this.error});

  factory PageState.init({required T data}) => PageState(currentState: StateEnum.initial,data:data, );

  factory PageState.loading({required T data}) => PageState(currentState: StateEnum.loading,data:data, );

  factory PageState.success({required T data}) =>
      PageState(currentState: StateEnum.success, data: data);

  factory PageState.error({required T data, required AppError error}) =>
      PageState(currentState: StateEnum.error, data:data,  error: error);

  bool get isLoading => currentState == StateEnum.loading;

  bool get isSuccess => currentState == StateEnum.success;

  bool get isInit => currentState == StateEnum.initial;

  bool get isError => currentState == StateEnum.error;
}