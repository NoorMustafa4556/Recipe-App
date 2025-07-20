
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'Components/useAbleComp.dart';
import 'HomeScreen.dart';
import 'SignupScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Container(
              height: 350,
              width: double.infinity,
              color:const  Color(0xffEF2A39),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0,top: 80),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Login",style: GoogleFonts.lilitaOne(
                      textStyle:const TextStyle(
                        fontSize: 70,
                        color: Colors.white,
                      ),
                    )),
                      Text("Enter your Information",style: GoogleFonts.aBeeZee(
                        textStyle:const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),),
                  ],
                ),
              ),

            ),
            Padding(
              padding: const EdgeInsets.only(top: 250.0),
              child: Container(

                    decoration:const BoxDecoration(
                        color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100),
                      ),

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
                            "assets/images/login.png"
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
                        padding: const EdgeInsets.symmetric(horizontal: 48.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const  Text("Don't have an account? "),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpScreen()));
                              },
                              child:const  Text("Sign up",style: TextStyle(
                                fontSize: 14,
                                color:Color(0xffEF2A39),
                                fontWeight: FontWeight.bold


                              ),),
                            ),
                          ],
                        ),
                      ),
                     const  SizedBox(height: 40,),

                      UseAbleComp.customButton("Login", () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
                      }),
                    ],


                      )

              ),
            )
          ],
        ),
      )
    );
  }
}
