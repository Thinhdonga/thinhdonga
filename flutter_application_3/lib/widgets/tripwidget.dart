import 'package:flutter/material.dart';

class Tripwidget extends StatefulWidget {
  final String avatar;
  final String cityName;
  final String date;
  final String customerName;
  final String avatarCus;
  final String tripName;
  
  const Tripwidget({
   Key?
  key,
  required this.avatar,
  required this.avatarCus,
  required this.cityName,
  required this.customerName,
  required this.date,
  required this.tripName,
  
   }):super(key: key);

  @override
  State<Tripwidget> createState() => _TripwidgetState();
}

class _TripwidgetState extends State<Tripwidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Container(
        width: MediaQuery.of(context).size.width*0.9,
        child: Card(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(widget.avatar,width: double.infinity,height: 200,fit: BoxFit.cover,),
                  Positioned(
                    
                    child: Row
                    (
                    children: [
                     
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      (SizedBox(width: 10,)),
                     // Text
                     Text(
                      widget.cityName,
                      style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,),
                     ),
                      

                    ],
                  ),
                  
                  left: 10,
                  bottom: 10,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(9.0), // Thêm padding để không chạm sát cạnh
                      child: Icon(
                        Icons.more_horiz, 
                        size: 30.0,
                        color: Colors.white,
                      ),
                    ),
                            ),
                ],
              ),
              


              // Khunng du lieu duoi
              Container(
                padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          
                          children: [
                        Text(widget.tripName,style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),)
                      ],
                    ),SizedBox(height: 10,),
                    Row(
                      
                      children: [
                        Icon(Icons.date_range),
                        Text("Feb 2 , 2020", style: TextStyle(color:Colors.black.withOpacity(0.5),),),
                      ],
                    ),SizedBox(height: 5,),
                    Row(
                      children: [
                        Icon(Icons.lock_clock),
                        Text(widget.date, style: TextStyle(color:Colors.black.withOpacity(0.5),),),
                      ],
                    ),SizedBox(height: 5,),
                    Row(
                      children: [
                        Icon(Icons.person),
                        Text(widget.customerName, style: TextStyle(color:Colors.black.withOpacity(0.5),),),
                      ],
                    ),SizedBox(height: 10,),
                    // Detail
                   Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Container cho Detail
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5), // Thêm padding bên trong
                          width: 80,
                          height: 35,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.teal,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10), // Bo góc
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center, // Căn giữa
                            children: [
                              Icon(Icons.lock_clock, color: Colors.teal),
                              SizedBox(width: 5),
                              Text(
                                "Detail",
                                style: TextStyle(
                                  color: Colors.teal.withOpacity(0.8), // Tăng độ đậm cho màu
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
    // Container cho Chat
    Container(
      padding: EdgeInsets.symmetric(horizontal: 5), // Thêm padding bên trong
      width: 80,
      height: 35,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.teal,
            width: 1,
          ),
        borderRadius: BorderRadius.circular(10), // Bo góc
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Căn giữa
        children: [
          Icon(Icons.chat, color: Colors.teal),
          SizedBox(width: 5),
          Text(
            "Chat",
            style: TextStyle(
              color: Colors.teal.withOpacity(0.8), // Tăng độ đậm cho màu
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
    // Container cho Start
    Container(
      padding: EdgeInsets.symmetric(horizontal: 5), // Thêm padding bên trong
      width: 80,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.teal,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10), // Bo góc
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Căn giữa
        children: [
          Icon(Icons.flag, color: Colors.teal),
          SizedBox(width: 5),
          Text(
            "Start",
            style: TextStyle(
              color: Colors.teal.withOpacity(0.8), // Tăng độ đậm cho màu
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  ],
),
                    ],
                    
                     ),
                    ),
                    
                    CircleAvatar(
                      radius: 30, 
                      child:Image.asset(widget.avatarCus,width: double.infinity,fit: BoxFit.cover,), 
                      ),SizedBox(height: 15,),
                      
                ],
                
                ),
                
              ),
              

            ],
          ),
          
        ),
      ),
    );
  }
}