import 'package:capstone_project/model/list_clothes_model.dart';
import 'package:capstone_project/style/color_style.dart';
import 'package:flutter/material.dart';

class ListGridView extends StatelessWidget {
  final List<ListClothes> clothes;
  final BuildContext context;
  const ListGridView({Key? key, required this.clothes, required this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
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
                  decoration: BoxDecoration(
                    color: surface,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          child: Image.network(
                            "https://images.unsplash.com/photo-1592878897400-43fb1f1cc324?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80}",
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
                            padding:
                                const EdgeInsets.only(right: 8.0, bottom: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.star_rounded,
                                    color: Colors.black38, size: 20),
                                Text("4.5/5",
                                    style: Theme.of(context).textTheme.caption),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
