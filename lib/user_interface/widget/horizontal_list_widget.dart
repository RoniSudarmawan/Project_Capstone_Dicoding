import 'package:capstone_project/style/color_style.dart';
import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 250,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/DetailScreen');
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    height: 250,
                    width: 180,
                    decoration: BoxDecoration(
                      color: surface,
                      borderRadius: BorderRadius.all(const Radius.circular(15)),
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
                              style: Theme.of(context).textTheme.subtitle2),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, bottom: 8.0),
                              child: Text("Rp. 100.000/hari",
                                  style: Theme.of(context).textTheme.caption),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 8.0, bottom: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(Icons.star_rounded,
                                      color: Colors.black38, size: 20),
                                  Text("4.5/5",
                                      style:
                                          Theme.of(context).textTheme.caption),
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
    );
  }
}
