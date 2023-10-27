import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram/constants/user_list_constant.dart';
import 'package:instagram/logics/login_logic.dart';
import 'package:instagram/models/user_models.dart';
import 'package:instagram/pages/main_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
    );
  }

  Widget get _buildBody {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.pink, Colors.purpleAccent])),
      child: _buildLoginPanel,
    );
  }

  Widget get _buildLoginPanel {
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTitle,
              _buildUsernameTextField,
              _buildPasswordTextField,
              _buildLoginButton,
              _buildForgetTextLink,
              _buildDividerOr,
              _buildLoginWithFacebook,
            ],
          ),
        ),
      ),
    );
  }

  Widget get _buildTitle {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        "Instagram",
        style: TextStyle(fontFamily: "IG", fontSize: 45, color: Colors.white),
      ),
    );
  }

  TextEditingController _userName = TextEditingController();
  TextEditingController _userPassword = TextEditingController();

  Widget get _buildUsernameTextField {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      constraints: BoxConstraints(
        maxHeight: 60,
        maxWidth: 500,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(75, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: _userName,
        decoration: InputDecoration(
            hintText: "Username",
            border: InputBorder.none,
            hintStyle: TextStyle(fontSize: 20, color: Colors.white54)),
        style: TextStyle(
          fontSize: 20,
          color: Colors.white54,
        ),
        keyboardType: TextInputType.emailAddress,
        autocorrect: false,
      ),
    );
  }

  bool _hide = true;
  Widget get _buildPasswordTextField {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      constraints: BoxConstraints(
        maxHeight: 60,
        maxWidth: 500,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(75, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: _userPassword,
        decoration: InputDecoration(
            hintText: "Password",
            border: InputBorder.none,
            hintStyle: TextStyle(fontSize: 20, color: Colors.white54),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _hide = !_hide;
                });
              },
              icon: Icon(
                _hide ? Icons.visibility : Icons.visibility_off,
                color: Colors.white,
              ),
            )),
        style: TextStyle(
          fontSize: 20,
          color: Colors.white54,
        ),
        keyboardType: TextInputType.text,
        obscureText: _hide,
        autocorrect: false,
      ),
    );
  }

  Widget get _buildLoginButton {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        constraints: BoxConstraints(
          maxHeight: 60,
          maxWidth: 500,
        ),
        width: 500,
        height: 50,
        child: TextButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(75, 255, 255, 255),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: () {
            List<UserModel> foundList = userlist
                .where((element) =>
                    element.email == _userName.text.toLowerCase().trim() &&
                    element.password == _userPassword.text)
                .toList();

            if (foundList.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  // margin: EdgeInsets.only(bottom: 100),
                  backgroundColor: Colors.red,
                  content: Text(
                    "Login Failed",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            } else {
              context.read<LoginLogic>().setLogginUser(foundList[0]);

              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => MainPage(),
                ),
              );
            }
          },
          child: Text(
            "Log In",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ));
  }

  Widget get _buildForgetTextLink {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "Forget your login detail?",
          style: TextStyle(fontSize: 17, color: Colors.white),
        ),
        Text(
          " Get Help signing in.",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white),
        ),
      ]),
    );
  }

  Widget get _buildDividerOr {
    return Row(
      children: [
        Expanded(
            child: Container(
          margin: EdgeInsets.only(left: 30, right: 10),
          child: Divider(
            color: Colors.white,
            height: 60,
            thickness: 1.5,
          ),
        )),
        Text(
          "OR",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        Expanded(
            child: Container(
          margin: EdgeInsets.only(right: 30, left: 10),
          child: Divider(
            color: Colors.white,
            height: 60,
            thickness: 1.5,
          ),
        )),
      ],
    );
  }

  Widget get _buildLoginWithFacebook {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(
          FontAwesomeIcons.facebookSquare,
          color: Colors.white,
          size: 35,
        ),
        SizedBox(width: 10),
        Text(
          "Login with facebook",
          style: TextStyle(
              fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }
}
