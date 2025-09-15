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
                  colorSchemeSeed: Colors.indigo,
                ),
                child: Container(
                  color: const Color.fromRGBO(255, 205, 210, 1.0), // light red background
                  alignment: Alignment.center,
                  child: Builder(
                    builder: (ctx) => Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'My name is Christopher!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.2,
                              color: Theme.of(ctx).colorScheme.primary,
                            ),
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: ctx,
                                builder: (dialogCtx) => AlertDialog(
                                  content: const Text('Hello! This is a simple alert.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.of(dialogCtx).pop(),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: const Text('Show Alert'),
                          ),
                        ],
                      ),
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
                        'https://images.unsplash.com/photo-1638718619061-54b56803f459?q=80&w=774&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        width: 150,
                        height: 160,
                        ),
                        SizedBox(
                          width: 260,
                          child: TextField(
                            decoration: const InputDecoration(
                              labelText: 'Enter a caption',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          Theme(
                data: ThemeData(
                  useMaterial3: true,
                  colorSchemeSeed: Colors.purple,
                ),
                child: Container(
                  color: const Color.fromRGBO(230, 230, 250, 1.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Button pressed in ${tabs[2]} tab!'),
                          ),
                        );
                      },
                      child: Text('Click me'),
                    ),
                  ),
                ),
              ),
          Theme(
                data: ThemeData(
                  useMaterial3: true,
                  colorSchemeSeed: Colors.blue,
                ),
                child: Container(
                  color: const Color.fromRGBO(230, 230, 250, 1.0),
                  child: Builder(
                    builder: (ctx) => Center(
                      child: ListView(
                        children: [
                          Card(
                            child: ListTile(title: Text('Dog')),
                          ),
                          Card(
                            child: ListTile(title: Text('Cat')),
                          ),
                          Card(
                            child: ListTile(title: Text('Bird')),
                          ),
                          Card(
                            child: ListTile(title: Text('Mouse')),
                          ),
                        ],
                      )
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

