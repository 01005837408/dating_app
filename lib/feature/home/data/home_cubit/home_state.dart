abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final Map<String, List<String>> userImages;

  HomeLoaded(this.userImages);
}

class HomeError extends HomeState {
  final String error;

  HomeError(this.error);
}
