import 'package:flutter/material.dart';

class SelectProjectView extends StatefulWidget {
  const SelectProjectView({ Key? key }) : super(key: key);

  @override
  _SelectProjectViewState createState() => _SelectProjectViewState();
}

class _SelectProjectViewState extends State<SelectProjectView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SelectableText("Select a project", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                title: Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("My Amazing Project!"),
                          Text("123456789", style: TextStyle(color: Colors.grey, fontSize: 14))
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.star),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                onTap: () {

                },
              );
            },
          ),
        )
      ],
    );
  }
}