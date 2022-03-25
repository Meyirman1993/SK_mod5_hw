import 'package:flutter/material.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MainPageWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  int _selectedIndex = 0;
  final List<Widget> _widgetList = <Widget>[
    Image.asset(
      'assets/images/index.jpg',
    ),
    Image.network(
        'https://avatars.mds.yandex.net/get-ott/1652588/2a00000167fa75d2172d17922a71191efb69/1344x756'),
    Image.network(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9H8tVE6PlK0m-0XUAqrHlTplRRadyWU4SeA&usqp=CAU')
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return FloatingActionButton.extended(
            onPressed: () {
              Scaffold.of(context).showBottomSheet<void>(
                  (BuildContext context) => Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.amber,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text('data'),
                              const Text('data'),
                              const Text('data'),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Exit'))
                            ],
                          ),
                        ),
                      ),
                  clipBehavior: Clip.antiAlias);
            },
            label: const Text('Some Text'),
            icon: const Icon(Icons.abc_outlined),
          );
        },
      ),
      drawer: const _DrawerLeft(),
      endDrawer: const _EndDrawerUserInfo(),
      appBar: AppBar(
        title: Text(widget.title),
        actions: const [_EndDrawerOpenKey()],
      ),
      body: Center(
        child: _widgetList.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomAppBar(
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.image_outlined), label: 'MonaLisa'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.image_outlined), label: 'Konstantin'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.image_outlined), label: 'Dr. Strange')
            ],
            onTap: _onItemTapped,
            currentIndex: _selectedIndex,
          )),
    );
  }
}

class _EndDrawerUserInfo extends StatelessWidget {
  const _EndDrawerUserInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        DrawerHeader(
          child: CircleAvatar(
            foregroundImage: AssetImage('assets/images/eminem.jpg'),
            radius: 50,
            backgroundColor: Color(0xFFE53935),
          ),
        ),
        Text('Eminem Marshall')
      ],
    ));
  }
}

class _EndDrawerOpenKey extends StatelessWidget {
  const _EndDrawerOpenKey({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => IconButton(
        onPressed: () {
          Scaffold.of(context).openEndDrawer();
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return Column();
              });
        },
        icon: const Icon(Icons.person_outlined),
      ),
    );
  }
}

class _DrawerLeft extends StatelessWidget {
  const _DrawerLeft({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const DrawerHeader(
                  child: CircleAvatar(
                    foregroundImage: NetworkImage(
                        'https://avatars.mds.yandex.net/get-zen_doc/1578824/pub_5fa3ad16f278637dd4502183_5fae561c4278375e7e436df5/scale_1200'),
                    radius: 60,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.perm_contact_calendar_sharp),
                  onTap: () {},
                  title: const Text('Profile'),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                ),
                ListTile(
                  leading: const Icon(Icons.image_sharp),
                  title: const Text('Images'),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  onTap: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Выход'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xFF9E9E9E),
                    ),
                    foregroundColor: MaterialStateProperty.all(
                      const Color(0xDD000000),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Регистрация'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xFF9E9E9E),
                    ),
                    foregroundColor: MaterialStateProperty.all(
                      const Color(0xDD000000),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
