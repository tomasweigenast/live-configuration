import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webapp/helpers/constants.dart';

class Hyperlink extends StatefulWidget {

  final String? text;
  final String clickableText;
  final String? openUrl;
  final void Function()? onTap;
  final TextAlign? textAlign;

  const Hyperlink({this.text, required this.clickableText, this.openUrl, this.onTap, this.textAlign, Key? key }) : super(key: key);

  @override
  _HyperlinkState createState() => _HyperlinkState();
}

class _HyperlinkState extends State<Hyperlink> {

  bool isHover = false;

  @override
  void initState() {
    super.initState();

    assert(() {
      if(widget.openUrl == null && widget.onTap == null) {
        return false;
      }

      return true;
    }(), "At least openUrl or onTap must be provided.");
  }

  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
      TextSpan(
        text: widget.text,
        children: <TextSpan>[ 
          TextSpan(
            mouseCursor: SystemMouseCursors.click,
            text: widget.text != null ? " ${widget.clickableText}" : widget.clickableText,
            style: TextStyle(color: isHover ? kSecondaryDarkColor : Colors.black, decoration: isHover ? TextDecoration.underline : null),
            onEnter: (_) {
              setState(() {
                isHover = true;
              });
            },
            onExit: (_) {
              setState(() {
                isHover = false;
              });
            },
            recognizer: TapGestureRecognizer()..onTap = () {
              if(widget.onTap != null) {
                widget.onTap!();
              } else {
                debugPrint("Opening ${widget.openUrl}");
              }
            }
          )
        ]
      ),
      textAlign: widget.textAlign
    );
  }
}