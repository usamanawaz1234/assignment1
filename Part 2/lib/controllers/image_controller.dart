import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ImageController extends ChangeNotifier {
  List<String> _images = [];
  bool _isLoading = false;
  String _error = '';

  List<String> get images => _images;
  bool get isLoading => _isLoading;
  String get error => _error;

  // Add a single image URL
  void addImage(String imageUrl) {
    if (imageUrl.isNotEmpty && Uri.tryParse(imageUrl)?.hasAbsolutePath == true) {
      _images.add(imageUrl);
      notifyListeners();
    }
  }

  // Remove an image by URL
  void removeImage(String imageUrl) {
    _images.remove(imageUrl);
    notifyListeners();
  }

  // Clear all images
  void clearImages() {
    _images.clear();
    notifyListeners();
  }

  // Validate if a URL is an image
  Future<bool> isValidImageUrl(String url) async {
    try {
      final response = await http.head(Uri.parse(url));
      final contentType = response.headers['content-type'];
      return contentType != null && contentType.startsWith('image/');
    } catch (e) {
      return false;
    }
  }

  // Search for images using a simple API (you might want to replace this with a better image search API)
  Future<void> searchImages(String query) async {
    if (query.isEmpty) return;

    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      // This is using a placeholder API. You might want to replace it with a proper image search API
      final response = await http.get(
        Uri.parse('https://api.pexels.com/v1/search?query=${Uri.encodeComponent(query)}&per_page=10'),
        headers: {
          'Authorization': 'YOUR_PEXELS_API_KEY', // Replace with your actual API key
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<String> newImages = [];
        
        for (var photo in data['photos']) {
          newImages.add(photo['src']['medium']);
        }

        _images = newImages;
      } else {
        _error = 'Failed to load images';
      }
    } catch (e) {
      _error = 'Error: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
