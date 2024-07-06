import 'package:equatable/equatable.dart';

abstract class ProfilePhotosState extends Equatable {
  const ProfilePhotosState();

  @override
  List<Object?> get props => [];
}

class ProfilePhotosInitial extends ProfilePhotosState {}

class ProfilePhotosLoading extends ProfilePhotosState {}

class ProfilePhotosLoaded extends ProfilePhotosState {
  final List<String> imageUrls;

  const ProfilePhotosLoaded({required this.imageUrls});

  @override
  List<Object?> get props => [imageUrls];
}

class ProfilePhotosError extends ProfilePhotosState {
  final String message;

  const ProfilePhotosError({required this.message});

  @override
  List<Object?> get props => [message];
}
