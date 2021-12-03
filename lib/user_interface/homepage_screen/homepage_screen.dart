import 'package:capstone_project/style/color_style.dart';
import 'package:capstone_project/user_interface/widget/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: surface,
                      suffixIcon: InkWell(
                        child: const Icon(
                          Icons.search,
                        ),
                        onTap: () {},
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
                  Text(
                    "see all",
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        decoration: TextDecoration.underline,
                        color: primaryColor100),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width,
              height: 250,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                            height: 250,
                            width: 180,
                            decoration: BoxDecoration(
                              color: surface,
                              borderRadius:
                                  BorderRadius.all(const Radius.circular(15)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  width: 180,
                                  height: 170,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                    child: Image.network(
                                      "https://images.unsplash.com/photo-1592878897400-43fb1f1cc324?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, bottom: 2.0, top: 10.0),
                                  child: Text("Green Suit",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, bottom: 8.0),
                                      child: Text("Rp. 100.000/hari",
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 8.0, bottom: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Icon(Icons.star_rounded,
                                              color: Colors.black38, size: 20),
                                          Text("4.5/5",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                    );
                  }),
            ),
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
                  Text(
                    "see all",
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        decoration: TextDecoration.underline,
                        color: primaryColor100),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width,
              height: 250,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                            height: 250,
                            width: 180,
                            decoration: BoxDecoration(
                              color: surface,
                              borderRadius:
                                  BorderRadius.all(const Radius.circular(15)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  width: 180,
                                  height: 170,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                    child: Image.network(
                                      "https://images.unsplash.com/photo-1592878897400-43fb1f1cc324?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, bottom: 2.0, top: 10.0),
                                  child: Text("Green Suit",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, bottom: 8.0),
                                      child: Text("Rp. 100.000/hari",
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 8.0, bottom: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Icon(Icons.star_rounded,
                                              color: Colors.black38, size: 20),
                                          Text("4.5/5",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
