import 'package:app/routes/route_names.dart';
import 'package:app/utils/text_styles.dart';
import 'package:flutter/material.dart';

import '../../language/appLocalizations.dart';
import '../../utils/validator.dart';
import '../../widgets/common_appbar_view.dart';
import '../../widgets/common_button.dart';
import '../../widgets/common_textfield_view.dart';
import '../../widgets/remove_focuse.dart';
import 'facebook_twitter_button_view.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({Key? key}) : super(key: key);

  @override
  _SingUpScreenState createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen>{

  String _errorEmail = "";
  TextEditingController _emailController = TextEditingController();
  String _errorPassword = "";
  TextEditingController _passwordController = TextEditingController();
  String _errorFName = "";
  TextEditingController _fNameController = TextEditingController();
  String _errorLName = "";
  TextEditingController _lNameController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: RemoveFocuse(
        onclick: () {
      FocusScope.of(context).requestFocus(FocusNode());
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonAppBarView(
            iconData: Icons.arrow_back_ios_new,
            titleText: AppLocalizations(context).of("sign_up"),
            onBackClick: (){
              Navigator.pop(context);
            }),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 16),
                  child: FaceBookTwitterButtonView(),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    AppLocalizations(context).of("log_with mail"),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).disabledColor
                    ),
                  ),
                ),
                CommonTextFieldView(
                  controller: _fNameController,
                  errorText: _errorFName,
                  titleText: AppLocalizations(context).of("first_name"),
                  padding: EdgeInsets.only(left: 24, right: 24, bottom: 15),
                  hintText: AppLocalizations(context).of("enter_first_name"),
                  keyboardType: TextInputType.name,
                  onChanged: (String txt){},
                ),
                CommonTextFieldView(
                  controller: _lNameController,
                  errorText: _errorLName,
                  titleText: AppLocalizations(context).of("last_name"),
                  padding: EdgeInsets.only(left: 24, right: 24, bottom: 15),
                  hintText: AppLocalizations(context).of("enter_last_name"),
                  onChanged: (String txt){},
                  keyboardType: TextInputType.name,
                  isObscureText: true,
                ),
                CommonTextFieldView(
                  controller: _emailController,
                  errorText: _errorEmail,
                  titleText: AppLocalizations(context).of("your_mail"),
                  padding: EdgeInsets.only(left: 24, right: 24, bottom: 15),
                  hintText: AppLocalizations(context).of("enter_your_email"),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (String txt){},
                ),
                CommonTextFieldView(
                  controller: _passwordController,
                  errorText: _errorPassword,
                  titleText: AppLocalizations(context).of("password"),
                  padding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
                  hintText: AppLocalizations(context).of("enter_password"),
                  onChanged: (String txt){},
                  keyboardType: TextInputType.text,
                  isObscureText: true,
                ),
                CommonButton(
                  padding:EdgeInsets.only(left: 24, right: 24, bottom: 16),
                  buttonText: AppLocalizations(context).of("sign_up"),
                  onTap: (){
                    if(allValidation())
                      NavigationServices(context).gotoBottomTabScreen();;
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    AppLocalizations(context).of("terms_agreed"),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).disabledColor
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations(context).of("already_have_account"),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).disabledColor
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.all(
                          Radius.circular(8),
                      ),
                      onTap: (){
                        NavigationServices(context).gotoLoginScreen();
                      },
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          AppLocalizations(context).of("login"),
                          style:
                          TextStyles(context).getRegularStyle().copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColor
                          ),
                        )
                      )
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 24,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),

    ));
  }

  bool allValidation() {
    bool isValid = true;

    if (_fNameController.text
        .trim()
        .isEmpty) {
      _errorFName = AppLocalizations(context).of("first_name_cannot_empty");
      isValid = false;
    } else {
      _errorFName = "";
    }

    if (_lNameController.text
        .trim()
        .isEmpty) {
      _errorLName = AppLocalizations(context).of("last_name_cannot_empty");
      isValid = false;
    } else {
      _errorLName = "";
    }

    if (_emailController.text
        .trim()
        .isEmpty) {
      _errorEmail = AppLocalizations(context).of("email_cannot_empty");
      isValid = false;
    } else if (!Validator.validateEmail(_emailController.text.trim())) {
      _errorEmail = AppLocalizations(context).of("invalido");
      isValid = false;
    } else {
      _errorEmail = "";
    }

    if (_passwordController.text
        .trim()
        .isEmpty) {
      _errorPassword = AppLocalizations(context).of("password_cannot_empty");
      isValid = false;
    } else if (_passwordController.text.trim().length < 8) {
      _errorPassword = AppLocalizations(context).of("valid_password");
      isValid = false;
    } else {
      _errorPassword = "";
    }
    setState(() {});
    return isValid;
  }


}