import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/Cubit/MyStat.dart';

class MyCubit extends Cubit<MyStat> {
  MyCubit() : super(init());

  static MyCubit get(context) => BlocProvider.of(context);

  // void Regesteter(
  //     {required UserName,
  //     required EmailAdd,
  //     required Password,
  //     required phone}) async {
  //   emit(RejesterLodingState());
  //   await FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(email: EmailAdd, password: Password)
  //       .then((value) async {
  //     print(value.user!.email);
  //     print(value.user!.uid);
  //     emit(RejesterSuccessState());
  //   }).catchError((onError) {
  //     emit(RejesterFailarState());
  //     print(onError.toString());
  //   });
  // }

  void Regesteter(
      {required UserName,
      required EmailAdd,
      required Password,
      required phone}) async {
    try {
      emit(RejesterLodingState());
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: EmailAdd, password: Password)
          .then((value) async {
        print(value.user!.email);
        print(value.user!.uid);
        emit(RejesterSuccessState());
      });
    } catch (e) {
      emit(RejesterFailarState());
      print(e.toString());
    }
    ;
  }
}
