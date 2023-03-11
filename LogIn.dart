import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/Pages/RejesterNow.dart';

import '../Cubit/MyCubit.dart';
import '../Cubit/MyStat.dart';

class LogIn extends StatelessWidget {
  // const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyCubit(),
      child: BlocConsumer<MyCubit, MyStat>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 222,
                ),
                Text(
                  'LogIn',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
                ),
                SizedBox(
                  height: 22,
                ),
                Text(
                  'LogIn  now to browse our hot offers',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 42,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: EC,
                  validator: (V) {
                    if (V!.isEmpty) {
                      return "most be Full The email";
                    }
                  },
                  decoration: InputDecoration(
                      label: Text(
                        'email address',
                        style: TextStyle(fontSize: 22),
                      ),
                      suffixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 11, color: Colors.blue))),
                ),
                SizedBox(
                  height: 22,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: PC,
                  validator: (V) {
                    if (V!.isEmpty) {
                      return "most be Full The Password";
                    }
                  },
                  decoration: InputDecoration(
                      label: Text(
                        'password',
                        style: TextStyle(fontSize: 22),
                      ),
                      suffixIcon: Icon(Icons.remove_red_eye),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 11, color: Colors.blue))),
                ),
                SizedBox(
                  height: 22,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  width: double.infinity,
                  height: 77,
                  child: MaterialButton(
                      onPressed: () {},
                      child: Text(
                        'LogIn',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      )),
                ),
                SizedBox(
                  height: 22,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'nt have an accunt?',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RejesterNow(),
                              ));
                        },
                        child: Text(
                          'Rejester Now',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

var EC = TextEditingController();
var PC = TextEditingController();
