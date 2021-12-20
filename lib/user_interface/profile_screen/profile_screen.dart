import 'package:capstone_project/style/color_style.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor900,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Profile",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: primaryColor100),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.only(bottom: 32, top: 24),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://images.unsplash.com/photo-1592878897400-43fb1f1cc324?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80}",
                          ),
                        )),
                  )),
            ],
          ),
          Expanded(
            child: Container(
              width: size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(45)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 28.0,
                      left: 28.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nama:",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: primaryColor100),
                        ),
                        Text(
                          "I Komang Roni Sudarmawan",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Divider(
                          thickness: 2,
                          color: primaryColor100,
                          endIndent: 28.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "Email:",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: primaryColor100),
                          ),
                        ),
                        Text(
                          "komang_ronisudarmawan@yahoo.com",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Divider(
                          thickness: 2,
                          color: primaryColor100,
                          endIndent: 28.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "Telepon:",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: primaryColor100),
                          ),
                        ),
                        Text(
                          "085792912012",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Divider(
                          thickness: 2,
                          color: primaryColor100,
                          endIndent: 28.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "Tanggal Lahir:",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: primaryColor100),
                          ),
                        ),
                        Text(
                          "31/12/2001",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Divider(
                          thickness: 2,
                          color: primaryColor100,
                          endIndent: 28.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "Alamat:",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: primaryColor100),
                          ),
                        ),
                        Text(
                          "Jalan Kenangan No. 5, Seririt",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Divider(
                          thickness: 2,
                          color: primaryColor100,
                          endIndent: 28.0,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 4,
                    color: primaryColor100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 28.0),
                        child: Text(
                          "Ubah Profil",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/EditProfileScreen');
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 15,
                          ))
                    ],
                  ),
                  Divider(
                    thickness: 2,
                    color: primaryColor100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 28.0),
                        child: Text(
                          "Ganti Password",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, '/ChangePasswordScreen');
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 15,
                          ))
                    ],
                  ),
                  Divider(
                    thickness: 2,
                    color: primaryColor100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 28.0),
                        child: Text(
                          "Sign Out",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.red),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/LoginScreen');
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 15,
                          ))
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
