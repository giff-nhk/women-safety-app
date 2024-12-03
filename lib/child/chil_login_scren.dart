import 'package:flutter/material.dart';
import 'package:liki_pro/componets/custom_text.dart';
import 'package:liki_pro/componets/primarybutton.dart';
import 'package:liki_pro/componets/secondarybuttons.dart';
import 'package:liki_pro/home_screen.dart';
import 'package:liki_pro/parent/parent_register_screen.dart';
import 'package:liki_pro/child/registerchilduser.dart';
import 'package:liki_pro/ulits/constant.dart';

class LoginScren extends StatefulWidget {
  @override
  State<LoginScren> createState() => _LoginScrenState();
}

class _LoginScrenState extends State<LoginScren> {
  bool isPasswordShown = false;
  final _formKey=GlobalKey<FormState>();
  final _formData=Map<String,Object>(); 

   void _onSubmit() {
    // Navigate directly to the Home screen without validation
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()), // Ensure HomeScreen is correctly defined
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "USER LOGIN",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 102, 102),
                  ),
                ),
                Image.asset(
                  'assets/logo.png',
                  height: 100,
                  width: 120,
                ),
                CustomTextField(
                  hintText: 'Enter Email',
                  textInputAction: TextInputAction.next ,
                  keyboardtype: TextInputType.emailAddress ,
                  prefix: Icon(Icons.person),
                  onsave:(email){
                    _formData['email']=email??"";

                  } ,
                  validate: (email){
                    if (email!.isEmpty || email.length<3 || !email.contains("@"))
                    {
                      return 'enter correct email';
                    };
                    return null;
                  },
                ),
                CustomTextField(
                  hintText: 'Enter password',
                  prefix: Icon(Icons.vpn_key_rounded),
                   onsave:(password){
                    _formData['password']= password??"";

                  } ,
                  validate: (password){
                    if (password!.isEmpty || password.length<7 )
                    {
                      return 'enter correct password';
                    };
                    return null;
                  },
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordShown = !isPasswordShown;
                      });
                    },
                    icon: isPasswordShown
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  ),
                  isPassword: !isPasswordShown, // Ensure correct logic here
                ),
                Primarybutton(
                  title: 'Login',
                  onPressed: () {
                    progressIndicator(context);
                    if(_formKey.currentState!.validate())
                    _onSubmit();
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "FORGOT PASSWORD?",
                      style: TextStyle(fontSize: 19),
                    ),
                    Secondarybuttons(
                      title: 'Click here',
                      onPressed: () {},
                    ),
                  ],
                ),
                Secondarybuttons(
                  title: 'Register as child',
                  onPressed: () {
                    goTo(context,RegisterChildScreen());
                  }
                  
                ),
                Secondarybuttons(
                  title: 'Register as Parent',
                  onPressed: () {
                    goTo(context,RegisterParentScreen());
                  }
                  
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}