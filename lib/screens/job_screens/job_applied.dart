import 'package:flutter/material.dart';

class JobApply extends StatelessWidget {
  const JobApply({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        buildJobTile(
          title: "Client Management Assistant (100% Remote, Contractor)",
          company: "AwePlus Cx Transformation Sdn Bhd",
          location: "Thành phố Hồ Chí Minh",
          isSaved: true,
          status: "Đã ứng tuyển",
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
  required String status,
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
            // Tiêu đề công việc (Chỉ chiếm không gian cần thiết)
            IntrinsicWidth(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 6,
                ), // Thêm padding nhẹ
                decoration: BoxDecoration(
                  color: Colors.lightBlue[100], // Nền xanh dương nhạt
                  borderRadius: BorderRadius.circular(4), // Bo góc nhẹ
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.blue[900], // Chữ xanh đậm
                    height: 1.5,
                  ),
                ),
              ),
            ),

            // Biểu tượng dấu ba chấm
            Spacer(), // Đẩy IconButton về bên phải
            IconButton(
              onPressed: () {
                _showBottomSheet(context);
              },
              icon: Icon(Icons.more_vert, color: Colors.black54),
            ),
          ],
        ),

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
              // print("Ứng tuyển: $title");
              capNhatTrangThai(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // Màu xanh đậm hơn
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(vertical: 12),
            ),
            child: Text(
              "Cập nhật trạng thái",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900, // Chữ màu trắng
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
                          Icons.folder_copy,
                          color: Colors.black,
                          size: 24,
                        ), // Icon thư mục
                        SizedBox(width: 10),
                        Text(
                          "Lưu trữ",
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.rotate_left_outlined,
                          color: Colors.black,
                          size: 24,
                        ), // Icon thư mục
                        SizedBox(width: 10),
                        Text(
                          "Di chuyển về Đã Lưu",
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

void capNhatTrangThai(BuildContext context) {
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
        height: 350,
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
                        "Cập nhật trạng thái đơn xin việc",
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
                          Icons.check_circle,
                          color: Colors.blue.shade900,
                          size: 24,
                        ), // Icon thư mục
                        SizedBox(width: 10),
                        Text(
                          "Đã ứng tuyển",
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: Colors.green.shade900,
                          size: 24,
                        ), // Icon thư mục
                        SizedBox(width: 10),
                        Text(
                          "Đang phỏng vấn",
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.library_add_check,
                          color: Colors.green.shade900,
                          size: 24,
                        ), // Icon thư mục
                        SizedBox(width: 10),
                        Text(
                          "Đã nhận được đề nghị",
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.insert_emoticon_rounded,
                          color: Colors.green.shade900,
                          size: 24,
                        ), // Icon thư mục
                        SizedBox(width: 10),
                        Text(
                          "Đã tryển",
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.close_outlined,
                          color: Colors.red.shade900,
                          size: 24,
                        ), // Icon thư mục
                        SizedBox(width: 10),
                        Text(
                          "Bạn chưa được nhà tuyển chọn lựa chọn",
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.unpublished,
                          color: Colors.red.shade900,
                          size: 24,
                        ), // Icon thư mục
                        SizedBox(width: 10),
                        Text(
                          "Không còn quan tâm ",
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      );
    },
  );
}
