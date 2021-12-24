import 'package:capstone_project/database/rent_service.dart';
import 'package:capstone_project/helper/result_state.dart';
import 'package:capstone_project/provider/rent_history_provider.dart';
import 'package:capstone_project/style/color_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RentHistoryScreen extends StatelessWidget {
  const RentHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RentHistoryProvider(rentService: RentService()),
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Rent History",
                    style: Theme.of(context).textTheme.headline6,
                  )
                ],
              ),
            ),
            Consumer<RentHistoryProvider>(builder: (context, snapshot, child) {
              if (snapshot.state == ResultState.hasData) {
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 6.0, right: 8),
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          snapshot
                                              .listRent[index].productImageUrl!,
                                        ),
                                      )),
                                )),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.listRent[index].clothesName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1!
                                              .copyWith(color: Colors.black),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Text(
                                            "Rp. " +
                                                snapshot.listRent[index].total
                                                    .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2!
                                                .copyWith(color: Colors.black),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Text(
                                            "Status: Sedang Dikirim",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2!
                                                .copyWith(color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 2,
                                      color: primaryColor100,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: snapshot.listRent.length,
                  ),
                );
              } else if (snapshot.state == ResultState.isLoading) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Center(
                      child: Text(
                          "Terjadi Error, Silahkan Buka Ulang Aplikasi Anda!"),
                    ),
                  ],
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
