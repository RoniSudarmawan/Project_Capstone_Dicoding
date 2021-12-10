import 'package:capstone_project/style/color_style.dart';
import 'package:capstone_project/user_interface/widget/list_grid_view.dart';
import 'package:flutter/material.dart';

class NewestProductScreen extends StatelessWidget {
  const NewestProductScreen({Key? key}) : super(key: key);

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
              "Newest Product",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontWeight: FontWeight.w600),
            )),
            const ListGridView(),
          ],
        ),
      ),
    );
  }
}
