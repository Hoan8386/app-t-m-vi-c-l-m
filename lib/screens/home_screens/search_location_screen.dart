import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class SearchAddressScreen extends StatefulWidget {
  const SearchAddressScreen({super.key});

  @override
  _SearchAddressScreenState createState() => _SearchAddressScreenState();
}

class _SearchAddressScreenState extends State<SearchAddressScreen> {
  List<String> filteredAddresses = [];
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;
  Timer? _debounce;

  Future<void> searchAddress(String query) async {
    if (query.isEmpty) {
      setState(() {
        filteredAddresses = [];
      });
      return;
    }

    setState(() {
      isLoading = true;
    });

    final url = Uri.parse(
      'https://nominatim.openstreetmap.org/search?format=json&q=$query&countrycodes=VN',
    );

    try {
      final response = await http.get(url).timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        if (data.isEmpty) {
          setState(() {
            filteredAddresses = ["Không tìm thấy địa chỉ phù hợp!"];
          });
        } else {
          setState(() {
            filteredAddresses =
                data
                    .where((item) => item.containsKey('display_name'))
                    .map((item) => item['display_name'].toString())
                    .toList();
          });
        }
      } else {
        setState(() {
          filteredAddresses = ["Lỗi máy chủ!"];
        });
      }
    } catch (e) {
      setState(() {
        filteredAddresses = ["Lỗi kết nối! Vui lòng thử lại."];
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      searchAddress(query);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tìm kiếm địa chỉ")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Nhập địa chỉ...",
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                suffixIcon:
                    searchController.text.isNotEmpty
                        ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            searchController.clear();
                            setState(() {
                              filteredAddresses = [];
                            });
                          },
                        )
                        : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
              onChanged: onSearchChanged,
            ),
            const SizedBox(height: 10),
            isLoading
                ? const CircularProgressIndicator()
                : Expanded(
                  child: ListView.builder(
                    itemCount: filteredAddresses.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(filteredAddresses[index]),
                        leading: const Icon(
                          Icons.location_on,
                          color: Colors.red,
                        ),
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Chọn: ${filteredAddresses[index]}",
                              ),
                            ),
                          );
                        },
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
