import 'package:capstone_project/database/clothes_service.dart';
import 'package:capstone_project/helper/result_state.dart';
import 'package:capstone_project/model/data_clothes_model.dart';
import 'package:capstone_project/provider/bottom_sheet_provider.dart';
import 'package:capstone_project/provider/detail_clothes_provider.dart';
import 'package:capstone_project/style/color_style.dart';
import 'package:capstone_project/user_interface/payment_screen/payment_screen.dart';
import 'package:capstone_project/user_interface/widget/horizontal_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  final String clothesId;
  DetailScreen({Key? key, required this.clothesId}) : super(key: key);

  List<String> sizeClothes = ['S', 'M', 'L', 'XL'];
  TextEditingController rentTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<DetailClothesProvider>(
            create: (_) => DetailClothesProvider(
              clothesService: ClothesService(),
              clothesId: clothesId,
            ),
          ),
        ],
        child: Consumer<DetailClothesProvider>(
            builder: (context, snapshot, child) {
          if (snapshot.state == ResultState.hasData) {
            print(snapshot.clothesData.review.length);
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
                            snapshot.clothesData.productImageUrl!,
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(color: Colors.black),
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
                                                .subtitle1!
                                                .copyWith(color: Colors.black)),
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
                                    .copyWith(
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black),
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
                                        .copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black)),
                              ),
                              Text(snapshot.clothesData.description,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(color: Colors.black)),
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
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            snapshot
                                                .clothesData.productImageUrl!,
                                          ),
                                        )),
                                  )),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.clothesData.shopName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(color: Colors.black),
                                  ),
                                  Text(
                                    snapshot.clothesData.shopLocation,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(color: Colors.black),
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
                                      .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black)),
                            ),
                            HorizontalList(
                              context: context,
                              clothes: snapshot.listClothes,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width,
                        height: 7,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 8),
                        color: Colors.white,
                        width: size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 6.0, top: 8.0),
                              child: Text("Review",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black)),
                            ),
                            // Flexible(
                            //   child: ReviewListView(
                            //     reviewData: snapshot.clothesData.review,
                            //     context: context,
                            //   ),
                            // )
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
                      ElevatedButton(
                          onPressed: () {
                            buildShowModalBottomSheet(
                                context, size, snapshot.clothesData);
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
        }));
  }

  Future<void> buildShowModalBottomSheet(
      BuildContext context, Size size, DataClothes dataClothes) {
    return showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return ChangeNotifierProvider(
            create: (_) => BottomSheetProvider(dataPrice: dataClothes.price),
            child: Consumer<BottomSheetProvider>(
                builder: (context, snapshot, child) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: size.height / 3.2,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Image.network(
                                dataClothes.productImageUrl!,
                                width: size.width / 4,
                                height: size.height / 7,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  dataClothes.name,
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text(
                                  "Rp. " + snapshot.price.toString(),
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              "Lama Penyewaan:",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: InkWell(
                                  child: Text(
                                    " - ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                  ),
                                  onTap: () {
                                    snapshot.setDuration = -1;
                                  },
                                ),
                              ),
                              Text(
                                snapshot.duration.toString() + " hari",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(color: Colors.black),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: InkWell(
                                  child: Text(
                                    " + ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                  ),
                                  onTap: () {
                                    snapshot.setDuration = 1;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                "Size:",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(color: Colors.black),
                              ),
                            ),
                            Container(
                              height: 25,
                              decoration: BoxDecoration(
                                  color: primaryColor900,
                                  borderRadius: BorderRadius.circular(20)),
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                    elevation: 0,
                                    hint: Text(snapshot.size,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(color: Colors.white)),
                                    items: sizeClothes
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                          value: value, child: Text(value));
                                    }).toList(),
                                    onChanged: (value) {
                                      snapshot.setSize = value!;
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PaymentScreen(
                                            dataClothes: dataClothes,
                                            clothesSize: snapshot.size,
                                            price: snapshot.price,
                                            duration: snapshot.duration)));
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
                      )
                    ],
                  ),
                ),
              );
            }),
          );
        });
  }
}
