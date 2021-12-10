import 'package:capstone_project/style/color_style.dart';
import 'package:capstone_project/user_interface/widget/horizontal_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: surface,
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            SliverAppBar(
              expandedHeight: size.height / 2.5,
              flexibleSpace: Stack(children: [
                FlexibleSpaceBar(
                  background: Image.network(
                    "https://images.unsplash.com/photo-1592878897400-43fb1f1cc324?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80}",
                    fit: BoxFit.cover,
                    width: size.width,
                    height: size.height / 2,
                  ),
                ),
              ]),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width,
                height: 7,
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Green Suit",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, right: 15.0),
                            child: Row(
                              children: [
                                const Icon(Icons.star_rounded, size: 17),
                                Text("4.5/5",
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Rp. 100.000 / hari",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: size.width,
                height: 7,
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: Text("Deskripsi Produk",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontWeight: FontWeight.w600)),
                      ),
                      Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sem vulputate condimentum fermentum, arcu sed. Ullamcorper enim, vitae venenatis, vitae urna porttitor massa pretium. Neque enim gravida sagittis pulvinar nunc nulla ultricies nisl iaculis. Enim felis, congue eget fermentum enim. Id diam dui lectus justo, dictum diam ac. Duis sed sit eu sed fermentum scelerisque vulputate dolor et. ",
                          style: Theme.of(context).textTheme.bodyText2!),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: size.width,
                height: 7,
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(bottom: 6.0, right: 8),
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    "https://images.unsplash.com/photo-1592878897400-43fb1f1cc324?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80}",
                                  ),
                                )),
                          )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bali Jas",
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          Text(
                            "Kota Denpasar",
                            style: Theme.of(context).textTheme.bodyText2,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: size.width,
                height: 7,
              ),
              Container(
                padding: EdgeInsets.only(left: 8),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6.0, top: 8.0),
                      child: Text("Lainnya Dari Toko Ini",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontWeight: FontWeight.w600)),
                    ),
                    HorizontalList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 50,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        side: BorderSide(
                          color: primaryColor900,
                        )),
                    child: Text(
                      "+ Keranjang",
                      style: Theme.of(context)
                          .textTheme
                          .button!
                          .copyWith(color: primaryColor900),
                    )),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/PaymentScreen');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor900,
                  ),
                  child: Text(
                    "Sewa Langsung",
                    style: Theme.of(context)
                        .textTheme
                        .button!
                        .copyWith(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
