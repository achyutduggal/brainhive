import 'package:flutter/material.dart';


class TopBarFb4 extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final String upperTitle;
  final Function() onTapMenu;
  const TopBarFb4({required this.title, required this.upperTitle, required this.onTapMenu, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 23.0, 0.0, 0.0),
      child: Container(
        color: const Color(0xff4361ee),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: onTapMenu,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children:  [
                SizedBox(height: 8.0,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                  child: Text(title,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.normal)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 10.0),
                  child: Text(upperTitle,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(68.0);
}