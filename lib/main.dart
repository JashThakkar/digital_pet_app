import 'package:flutter/material.dart'; // Standard Flutter UI widgets

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget { // App "blueprint"
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: _TabsNonScrollableDemo(),
      ),
    );
  }
}

class _TabsNonScrollableDemo extends StatefulWidget {
  @override
  __TabsNonScrollableDemoState createState() => __TabsNonScrollableDemoState();
}

class __TabsNonScrollableDemoState extends State<_TabsNonScrollableDemo>
    with SingleTickerProviderStateMixin, RestorationMixin {
  late TabController _tabController;

  final RestorableInt tabIndex = RestorableInt(0);

  @override
  String get restorationId => 'tab_non_scrollable_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(tabIndex, 'tab_index');
    _tabController.index = tabIndex.value;
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
    _tabController.addListener(() {
      setState(() => tabIndex.value = _tabController.index);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    tabIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = ['Tab 1', 'Tab 2', 'Tab 3', 'Tab 4'];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Tabs Demo'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: false,
          tabs: [for (final tab in tabs) Tab(text: tab)],
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: [
          Theme(
                data: ThemeData(
                  useMaterial3: true,
                  colorSchemeSeed: Colors.green,
                ),
                child: Container(
                  color: const Color.fromRGBO(255, 255, 224, 1.0),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                        'https://unsplash.com/photos/dog-running-on-beach-during-daytime-yihlaRCCvd4',
                        width: 150,
                        height: 160,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          Theme(
                data: ThemeData(
                  useMaterial3: true,
                  colorSchemeSeed: Colors.green,
                ),
                child: Container(
                  color: const Color.fromRGBO(255, 255, 224, 1.0),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                        'https://t3.ftcdn.net/jpg/02/36/99/22/360_F_236992283_sNOxCVQeFLd5pdqaKGh8DRGMZy7P4XKm.jpg',
                        width: 150,
                        height: 160,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          Theme(
                data: ThemeData(
                  useMaterial3: true,
                  colorSchemeSeed: Colors.green,
                ),
                child: Container(
                  color: const Color.fromRGBO(255, 255, 224, 1.0),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                        'https://t4.ftcdn.net/jpg/01/66/10/03/360_F_166100342_KbTGIRrnrlwGDZSXSMpH3zfn2dxyTKae.jpg',
                        width: 150,
                        height: 160,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            
          Theme(
                data: ThemeData(
                  useMaterial3: true,
                  colorSchemeSeed: Colors.green,
                ),
                child: Container(
                  color: const Color.fromRGBO(255, 255, 224, 1.0),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                        'https://media.istockphoto.com/id/115962508/photo/zebra.jpg?s=612x612&w=0&k=20&c=edasI8Wc4_BQ1KL9Mw2LL__MdtnecACK0Znh5rDRpHU=',
                        width: 150,
                        height: 160,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          
          // for (final tab in tabs) Center(child: Text(tab)),
        ],
      ),

      bottomNavigationBar: BottomAppBar(),
    );
  }
}

