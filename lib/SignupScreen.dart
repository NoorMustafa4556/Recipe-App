
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Components/useAbleComp.dart';
import 'HomeScreen.dart';
import 'LoginScreen.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 250.0),
              child: Container(

                  decoration:const BoxDecoration(
                    color: Colors.white,

                  ),
                  child:Column(

                    children: [
                      const SizedBox(height: 30,),
                      Container(
                        height: 200,
                        width: 200,
                        child: const Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "assets/images/signup.png"
                          ),

                        ),
                      ),
                      const   SizedBox(height: 20,),
                      UseAbleComp.customTextFormField(
                          controller: emailController,
                          text: "Email",
                          iconData: Icons.email,
                          toHide: false),
                      UseAbleComp.customTextFormField(
                          controller: passwordController,
                          text: "Password",
                          iconData: Icons.lock,
                          toHide: true),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const  Text("Already have an account? "),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                              },
                              child:const  Text("Login",style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xffEF2A39),
                                  fontWeight: FontWeight.bold


                              ),),
                            ),
                          ],
                        ),
                      ),
                      const  SizedBox(height: 40,),

                      UseAbleComp.customButton("Sign Up", () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));

                      }),
                    ],


                  )

              ),
            ),
            Container(
              decoration:const  BoxDecoration(
                color:  Color(0xffEF2A39),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),

              ),
              height: 255,
              width: double.infinity,

              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sign Up",style: GoogleFonts.lilitaOne(
                      textStyle:const TextStyle(
                        fontSize: 70,
                        color: Colors.white,
                      ),
                    )),
                    Text(" Feel Free To Sign Up",style: GoogleFonts.aBeeZee(
                      textStyle:const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),),
                  ],
                ),
              ),

            ),
          ],
        ),
      )
    );
  }
}
