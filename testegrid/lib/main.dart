import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildGridViewWithBuild(),
    );
  }

  Widget _gridViewSimples() {
    return GridView.count(
      // maxCrossAxisExtent: 100,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      crossAxisCount: 3,
      children: List.generate(
        9,
        (index) => _buildItem(index),
      ),
    );
  }

  Widget _buildGridViewWithBuild() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          // maxCrossAxisExtent: 100,
          // padding: const EdgeInsets.all(4),
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          crossAxisCount: 2,
        ),
        itemCount: 300,
        itemBuilder: (context, index) => _buldCard(index));
  }

  Widget _buildItem(int index) {
    return Stack(
      children: [
        Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(100),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://picsum.photos/id/$index/200/300',
            ),
            radius: 100,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            color: Colors.black45,
            child: Text(
              'Nome pessoa $index',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buldCard(int index) {
    return Card(
      elevation: 4,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Image.network(
                    'https://picsum.photos/id/$index/200/300',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.black45,
                    child: const Text(
                      'Nome da pessoa',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Pessoa $index'),
            subtitle: const Text('Lorem ipsum dolor'),
          ),
          ButtonBar(
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Like'),
              )
            ],
          )
        ],
      ),
    );
  }
}
