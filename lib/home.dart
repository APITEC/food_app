import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  List icons = [
    Icons.local_pizza,
    Icons.fastfood,
    Icons.free_breakfast,
    Icons.local_drink,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.grey[700],
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          MenuButton(icon: Icons.search),
          MenuButton(icon: Icons.list),
        ],
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              'Hello, Dilan',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 40),
            ),
            subtitle: Text(
              'What do you want to eat?',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 40, 0, 30),
            child: Container(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(7),
                        elevation: selectedIndex == index ? 3 : 0,
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: selectedIndex == index
                                ? Colors.indigo
                                : Colors.white,
                          ),
                          child: Icon(
                            icons[index % 4],
                            color: selectedIndex == index
                                ? Colors.white
                                : Colors.grey,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Pizza  ·  ',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
                ),
                Text(
                  'delivery \$15 (15-20min)',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            'https://i.pinimg.com/474x/8c/93/d3/8c93d35df867bf1e169cbd2c4718b1f2--cookbook-photography-ingredient-photography.jpg',
                            fit: BoxFit.cover,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          height: 110,
                          width: 382,
                          child: Container(
                            padding: EdgeInsets.all(16),
                            height: 110,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Pizza House',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 25),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          'Min',
                                          style: TextStyle(
                                              fontFamily: 'Organo',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20,
                                              color: Colors.grey[700]),
                                        ),
                                        Text(' - \$20',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                                color: Colors.grey[700]))
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 4.0),
                                          child: Chip(
                                            label: Text(
                                              'American',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                            backgroundColor: Colors.grey[50],
                                          ),
                                        ),
                                        Chip(
                                          label: Text(
                                            'Italian',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          backgroundColor: Colors.grey[50],
                                        )
                                      ],
                                    ),
                                    Text('Test')
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 20),
                itemCount: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final icon;
  MenuButton({this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[200]),
            height: 40,
            width: 40,
            child: InkWell(
              borderRadius: BorderRadius.circular(40),
              onTap: () {},
              child: Icon(
                icon,
                color: Colors.grey[700],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
