import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Tour List
import 'models/tour.dart';
import 'widgets/tourwidget.dart';
// Add photo
import 'models/photo.dart';
import 'widgets/photowidget.dart';
// My trip
import 'models/trip.dart';
import 'widgets/tripwidget.dart';
// My Exprience

import 'models/exprience.dart';
import 'widgets/expriencewidget.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tour list',
      debugShowCheckedModeBanner: false,
      home: const FirstPage(title: 'Tour List'),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key, required this.title});


  final String title;

  
  @override
  Widget build(BuildContext context) {
    List<Tour> lsTours = [
      Tour("images/danang.png", "Uc - Sydney", "Sept 30, 2022", "\$1000", "07 days"),
      Tour("images/halong.png", "HaNoi - Ha Long", "Feb 20, 2021", "\$200", "05 days"),
      Tour("images/Uc.png", "DaNang - Ba Na", "Jan 30, 2020", "\$600", "03 days"),
    ];
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.white,
        // Trang chu
        title: Text(title),
        actions: [
          TextButton(
            onPressed: () {
              // Điều hướng đến SecondPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondPage()),
              );
            },
            child: const Text(
              " Add photo",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(padding: 
        const EdgeInsets.symmetric(horizontal: 500,
          vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          
          children:[
            // Background image
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/footer.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // App bar với nút back và tín hiệu di động
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Nút back
                  GestureDetector(
                    onTap: () {
                      // Xử lý khi nhấn back
                    },
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  // Các icon tín hiệu
                  Row(
                    children: [
                      Icon(Icons.signal_cellular_alt, color: Colors.white),
                      SizedBox(width: 5),
                      Icon(Icons.wifi, color: Colors.white),
                      SizedBox(width: 5),
                      Icon(Icons.battery_full, color: Colors.white),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Nội dung chính với tiêu đề và thanh tìm kiếm
          Padding(
            padding: const EdgeInsets.only(top: 280,  // Vị trí cách phần trên của hình ảnh để đè một phần
            left: 16,
            right: 16,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Plenty of amazing tours are waiting for you',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                // Thanh tìm kiếm
                Positioned( top: 280,
                left: 16, right: 16,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 241, 238, 238),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.search),
                      hintText: 'Hi, where do you want to explore?',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                ),
              ],
            ),
          ),
              ],
        ),
         SizedBox(height: 20,),

            // Danh sach Tour
            ListView.builder(shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // Để tránh cuộn bên trong ListView
              itemCount: lsTours.length,
              itemBuilder: (context, index){
                Tour tour = lsTours[index];
                return Padding(padding: 
                 const EdgeInsets.only(bottom: 16.0),
                 child: Tourwidget(
                  avatar: tour.avatar,
                  cityName: tour.cityName,
                  date: tour.date,
                  price: tour.price,
                  days: tour.days,
                 ),
                );
              },
            ),SizedBox(height: 30,),
            Center(
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Image.asset("images/daucham.png"),
              ],
            ),
            
            ),SizedBox(height: 50,),
           Center(
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Image.asset("images/thanhngang.png"),
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
// Add Photo
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});
  @override
  Widget build(BuildContext context) {
    List<Photo> lsPhotos =[
      Photo("images/photo/take_photo.jpg","images/photo/thap.png","images/photo/tree.png"),
      Photo("images/photo/ho.png","images/photo/nui.png","images/photo/bien.png"),
      Photo("images/photo/ho.png","images/photo/food.png","images/photo/tree.png")
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add photo'),
        actions: [
          TextButton(
            onPressed: () {
              // Điều hướng đến SecondPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ThirdPage()),
              );
            },
            child: const Text(
              " Sign Up",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),


      body: SingleChildScrollView(
        child:Column(
          children: [
            // Thanh trạng thái
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 500, vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Thanh trang thái (ví dụ 9:40, tín hiệu, wifi)
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "9:40",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          children: const [
                            Icon(Icons.signal_cellular_4_bar, size: 20, color: Colors.black),
                            SizedBox(width: 6),
                            Icon(Icons.wifi, size: 20, color: Colors.black),
                            SizedBox(width: 6),
                            Icon(Icons.battery_full, size: 20, color: Colors.black),
                          ],
                        )
                      ],
                    ),
                  ),
                  // Add Photos bar
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    color: Colors.white,
                    child: Row(
                      children: [
                        const Icon(Icons.close),
                        const SizedBox(width: 150),
                        const Text(
                          "Add Photos",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          "Done",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                      ],
                    ),
                  ),
                   SizedBox(height: 20),
                 // Hiển thị lưới hình ảnh

        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: lsPhotos.length, // Số lượng ảnh từ danh sách lsPhotos
          itemBuilder: (context, index) {
            Photo photo = lsPhotos[index];  // Lấy đối tượng photo từ danh sách lsPhotos

            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Photowidget(
              anh1: photo.anh1,
              anh2:  photo.anh2, 
              anh3: photo.anh3,          
              ),
            );
            
          },
        ),SizedBox(height: 300),
        
      // Thanh ngang cuoi trang
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Image.asset('images/thanhngang.png')
              ],),
            )
        
        ],
      ),
      ),
      ],

        ),
        
      ),
    );

  }
}
// Trang Sign up 
class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        actions: [
          TextButton(
            onPressed: () {
              // Điều hướng đến SecondPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FourPage()),
              );
            },
            child: const Text(
              "My trip",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Dang ky
            Padding(padding: 
            const EdgeInsets.symmetric(horizontal: 500,
            vertical: 40),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              // Thanh trang thai
             Container(
              padding: const EdgeInsets.all(9.0),
              color: const Color.fromARGB(255, 50, 205, 190),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 
                  Text(
                    '9:41',
                    style: TextStyle(fontSize: 18, 
                    fontWeight: FontWeight.bold, 
                    color: Colors.white,
                    ),
                  ),
                  Row(
                    // Các iconn
                    children: [
                      
                      Icon(Icons.signal_cellular_4_bar, size: 20, color: Colors.white,),
                      SizedBox(width: 4),
                      Icon(Icons.wifi, size: 20,color: Colors.white),
                      SizedBox(width: 4),
                      Icon(Icons.battery_full, size: 20,color: Colors.white,)
                    ],
                  ),
                ],
              ),
            
              
            ),
            //Khung 
            Container(
             
             height: 120,
            
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 50, 205, 190),
                borderRadius: BorderRadius.only(
                 
                  ),
                ),

                //Logo
              child: Padding(
                padding: const EdgeInsets.only(left: 35.0,bottom:30), 
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                child: Center(
                  child: 
                  Image.asset('images/signup/Group.png'),
                          ),
                  
                ),
              )
            ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20,left: 25.0,bottom:20),
              child: Align(
                alignment: Alignment.centerLeft,
              child: Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
              ),
            ),
            // khung ngang
            Padding(padding: const EdgeInsets.only(left: 25.0),
            child: Align(
                alignment: Alignment.centerLeft,
            child: Row(
              children: [
                // Travel and guide
                  Row(
                    children: [
                      Image.asset('images/signup/select.png'),
                      SizedBox(width: 20,),
                      Text('Traveled',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,

                      ),),
                      SizedBox(width: 120,),
                      Image.asset('images/signup/Oval.png'),
                      SizedBox(width: 20,),
                      Text("Guide",
                      style: TextStyle(
                        fontSize:20 ,
                        color: Colors.black,
                      ),)

                    ],
              ),
            ],
            ),
            ),
            ),
            SizedBox(height: 25,),
           
            
            // Last name and first name
            Padding(padding: const EdgeInsets.only(left: 25.0,right: 25.0),
            child: Align(
                alignment: Alignment.centerLeft,
           child: Column(
              
              children: [
                
                Row(
                  
                  children: [
                    // First Name
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "First Name",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          hintText: 'Họ',hintStyle: TextStyle(
                          color: const Color.fromARGB(255, 37, 35, 35).withOpacity(0.6),
                          fontSize: 15),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),floatingLabelBehavior: FloatingLabelBehavior.always,
                          
                          
                        ),
                      ),
                    ),
                    SizedBox(width: 25), // Khoảng cách giữa First Name và Last Name
                    // Last Name
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Last Name",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          hintText: 'Tên',
                          hintStyle: TextStyle(
                            color: const Color.fromARGB(255, 37, 35, 35).withOpacity(0.6),
                          fontSize: 15),
                          
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(),
                          ),floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                    ),
                  ],
                ),SizedBox(height: 25,),
                // Country
                TextField(
              decoration: InputDecoration(
                labelText: 'Country',labelStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                hintText: 'VietNam',
                hintStyle: TextStyle(
                  color: const Color.fromARGB(255, 37, 35, 35).withOpacity(0.6),
                          fontSize: 15),
                
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                  ),
                  
                ) ,floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            // Email
            SizedBox(height: 25,),
                TextField(
              decoration: InputDecoration(
                labelText: 'Email',labelStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                hintText: 'example@gmail.com',
                hintStyle: TextStyle(
                  color: const Color.fromARGB(255, 37, 35, 35).withOpacity(0.6),
                          fontSize: 15),
                
                border: UnderlineInputBorder(
                  borderSide: BorderSide(

                  ),
                ) , floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            // Password
            SizedBox(height: 25,),
                TextField(
              decoration: InputDecoration(
                labelText: 'Password',labelStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                hintText: '***********', 
                hintStyle: TextStyle(
                  color: const Color.fromARGB(255, 37, 35, 35).withOpacity(0.6),
                          fontSize: 15),
                
                border: UnderlineInputBorder(
                  borderSide: BorderSide(

                  ),
                ) , floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            //Confirm Password
            SizedBox(height: 15,),
                TextField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',labelStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                hintText: '***********',hintStyle: TextStyle(
                  color: const Color.fromARGB(255, 37, 35, 35).withOpacity(0.6),
                          fontSize: 15),
                
                border: UnderlineInputBorder(
                  borderSide: BorderSide(

                  ),
                ) , floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            SizedBox(height: 40),
            // By sign Up
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  " By Signing Up,you agree to our", style: TextStyle(
                    
                    
                  ),

                ), 
                Text(
                  " Terms & Conditions", style: TextStyle(
                    color: Colors.teal,
                  ),
                )
              ],
             ),
             SizedBox(height: 20,),
             // Buttom sign Up
             SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00C48C),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                child: Text(
                  "SIGN UP",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),SizedBox( height: 20,),
            // Already
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    ),
                   SizedBox(width: 10),
                  
                  Text(
                    'Sign In',
                    
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 15,
                    ),
                    
                  ),
                  SizedBox (width: 15,),
                 
                ],
              ),
            ),SizedBox(height: 30,),
            // Thanh ngang cuoi trang
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Image.asset('images/thanhngang.png')
              ],),
            )

              ],
              
            ),
            ),
            ),
            ],
          ),
          
            )
          ],
          
        ),
      ),
      
    );
  }
}

