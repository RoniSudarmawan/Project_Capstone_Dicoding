import 'package:capstone_project/style/color_style.dart';
import 'package:capstone_project/user_interface/widget/horizontal_list_widget.dart';
import 'package:flutter/material.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Hello, \n Rony",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Icon(
                  Icons.person,
                  size: 45,
                  color: primaryColor900,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: SizedBox(
                  height: 35,
                  child: TextField(
                    onTap: () {
                      Navigator.pushNamed(context, '/SearchScreen');
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: surface,
                      suffixIcon: const Icon(
                        Icons.search,
                      ),
                      hintText: 'search',
                      contentPadding: const EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended For You",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/RecommendedListScreen');
                    },
                    child: Text(
                      "see all",
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          decoration: TextDecoration.underline,
                          color: primaryColor100),
                    ),
                  ),
                ],
              ),
            ),
            const HorizontalList(),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Newest Product",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/NewestProductScreen');
                    },
                    child: Text(
                      "see all",
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          decoration: TextDecoration.underline,
                          color: primaryColor100),
                    ),
                  ),
                ],
              ),
            ),
            const HorizontalList(),
          ],
        ),
      ),
    );
  }
}
