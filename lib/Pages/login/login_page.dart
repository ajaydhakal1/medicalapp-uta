import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final PageController _pageController = PageController();
  bool usePhoneNumber = false;
  bool isUsingEmail = true;
  bool isOTPScreen = false;

  void _switchToSignUp() {
    _pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _switchToSignIn() {
    _pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _switchToOTP() {
    setState(() {
      isOTPScreen = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isOTPScreen
            ? _buildOTPScreen(context)
            : PageView(
                controller: _pageController,
                children: [
                  _buildSignInPage(context),
                  _buildSignUpPage(context),
                ],
              ),
      ),
    );
  }

  Widget _buildSignInPage(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const Text(
            'Hey,',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
          RichText(
            text: const TextSpan(
              text: 'Welcome',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: ' back.',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Login to ensure you never miss a dose.',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 32),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter Your Email',
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter Your Password',
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                  ),
                  const Text('Remember me'),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgotten Password?',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              'Sign in',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          const SizedBox(height: 24),
          const Center(child: Text('Or', style: TextStyle(color: Colors.grey))),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.google, color: Colors.black),
            label: const Text('Sign up with Google',
                style: TextStyle(color: Colors.black)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF1F1F1),
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.facebook, color: Colors.black),
            label: const Text('Sign up with Facebook',
                style: TextStyle(color: Colors.black)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF1F1F1),
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              setState(() {
                usePhoneNumber = true;
              });
            },
            child: const Center(
              child: Text(
                'Use number instead',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: RichText(
                text: TextSpan(
                  text: 'Doesn\'t have account? ',
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Sign up',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = _switchToSignUp,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOTPScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: (){
          
        }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Text(
              'Enter the code we sent to your mobile number.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter OTP',
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            TimerCountdown(
              format: CountDownTimerFormat.secondsOnly,
              endTime: DateTime.now().add(const Duration(seconds: 60)),
              onEnd: () {
                setState(() {
                  // Allow resend button to be active after countdown
                });
              },
              timeTextStyle: const TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              spacerWidth: 5,
              enableDescriptions: false,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Verify OTP action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'Verify',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Resend OTP action
              },
              child: const Text(
                'Resend Code',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUpPage(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          const Text(
            'Sign up',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Stay On Track, Stay Healthy!',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Create your account to manage your medication effortlessly.',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          usePhoneNumber ? _buildPhoneNumberInput() : _buildEmailInput(),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _switchToOTP,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            child: const Text(
              'Next',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Or'),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.google, color: Colors.black),
            label: const Text('Sign up with Google',
                style: TextStyle(color: Colors.black)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF1F1F1),
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.facebook, color: Colors.black),
            label: const Text('Sign up with Facebook',
                style: TextStyle(color: Colors.black)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF1F1F1),
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              setState(() {
                usePhoneNumber = !usePhoneNumber;
              });
            },
            child: Text(
              usePhoneNumber ? 'Use email instead' : 'Use number instead',
              style: const TextStyle(color: Colors.blue),
            ),
          ),
          const SizedBox(height: 32),
          RichText(
            text: TextSpan(
              text: 'Already have account? ',
              style: const TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: 'Sign in',
                  style: const TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()..onTap = _switchToSignIn,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailInput() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Enter Your Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }

  Widget _buildPhoneNumberInput() {
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {
        // Handle phone number input change
      },
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
      ),
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.disabled,
      selectorTextStyle: const TextStyle(color: Colors.black),
      initialValue: PhoneNumber(isoCode: 'NP'),
      textFieldController: TextEditingController(),
      formatInput: false,
      keyboardType:
          TextInputType.numberWithOptions(signed: true, decimal: false),
      inputDecoration: InputDecoration(
        hintText: 'Phone number',
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}
