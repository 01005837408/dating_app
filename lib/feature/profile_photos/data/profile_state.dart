abstract class ProfilePhotosState {}

class ProfilePhotosInitial extends ProfilePhotosState {}

class ProfilePhotosLoading extends ProfilePhotosState {}

class ProfilePhotosLoaded extends ProfilePhotosState {
  final List<String> images;

  ProfilePhotosLoaded(this.images);
}

class ProfilePhotosUploading extends ProfilePhotosState {}

class ProfilePhotosUploaded extends ProfilePhotosState {
  final String imageUrl;

  ProfilePhotosUploaded(this.imageUrl);
}

class ProfilePhotosError extends ProfilePhotosState {
  final String error;

  ProfilePhotosError(this.error);
}

class ProfilePhotosDeleting extends ProfilePhotosState {}
