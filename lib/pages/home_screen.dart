import 'package:flutter/material.dart';
import 'package:result_checker/pages/results.dart';
import 'package:result_checker/students_data.dart';
import 'package:result_checker/widgets/my_textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // TextEditingControllers
  final emailController = TextEditingController();
  final matricNoController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    final String email = emailController.text;
    final String matricNumber = matricNoController.text;
    final String password = passwordController.text;
    String errorMessage;

    // Find the student with matching credentials
    final student = students.firstWhere(
      (student) =>
          student['email'] == email &&
          student['matricNumber'] == matricNumber &&
          student['password'] == password,
      orElse: () => {},
    );

    if (student.isNotEmpty) {
      // Successful login
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsPage(results: student['results']),
        ),
      );
    } else {
      // Show error message
      errorMessage = 'Invalid login details. Please try again.';
      showWindowsStyleErrorDialog(context, errorMessage);
    }
  }

  void showWindowsStyleErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          titlePadding: EdgeInsets.all(16.0),
          contentPadding: EdgeInsets.all(16.0),
          title: Row(
            children: [
              Icon(Icons.error, color: Colors.red, size: 30),
              SizedBox(width: 8),
              Text(
                'Error',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: Text(
            errorMessage,
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    matricNoController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double horizontalPadding = screenWidth * 0.2;
    double verticalPadding = screenHeight * 0.02;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: infoBox,
          icon: Icon(
            color: Theme.of(context).colorScheme.secondary,
            Icons.info,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/The McPherson University logo.jpg',
                  width: 100),
              SizedBox(height: 20),

              // Login Text
              Text(
                "Login",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              // Email textfield
              MyTextfield(
                59,
                Icon(Icons.email_outlined),
                controller: emailController,
                obscureText: false,
                labelText: "Email",
              ),
              SizedBox(height: 20),

              // Matric number textfield
              MyTextfield(
                9,
                Icon(Icons.person),
                controller: matricNoController,
                obscureText: false,
                labelText: 'Matric Number',
              ),
              SizedBox(height: 20),

              // Password textfield
              MyTextfield(
                25,
                Icon(Icons.lock),
                controller: passwordController,
                obscureText: true,
                labelText: 'Password',
              ),

              SizedBox(height: 8),

              TextButton(
                  onPressed: () {
                    // here we will show an error like message
                    String errorMessage = 'Contact the admin!';
                    showWindowsStyleErrorDialog(context, errorMessage);
                  },
                  child: Text('Don\'t have an account yet?')),

              SizedBox(height: 20),

              // Login button
              ElevatedButton.icon(
                label: Text('Check Result!'),
                onPressed: () {
                  login();
                  emailController.clear();
                  matricNoController.clear();
                  passwordController.clear();
                },
                icon: Icon(Icons.arrow_forward),
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
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

  void infoBox() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Row(
              children: [
                Image.asset(
                  'assets/images/The McPherson University logo.jpg',
                  width: 40,
                ),
                SizedBox(width: 5),
                Text('Creators Name',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Aludo Charles - 220202007 '),
              Text('Sao Oluwaferanmi - 220202017 '),
              Text('Osawemen Riccardo - 230501037'),
              Text('Ekeledirichukwu Samuel 220202022'),
              Text('Umanah-Eno Abasi - 220202008'),
              Text('Judah Muyiwa - 230501040'),
              Text('Tonade Tolulope - 230501042'),
              Text('Gbadebo Oluwanifemi - 220202011'),
            ],
          ),
        );
      },
    );
  }
}
