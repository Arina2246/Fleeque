import 'package:bloc/bloc.dart';
import 'package:domain/entities/user/user_entities.dart';
import 'package:domain/usecases/user/get_user_data_usecase.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserDataUseCase getUserDataUseCase;
  UserBloc({
    required this.getUserDataUseCase,
  }) : super(const UserState(isLoading: true, userData: null)) {
    on<GetUserData>((event, emit) async {
      await getUserData(emit);
    });
  }
  Future<void> getUserData(Emitter emit) async {
    var userData = await getUserDataUseCase.call();
    emit(
      UserState(
        isLoading: false,
        userData: userData,
      ),
    );
  }
}
