import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:webapp/helpers/constants.dart';
import 'package:webapp/ui/controls/animations/linear_gradient_tween.dart';

/// A wrapper that handles all routes when the user is not logged in.
class UnauthenticatedWrapperView extends StatefulWidget{
  const UnauthenticatedWrapperView({ Key? key }) : super(key: key);

  @override
  _UnauthenticatedWrapperViewState createState() => _UnauthenticatedWrapperViewState();
}

class _UnauthenticatedWrapperViewState extends State<UnauthenticatedWrapperView> with SingleTickerProviderStateMixin {
  
  late final Animation<LinearGradient> _animation;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..reverse();
    _animation = LinearGradientTween(
      begin: const LinearGradient(
        colors: [kSecondaryDarkColor, kSecondaryLightColor, kSecondaryDarkColor],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      end: const LinearGradient(
        colors: [kSecondaryDarkColor, kSecondaryLightColor, kSecondaryDarkColor]
      ),
    ).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) => Container(
          decoration: BoxDecoration(
            gradient: _animation.value
          ),
          child: child
        ),
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: size.width / 4, vertical: size.height / 6),
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: SelectableText("Live Configuration", style: TextStyle(fontSize: 36, fontWeight: FontWeight.w300)),
              ),
              Divider(indent: 20, endIndent: 20),
              SizedBox(height: 10),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  child: AutoRouter(),
                )
              )
            ],
          ),
        ),
      )
    );
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }
}