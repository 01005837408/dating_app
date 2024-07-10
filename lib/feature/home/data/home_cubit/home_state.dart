abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<String> images;

  HomeLoaded(this.images);
}

class HomeError extends HomeState {
  final String error;

  HomeError(this.error);
}
