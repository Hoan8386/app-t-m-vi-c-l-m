import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> allJobs = [
    "Lập trình viên",
    "Thiết kế đồ họa",
    "Nhân viên kinh doanh",
    "Quản lý dự án",
    "Marketing online",
    "Nhân viên bán hàng",
  ];

  List<String> filteredJobs = [];
  TextEditingController searchController = TextEditingController();

  void searchJob(String query) {
    setState(() {
      filteredJobs =
          allJobs
              .where((job) => job.toLowerCase().contains(query.toLowerCase()))
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tìm kiếm công việc")),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Nhập công việc...",
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: InputBorder.none, // Ẩn border mặc định
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ), // Chỉ hiển thị border dưới
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ), // Border khi nhập
                ),
              ),
              onChanged: searchJob,
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: filteredJobs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredJobs[index]),
                    leading: Icon(Icons.work),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
