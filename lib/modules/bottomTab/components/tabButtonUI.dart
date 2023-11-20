import 'package:app/utils/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../utils/themes.dart';

class TabButtonUI extends StatelessWidget {
  final IconData icon;
  final Function()? onTap;
  final bool isSelected;
  final String text;

  const TabButtonUI({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.isSelected,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _color = isSelected ? AppTheme.primaryColor : AppTheme.secondaryTextColor;

    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Theme.of(context).primaryColor.withOpacity(0.2),
          onTap: onTap,
          child: Column(
            children: [
              SizedBox(
                width: 40,
                height: 32,
                child: Icon(
                  icon,
                  size: 26,
                  color: _color,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 0),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Text(
                    text,
                    style: TextStyles(context)
                      .getDescriptionStyle()
                      .copyWith(color: _color),
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
