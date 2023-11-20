import 'package:app/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class FaceBookTwitterButtonView extends StatelessWidget{

    const FaceBookTwitterButtonView({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context){
      return Container(
        child: Row(
          children: [
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: CommonButton(
                padding: EdgeInsets.zero,
                backgroundColor: Color(0x0FF3C5799),
                buttonTextWidget: _buttonTextUi(),
              )
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
                child: CommonButton(
                  padding: EdgeInsets.zero,
                  backgroundColor: Color(0x0FF05A9F0),
                  buttonTextWidget: _buttonTextUi(isFacebook: false),
                )
            )
          ],
        ),
      );
    }

    Widget _buttonTextUi({bool isFacebook = true}){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(isFacebook ? FontAwesomeIcons.facebookF : FontAwesomeIcons.twitter,
          size: 20,
          color: Colors.white,
          ),
          SizedBox(
            width: 24,
          ),
          Text(
            isFacebook ? "Facebook" : "Twitter",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.white
            ),
          )
        ],
      );
    }

}