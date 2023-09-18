import 'package:bloc/bloc.dart';
import 'package:domain/entities/user/user_entities.dart';
import 'package:domain/usecases/user/get_user_data_usecase.dart';
import 'package:domain/usecases/user/get_user_uid_usecase.dart';
import 'package:domain/usecases/user/update_user_data_usecase.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserUidUseCase getUserUidUseCase;
  final GetUserDataUseCase getUserDataUseCase;
  final UpdateUserDataUseCase updateUserDataUseCase;
  UserBloc({
    required this.getUserUidUseCase,
    required this.getUserDataUseCase,
    required this.updateUserDataUseCase,
  }) : super(const UserState(isLoading: true, userData: null)) {
    on<GetUserUid>((event, emit) async {
      await getUserUid(emit);
    });
    on<UpdateName>((event, emit) async {
      await updateName();
    });
    on<ShowName>((event, emit) async {
      await showName();
    });
  }
  Future<void> getUserUid(Emitter emit) async {
    var userUid = await getUserUidUseCase.call();
    var userfjhfjh = await getUserDataUseCase.call();
    print(userfjhfjh.name);
    print(userfjhfjh.email);
    print(userfjhfjh.bankAccount);
    print(userfjhfjh.insta);
    print(userfjhfjh.number);
    print(userfjhfjh.password);
    emit(
      UserState(
        isLoading: false,
        userData: userUid,
      ),
    );
  }

  Future<void> updateName() async {
    const name = 'arina';
    var userUid = await getUserUidUseCase.call();
    var u = UserEntity(uid: userUid.uid, name: name);
    await updateUserDataUseCase.call(u);
  }

  Future<void> showName() async {
    var userfjhfjh = await getUserDataUseCase.call();
    print(userfjhfjh.name);
  }
}
