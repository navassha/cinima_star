import 'package:cinima_star/services/login_page_provider.dart';
import 'package:cinima_star/utils/cinima_star_responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/textediting_provider.dart';
import '../widgets/sign_up_container.dart';
import '../widgets/textfield.dart';
import 'cinima_star_home.dart';
import 'cinmastar_signup.dart';

class CinimaStarLogin extends ConsumerWidget {
  const CinimaStarLogin({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constomContrller = ref.watch(customTextFieldsProvider);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(
            ResMobSize.width(15, context),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      children: const [
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
                Text(
                  "Your Email Address",
                  style: TextStyle(
                    fontFamily: "Poppins regular",
                    fontSize: ResMobSize.width(15, context),
                  ),
                ),
                SizedBox(
                  height: ResMobSize.width(5, context),
                ),
                TextfieldModel(
                  hintText: "Enter A Valid Email Address",
                  controller: constomContrller.email,
                  typeicon: Icon(
                    CupertinoIcons.mail,
                    size: ResMobSize.width(18, context),
                  ),
                  typetext: 'Enter Email',
                  onChanged: (value) {
                    ref.read(isEmailEmptyProvider.notifier).state = value == '';
                  },
                ),
                SizedBox(
                  height: ResMobSize.width(20, context),
                ),
                Text(
                  "Enter Your Password",
                  style: TextStyle(
                    fontFamily: "Poppins regular",
                    fontSize: ResMobSize.width(15, context),
                  ),
                ),
                SizedBox(
                  height: ResMobSize.width(5, context),
                ),
                TextfieldModel(
                  controller: constomContrller.password,
                  hintText: "Enter 8 Digit Password",
                  typeicon: Icon(
                    CupertinoIcons.eye_slash,
                    size: ResMobSize.width(18, context),
                  ),
                  typetext: 'Enter Password',
                  onChanged: (value) {
                    ref.read(isPasswordEmptyProvider.notifier).state =
                        value == '';
                  },
                ),
                SizedBox(
                  height: ResMobSize.width(15, context),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CinimaStarSignUp(),
                          ),
                        );
                      },
                      child: Text(
                        "SignUp",
                        style: TextStyle(
                          fontSize: ResMobSize.width(14, context),
                          color: Colors.blue,
                          fontFamily: 'Poppins regular',
                        ),
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forget Password?",
                        style: TextStyle(
                          fontSize: ResMobSize.width(14, context),
                          color: Colors.blue,
                          fontFamily: 'Poppins regular',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ResMobSize.width(15, context),
                ),
                Center(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                      ResMobSize.width(25, context),
                    ),
                    onTap: () {
                      if (constomContrller.email.text != '' &&
                          constomContrller.password.text != '') {
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
                                  "Enter You're Email\nAddress and Password",
                                  style: TextStyle(
                                    fontFamily: "Poppins regular",
                                    fontSize: ResMobSize.width(17, context),
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
                        color: ref.watch(isEmailEmptyProvider) == false &&
                                ref.watch(isPasswordEmptyProvider) == false
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
