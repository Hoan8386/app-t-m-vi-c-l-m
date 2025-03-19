import 'package:flutter/material.dart';

class Messenger extends StatelessWidget {
  const Messenger({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 4,
        shadowColor: Colors.black26,
        centerTitle: true,
        title: Text("Tin nhắn", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _itemMessage("Nam", "../../assets/logo.jpg", context),
            _itemMessage("Nam", "../../assets/logo.jpg", context),
            _itemMessage("Nam", "../../assets/logo.jpg", context),
          ],
        ),
      ),
    );
  }
}

Widget _itemMessage(String name, String img, BuildContext context) {
  return Padding(
    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () {},
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    img,
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Nguyễn Thành Hoàn 2",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () {
                  _showBottomSheet(context);
                },
                icon: Icon(Icons.more_vert, color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
    ),
    builder: (BuildContext context) {
      return Container(
        height: 350,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 1),
                ),
              ),
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        "Thao tác",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.close, color: Colors.black54),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            _buildBottomSheetItem(Icons.phone, "Gọi"),
            _buildBottomSheetItem(Icons.bookmark, "Đánh giấu"),
            _buildBottomSheetItem(Icons.delete, "Xóa"),
            _buildBottomSheetItem(Icons.block, "Chặn"),
            _buildBottomSheetItem(Icons.report, "Báo cáo"),
          ],
        ),
      );
    },
  );
}

Widget _buildBottomSheetItem(IconData icon, String text) {
  return TextButton(
    onPressed: () {},
    style: TextButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      alignment: Alignment.centerLeft,
    ),
    child: Row(
      children: [
        Icon(icon, color: Colors.blue, size: 24),
        SizedBox(width: 10),
        Text(text, style: TextStyle(fontSize: 14, color: Colors.black87)),
      ],
    ),
  );
}
