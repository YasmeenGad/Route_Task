import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_route/core/network/constants/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        children: [
          Flexible(
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 51,
              decoration: BoxDecoration(
                border: Border.all(color: primaryColor),
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'What do you search for?',
                      hintStyle:
                          TextStyle(color: Colors.grey.shade400, fontSize: 17),
                      prefixIcon: Icon(
                        CupertinoIcons.search,
                        color: primaryColor,
                      )),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Icon(
            CupertinoIcons.cart,
            color: primaryColor,
            size: 38,
          )
        ],
      ),
    );
  }
}
