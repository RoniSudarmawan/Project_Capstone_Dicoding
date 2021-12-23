import 'package:capstone_project/model/list_clothes_model.dart';
import 'package:capstone_project/style/color_style.dart';
import 'package:capstone_project/user_interface/widget/list_grid_view.dart';
import 'package:flutter/material.dart';

class NewestProductScreen extends StatelessWidget {
  final List<ListClothes> clothes;
  final BuildContext context;
  String title;
  NewestProductScreen(
      {Key? key,
      required this.clothes,
      required this.context,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                color: primaryColor100,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: primaryColor900,
                )),
            Center(
                child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontWeight: FontWeight.w600),
            )),
            ListGridView(clothes: clothes, context: context)
          ],
        ),
      ),
    );
  }
}
