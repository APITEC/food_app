import 'package:flutter/material.dart';

class Restaurant extends StatelessWidget {
  final name;
  final image;
  final price;
  final types;

  Restaurant({this.name, this.image, this.price, this.types});

  List<Chip> buildRestaurantTypes(List types) {
    List<Chip> chips = [];
    types.forEach((type) {
      chips.add(
        Chip(
          label: Text(
            type,
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey[600],
            ),
          ),
          backgroundColor: Colors.grey[50],
        ),
      );
    });
    return chips;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              image,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Min',
                            style: TextStyle(
                              fontFamily: 'Organo',
                              fontSize: 18,
                              color: Colors.grey[700],
                            ),
                          ),
                          Text(
                            ' - \$$price',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: buildRestaurantTypes(types),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.timer),
                          Text(
                            ' 10:00 - 18:00',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
