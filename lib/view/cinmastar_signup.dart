import 'package:cinima_star/services/signup_provider.dart';
import 'package:cinima_star/services/textediting_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/cinima_star_responsive.dart';
import '../widgets/sign_up_container.dart';
import '../widgets/textfield.dart';
import 'cinima_star_home.dart';

class CinimaStarSignUp extends ConsumerWidget {
  const CinimaStarSignUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signupcontroller = ref.watch(signupprovider);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(
            ResMobSize.width(10, context),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: ResMobSize.width(80, context),
                  width: MediaQuery.of(context).size.width,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "#",
                      style: TextStyle(
                        fontSize: ResMobSize.width(26, context),
                        fontFamily: "Poppins italic",
                        color: const Color(0xff13f6e2),
                      ),
                      children: const <TextSpan>[
                        TextSpan(
                          text: "bepartoffilm",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Wacth Movies Without Limits!",
                    style: TextStyle(
                      fontFamily: "Poppins regular",
                      fontSize: ResMobSize.width(17, context),
                    ),
                  ),
                ),
                SizedBox(
                  height: ResMobSize.width(100, context),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ResMobSize.width(10, context),
                  ),
                  child: Column(
                    children: [
                      TextfieldModel(
                        controller: signupcontroller.firstname,
                        typeicon: const Icon(CupertinoIcons.textformat),
                        hintText: 'First Name',
                        typetext: 'Enter Your First Name',
                        onChanged: (value) {
                          ref.read(signupfirstname.notifier).state =
                              value == '';
                        },
                      ),
                      SizedBox(
                        height: ResMobSize.width(20, context),
                      ),
                      TextfieldModel(
                        controller: signupcontroller.lastname,
                        typeicon: const Icon(CupertinoIcons.textformat),
                        hintText: 'Last Name',
                        typetext: 'Enter Your Last Name',
                        onChanged: (value) {
                          ref.read(signuplastname.notifier).state = value == '';
                        },
                      ),
                      SizedBox(
                        height: ResMobSize.width(20, context),
                      ),
                      TextfieldModel(
                        controller: signupcontroller.emails,
                        typeicon: const Icon(CupertinoIcons.mail),
                        hintText: 'Your Email',
                        typetext: 'Enter Your Email',
                        onChanged: (value) {
                          ref.read(signupemail.notifier).state = value == '';
                        },
                      ),
                      SizedBox(
                        height: ResMobSize.width(20, context),
                      ),
                      TextfieldModel(
                        controller: signupcontroller.passwords,
                        typeicon: const Icon(CupertinoIcons.eye_slash),
                        hintText: 'Last Password',
                        typetext: 'Enter Your Password',
                        onChanged: (value) {
                          ref.read(signuppassword.notifier).state = value == '';
                        },
                      ),
                      SizedBox(
                        height: ResMobSize.width(30, context),
                      ),
                      Center(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(
                            ResMobSize.width(25, context),
                          ),
                          onTap: () {
                            if (signupcontroller.emails.text != '' &&
                                signupcontroller.passwords.text != '' &&
                                signupcontroller.firstname.text != '' &&
                                signupcontroller.lastname.text != '') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CinimaStarHome(),
                                ),
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  backgroundColor: Colors.transparent,
                                  content: Container(
                                    width: ResMobSize.width(100, context),
                                    height: ResMobSize.width(100, context),
                                    decoration: BoxDecoration(
                                      // ignore: use_full_hex_values_for_flutter_colors
                                      color: const Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(
                                        ResMobSize.width(10, context),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        "Please Enter Your Details",
                                        style: TextStyle(
                                          fontFamily: "Poppins regular",
                                          fontSize:
                                              ResMobSize.width(17, context),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                          child: Container(
                            width: ResMobSize.width(200, context),
                            height: ResMobSize.width(50, context),
                            decoration: BoxDecoration(
                              color: ref.watch(signupfirstname) == false &&
                                      ref.watch(signuplastname) == false &&
                                      ref.watch(signupemail) == false &&
                                      ref.watch(signuppassword) == false
                                  ? const Color(0xffa3fb81)
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(
                                ResMobSize.width(25, context),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                  fontSize: ResMobSize.width(15, context),
                                  fontFamily: "Poppins regular",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ResMobSize.width(20, context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: ResMobSize.width(120, context),
                      height: ResMobSize.width(0.3, context),
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: ResMobSize.width(10, context),
                    ),
                    Text(
                      "or",
                      style: TextStyle(
                        fontFamily: "Poppins regular",
                        fontSize: ResMobSize.width(15, context),
                      ),
                    ),
                    SizedBox(
                      width: ResMobSize.width(10, context),
                    ),
                    Container(
                      width: ResMobSize.width(120, context),
                      height: ResMobSize.width(0.3, context),
                      color: Colors.black,
                    ),
                  ],
                ),
                SizedBox(
                  height: ResMobSize.width(20, context),
                ),
                SignUpContainer(
                  link:
                      "https://i.pinimg.com/564x/e0/41/57/e04157fd346ae0faaef2c18493fdf0b0.jpg",
                  text: "Sign up with Google",
                ),
                SizedBox(
                  height: ResMobSize.width(20, context),
                ),
                SignUpContainer(
                  link:
                      'https://i.pinimg.com/564x/48/37/d0/4837d0a0512fe65bbd7deb4115044b0f.jpg',
                  text: "Sign up with Apple",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
