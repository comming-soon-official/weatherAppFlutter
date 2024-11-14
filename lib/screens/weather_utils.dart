import 'package:flutter/material.dart';

class WeatherUtils {
  static String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else if (hour < 21) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  static Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && <= 300:
        return Image.asset(
          "assets/1.png",
          scale: 4,
        );
      case >= 300 && <= 400:
        return Image.asset("assets/2.png", scale: 4);
      case >= 500 && <= 600:
        return Image.asset("assets/3.png", scale: 4);
      case >= 600 && <= 700:
        return Image.asset("assets/4.png", scale: 4);
      case >= 700 && < 800:
        return Image.asset("assets/5.png", scale: 4);
      case == 800:
        return Image.asset("assets/6.png", scale: 4);
      case > 800 && <= 804:
        return Image.asset("assets/7.png", scale: 4);
      default:
        return Image.asset("assets/7.png", scale: 4);
    }
  }
}
