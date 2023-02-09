import 'package:flutter/material.dart';

class IconState extends ChangeNotifier {
  bool _isVisible = false;
  bool _isVisible2 = false;

  bool get getIsVisible {
    return _isVisible;
  }

  bool get getIsVisible2 {
    return _isVisible2;
  }

  IconData get getIcon {
    return _isVisible ? Icons.visibility_off : Icons.visibility;
  }

  IconData get getIcon2 {
    return _isVisible2 ? Icons.visibility_off : Icons.visibility;
  }

  set setIcon(bool value) {
    _isVisible = value;
    notifyListeners();
  }

  set setIcon2(bool value) {
    _isVisible2 = value;
    notifyListeners();
  }
}
