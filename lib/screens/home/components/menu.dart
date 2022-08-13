import 'package:flutter/material.dart';

import 'package:flutter_project/screens/login/login.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu TÂN"),
        backgroundColor: Colors.green[700],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: const Text(
              "TAN IT",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
            ),
            accountEmail: const Text("tanit91.nina@gmail.com"),
            currentAccountPicture: const CircleAvatar(
              backgroundImage:
                  NetworkImage("http://demo023.ninavietnam.org/AVATAR.jpg"),
            ),
            decoration: BoxDecoration(color: Colors.green[700]),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Trang Chủ"),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ExpansionTile(
            leading: const Icon(Icons.category_sharp),
            title: const Text("Sản Phẩm"),
            children: <Widget>[
              ListTile(
                //leading: Icon(Icons.arrow_right),
                leading: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    width: 48,
                    height: 48,
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    alignment: Alignment.center,
                    //child: const CircleAvatar(),
                    child: const Icon(Icons.chevron_right),
                  ),
                ),
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NavDrawer()))
                },
                title: const Text("Thời Trang Nam"),
                subtitle: const Text('Đẹp Hết chỗ Nói'),
              ),
              ListTile(
                leading: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    width: 48,
                    height: 48,
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    alignment: Alignment.center,
                    child: const Icon(Icons.chevron_right),
                  ),
                ),
                title: const Text("Thời Trang Nữ"),
                subtitle: const Text('Đẹp Hết chỗ Nói'),
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NavDrawer()))
                },
              ),
              ListTile(
                leading: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {},
                  child: Container(
                    width: 48,
                    height: 48,
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    alignment: Alignment.center,
                    child: const Icon(Icons.chevron_right),
                  ),
                ),
                title: const Text("Thời Trang Em Bé"),
                subtitle: const Text('Đẹp Hết chỗ Nói'),
              ),
              ListTile(
                leading: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {},
                  child: Container(
                    width: 48,
                    height: 48,
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    alignment: Alignment.center,
                    child: const Icon(Icons.chevron_right),
                  ),
                ),
                title: const Text("Thời Trang Tomboy"),
                subtitle: const Text('Đẹp Hết chỗ Nói'),
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.content_copy),
            title: const Text("Tin Tức"),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text("Giỏ Hàng"),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text("Liên Hệ"),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Tài Khoản"),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text("Đăng Nhập"),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ))
            },
          ),
          const SizedBox(
            height: 5.0,
          ),
          const Divider(color: Colors.black12),
          const SizedBox(
            height: 5.0,
          ),
        ],
      ),
    );
  }
}
