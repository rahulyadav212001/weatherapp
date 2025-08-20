# Create a polished README.md for the weatherapp repository.
from textwrap import dedent

readme_weather = dedent("""
# 🌦️ WeatherApp — Flutter Weather Forecast Application

[![Flutter](https://img.shields.io/badge/Flutter-%5E3.x-blue)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-stable-blue.svg)](https://dart.dev)
![Platforms](https://img.shields.io/badge/platforms-Android%20|%20iOS%20|%20Web%20|%20Windows%20|%20macOS%20|%20Linux-informational)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

A modern Flutter app that fetches and displays weather forecasts in real‑time.  
Clean UI, location support, and multiple platform support.

> **Repo:** `rahulyadav212001/weatherapp`

---

## ✨ Features

- 🌍 Current weather by city or geolocation
- 📅 5‑day forecast (temperature, humidity, wind speed)
- 🌓 Light & Dark mode
- 🖼️ Beautiful icons and UI
- 🌐 Works on Android, iOS, Web, and Desktop
- 💾 Persistent last searched city
- 🔍 Search weather by city name
- ⚡ Fast API integration (OpenWeatherMap or WeatherAPI)

---

## 🧱 Tech Stack

- **Framework:** Flutter (Dart)
- **State management:** `Provider` / `Riverpod` / `Bloc` (update with actual)
- **Networking:** `http` / `dio`
- **Storage:** `shared_preferences`
- **API:** OpenWeatherMap (default, free tier)

---

## 🚀 Getting Started

### 1) Prerequisites
- Flutter SDK `3.x`
- API key from [OpenWeatherMap](https://openweathermap.org/api)

### 2) Clone & Install
```bash
git clone https://github.com/rahulyadav212001/weatherapp.git
cd weatherapp
flutter pub get
