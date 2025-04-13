import 'package:fitness_app/constants/color.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,size: size.width*0.065),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.only(
            top: size.height * 0.06,
            left: size.width * 0.03,
            right: size.width * 0.05,
            bottom: size.height * 0.03,
          ),
          child: Column(
            children: [
              Text(
                'Forgot Password?'.toUpperCase(),
                style: TextStyle(
                  fontSize: size.width * 0.07,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                'Enter your email address below or \n login with another account',
                style: TextStyle(
                  fontSize: size.width * 0.04,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: size.height * 0.05),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: size.width * 0.04,
                      ),
                      // fillColor: Colors.grey.shade800,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade800),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      )),
                ),
              ),
              Spacer(),
              Container(
                width: size.width * 0.9,
                alignment: Alignment.center,
                child: TextButton(
                  child: TextButton(
                    child: Text(
                      "Try another way",
                      style: TextStyle(
                        color: PrimaryColor,
                        fontSize: size.width * 0.04,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                // width: size.width * 0.9,
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PrimaryColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.3,
                      vertical: size.height * 0.02,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text(
                    'Send',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: size.width * 0.04,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
