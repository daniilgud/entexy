import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.filter_alt),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Center(
          child: Text('Флеты'),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                )),
            margin: EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() {
                      _selectedTabIndex = 0;
                    }),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: _selectedTabIndex == 0
                            ? Theme.of(context).colorScheme.primary
                            : Colors.transparent,
                      ),
                      child: Center(
                        child: Text('Список'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() {
                      _selectedTabIndex = 1;
                    }),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: _selectedTabIndex == 1
                            ? Theme.of(context).colorScheme.primary
                            : Colors.transparent,
                      ),
                      child: Center(
                        child: Text('Карта'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          MainTabContent(tabIndex: _selectedTabIndex),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.sunny),
          label: 'Погода',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Главная',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: 'ЧатХуят',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_box),
          label: 'Профиль',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Theme.of(context).colorScheme.secondary,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class MainTabContent extends StatelessWidget {
  final int tabIndex;
  final List<HomeCardData> dataItems = _cards();

  MainTabContent({
    required this.tabIndex,
  });

  @override
  Widget build(BuildContext context) {
    return tabIndex == 1
        ? const Placeholder()
        : Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: ListView.separated(
                itemCount: dataItems.length,
                itemBuilder: (_, int index) {
                  return HomeCard(dataItems[index]);
                },
                separatorBuilder: (_, __) => SizedBox(
                  height: 3.0,
                ),
              ),
            ),
          );
  }
}

class HomeCardData {
  final String assetName;
  final String title;
  final String description;
  bool isFavourite;

  HomeCardData(this.assetName, this.title, this.description, this.isFavourite);
}

List<HomeCardData> _cards() {
  return <HomeCardData>[
    HomeCardData(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSY_ccM0gDhP63z9tb39_NBrio03iPi15o2ew&usqp=CAU',
        'title',
        'vdfkjvnjdf vndfvndofv',
        false),
    HomeCardData(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSY_ccM0gDhP63z9tb39_NBrio03iPi15o2ew&usqp=CAU',
        'title',
        'vdfkjvnjdf vndfvndofv',
        false),
    HomeCardData(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSY_ccM0gDhP63z9tb39_NBrio03iPi15o2ew&usqp=CAU',
        'title',
        'vdfkjvnjdf vndfvndofv',
        false),
    HomeCardData(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSY_ccM0gDhP63z9tb39_NBrio03iPi15o2ew&usqp=CAU',
        'title',
        'vdfkjvnjdf vndfvndofv',
        false),
    HomeCardData(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSY_ccM0gDhP63z9tb39_NBrio03iPi15o2ew&usqp=CAU',
        'title',
        'vdfkjvnjdf vndfvndofv',
        false),
    HomeCardData(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSY_ccM0gDhP63z9tb39_NBrio03iPi15o2ew&usqp=CAU',
        'title',
        'vdfkjvnjdf vndfvndofv',
        false),
    HomeCardData(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSY_ccM0gDhP63z9tb39_NBrio03iPi15o2ew&usqp=CAU',
        'title',
        'vdfkjvnjdf vndfvndofv',
        false),
  ];
}

class HomeCard extends StatefulWidget {
  final HomeCardData data;

  const HomeCard(this.data);

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Theme.of(context).colorScheme.secondaryContainer),
      padding: EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 5.0),
          Image.network(
            widget.data.assetName,
            width: 100.0,
            height: 100.0,
          ),
          SizedBox(width: 5.0),
          Column(
            children: [
              Text(widget.data.title),
              Row(
                children: [
                  Text(widget.data.description),
                  IconButton(
                    onPressed: () {
                      widget.data.isFavourite = !widget.data.isFavourite;
                      setState(() {});
                    },
                    icon: Icon(
                      widget.data.isFavourite
                          ? Icons.favorite
                          : Icons.favorite_outline_rounded,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
