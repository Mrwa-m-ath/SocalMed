import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/Cubit/MyCubit.dart';
import 'package:socialapp/Cubit/MyStat.dart';

class RejesterNow extends StatelessWidget {
  const RejesterNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyCubit(),
      child: BlocConsumer<MyCubit, MyStat>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
          ),
          body: Form(
            key: KeyForm,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 150,
                      ),
                      Text(
                        'REJESTER',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 33),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      Text(
                        'Rejester  now to browse our hot offers',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: UsR,
                        validator: (V) {
                          if (V!.isEmpty) {
                            return "most be Full The User Name";
                          }
                        },
                        decoration: InputDecoration(
                            label: Text(
                              ' user Name',
                              style: TextStyle(fontSize: 22),
                            ),
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 11, color: Colors.blue))),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: EmR,
                        validator: (V) {
                          if (V!.isEmpty) {
                            return "most be Full The email";
                          }
                        },
                        decoration: InputDecoration(
                            label: Text(
                              'email addres',
                              style: TextStyle(fontSize: 22),
                            ),
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 11, color: Colors.blue))),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: PassR,
                        validator: (V) {
                          if (V!.isEmpty) {
                            return "most be Full The password";
                          }
                        },
                        decoration: InputDecoration(
                            label: Text(
                              'password',
                              style: TextStyle(fontSize: 22),
                            ),
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: Icon(Icons.remove_red_eye),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 11, color: Colors.blue))),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: PhoR,
                        validator: (V) {
                          if (V!.isEmpty) {
                            return "most be Full The phone";
                          }
                        },
                        decoration: InputDecoration(
                            label: Text(
                              'phone',
                              style: TextStyle(fontSize: 22),
                            ),
                            prefixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 11, color: Colors.blue))),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      ConditionalBuilder(
                        condition: state is! RejesterLodingState,
                        builder: (context) => Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          width: double.infinity,
                          height: 77,
                          child: MaterialButton(
                              onPressed: () {
                                if (KeyForm.currentState!.validate()) {
                                  MyCubit.get(context).Regesteter(
                                      UserName: UsR.text,
                                      EmailAdd: EmR.text,
                                      Password: PassR.text,
                                      phone: PhoR.text);
                                }
                              },
                              child: Text(
                                'Rejester ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              )),
                        ),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                    ]),
              ),
            ),
          ),
        ),
        listener: (context, state) {},
      ),
    );
  }
}

var KeyForm = GlobalKey<FormState>();

var UsR = TextEditingController();
var EmR = TextEditingController();
var PassR = TextEditingController();
var PhoR = TextEditingController();
