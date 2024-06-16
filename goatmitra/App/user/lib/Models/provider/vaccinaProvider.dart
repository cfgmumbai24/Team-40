import "package:flutter/material.dart";

class ListProvider extends ChangeNotifier {
  List<String> done = [];
  List<String> remain= ["Peste-des-Petitis Ruminants", "Enterotoxaemia","Foot & Mouth Disease","Goat Pox","Haemorrhagic Septicaemia","Blue Tongue","Johne's Disease"];

  void addItem(String item) {
    done.add(item);
    notifyListeners();
    remain.remove(item);
    notifyListeners();
  }
  void removeItem(String item) {
    remain.add(item);
    notifyListeners();
    done.remove(item);
    notifyListeners();
  }
}