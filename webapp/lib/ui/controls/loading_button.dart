import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {

  final Widget child;
  final Widget? loadingChild;
  final Future Function() onPressed;
  final bool hideChildOnLoading;

  final _LoadingButtonType _buttonType;

  const LoadingButton._({required this.child, required this.onPressed, required this.hideChildOnLoading, required _LoadingButtonType type, required this.loadingChild, Key? key }) 
    : _buttonType = type, super(key: key);

  factory LoadingButton.elevated({required Widget child, required Future Function() onPressed, bool hideChildOnLoading = false, Widget? loadingChild, Key? key}) {
    return LoadingButton._(child: child, type: _LoadingButtonType.elevated, onPressed: onPressed, hideChildOnLoading: hideChildOnLoading, loadingChild: loadingChild, key: key);
  }

  factory LoadingButton.text({required Widget child, required Future Function() onPressed, bool hideChildOnLoading = false, Widget? loadingChild, Key? key}) {
    return LoadingButton._(child: child, type: _LoadingButtonType.text, onPressed: onPressed, hideChildOnLoading: hideChildOnLoading, loadingChild: loadingChild, key: key);
  }
  
  factory LoadingButton.ouilined({required Widget child, required Future Function() onPressed, bool hideChildOnLoading = false, Widget? loadingChild, Key? key}) {
    return LoadingButton._(child: child, type: _LoadingButtonType.outlined, onPressed: onPressed, hideChildOnLoading: hideChildOnLoading, loadingChild: loadingChild, key: key);
  }

  @override
  _LoadingButtonState createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    switch(widget._buttonType) {
      case _LoadingButtonType.elevated:
        return _elevated();

      case _LoadingButtonType.outlined:
        return _outlined();

      case _LoadingButtonType.text:
        return _text();
    }
  }

  Widget _elevated() {
    return ElevatedButton(
      onPressed: _onButtonPressed, 
      child: _child()
    );
  }

  Widget _outlined() {
    return OutlinedButton(
      onPressed: _onButtonPressed, 
      child: _child()
    );
  }

  Widget _text() {
    return TextButton(
      onPressed: _onButtonPressed, 
      child: _child()
    );
  }

  Widget _child() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if(isLoading)
          ...[
            SizedBox(
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              height: 20,
              width: 20,
            ),
            const SizedBox(width: 20)
          ],
      
        if(!isLoading || (isLoading && !widget.hideChildOnLoading))
          widget.child,

        if(isLoading && widget.loadingChild != null)
          widget.loadingChild!
      ],
    );
  }

  void _onButtonPressed() {
    if(isLoading) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    widget.onPressed().then((_) {
      setState(() {
        isLoading = false;
      });
    });
  }
}

enum _LoadingButtonType {
  elevated, text, outlined
}