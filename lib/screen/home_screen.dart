import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_services.dart';
import 'package:weatherapp/widget/weather_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherServices _weatherservices = WeatherServices();
  final TextEditingController _controller = TextEditingController();

  bool _isloading = false;

  Weather? _weather;

  void _getweather() async {
    setState(() {
      _isloading = true;
    });

    try {
      final weather = await _weatherservices.fetchWeather(_controller.text);

      setState(() {
        _weather = weather;
        _isloading = false;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error Fetching Weather Data")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient:
              _weather != null &&
                      _weather!.description.toLowerCase().contains("rain")
                  ? LinearGradient(
                    colors: [Colors.grey, Colors.blueGrey],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
                  : _weather != null &&
                      _weather!.description.toLowerCase().contains("clear")
                  ? LinearGradient(
                    colors: [Colors.orangeAccent, Colors.blueAccent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
                  : LinearGradient(
                    colors: [Colors.grey, Colors.lightBlueAccent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
        ),

        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 25),

                const Text(
                  "Indian Weather ",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 25),
                TextField(
                  controller: _controller,
                  style: TextStyle(color: Colors.black),

                  decoration: InputDecoration(
                    hintText: "Enter Your City Name",
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(169, 255, 255, 255),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(193, 255, 255, 255),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _getweather,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 112, 147, 165),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text("Get Weather", style: TextStyle(fontSize: 18)),
                ),
                if (_isloading)
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                if (_weather != null) WeatherCard(weather: _weather!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
