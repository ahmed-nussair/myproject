import 'package:flutter/material.dart';
import 'screen_util.dart';

class UserItem extends StatefulWidget {
  final int id;
  final String name;
  final String username;
  final Function(int) onUserPressed;

  const UserItem({
    Key? key,
    required this.id,
    required this.name,
    required this.username,
    required this.onUserPressed,
  }) : super(key: key);

  @override
  State<UserItem> createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: _screenUtil.setSp(70),
                    ),
                  ),
                  SizedBox(
                    height: _screenUtil.setHeight(30),
                  ),
                  Text(
                    widget.username,
                    style: TextStyle(
                      fontSize: _screenUtil.setSp(50),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  widget.onUserPressed(widget.id);
                },
                child: Image.asset(
                  'assets/details.png',
                  height: _screenUtil.setHeight(150),
                  width: _screenUtil.setWidth(150),
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: _screenUtil.setHeight(5),
        ),
      ],
    );
  }
}
