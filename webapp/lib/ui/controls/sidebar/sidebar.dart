import 'package:flutter/material.dart';
import 'package:webapp/helpers/constants.dart';
import 'package:webapp/ui/controls/nil.dart';
import 'package:webapp/ui/controls/sidebar/sidebar_item.dart';

import '../hyperlink.dart';

class SidebarWrapper extends StatefulWidget {

  final List<BaseSidebarItem> items;
  final Widget child;

  const SidebarWrapper({required this.items, required this.child, Key? key }) : super(key: key);

  @override
  _SidebarWrapperState createState() => _SidebarWrapperState();
}

class _SidebarWrapperState extends State<SidebarWrapper> {
  bool _isCollapsed = false;
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  kSecondaryDarkColor, kSecondaryColor, kSecondaryDarkColor
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
              )
            ),
            width: _isCollapsed ? size.width * .03 : size.width * .15,
            child: _buildColumn(),
          ),
        ),
        const VerticalDivider(width: 1),
        Expanded(
          child: widget.child,
        )
      ],
    );
  }

  Widget _buildColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        AnimatedCrossFade(
          firstChild: DrawerHeader(
            decoration: const BoxDecoration(
              color: kSecondaryDarkColor
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Flexible(child: Text("Tomás Weigenast", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.white))),
                const Flexible(child: Text("tomaswegenast@gmail.com", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Colors.white))),
                const Spacer(),
                Flexible(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      primary: Colors.white,
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.white
                      )
                    ),
                    child: const Text("Go to my account"),
                    onPressed: () {

                    },
                  ),
                ),
                const SizedBox(height: 10),
                Flexible(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      primary: Colors.white,
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.white
                      )
                    ),
                    child: const Text("Logout"),
                    onPressed: () {

                    },
                  ),
                )
              ],
            ),
            margin: EdgeInsets.zero,
          ), 
          secondChild: Tooltip(
          message: "My account",
            child: ListTile(
              title: Center(child: IconTheme(
                child: const Icon(Icons.account_circle_rounded),
                data: IconThemeData(
                  color: Colors.grey[200]
                ),
              )),
              onTap: () {}
            ),
          ), 
          crossFadeState: _isCollapsed ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 150)
        ),
        Divider(height: 1, color: Colors.grey[60], thickness: 2),

        ...widget.items.map((e) => _buildItem(e)),

        const Spacer(),
        Divider(height: 1, color: Colors.grey[60], thickness: 2),
        if(_isCollapsed)
          IconButton(
            splashRadius: 20,
            icon: Icon(Icons.double_arrow_rounded, color: Colors.grey[200]),
            onPressed: () {
              setState(() {
                _isCollapsed = false;
              });
            },
          )
        else
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              splashRadius: 20,
              icon: RotatedBox(
                quarterTurns: 2,
                child: Icon(Icons.double_arrow_rounded, color: Colors.grey[200]),
              ),
              onPressed: () {
                setState(() {
                  _isCollapsed = true;
                });
              },
            ),
          )
      ]
    );
  }

  Widget _buildItem(BaseSidebarItem item) {
    if(item is SidebarItem){
      return AnimatedCrossFade(
        crossFadeState: _isCollapsed ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 500),
        firstChild: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: item.onTap,
            splashColor: kSecondaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6),
              child: Row(
                children: [
                  Flexible(
                    child: IconTheme(
                      child: item.icon,
                      data: const IconThemeData(
                        color: Colors.white,
                        size: 24
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Flexible(child: Text(item.text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 16), overflow: TextOverflow.ellipsis,))
                ],
              ),
            ),
          ),
        ),
        secondChild: Tooltip(
          message: item.text,
          child: ListTile(
            title: Center(
              child: IconTheme(
                child: item.icon,
                data: const IconThemeData(
                  color: Colors.white,
                  size: 24
                ),
              ),
            ),
            onTap: item.onTap
          ),
        ),
      );
    } else {
      return const Nil();
    }
  }
}