// Trip
class FourPage extends StatelessWidget {
  const FourPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Trip> lsTrips =[
      Trip ("images/trip/hoguom.png","Hanoi, Vietnam","Ho Guom Trip","8:00 - 10:00","Jonathan P","images/trip/cus1.png"),
      Trip ("images/trip/langBac.png","Hanoi, Vietnam","Ho Chi Minh Mausoleum","8:00 - 10:00","Stephne","images/trip/cus2.png"),
      Trip ("images/trip/ducba.png","Ho Chi Minh , Vietnam","Duc Ba Church","8:00 - 10:00","Myung Dea","images/trip/cus3.png"),

    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('My trip'),
        actions: [
          TextButton(
            onPressed: () {
              // Điều hướng đến SecondPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FivePage()),
              );
            },
            child: const Text(
              "My exprience",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(padding: 
        const EdgeInsets.symmetric(horizontal: 500,
          vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          
          children:[
            // Background image
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/trip/danang.png'),
                fit: BoxFit.cover,
              ),
            ), 
          ),
          // My trips
          Padding(padding: const EdgeInsets.only(top: 140, right: 20, left: 10),
          child: 
          Text('My Trips', style: TextStyle(fontWeight: FontWeight.bold, 
          fontSize: 35, 
          color: Colors.white),),
          ),
          // Search
          Padding(padding: const EdgeInsets.only(top: 70, right: 10,left: 490),
          child: 
          CircleAvatar(
         radius: 20, 
         backgroundColor: const Color.fromARGB(255, 196, 192, 192).withOpacity(0.3),
          child:Icon(Icons.search,), 
    ),
          ),
          // App bar với nút back và tín hiệu di động
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Text("9:41", style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontSize: 18, color: Colors.white),),
                  // Các icon tín hiệu
                  Row(
                    children: [
                      Icon(Icons.signal_cellular_alt, color: Colors.white),
                      SizedBox(width: 5),
                      Icon(Icons.wifi, color: Colors.white),
                      SizedBox(width: 5),
                      Icon(Icons.battery_full, color: Colors.white),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          // Nội dung chính với tiêu đề và thanh tìm kiếm
          Padding(
            padding: const EdgeInsets.only(top: 200,  // Vị trí cách phần trên của hình ảnh để đè một phần
            left: 16,
            right: 16,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // current Trips
                   Expanded(child: Container(
                    height: 60,
                    child: Center(
                      child: Text("Current Trips",style: TextStyle(
                        color: Colors.grey.withOpacity(0.8),
                      ),),
                    ),
                   ),
                   ),
                   //Next Trips
                    Expanded(child: Container(
                    height: 45,
                    
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      border: Border.all( color: Colors.teal,
            width: 0,),
                      borderRadius: BorderRadius.circular(5),),
                    child: Center(
                      child: Text("Next Trips",style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                      ),
                      ),
                    ),
                   ),
                   ),
                   //Past trips
                    Expanded(child: Container(
                    height: 60,
                    child: Center(
                      child: Text("Past Trips",style: TextStyle(
                        color: Colors.grey.withOpacity(0.8),
                      ),),
                    ),
                   ),
                   ),
                   //Wish List
                    Expanded(child: Container(
                    height: 60,
                    child: Center(
                      child: Text("Wish List",style: TextStyle(
                        color: Colors.grey.withOpacity(0.8),
                      ),),
                    ),
                   ),
                   ),
                    
                  ],
                ),
               
                
              ],
            ),
          ),
              ],
        ),
         SizedBox(height: 20,),

            // Danh sach Trip
            ListView.builder(shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // Để tránh cuộn bên trong ListView
              itemCount: lsTrips.length,
              itemBuilder: (context, index){
                Trip trip = lsTrips[index];
                return Padding(padding: 
                 const EdgeInsets.only(bottom: 16.0),
                 child: Tripwidget(
                  avatar: trip.avatar,
                  cityName: trip.cityName,
                  date: trip.date,
                  avatarCus: trip.avatarCus,
                  tripName: trip.tripName,
                  customerName: trip.customerName,
                 ),
                );
              },
            ),SizedBox(height: 10,),
            
            // hinh anh
            Center(child: 
            Image.asset("images/trip/TabBar.png",width: double.infinity,fit: BoxFit.cover,),
            ),SizedBox(height: 3,)
            ,
           Center(
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Image.asset("images/thanhngang.png"),
              ],
            ),
            ),
          ],
        ),
        ),
        ),
      );// This trailing comma makes auto-formatting nicer for build methods.
    
  }
}

