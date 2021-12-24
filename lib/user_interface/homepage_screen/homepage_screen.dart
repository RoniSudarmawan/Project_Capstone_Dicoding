import 'package:capstone_project/database/clothes_service.dart';
import 'package:capstone_project/provider/home_page_provider.dart';
import 'package:capstone_project/style/color_style.dart';
import 'package:capstone_project/user_interface/homepage_screen/newest_product_screen.dart';
import 'package:capstone_project/user_interface/widget/horizontal_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageProvider>(
      create: (_) => HomePageProvider(
        clothesService: ClothesService(),
      ),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Consumer<HomePageProvider>(builder: (context, snapshot, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Hello user, \nWelcome To Clothal",
                      textAlign: TextAlign.end,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: Colors.black),
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
                        readOnly: true,
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
                        "Recommended Suit For You",
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontWeight: FontWeight.w600, color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewestProductScreen(
                                        context: context,
                                        clothes:
                                            snapshot.listClothesRecommended,
                                        title: "Recommended Suit For You",
                                      )));
                        },
                        child: Text(
                          "see all",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(
                                  decoration: TextDecoration.underline,
                                  color: primaryColor100),
                        ),
                      ),
                    ],
                  ),
                ),
                HorizontalList(
                  clothes: snapshot.listClothesRecommended,
                  context: context,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Newest Product",
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontWeight: FontWeight.w600, color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewestProductScreen(
                                        context: context,
                                        clothes: snapshot.listNewestClothes,
                                        title: "Newest Product",
                                      )));
                        },
                        child: Text(
                          "see all",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(
                                  decoration: TextDecoration.underline,
                                  color: primaryColor100),
                        ),
                      ),
                    ],
                  ),
                ),
                HorizontalList(
                  clothes: snapshot.listNewestClothes,
                  context: context,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
