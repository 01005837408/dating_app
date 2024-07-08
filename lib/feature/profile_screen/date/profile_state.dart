import 'dart:io';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final String imageUrl;
  ProfileLoaded(this.imageUrl);
}

class ProfileImageSelected extends ProfileState {
  final File image;
  ProfileImageSelected(this.image);
}

class ProfilePictureUpdated extends ProfileState {
  final String imageUrl;
  ProfilePictureUpdated(this.imageUrl);
}

class ProfileError extends ProfileState {
  final String error;
  ProfileError(this.error);
}