// Giao dien My exxpriences
class FivePage extends StatelessWidget {
  const FivePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Exprience> lsExpriences =[
      Exprience("images/exprience/hoian1.png", "images/exprience/hoian2.png", "images/exprience/hoian3.png", 
      "2 Hour Bicycle Tour exploring Hoian", "Hoian, Vietnam", "Jan 25,2020", "1234 Likes"),
      Exprience("images/exprience/fod1.png", "images/exprience/fod2.png", "images/exprience/fod3.png", 
      "Food tour in Danang", "Danang, Vietnam", "Jan 20,2020", "234 Likes"),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("My Expriences"),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=> const SecondPage()),);
          }, child: Text(
            "Next Screen",
            style: TextStyle(color: Colors.black),
          ),),
        ],
      ),
      
      // Body
body: SingleChildScrollView(
        child: Padding(padding: 
        const EdgeInsets.symmetric(horizontal: 500,vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20,right: 20),
              color: Colors.white,
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "9:40",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                    color: Colors.black),
                  ),
                  // SizedBox(width: 100,),
                  Row(
                    children: [
                      Icon(Icons.signal_cellular_4_bar_rounded, size: 20, color: Colors.black),
                      SizedBox(width: 6),
                      Icon(Icons.wifi, size: 20, color: Colors.black),
                      SizedBox(width: 6),
                      Icon(Icons.battery_full_sharp, size: 20, color: Colors.black),
                    ],
                  ),
                  
              ],),
            ),
            SizedBox(height: 10,),
            // My Ẽxrience 
            Container(
                  color: Colors.white,
                    child: Row(
                      
                      children: [
                        const Icon(Icons.chevron_left,size: 50,),
                        const SizedBox(width: 150),
                        const Text(
                          "My Expriences",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        
                      ],
                    ),
            ),
            SizedBox(height: 20,),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0), // Tạo khoảng cách 16 đơn vị hai bên
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Thêm padding bên trong Container
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.teal.withOpacity(0.8), width: 1),
                borderRadius: BorderRadius.circular(9),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.teal,
                    size: 24,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Add Experience",
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 20,
                      
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),


            // Exprience
           ListView.builder(
          physics: NeverScrollableScrollPhysics(), // Để tránh cuộn bên trong ListView
          shrinkWrap: true,
          itemCount: lsExpriences.length,
          itemBuilder: (context, index) {
            Exprience experience = lsExpriences[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ExperienceWidgets(
                avatar1: experience.avatar1,
                avatar2: experience.avatar2,
                avatar3: experience.avatar3,
                title: experience.title,
                local: experience.local,
                date: experience.date,
                like: experience.like,
              ),
            );
          },
        ),SizedBox(height: 80,),
        Center(
          child: Image.asset('images/thanhngang.png'),
        )
          ],
        ),
        
        ),

       
      ),
    );
  }
}
