import 'package:capstone_project/provider/authentication_provider.dart';
import 'package:capstone_project/style/color_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  TextEditingController nameTextController = TextEditingController();
  TextEditingController bornDateTextController = TextEditingController();
  TextEditingController phoneTextController = TextEditingController();
  TextEditingController addressTextController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor900,
      body:
          Consumer<AuthenticationProvider>(builder: (context, snapshot, child) {
        nameTextController.text = snapshot.user.name;
        bornDateTextController.text = DateTime.fromMillisecondsSinceEpoch(
                snapshot.user.bornDate!.millisecondsSinceEpoch)
            .toString();
        phoneTextController.text = snapshot.user.phoneNumber ?? "";
        addressTextController.text = snapshot.user.address ?? "";
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 6.0),
                    child: IconButton(
                        color: primaryColor600,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: primaryColor100,
                        )),
                  ),
                  Text(
                    "Ubah Profil",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: primaryColor100),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(45)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 48.0,
                    left: 28.0,
                    right: 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nama:",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: TextFormField(
                          controller: nameTextController,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: primaryColor900, width: 2),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: primaryColor900, width: 2),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Telepon:",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: TextFormField(
                          controller: phoneTextController,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: primaryColor900, width: 2),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: primaryColor900, width: 2),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Tanggal Lahir:",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: TextFormField(
                          controller: bornDateTextController,
                          onTap: () => _selectedDate(context),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: primaryColor900, width: 2),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: primaryColor900, width: 2),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Alamat:",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: TextFormField(
                          controller: addressTextController,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: primaryColor900, width: 2),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: primaryColor900, width: 2),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: ElevatedButton(
                            onPressed: () async {
                              final result =
                                  Provider.of<AuthenticationProvider>(context,
                                      listen: false);
                              await result.updateDataUser(
                                  nameTextController.text,
                                  phoneTextController.text,
                                  addressTextController.text,
                                  Timestamp.fromDate(DateTime.parse(
                                      bornDateTextController.text)));
                              Navigator.pushReplacementNamed(
                                  context, '/PageHelper');
                            },
                            style: ElevatedButton.styleFrom(
                                primary: primaryColor900,
                                shape: const StadiumBorder(),
                                fixedSize: Size(size.width, 20)),
                            child: Text(
                              "Ubah Profil",
                              style: Theme.of(context)
                                  .textTheme
                                  .button!
                                  .copyWith(color: Colors.white, fontSize: 15),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }

  Future<Null> _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(selectedDate.year - 60),
        lastDate: DateTime(selectedDate.year + 1));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
    }
    bornDateTextController.text = selectedDate.toString();
  }
}
