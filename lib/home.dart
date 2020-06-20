import 'package:flutter/material.dart';

// Widgets
import 'restaurant.dart';
import 'menu_button.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  List restaurants = [
    {
      'name': 'Pizza',
      'image':
          'https://media-cdn.tripadvisor.com/media/photo-s/05/75/ff/d2/una-pizza-napoletana.jpg',
      'price': '25',
      'types': ['American', 'Italian']
    },
    {
      'name': 'Burgers',
      'image':
          'https://www.gannett-cdn.com/presto/2019/04/10/PDTF/2722d7b5-fc31-4c19-a227-0a93242df2d8-SHAKESHACKcjessicagiesey-104.jpg?crop=4793,2696,x0,y0&width=3200&height=1680&fit=bounds',
      'price': '15',
      'types': ['Fast Food']
    },
    {
      'name': 'Sushi',
      'image':
          'https://b.zmtcdn.com/data/pictures/chains/4/16790024/c0318b82a9003d4fe951f81980bafdab.jpg',
      'price': '30',
      'types': ['Japanese']
    },
  ];
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
        leading: MenuButton(icon: Icons.search, color: Colors.grey[50]),
        actions: <Widget>[
          MenuButton(icon: Icons.search, color: Colors.grey[200]),
          MenuButton(icon: Icons.list, color: Colors.grey[200]),
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
                  return foodTypeButton(index);
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
                  return Restaurant(
                    name: restaurants[index]['name'],
                    image: restaurants[index]['image'],
                    price: restaurants[index]['price'],
                    types: restaurants[index]['types'],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 20),
                itemCount: restaurants.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector foodTypeButton(int index) {
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
              color: selectedIndex == index ? Colors.indigo : Colors.white,
            ),
            child: Icon(
              icons[index % 4],
              color: selectedIndex == index ? Colors.white : Colors.grey,
              size: 50,
            ),
          ),
        ),
      ),
    );
  }
}
