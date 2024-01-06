import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tutorhub/firebase_options.dart';
import 'package:tutorhub/ui/screens/forget_password_page.dart';
import 'package:tutorhub/ui/screens/password_reset_success_page.dart';
import 'package:tutorhub/ui/screens/reset_password_page.dart';
import 'package:tutorhub/ui/screens/otp_verification_page.dart';
import 'package:tutorhub/ui/screens/sign_in_page.dart';
import 'package:tutorhub/ui/screens/sign_up_page.dart';
import 'package:tutorhub/ui/screens/start_screen.dart';
import 'package:tutorhub/utils/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TutorHub',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        // home: StartPage(),
        // home: SignInPage(),
        // home: SignUpPage(),
        // home: ForgetPasswordPage()
        // home: ResetPasswordPage()
        // home: ResetPasswordSuccessPage()
        home: OTPVerificationPage());
  }
}
