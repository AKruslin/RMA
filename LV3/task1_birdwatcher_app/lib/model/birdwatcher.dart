import 'package:flutter/material.dart';

class BirdWatcher {
  late int color;
  late int counterValue;
  BirdWatcher({required this.color, required this.counterValue});

  BirdWatcher.initialStart() {
    this.color = Colors.white.value;
    this.counterValue = 0;
  }

  factory BirdWatcher.fromJson(Map<String, dynamic> parsedJson) {
    return new BirdWatcher(
        color: parsedJson['color'] ?? Colors.white.value,
        counterValue: parsedJson['counterValue'] ?? 0);
  }

  Map<String, dynamic> toJson() {
    return {"color": this.color, "counterValue": this.counterValue};
  }
}
