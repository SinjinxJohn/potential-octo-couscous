import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/HomePage.dart';
import 'package:frontend/components/searchbar.dart';
import 'package:frontend/components/size_config.dart';
import 'package:frontend/components/constants.dart';
import 'package:lottie/lottie.dart';
import 'package:frontend/components/InputBox.dart';

class LoginPage extends StatefulWidget {
  
  const LoginPage({super.key,});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 233, 232, 232),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Center(
                child: Container(
                  height: 300,
                  child: Lottie.network("https://assets5.lottiefiles.com/packages/lf20_pm5qdb4j.json"),
                ),
              ),
              SizedBox(
                height: 120,
              ),
              InputBox(
                  value: "Enter the email",
                  controller: _emailController,
                  obscure: false),
              SizedBox(
                height: 5,
              ),
              InputBox(
                  value: "Enter the password",
                  controller: _passwordController,
                  obscure: true),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                    // login(_emailController.text.toString(),
                    //     _passwordController.text.toString());
                  },
                  child: Center(
              child: Container(
                height:60 ,
                width: 300,
                decoration: BoxDecoration(color: kPrimaryColor,borderRadius: BorderRadius.circular(18)),
                child: Padding(
                  padding: const EdgeInsets.only(left:30.0, right: 30),
                  child: Center(child:
                   Text("ADD TO CART",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                  
                   ),))
                   )),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  print("Forgot password, navigate to retrieve screen ");
                },
                child: Container(
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}