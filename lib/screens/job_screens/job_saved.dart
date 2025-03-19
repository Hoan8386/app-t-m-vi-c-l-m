import 'package:flutter/material.dart';

class JobSave extends StatelessWidget {
  const JobSave({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        buildJobTile(
          title: "Client Management Assistant (100% Remote, Contractor)",
          company: "AwePlus Cx Transformation Sdn Bhd",
          location: "Thành phố Hồ Chí Minh",
          isSaved: true,
          context: context,
        ),
        buildJobTile(
          title: "Client Management Assistant (100% Remote, Contractor)",
          company: "AwePlus Cx Transformation Sdn Bhd",
          location: "Thành phố Hồ Chí Minh",
          isSaved: true,
          context: context,
        ),
        buildJobTile(
          title: "Client Management Assistant (100% Remote, Contractor)",
          company: "AwePlus Cx Transformation Sdn Bhd",
          location: "Thành phố Hồ Chí Minh",
          isSaved: true,
          context: context,
        ),
        buildJobTile(
          title: "Client Management Assistant (100% Remote, Contractor)",
          company: "AwePlus Cx Transformation Sdn Bhd",
          location: "Thành phố Hồ Chí Minh",
          isSaved: true,
          context: context,
        ),
        buildJobTile(
          title: "Client Management Assistant (100% Remote, Contractor)",
          company: "AwePlus Cx Transformation Sdn Bhd",
          location: "Thành phố Hồ Chí Minh",
          isSaved: true,
          context: context,
        ),
        buildJobTile(
          title: "Client Management Assistant (100% Remote, Contractor)",
          company: "AwePlus Cx Transformation Sdn Bhd",
          location: "Thành phố Hồ Chí Minh",
          isSaved: true,
          context: context,
        ),
      ],
    );
  }
}

Widget buildJobTile({
  required String title,
  required String company,
  required String location,
  required bool isSaved,
  required BuildContext context,
}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Hàng trên cùng: Tiêu đề + biểu tượng bookmark + menu
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tiêu đề công việc
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(width: 8),
            // Biểu tượng bookmark
            ElevatedButton(
              //style: (),
              onPressed: () {
                _showBottomSheet(context);
                ;
              },
              child: Icon(Icons.bookmark_border, color: Colors.black54),
            ),
            SizedBox(width: 8),
            // Biểu tượng dấu ba chấm
            ElevatedButton(
              //style: (),
              onPressed: () {
                _showBottomSheet(context);
                ;
              },
              child: Icon(Icons.more_vert, color: Colors.black54),
            ),
          ],
        ),
        SizedBox(height: 6),
        // Công ty + Địa điểm
        Text(company, style: TextStyle(fontSize: 14, color: Colors.black87)),
        Text(location, style: TextStyle(fontSize: 14, color: Colors.black87)),
        SizedBox(height: 6),
        // Dòng "Đã lưu hôm nay"
        Text(
          "Đã lưu hôm nay",
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        SizedBox(height: 10),
        // Nút "Nộp Hồ sơ Ngay"
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              print("Ứng tuyển: $title");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade900, // Màu xanh đậm hơn
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(vertical: 12),
            ),
            child: Text(
              "Nộp Hồ sơ Ngay",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Chữ màu trắng
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(15),
      ), // Bo tròn 2 góc trên
    ),
    builder: (BuildContext context) {
      return Container(
        //padding: EdgeInsets.all(16),
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15),
          ), // Bo tròn 2 góc trên
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row 1: Tiêu đề + nút đóng
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ), // Border bottom màu xám
                ),
              ),
              padding: EdgeInsets.fromLTRB(
                10,
                10,
                10,
                10,
              ), // Khoảng cách giữa border và nội dung
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        "Quản lý việc làm",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context), // Đóng bottom sheet
                    child: Icon(Icons.close, color: Colors.black54),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // Row 2: Icon Folder + "Di chuyển vào thư mục ứng tuyển"
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.folder,
                          color: Colors.black,
                          size: 24,
                        ), // Icon thư mục
                        SizedBox(width: 10),
                        Text(
                          "Di chuyển vào thư mục ứng tuyển",
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
