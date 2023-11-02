import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:domain/entities/user/user_entities.dart';
import 'package:domain/usecases/authentification/sign_out_usecase.dart';
import 'package:domain/usecases/user/delete_user_uid_usecase.dart';
import 'package:domain/usecases/user/get_user_data_usecase.dart';
import 'package:domain/usecases/user/get_user_uid_usecase.dart';
import 'package:domain/usecases/user/update_user_data_usecase.dart';
import 'package:domain/usecases/user/update_user_img_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserUidUseCase getUserUidUseCase;
  final DeleteUserUidUseCase deleteUserUidUseCase;
  final SignOutUseCase signOutUseCase;
  final GetUserDataUseCase getUserDataUseCase;
  final UpdateUserDataUseCase updateUserDataUseCase;
  final UpdateUserImgUseCase updateUserImgUseCase;
  UserBloc({
    required this.getUserUidUseCase,
    required this.deleteUserUidUseCase,
    required this.signOutUseCase,
    required this.getUserDataUseCase,
    required this.updateUserDataUseCase,
    required this.updateUserImgUseCase,
  }) : super(const UserState(isLoading: true, userData: null)) {
    on<GetUserData>((event, emit) async {
      await getUserData(emit);
    });
    on<LogOut>((event, emit) async {
      await logOut(emit);
    });
    on<UpdateUserData>((event, emit) async {
      await updateUserData(
          name: event.name,
          emit: emit,
          email: event.email,
          number: event.number,
          insta: event.insta,
          bankAccount: event.bankAccount);
    });
    on<UpdateUserImg>((event, emit) async {
      await updateUserImg(
        img: event.img,
        emit: emit,
      );
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

  Future<void> logOut(Emitter emit) async {
    await signOutUseCase.call();
    await deleteUserUidUseCase.call();
  }

  Future<void> updateUserData(
      {required String name,
      required String email,
      required String number,
      required String insta,
      required String bankAccount,
      required Emitter emit}) async {
    var userUid = await getUserUidUseCase.call();

    var entity = UserEntity(
        uid: userUid.uid,
        name: name,
        email: email,
        bankAccount: bankAccount,
        insta: insta,
        number: number);

    await updateUserDataUseCase.call(entity);
    emit(
      const UserState(
        isLoading: true,
        userData: null,
      ),
    );
    await getUserData(emit);
  }

  Future<void> updateUserImg(
      {required XFile img, required Emitter emit}) async {
    emit(
      const UserState(
        isLoading: true,
        userData: null,
      ),
    );
    await updateUserImgUseCase.call(File(img.path));
    await getUserData(emit);
  }
}
