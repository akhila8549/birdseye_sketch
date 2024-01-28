import 'package:flutter/material.dart';
import 'package:birdseye_sketch/year_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sketch',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Sketch'),
            bottom: TabBar(tabs: [
              Tab(icon: Icon(Icons.calendar_month), text: 'Season'),
              Tab(icon: Icon(Icons.emoji_events), text: 'Event'),
              Tab(icon: Icon(Icons.groups), text: 'Team'),
            ]),
          ),
          body: TabBarView(children: [
            // under the Season tab:
            SizedBox(
              height: 400,
              child: Column(children: [
                Yearpicker(
                    List.generate(41, (index) => DateTime(2000 + index))),
                Text('NUMBER HERE scouters'),
                Text('NUMBER HERE matches'),
                Text('NUMBER HERE teams')
              ]),
            ),
            // under the Events tab:
            SizedBox(
                height: 400,
                child: Column(children: [
                  Expanded(
                      child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ListTile(
                          contentPadding: EdgeInsets.all(20),
                          leading: const Icon(Icons.emoji_events),
                          trailing: Column(
                            children: [
                              Text('MATCH $index'),
                              Text('TEAM $index'),
                              Text('$index scouters')
                            ],
                          ),
                          title: Text('EVENT HERE'));
                    },
                  ))
                ])),
            // Teams tab
            SizedBox(
                height: 400,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return ListTile(
                                contentPadding: EdgeInsets.all(20),
                                leading: const Icon(Icons.groups),
                                trailing: Column(children: [
                                  Text('$index/10 MATCHES'),
                                  Text('XYZ RANK')
                                ]),
                                title: Text('TEAM $index'));
                          }),
                    )
                  ],
                ))
          ]),
        ));
  }
}
