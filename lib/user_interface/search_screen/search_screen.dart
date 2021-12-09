import 'package:capstone_project/style/color_style.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var _urutan = "Default";
    var _kategori = "Semua";
    List<String> kategori = ['Semua', 'Jas', 'Kebaya', 'Kemeja', 'Aksesoris'];
    List<String> urutan = ['Default', 'Populer', 'Terbaru', 'Terlama'];
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                              width: size.width / 1.5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('Kategori :',
                                      style: TextStyle(
                                          fontSize: size.width / 20,
                                          fontWeight: FontWeight.w600)),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: size.width / 30,
                                        right: size.width / 100),
                                    width: size.width / 3,
                                    height: size.height / 20,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(54, 188, 178, 1),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                          elevation: 0,
                                          hint: Text(_kategori,
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          items: kategori
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value));
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
                            ),
                            SizedBox(height: size.height / 100),
                            Container(
                              width: size.width / 1.5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Urutkan :",
                                      style: TextStyle(
                                          fontSize: size.width / 20,
                                          fontWeight: FontWeight.w600)),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: size.width / 30,
                                        right: size.width / 100),
                                    width: size.width / 3,
                                    height: size.height / 20,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(54, 188, 178, 1),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                          elevation: 0,
                                          hint: Text(_urutan,
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          items: urutan
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
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
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ])));
  }
}
