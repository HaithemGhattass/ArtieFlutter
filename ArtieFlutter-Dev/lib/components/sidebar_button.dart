import 'package:artie/constants.dart';
import 'package:flutter/material.dart';

class SideBarButton extends StatelessWidget {
  SideBarButton({required this.triggerAnimation});
  final VoidCallback triggerAnimation;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      constraints: BoxConstraints(maxHeight: 40.0, maxWidth: 40.0),
      onPressed: triggerAnimation,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14.0),
            boxShadow: [
              BoxShadow(
                  color: kShadowColor, offset: Offset(0, 12), blurRadius: 16.0)
            ]),
        child: Image.asset('asset/icons/icon-sidebar.png',
            color: kPrimaryLabelColor),
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
      ),
    );
  }
}
