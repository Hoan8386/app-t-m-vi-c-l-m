import 'package:app_tim_viec_lam/screens/job_screens/job_applied.dart';
import 'package:app_tim_viec_lam/screens/job_screens/job_saved.dart';
import 'package:flutter/material.dart';

class MyJob extends StatelessWidget {
  const MyJob({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4, // Số lượng tab
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 4,
            shadowColor: Colors.black26,
            centerTitle: true,
            title: Text(
              "Việc làm của tôi",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(48.0),
              child: TabBar(
                isScrollable: true, // Cho phép cuộn nếu nhiều tab
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey, // Giữ lại cho dễ nhìn
                indicatorColor: Colors.blue,
                tabs: const [
                  Tab(text: "Đã lưu"),
                  Tab(text: "Đã ứng tuyển"),
                  Tab(text: "Phỏng vấn"),
                  Tab(text: "Đã lưu trữ"),
                ],
              ),
            ),
          ),

          body: TabBarView(
            children: [
              Center(child: JobSave()),
              Center(child: JobApply()),
              Center(child: Text("Danh sách lịch phỏng vấn")),
              Center(child: Text("Danh sách việc làm đã lưu trữ")),
            ],
          ),
        ),
      ),
    );
  }
}
