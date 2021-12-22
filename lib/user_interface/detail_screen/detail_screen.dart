import 'package:capstone_project/database/clothes_service.dart';
import 'package:capstone_project/helper/result_state.dart';
import 'package:capstone_project/provider/detail_clothes_provider.dart';
import 'package:capstone_project/style/color_style.dart';
import 'package:capstone_project/user_interface/widget/horizontal_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  final String clothesId;
  const DetailScreen({Key? key, required this.clothesId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<DetailClothesProvider>(
        create: (_) => DetailClothesProvider(
            clothesService: ClothesService(), clothesId: clothesId),
        child: Scaffold(
          backgroundColor: surface,
          body: Consumer<DetailClothesProvider>(
              builder: (context, snapshot, child) {
            if (snapshot.state == ResultState.hasData) {
              return NestedScrollView(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    snapshot.clothesData.name,
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, right: 15.0),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.star_rounded,
                                            size: 17),
                                        Text("4.5/5",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Rp. " +
                                    snapshot.clothesData.price.toString() +
                                    "/hari",
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
                              Text(snapshot.clothesData.description,
                                  style:
                                      Theme.of(context).textTheme.bodyText2!),
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
                                  padding: const EdgeInsets.only(
                                      bottom: 6.0, right: 8),
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
                                    snapshot.clothesData.shopName,
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                  Text(
                                    snapshot.clothesData.shopLocation,
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
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
                              padding:
                                  const EdgeInsets.only(bottom: 6.0, top: 8.0),
                              child: Text("Lainnya Dari Toko Ini",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(fontWeight: FontWeight.w600)),
                            ),
                            const HorizontalList(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.state == ResultState.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Center(
                child: Text(
                  "Aplikasi Gagal Dimuat, Silahkan Coba Lagi!",
                  style: Theme.of(context).textTheme.headline6,
                ),
              );
            }
          }),
          bottomNavigationBar: Container(
            color: Colors.white,
            height: 50,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
        ));
  }
}
