import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(home: CreateCVScreen()));
}

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
  final _educationController = TextEditingController();
  final _experienceController = TextEditingController();
  final _skillsController = TextEditingController();

  // Biến cho địa chỉ
  List<Map<String, dynamic>> provinces = [];
  List<Map<String, dynamic>> districts = [];
  String? selectedProvince;
  String? selectedDistrict;
  bool isLoadingProvinces = true; // Thêm biến để theo dõi trạng thái tải

  @override
  void initState() {
    super.initState();
    _fetchProvinces();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _educationController.dispose();
    _experienceController.dispose();
    _skillsController.dispose();
    super.dispose();
  }

  // Lấy danh sách tỉnh/thành phố từ API
  Future<void> _fetchProvinces() async {
    try {
      final response = await http.get(
        Uri.parse('https://vapi.vnappmob.com/api/province/'),
      );
      if (response.statusCode == 200) {
        setState(() {
          provinces = List<Map<String, dynamic>>.from(
            json.decode(response.body)['results'],
          );
          isLoadingProvinces = false; // Đã tải xong
        });
      } else {
        throw Exception('Failed to load provinces');
      }
    } catch (e) {
      setState(() {
        isLoadingProvinces = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lỗi khi tải danh sách tỉnh/thành phố: $e')),
      );
    }
  }

  // Lấy danh sách quận/huyện dựa trên tỉnh/thành phố đã chọn
  Future<void> _fetchDistricts(String provinceId) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://vapi.vnappmob.com/api/province/district/$provinceId',
        ),
      );
      if (response.statusCode == 200) {
        setState(() {
          districts = List<Map<String, dynamic>>.from(
            json.decode(response.body)['results'],
          );
          selectedDistrict = null; // Reset quận/huyện khi chọn tỉnh mới
        });
      } else {
        throw Exception('Failed to load districts');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lỗi khi tải danh sách quận/huyện: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.green.shade50, Colors.white],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 150,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  "Tạo CV Chuyên Nghiệp",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black26,
                        offset: Offset(1, 1),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.green.shade700, Colors.green.shade400],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
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
                      _buildTextField(
                        "Email",
                        _emailController,
                        "Vui lòng nhập email",
                      ),
                      SizedBox(height: 20),
                      _buildTextField(
                        "Số điện thoại",
                        _phoneController,
                        "Vui lòng nhập số điện thoại",
                      ),
                      SizedBox(height: 20),
                      isLoadingProvinces
                          ? Center(child: CircularProgressIndicator())
                          : _buildDropdownField(
                            label: "Tỉnh/Thành phố",
                            value: selectedProvince,
                            items:
                                provinces.map((province) {
                                  return DropdownMenuItem<String>(
                                    value: province['province_id'] as String,
                                    child: Text(
                                      province['province_name'] as String,
                                    ),
                                  );
                                }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedProvince = value;
                                if (value != null) {
                                  _fetchDistricts(value);
                                } else {
                                  districts = [];
                                  selectedDistrict = null;
                                }
                              });
                            },
                            errorText: "Vui lòng chọn tỉnh/thành phố",
                          ),
                      SizedBox(height: 20),
                      _buildDropdownField(
                        label: "Quận/Huyện",
                        value: selectedDistrict,
                        items:
                            districts.map((district) {
                              return DropdownMenuItem<String>(
                                value: district['district_id'] as String,
                                child: Text(
                                  district['district_name'] as String,
                                ),
                              );
                            }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedDistrict = value;
                          });
                        },
                        errorText: "Vui lòng chọn quận/huyện",
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
                      SizedBox(height: 40),
                      Center(
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          child: ElevatedButton(
                            onPressed: _submitCV,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green.shade600,
                              padding: EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 18,
                              ),
                              elevation: 8,
                              shadowColor: Colors.green.shade200,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Text(
                              "Lưu CV",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    String errorText,
  ) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.green.shade700,
            fontWeight: FontWeight.w500,
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.green.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.green.shade600, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.red.shade400),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return errorText;
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String? value,
    required List<DropdownMenuItem<String>> items,
    required void Function(String?) onChanged,
    required String errorText,
  }) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: DropdownButtonFormField<String>(
        value: value,
        items: items,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.green.shade700,
            fontWeight: FontWeight.w500,
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.green.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.green.shade600, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.red.shade400),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        ),
        validator: (value) {
          if (value == null) {
            return errorText;
          }
          return null;
        },
      ),
    );
  }

  void _submitCV() {
    if (_formKey.currentState!.validate()) {
      final cvData = {
        "fullName": _fullNameController.text,
        "email": _emailController.text,
        "phone": _phoneController.text,
        "province":
            provinces.firstWhere(
                  (p) => p['province_id'] == selectedProvince,
                )['province_name']
                as String,
        "district":
            districts.firstWhere(
                  (d) => d['district_id'] == selectedDistrict,
                )['district_name']
                as String,
        "education": _educationController.text,
        "experience": _experienceController.text,
        "skills": _skillsController.text,
      };

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 10),
              Text("CV đã được lưu thành công!"),
            ],
          ),
          backgroundColor: Colors.green.shade600,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.all(10),
        ),
      );

      Future.delayed(Duration(seconds: 1), () {
        Navigator.pop(context);
      });
    }
  }
}
