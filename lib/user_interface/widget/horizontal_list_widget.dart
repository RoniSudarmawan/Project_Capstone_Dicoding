import 'package:capstone_project/model/list_clothes_model.dart';
import 'package:capstone_project/style/color_style.dart';
import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  final List<ListClothes> clothes;
  final BuildContext context;
  const HorizontalList({Key? key, required this.clothes, required this.context})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 250,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: clothes.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/DetailScreen',
                    arguments: clothes[index].id);
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
                              clothes[index].productImageUrl!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, bottom: 2.0, top: 10.0),
                          child: Text(clothes[index].name,
                              style: Theme.of(context).textTheme.subtitle2),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, bottom: 8.0),
                              child: Text(
                                  "Rp. " +
                                      clothes[index].price.toString() +
                                      "/hari",
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
