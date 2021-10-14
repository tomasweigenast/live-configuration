import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:webapp/helpers/constants.dart';
import 'package:webapp/ui/controls/popup_menu_widget.dart';

/// A wrapper that handles all routes when the user is logged in.
class DashboardWrapperView extends StatelessWidget {
  const DashboardWrapperView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 65,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [kPrimaryDarkColor, kSecondaryColor]
                  )
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 60,
                color: Colors.white,
                child: Row(
                  children: [
                    Text("Live Configuration", style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal, foreground: Paint()..shader = const LinearGradient(
                      colors: [kPrimaryDarkColor, kSecondaryColor]
                    ).createShader(const Rect.fromLTWH(0, 0, 200, 70)))),
                    const Spacer(),
                    PopupMenuButton(
                      child: const Icon(Icons.account_circle_rounded, color: kSecondaryColor, size: 30),
                      tooltip: "My account",
                      elevation: 8,
                      offset: const Offset(0, 35),
                      padding: EdgeInsets.zero,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                      itemBuilder: (context) => <PopupMenuEntry>[
                        PopupMenuWidget(
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text("Tomás Weigenast", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                                Text("tomaswegenast@gmail.com", style: TextStyle(fontSize: 14)),
                              ],
                            ),
                          )
                        ),
                        const PopupMenuDivider(height: 1,),
                        PopupMenuItem(
                          onTap: () {
                            
                          },
                          child: Row(
                            children: const [
                              Icon(Icons.manage_accounts_rounded, color: kPrimaryDarkColor),
                              SizedBox(width: 20),
                              Text("My account", style: TextStyle(color: kPrimaryDarkColor))
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          onTap: () {

                          },
                          child: Row(
                            children: const [
                              Icon(Icons.logout, color: kPrimaryDarkColor),
                              SizedBox(width: 20),
                              Text("Logout", style: TextStyle(color: kPrimaryDarkColor))
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          const Expanded(
            child: AutoRouter(),
          )
        ],
      )
    );
  }
}