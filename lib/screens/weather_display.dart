import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'weather_utils.dart';

class WeatherDisplay extends StatelessWidget {
  final Weather weather;

  const WeatherDisplay({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '📍 ${weather.country}/${weather.areaName}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    DateFormat('EEEE dd •').add_jm().format(weather.date!),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  _buildMainWeatherInfo(),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WeatherUtils.getWeatherIcon(weather.weatherConditionCode!),
                  Text(
                    weather.weatherMain!.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
          HorizontalScroll(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Divider(color: Colors.grey),
          ),
          _buildSunriseSunsetInfo(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Divider(color: Colors.grey),
          ),
          _buildTemperatureMinMax(),
        ],
      ),
    );
  }

  Widget _buildMainWeatherInfo() {
    return Column(
      children: [
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${weather.temperature!.celsius!.round()}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 100,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Text(
                '°C',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }

  Widget _buildSunriseSunsetInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildInfoRow("assets/11.png", "Sunrise",
            DateFormat().add_jm().format(weather.sunrise!)),
        _buildInfoRow("assets/12.png", "Sunset",
            DateFormat().add_jm().format(weather.sunset!)),
      ],
    );
  }

  Widget _buildTemperatureMinMax() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildInfoRow("assets/13.png", "Temp Max",
            '${weather.tempMax!.celsius!.round()}°C'),
        _buildInfoRow("assets/14.png", "Temp Min",
            '${weather.tempMin!.celsius!.round()}°C'),
      ],
    );
  }

  Widget _buildInfoRow(String imagePath, String label, String value) {
    return Row(
      children: [
        Image.asset(imagePath, scale: 10),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 3),
            Text(
              value,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700),
            )
          ],
        )
      ],
    );
  }

  Widget HorizontalScroll() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 150,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: _buildInfoRow("assets/13.png", "Temp Max",
                '${weather.tempMax!.celsius!.round()}°C'),
          ),
          Container(
            width: 150,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: _buildInfoRow("assets/14.png", "Temp Min",
                '${weather.tempMin!.celsius!.round()}°C'),
          ),
          Container(
            width: 150,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: _buildInfoRow("assets/11.png", "Sunrise",
                DateFormat().add_jm().format(weather.sunrise!)),
          ),
          Container(
            width: 150,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: _buildInfoRow("assets/12.png", "Sunset",
                DateFormat().add_jm().format(weather.sunset!)),
          ),
        ],
      ),
    );
  }
}
