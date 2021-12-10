import 'package:capstone_project/style/color_style.dart';
import 'package:capstone_project/user_interface/widget/list_grid_view.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var _urutan = "Default";
  var _kategori = "Semua";
  List<String> kategori = ['Semua', 'Jas', 'Kebaya', 'Kemeja', 'Aksesoris'];
  List<String> urutan = ['Default', 'Populer', 'Terbaru', 'Terlama'];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 36.0, bottom: 12),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text('Kategori :',
                            style: Theme.of(context).textTheme.bodyText2),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: size.width / 30,
                        ),
                        width: 130,
                        height: 30,
                        decoration: BoxDecoration(
                            color: primaryColor900,
                            borderRadius: BorderRadius.circular(20)),
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
                              }),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text('Urutan :',
                            style: Theme.of(context).textTheme.bodyText2),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: size.width / 30, right: size.width / 100),
                        width: 130,
                        height: 30,
                        decoration: BoxDecoration(
                            color: primaryColor900,
                            borderRadius: BorderRadius.circular(20)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                              elevation: 0,
                              hint: Text(_urutan,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(color: Colors.white)),
                              items: urutan.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                    value: value, child: Text(value));
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _urutan = value!;
                                });
                              }),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ListGridView(),
            ]),
      ),
    );
  }
}
