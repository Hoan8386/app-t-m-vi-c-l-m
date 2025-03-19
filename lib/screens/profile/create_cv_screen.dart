import 'package:flutter/material.dart';

class CreateCVScreen extends StatefulWidget {
  const CreateCVScreen({super.key});

  @override
  _CreateCVScreenState createState() => _CreateCVScreenState();
}

class _CreateCVScreenState extends State<CreateCVScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _educationController = TextEditingController();
  final _experienceController = TextEditingController();
  final _skillsController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _educationController.dispose();
    _experienceController.dispose();
    _skillsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Xây dựng CV"),
        backgroundColor: Colors.green[600],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(
                "Họ và tên",
                _fullNameController,
                "Vui lòng nhập họ và tên",
              ),
              SizedBox(height: 20),
              _buildTextField("Email", _emailController, "Vui lòng nhập email"),
              SizedBox(height: 20),
              _buildTextField(
                "Số điện thoại",
                _phoneController,
                "Vui lòng nhập số điện thoại",
              ),
              SizedBox(height: 20),
              _buildTextField(
                "Địa chỉ",
                _addressController,
                "Vui lòng nhập địa chỉ",
              ),
              SizedBox(height: 20),
              _buildTextField(
                "Học vấn",
                _educationController,
                "Vui lòng nhập thông tin học vấn",
              ),
              SizedBox(height: 20),
              _buildTextField(
                "Kinh nghiệm",
                _experienceController,
                "Vui lòng nhập kinh nghiệm",
              ),
              SizedBox(height: 20),
              _buildTextField(
                "Kỹ năng",
                _skillsController,
                "Vui lòng nhập kỹ năng",
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: _submitCV,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[600],
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Lưu CV",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    String errorText,
  ) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorText;
        }
        return null;
      },
    );
  }

  void _submitCV() {
    if (_formKey.currentState!.validate()) {
      // Xử lý dữ liệu CV
      final cvData = {
        "fullName": _fullNameController.text,
        "email": _emailController.text,
        "phone": _phoneController.text,
        "address": _addressController.text,
        "education": _educationController.text,
        "experience": _experienceController.text,
        "skills": _skillsController.text,
      };

      // Hiển thị thông báo thành công
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("CV đã được lưu thành công!"),
          backgroundColor: Colors.green,
        ),
      );

      // Đóng màn hình sau khi lưu
      Navigator.pop(context);
    }
  }
}
