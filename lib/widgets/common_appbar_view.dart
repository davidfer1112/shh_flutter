import 'package:flutter/material.dart';
import 'package:app/utils/themes.dart';
import 'package:app/utils/text_styles.dart';

class CommonAppBarView extends StatelessWidget{

  final double? topPadding;
  final Widget? backWidget;
  final String? titleText;
  final VoidCallback onBackClick;
  final IconData? iconData;

  const CommonAppBarView({Key? key, this.topPadding, this.backWidget, this.titleText, required this.onBackClick, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context){
    final paddingTop = topPadding ?? MediaQuery.of(context).padding.top;
    final textStyles = TextStyles(context);
    return Padding(
      padding: EdgeInsets.only(top: paddingTop),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppBar().preferredSize.height,
            child: Padding(
              padding: EdgeInsets.only(top: 8, left: 8, right: 8),
              child: Container(
                width: AppBar().preferredSize.height -8,
                height: AppBar().preferredSize.height -8,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                    onTap: onBackClick,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: backWidget ?? Icon(iconData,color: AppTheme.primaryTextColor,),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 4, left: 24, right: 24),
            child: Text(titleText!, style: textStyles.getTitleStyle()),
          )
        ],
      ),
    );
  }

}