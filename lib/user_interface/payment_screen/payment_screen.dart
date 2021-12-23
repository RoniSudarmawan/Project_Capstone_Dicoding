import 'package:capstone_project/model/data_clothes_model.dart';
import 'package:capstone_project/provider/payment_provider.dart';
import 'package:capstone_project/style/color_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatelessWidget {
  DataClothes dataClothes;
  String clothesSize;
  int price;
  int duration;
  PaymentScreen(
      {Key? key,
      required this.dataClothes,
      required this.clothesSize,
      required this.price,
      required this.duration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: surface,
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 6.0),
                  child: IconButton(
                      color: primaryColor100,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: primaryColor900,
                      )),
                ),
                Text(
                  "Checkout",
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.network(
                    dataClothes.productImageUrl!,
                    width: 160,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dataClothes.name,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(
                      "Rp. " +
                          price.toString() +
                          " (" +
                          duration.toString() +
                          " hari)",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Size : " + clothesSize,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 4.0, top: 8.0, left: 8),
                  child: Text(
                    "Jasa Pengiriman",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: primaryColor100),
                  ),
                ),
                const Divider(
                  thickness: 3,
                  color: Colors.black,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 8.0, top: 4.0, left: 16),
                  child: Text("JnE - Rp. 10.500",
                      style: Theme.of(context).textTheme.subtitle1),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 4.0, top: 8.0, left: 8),
                  child: Text(
                    "Opsi Pembayaran",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: primaryColor100),
                  ),
                ),
                const Divider(
                  thickness: 3,
                  color: Colors.black,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 8.0, top: 4.0, left: 16),
                  child: Text("Transfer Bank - Rp. 1.500",
                      style: Theme.of(context).textTheme.subtitle1),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 4.0, top: 8.0, left: 8),
                  child: Text(
                    "Total Pembayaran",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: primaryColor100),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 4.0, top: 8.0, left: 16),
                      child: Text(
                        "Subtotal untuk penyewaan barang",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: primaryColor100),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 4.0, top: 8.0, right: 8),
                      child: Text(
                        "Rp. " + price.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: primaryColor100),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 4.0, top: 8.0, left: 16),
                      child: Text(
                        "Subtotal untuk jasa pengiriman",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: primaryColor100),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 4.0, top: 8.0, right: 8),
                      child: Text(
                        "Rp. 10.500",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: primaryColor100),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 4.0, top: 8.0, left: 16),
                      child: Text(
                        "Subtotal untuk jasa pembayaran",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: primaryColor100),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 4.0, top: 8.0, right: 8),
                      child: Text(
                        "Rp. 1.500",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: primaryColor100),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 4.0, top: 8.0, left: 16),
                      child: Text(
                        "Biaya Admin",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: primaryColor100),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 4.0, top: 8.0, right: 8),
                      child: Text(
                        "Rp. 1.500",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: primaryColor100),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 3,
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8.0, top: 4.0, left: 16),
                      child: Text("Total Pembayaran \t",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(fontWeight: FontWeight.w600)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8.0, top: 4.0, right: 8),
                      child: Text("Rp. ${price + 10500 + 1500 + 1500}",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
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
                    Provider.of<PaymentProvider>(context, listen: false)
                        .addRentData(dataClothes.id, clothesSize, duration,
                            (price + 10500 + 1500 + 1500));
                    Navigator.pushNamed(context, '/PageHelper');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor900,
                  ),
                  child: Text(
                    "Konfirmasi Penyewaan",
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
