import 'package:capstone_project/database/clothes_service.dart';
import 'package:capstone_project/helper/result_state.dart';
import 'package:capstone_project/provider/list_clothes_provider.dart';
import 'package:capstone_project/style/color_style.dart';
import 'package:capstone_project/user_interface/widget/list_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchTextController = TextEditingController();
  var _kategori = "Semua";
  List<String> kategori = ['Semua', 'Jas', 'Kebaya', 'Kemeja', 'Aksesoris'];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (_) => ListClothesProvider(clothesService: ClothesService()),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<ListClothesProvider>(
              builder: (context, snapshot, child) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 36.0, bottom: 12),
                    child: SizedBox(
                        height: 35,
                        child: TextField(
                          controller: searchTextController,
                          onSubmitted: (query) {
                            Provider.of<ListClothesProvider>(context,
                                    listen: false)
                                .searchClothes(query);
                          },
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text('Kategori :',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(color: Colors.black)),
                          ),
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                                color: primaryColor900,
                                borderRadius: BorderRadius.circular(20)),
                            padding: EdgeInsets.only(
                              left: size.width / 30,
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                  elevation: 0,
                                  hint: Text(_kategori,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(color: Colors.white)),
                                  items: kategori.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                        value: value, child: Text(value));
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _kategori = value!;
                                    });
                                    snapshot.filterClothes(_kategori);
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Consumer<ListClothesProvider>(
                    builder: (context, snapshot, child) {
                      if (snapshot.state == ResultState.hasData) {
                        final clothes = snapshot.listClothes;
                        return ListGridView(
                          context: context,
                          clothes: clothes,
                        );
                      } else if (snapshot.state == ResultState.isLoading) {
                        return Padding(
                          padding: EdgeInsets.only(top: size.height / 3),
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (snapshot.state == ResultState.noData) {
                        return Padding(
                          padding: EdgeInsets.only(top: size.height / 3),
                          child: Center(
                            child: Text(
                              "Data Tidak Ditemukan",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsets.only(top: size.height / 3),
                          child: Center(
                            child: Text(
                              "Aplikasi Gagal Dimuat, Silahkan Coba Lagi!",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        );
                      }
                    },
                  )
                ]);
          }),
        ),
      ),
    );
  }
}
