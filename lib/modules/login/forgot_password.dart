import 'package:app/widgets/common_button.dart';
import 'package:app/widgets/remove_focuse.dart';
import 'package:flutter/material.dart';

import '../../language/appLocalizations.dart';
import '../../utils/validator.dart';
import '../../widgets/common_appbar_view.dart';
import '../../widgets/common_textfield_view.dart';

class ForgotPassword extends StatefulWidget{

  ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}


class _ForgotPasswordState extends State<ForgotPassword>{
  String _errorEmail = "";
  TextEditingController _emailController = TextEditingController();
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
                  titleText: AppLocalizations(context).of("forgot_your_Password"),
                  onBackClick: (){
                    Navigator.pop(context);
                  }
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 32, bottom: 16, left: 24, right: 24
                        ),
                        child: Row(
                          children:[
                            Expanded(
                              child: Text(AppLocalizations(context).of("resend_email_link"),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).disabledColor
                                ),
                              ),
                            )
                          ]
                        )
                      ),
                      CommonTextFieldView(
                        controller: _emailController,
                        errorText: _errorEmail,
                        titleText: AppLocalizations(context).of("your_mail"),
                        padding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
                        hintText: AppLocalizations(context).of("enter_your_email"),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (String txt){},
                      ),
                      CommonButton(
                        padding: EdgeInsets.only(left: 24, right: 24,bottom: 16),
                        buttonText: AppLocalizations(context).of("send"),
                        onTap: (){
                          if(_allValidation()) Navigator.pop(context);
                        },
                      )
                    ]
                  ),
                ),
              )
            ],
          )
        )
    );
  }

  bool _allValidation(){
    bool isValid = true;
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
    setState(() {});
    return isValid;
  }

}