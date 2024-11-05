import 'package:flutter/material.dart';

class Tourwidget extends StatefulWidget {
  final String cityName;
  final String days;
  final String price;
  final String avatar;
  final String date; // Thêm thuộc tính date
  const Tourwidget({
    Key?
  key,
  required this.cityName,
    required this.days,
    required this.price,
    required this.avatar,
    required this.date, // Thêm vào constructor
  }):super(key: key);

  @override
  State<Tourwidget> createState() => _TourwidgetState();
}

class _TourwidgetState extends State<Tourwidget> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width*0.9,

      child: Card(
        child: Column(
          
          children: [
            Stack(
              children: [
                Image.asset(widget.avatar, width: double.infinity,height: 200,fit:BoxFit.cover,),
                Positioned(child: Row(
                  children: [
                    Icon(
                      Icons.star, 
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Text(
                      "142 likes",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    )
                  ],
                ),
                left: 10,
                bottom: 10,
                ),
              ],
            ),
            Padding(
              
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
             
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.cityName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:Colors.black.withOpacity(0.6)

                    ),
                  ),
                  InkWell(
                    onTap: ()
                    {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: isFavorite == false
                      ?Icon(Icons.favorite_border_outlined):
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                  )
                ],
              ),
            ), 
            Padding(
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Row(
                children: [
                  Icon(Icons.date_range),
                  Text("Jan 30, 2020", style: TextStyle(color:Colors.black.withOpacity(0.5),),),
                ],
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lock_clock),
                      Text(widget.days, style: TextStyle(color: Colors.black.withOpacity(0.5),),),
                    ],
                  ),
                  Text(widget.price, style: TextStyle(color:const Color.fromARGB(255, 110, 216, 205)),),
                ],
              ),
            )

          ],
        ),
      ),
      ),
    );
  }
}