import 'package:app_tim_viec_lam/screens/home_screens/notification_screen.dart';
import 'package:app_tim_viec_lam/screens/home_screens/search_location_screen.dart';
import 'package:app_tim_viec_lam/screens/home_screens/search_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // header bar
        appBar: AppBar(
          //iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xFFFFFFFF), // Màu trắng
          leading: Padding(
            padding: EdgeInsets.all(0),
            child: Image.asset('../../assets/logo.jpg'), // Đường dẫn đến logo
          ),
          //title: Text("Tiêu đề"), // Nếu cần tiêu đề
          actions: [
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.grey,
              ), // Đổi màu icon
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationScreen()),
                );
              },
            ),
          ],
        ),

        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // search bar
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchScreen(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.work, color: Colors.grey.shade800),
                                SizedBox(width: 10),
                                Text(
                                  "Nhập công việc...",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 1,
                        color: Colors.grey, // Gạch đứng ngăn cách
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchAddressScreen(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.grey.shade800,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Nhập đia điểm ...",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Expanded(
                      //   child: TextField(
                      //     decoration: InputDecoration(
                      //       hintText: "Nhập địa điểm...",
                      //       border: InputBorder.none,
                      //       prefixIcon: Icon(Icons.location_on),
                      //       contentPadding: EdgeInsets.symmetric(
                      //         vertical: 15,
                      //       ), // Căn giữa hint
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),

              // body title
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Việc làm cho bạn", // Dòng tiêu đề
                                    style: TextStyle(
                                      fontSize: 18, // Cỡ chữ lớn hơn
                                      fontWeight: FontWeight.bold, // In đậm
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ), // Khoảng cách giữa hai dòng
                                  Text(
                                    "Các việc cần làm của bạn dựa trên hoạt động của bản trên Indeed", // Dòng mô tả
                                    style: TextStyle(
                                      fontSize: 14, // Cỡ chữ nhỏ hơn
                                      color:
                                          Colors.grey[700], // Màu chữ xám nhẹ
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // body title
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  //padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                  // list item job
                  child: Column(
                    children: [
                      // job item
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            10,
                          ), // Bo góc cho đẹp
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // Đổ bóng xuống dưới
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Hàng đầu tiên: "Mới vào" & "Cần tuyển gấp"
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.circular(
                                              5,
                                            ),
                                          ),
                                          child: Text(
                                            "Mới vào",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.circular(
                                              5,
                                            ),
                                          ),
                                          child: Text(
                                            "Cần tuyển gấp",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),

                                    // Hàng thứ 2: Tên việc làm
                                    Text(
                                      "Nhân viên lập trình Flutter",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),

                                    // Hàng thứ 3: Địa chỉ công ty
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          size: 16,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "Công ty ABC - Quận 1, TP. HCM",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),

                                    // Hàng thứ 4: Tiền lương trên tháng
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.monetization_on,
                                          size: 16,
                                          color: Colors.orange,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "Lương: 20 - 30 triệu/tháng",
                                          style: TextStyle(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),

                                    // Hàng thứ 5: Loại hình công việc
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.access_time,
                                          size: 16,
                                          color: Colors.blue,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "Toàn thời gian",
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),

                                    // Hàng thứ 6: Link nộp đơn
                                    Row(
                                      children: [
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            padding:
                                                EdgeInsets
                                                    .zero, // Bỏ padding mặc định
                                            minimumSize: Size(
                                              0,
                                              0,
                                            ), // Tránh bị ảnh hưởng bởi kích thước tối thiểu
                                            tapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap, // Thu nhỏ vùng bấm
                                          ),
                                          onPressed: () {},
                                          child: Row(
                                            // Giữ kích thước gọn gàng
                                            children: [
                                              Icon(
                                                Icons.send,
                                                color: Colors.blue, // Màu icon
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ), // Khoảng cách giữa icon và text
                                              Text(
                                                "Nộp đơn ngay",
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  decoration:
                                                      TextDecoration.none,
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

                              // Phần đánh dấu và block (flex: 1)
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 100, // Giới hạn chiều cao
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.bookmark_border,
                                        size: 30,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(height: 10),
                                      Icon(
                                        Icons.block,
                                        size: 30,
                                        color: Colors.red,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      // job item
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            10,
                          ), // Bo góc cho đẹp
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // Đổ bóng xuống dưới
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Hàng đầu tiên: "Mới vào" & "Cần tuyển gấp"
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.circular(
                                              5,
                                            ),
                                          ),
                                          child: Text(
                                            "Mới vào",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.circular(
                                              5,
                                            ),
                                          ),
                                          child: Text(
                                            "Cần tuyển gấp",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),

                                    // Hàng thứ 2: Tên việc làm
                                    Text(
                                      "Nhân viên lập trình Flutter",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),

                                    // Hàng thứ 3: Địa chỉ công ty
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          size: 16,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "Công ty ABC - Quận 1, TP. HCM",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),

                                    // Hàng thứ 4: Tiền lương trên tháng
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.monetization_on,
                                          size: 16,
                                          color: Colors.orange,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "Lương: 20 - 30 triệu/tháng",
                                          style: TextStyle(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),

                                    // Hàng thứ 5: Loại hình công việc
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.access_time,
                                          size: 16,
                                          color: Colors.blue,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "Toàn thời gian",
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),

                                    // Hàng thứ 6: Link nộp đơn
                                    Row(
                                      children: [
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            padding:
                                                EdgeInsets
                                                    .zero, // Bỏ padding mặc định
                                            minimumSize: Size(
                                              0,
                                              0,
                                            ), // Tránh bị ảnh hưởng bởi kích thước tối thiểu
                                            tapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap, // Thu nhỏ vùng bấm
                                          ),
                                          onPressed: () {},
                                          child: Row(
                                            // Giữ kích thước gọn gàng
                                            children: [
                                              Icon(
                                                Icons.send,
                                                color: Colors.blue, // Màu icon
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ), // Khoảng cách giữa icon và text
                                              Text(
                                                "Nộp đơn ngay",
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  decoration:
                                                      TextDecoration.none,
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

                              // Phần đánh dấu và block (flex: 1)
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 100, // Giới hạn chiều cao
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.bookmark_border,
                                        size: 30,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(height: 10),
                                      Icon(
                                        Icons.block,
                                        size: 30,
                                        color: Colors.red,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      // job item
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            10,
                          ), // Bo góc cho đẹp
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // Đổ bóng xuống dưới
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Hàng đầu tiên: "Mới vào" & "Cần tuyển gấp"
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.circular(
                                              5,
                                            ),
                                          ),
                                          child: Text(
                                            "Mới vào",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.circular(
                                              5,
                                            ),
                                          ),
                                          child: Text(
                                            "Cần tuyển gấp",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),

                                    // Hàng thứ 2: Tên việc làm
                                    Text(
                                      "Nhân viên lập trình Flutter",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),

                                    // Hàng thứ 3: Địa chỉ công ty
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          size: 16,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "Công ty ABC - Quận 1, TP. HCM",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),

                                    // Hàng thứ 4: Tiền lương trên tháng
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.monetization_on,
                                          size: 16,
                                          color: Colors.orange,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "Lương: 20 - 30 triệu/tháng",
                                          style: TextStyle(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),

                                    // Hàng thứ 5: Loại hình công việc
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.access_time,
                                          size: 16,
                                          color: Colors.blue,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "Toàn thời gian",
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),

                                    // Hàng thứ 6: Link nộp đơn
                                    Row(
                                      children: [
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            padding:
                                                EdgeInsets
                                                    .zero, // Bỏ padding mặc định
                                            minimumSize: Size(
                                              0,
                                              0,
                                            ), // Tránh bị ảnh hưởng bởi kích thước tối thiểu
                                            tapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap, // Thu nhỏ vùng bấm
                                          ),
                                          onPressed: () {},
                                          child: Row(
                                            // Giữ kích thước gọn gàng
                                            children: [
                                              Icon(
                                                Icons.send,
                                                color: Colors.blue, // Màu icon
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ), // Khoảng cách giữa icon và text
                                              Text(
                                                "Nộp đơn ngay",
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  decoration:
                                                      TextDecoration.none,
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

                              // Phần đánh dấu và block (flex: 1)
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 100, // Giới hạn chiều cao
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.bookmark_border,
                                        size: 30,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(height: 10),
                                      Icon(
                                        Icons.block,
                                        size: 30,
                                        color: Colors.red,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      // job item
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            10,
                          ), // Bo góc cho đẹp
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // Đổ bóng xuống dưới
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Hàng đầu tiên: "Mới vào" & "Cần tuyển gấp"
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.circular(
                                              5,
                                            ),
                                          ),
                                          child: Text(
                                            "Mới vào",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.circular(
                                              5,
                                            ),
                                          ),
                                          child: Text(
                                            "Cần tuyển gấp",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),

                                    // Hàng thứ 2: Tên việc làm
                                    Text(
                                      "Nhân viên lập trình Flutter",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),

                                    // Hàng thứ 3: Địa chỉ công ty
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          size: 16,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "Công ty ABC - Quận 1, TP. HCM",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),

                                    // Hàng thứ 4: Tiền lương trên tháng
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.monetization_on,
                                          size: 16,
                                          color: Colors.orange,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "Lương: 20 - 30 triệu/tháng",
                                          style: TextStyle(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),

                                    // Hàng thứ 5: Loại hình công việc
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.access_time,
                                          size: 16,
                                          color: Colors.blue,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "Toàn thời gian",
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),

                                    // Hàng thứ 6: Link nộp đơn
                                    Row(
                                      children: [
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            padding:
                                                EdgeInsets
                                                    .zero, // Bỏ padding mặc định
                                            minimumSize: Size(
                                              0,
                                              0,
                                            ), // Tránh bị ảnh hưởng bởi kích thước tối thiểu
                                            tapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap, // Thu nhỏ vùng bấm
                                          ),
                                          onPressed: () {},
                                          child: Row(
                                            // Giữ kích thước gọn gàng
                                            children: [
                                              Icon(
                                                Icons.send,
                                                color: Colors.blue, // Màu icon
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ), // Khoảng cách giữa icon và text
                                              Text(
                                                "Nộp đơn ngay",
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  decoration:
                                                      TextDecoration.none,
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

                              // Phần đánh dấu và block (flex: 1)
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 100, // Giới hạn chiều cao
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.bookmark_border,
                                        size: 30,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(height: 10),
                                      Icon(
                                        Icons.block,
                                        size: 30,
                                        color: Colors.red,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
