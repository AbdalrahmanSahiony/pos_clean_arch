part of 'add_delete_update_bloc.dart';

@freezed
class AddDeleteUpdateState with _$AddDeleteUpdateState {
  const factory AddDeleteUpdateState.initial() = _Initial;
  const factory AddDeleteUpdateState.loadInProgress() = _LoadInProgress;
  const factory AddDeleteUpdateState.done() = _Done;
  const factory AddDeleteUpdateState.error(String errorMessage) = _Error;
}
