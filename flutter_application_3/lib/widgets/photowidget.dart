import 'package:flutter/material.dart';

class Photowidget extends StatefulWidget {
  final String anh1;
  final String anh2;
  final String anh3;
  const Photowidget({
    Key?
  key,
    required this. anh1,
    required this. anh2,
    required this. anh3,
    }):super(key: key);

  @override
  State<Photowidget> createState() => _PhotowidgetState();
}

class _PhotowidgetState extends State<Photowidget> {
   List<bool> isCheckedList = [false, false, false]; // Mỗi phần tử tương ứng với một bức ảnh
  @override
  Widget build(BuildContext context) {
    return Container( 
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: Stack(
                  children:[
                      // Bức ảnh
                  Image.asset(widget.anh1, width: double.infinity, fit: BoxFit.cover,),
                  // Hình tròn ở góc phải
                  Positioned(top: 20,  right: 20, 
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isCheckedList[0] = !isCheckedList[0]; // Chỉ thay đổi trạng thái của bức ảnh 1
                        });
                      },
                      child: Container(
                        width: 30, height: 30, 
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isCheckedList[0] ? Colors.green :  Colors.transparent, // Đổi màu khi tick
                          border: Border.all(color:  Colors.white, width: 2),  // Viền của hình tròn
                        ),
                         alignment: Alignment.center,
                        child: isCheckedList[0]
                            ? Icon(Icons.check, size: 24.0, color: const Color.fromARGB(255, 118, 70, 70))  // Hiển thị icon tick với kích thước lớn hơn
                            : Icon(Icons.circle_outlined, size: 24.0, color: Colors.transparent), // Không tick với kích thước lớn hơn
                      ),
                    ),
                  ),
                  ],
                ),
                ),

                SizedBox(width: 8,),
                // Anh 2
                Expanded(child: Stack(
                  children:[
                      // Bức ảnh
                  Image.asset(widget.anh2, width: double.infinity, fit: BoxFit.cover,),
                  // Hình tròn ở góc phải
                  Positioned(top: 20,  right: 20, 
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isCheckedList[1] = !isCheckedList[1];
                        });
                      },
                      child: Container(
                        width: 30, height: 30, 
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isCheckedList[1] ? Colors.green :  Colors.transparent, // Đổi màu khi tick
                          border: Border.all(color:  Colors.white, width: 2),  // Viền của hình tròn
                        ),
                         alignment: Alignment.center,
                        child: isCheckedList[1]
                            ? Icon(Icons.check, size: 24.0, color: Colors.black) // Hiển thị icon tick với kích thước lớn hơn
                            : Icon(Icons.circle_outlined, size: 24.0, color: Colors.transparent), // Không tick với kích thước lớn hơn
                      ),
                    ),
                  ),
                  ],
                ),
                ),

                SizedBox(width: 8,),
                // Amh 3
                Expanded(child: Stack(
                  children:[
                      // Bức ảnh
                  Image.asset(widget.anh3, width: double.infinity, fit: BoxFit.cover,),
                  // Hình tròn ở góc phải
                  Positioned(top: 20,  right: 20, 
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isCheckedList[2] = !isCheckedList[2]; 
                        });
                      },
                      child: Container(
                        width: 30, height: 30, 
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isCheckedList[2] ? Colors.green :  Colors.transparent, // Đổi màu khi tick
                          border: Border.all(color:  Colors.white, width: 2),  // Viền của hình tròn
                        ),
                        
                        alignment: Alignment.center,
                        child: isCheckedList[2]
                            ? Icon(Icons.check, size: 24.0, color: const Color.fromARGB(255, 118, 70, 70))  // Hiển thị icon tick với kích thước lớn hơn
                            : Icon(Icons.circle_outlined, size: 24.0, color: Colors.transparent), // Không tick với kích thước lớn hơn
                      ),
                    ),
                  ),
                  ],
                ),
                ),

                SizedBox(width: 8,),


                
              
              ],
              
            ),
           
          
          ],
        ),
      
       
    );
  }
}

