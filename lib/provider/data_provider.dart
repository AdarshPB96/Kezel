import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kezel/domain/api/api_urls.dart';
import 'package:kezel/domain/data_model/data_model.dart';

class DataProvider extends ChangeNotifier {
  late List<MenuItem> _menuItems;
  late WebsiteDetails _websiteDetails;
  bool _isLoading = true;

  List<MenuItem> get menuItems => _menuItems;
  WebsiteDetails get websiteDetails => _websiteDetails;
  bool get isLoading => _isLoading;

  Future<void> fetchData() async {
    _isLoading = true;
    notifyListeners();

    final Map<String, String> body = {
      'restaurant': 'LeisureInnVKL',
    };

    final response = await http.post(
      Uri.parse(mainUrl),
      body: body,
    );

    if (response.statusCode == 200) {
      final parsedResponse = json.decode(response.body);
      _menuItems = (parsedResponse['menu_items'] as List)
          .map((item) => MenuItem.fromJson(item))
          .toList();
      _websiteDetails = WebsiteDetails.fromJson(parsedResponse['website']);
    } else {
      throw Exception('Failed to load data');
    }

    _isLoading = false;
    notifyListeners();
  }
}
