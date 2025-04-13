import 'package:fitness_app/constants/color.dart';
import 'package:fitness_app/provider/auth_provider.dart';
import 'package:fitness_app/screens/OnBoardingScreen/onBoardingScreen.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  late PageController _pageController = PageController();
  bool isLoginSelected = true;
  bool _isNotValidate = false;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  void loginUser() async {
    if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      var token = await AuthProvider.loginUser(_emailController.text, _passwordController.text);
      if (token != null) {
        print('Login successful');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OnBoardingScreen(),
          ),
        );
      } else {
        print('Login failed');
      }
    } else {
      setState(() {
        _isNotValidate = true;
      });
    }
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/onBoardingImages/Background.png',
              height: size.height * 0.6,
              width: size.width,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 20,
            left: 15,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _pageController.animateToPage(
                        0,
                        duration: Duration(milliseconds: 5),
                        curve: Curves.easeInBack,
                      );
                      isLoginSelected = true;
                    });
                  },
                  child: Text(
                    "Log In",
                    style: TextStyle(
                      color: isLoginSelected ? PrimaryColor : Colors.white,
                      fontSize: isLoginSelected ? 19 : 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _pageController.animateToPage(1,
                          duration: Duration(milliseconds: 5),
                          curve: Curves.easeInBack);
                      isLoginSelected = false;
                    });
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: !isLoginSelected ? PrimaryColor : Colors.white,
                      fontSize: isLoginSelected ? 17 : 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Spacer(),
                isLoginSelected
                    ? CircleAvatar(
                        radius: 17,
                        backgroundColor: Colors.white,
                      )
                    : SizedBox(),
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.40,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                isLoginSelected
                    ? "Welcome Back, \nuser".toUpperCase()
                    : "Hello Rookies".toUpperCase(),
                style: TextStyle(
                  fontSize: size.width * 0.095,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Positioned(
            top: size.height * (isLoginSelected ? 0.62 : 0.52),
            left: 0,
            right: 0,
            child: SizedBox(
              height: size.height * 0.5,
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    isLoginSelected = index == 0;
                  });
                },
                children: [
                  // Login Page

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[500],
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade800,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[500],
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade800,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/forgotpassword');
                              },
                              child: const Text(
                                "Forgot Password ?",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: PrimaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.075),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: size.height * 0.07,
                              width: size.height * 0.07,
                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // Add Google sign-in logic
                                },
                                child: Image.asset(
                                  'assets/images/google.png',
                                  color: Colors.white,
                                  height: size.height * 0.05,
                                ),
                              ),
                            ),
                            SizedBox(width: size.width * 0.05),
                            Container(
                              height: size.height * 0.07,
                              width: size.height * 0.07,
                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // Add Apple sign-in logic
                                },
                                child: Image.asset(
                                  'assets/images/apple.png',
                                  color: Colors.white,
                                  height: size.height * 0.05,
                                ),
                              ),
                            ),
                            const Expanded(child: SizedBox.shrink()),
                            Container(
                              height: size.height * 0.06,
                              width: size.width * 0.3,
                              decoration: BoxDecoration(
                                color: PrimaryColor,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // _login();
                                  loginUser();
                                },
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Login",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.04),
                      ],
                    ),
                  ),

                  // Sigtopn up Page
                  //Name

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            hintText: "Name",
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[500],
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade800,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[500],
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade800,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[500],
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade800,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: size.height * 0.07,
                              width: size.height * 0.07,
                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // Add Google sign-up logic
                                },
                                child: Image.asset(
                                  'assets/images/google.png',
                                  color: Colors.white,
                                  height: size.height * 0.05,
                                ),
                              ),
                            ),
                            SizedBox(width: size.width * 0.05),
                            Container(
                              height: size.height * 0.07,
                              width: size.height * 0.07,
                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // Add Apple sign-up logic
                                },
                                child: Image.asset(
                                  'assets/images/apple.png',
                                  color: Colors.white,
                                  height: size.height * 0.05,
                                ),
                              ),
                            ),
                            const Expanded(child: SizedBox.shrink()),
                            Container(
                              height: size.height * 0.06,
                              width: size.width * 0.318,
                              decoration: BoxDecoration(
                                color: PrimaryColor,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // registerUser();
                                  //print the user details
                                },
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Sign up",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: 3),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.055),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
