// edit_profile_state.dart
class EditProfileState {
  final bool loading;
  final String? errorMessage;
  final bool success;

  EditProfileState({this.loading = false, this.errorMessage, this.success = false});

  EditProfileState copyWith({bool? loading, String? errorMessage, bool? success}) {
    return EditProfileState(
      loading: loading ?? this.loading,
      errorMessage: errorMessage ?? this.errorMessage,
      success: success ?? this.success,
    );
  }
}
