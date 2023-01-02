// ignore_for_file: prefer_typing_uninitialized_variables, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:intl/intl.dart';
import '../models/city_model.dart';
import '../models/faq_questions_model.dart';
import '../models/popular_city_model.dart';
import '../models/weather_service.dart';

class HomePageViewModel extends ChangeNotifier {
  final apiClient = WeatherService();
  List<CityViewModel> _listCities = [];
  CityWeatherViewModel? _cityWeater;
  final String _searchInput = '';
  final List<PopularCityModel> _popularCities = [];
  final List<FaqViewModel> _faqList = [];
  final int _year = DateTime.now().year;
  String? _backgroundImage;
  Color? _widgetColor;
  Color? _textColor;

  CityWeatherViewModel? get cityWeater => _cityWeater;
  List<CityViewModel> get listCities => _listCities;
  String get searchInput => _searchInput;
  List<PopularCityModel> get popularCities => _popularCities;
  List<FaqViewModel> get faqList => _faqList;
  int get year => _year;
  String? get backgroundImage => _backgroundImage;
  Color? get widgetColor => _widgetColor;
  Color? get textColor => _textColor;

  void getListCitiesAction(String name) async {
    var listCities = await apiClient.getCities(name);
    _listCities = [];
    for (var e in listCities) {
      _listCities.add(CityViewModel.makeViewModel(e));
    }
    _listCities;
    notifyListeners();
  }

  void getWeaterAction(String name) async {
    var cityWeater = await apiClient.getWeather(name);
    if (cityWeater == null) {
      return;
    } else {
      _cityWeater = CityWeatherViewModel.makeViewModel(cityWeater);
    }
    notifyListeners();
  }

  void getInitCityWeather() async {
    var cityFromIp = await apiClient.getInitCity();
    getWeaterAction(cityFromIp);
    notifyListeners();
  }

  void getPopularCities() {
    _popularCities
        .add(PopularCityModel(name: 'New York', assetImage: 'assets/ny.jpg'));
    _popularCities
        .add(PopularCityModel(name: 'London', assetImage: 'assets/london.jpg'));
    _popularCities
        .add(PopularCityModel(name: 'Dubai', assetImage: 'assets/dubai.jpg'));
    _popularCities
        .add(PopularCityModel(name: 'Paris', assetImage: 'assets/paris.jpg'));
  }

  void getfaqList() {
    var randomText =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam augue nisl, consequat et justo sit amet, interdum feugiat est. Sed eu quam urna. Ut blandit turpis quis rutrum sodales. Etiam ornare justo sed tortor elementum consectetur. Vivamus pulvinar lorem quis elit mollis, eget fermentum elit facilisis. Sed cursus sed lacus nec egestas. Duis nec tincidunt purus. Aenean consequat lacus sit amet rhoncus tempor. Phasellus in lacus a purus tempus finibus. Ut cursus, nibh ac venenatis porta, justo mauris maximus velit, volutpat dignissim eros est quis lorem. Proin in ipsum et est posuere tincidunt ac vitae sem.';
    List<FaqModel> faqList = [];
    faqList.add(FaqModel(
        question: 'Question 1',
        text:
            'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.'));
    faqList.add(FaqModel(question: 'Question 2', text: randomText));
    faqList.add(FaqModel(question: 'Question 3', text: randomText));
    faqList.add(FaqModel(question: 'Question 4', text: randomText));
    for (var e in faqList) {
      _faqList.add(FaqViewModel.makeViewModel(e));
    }
  }

  void isDayNow() {
    var hour = DateTime.now().hour;
    bool isDay = hour >= 6 && hour < 18;
    if (isDay) {
      _backgroundImage = 'assets/day_bg.jpg';
      _widgetColor = const Color(0xFF90CAF9);
      _textColor = Colors.black;
    } else {
      _backgroundImage = 'assets/night_bg.jpg';
      _widgetColor = const Color(0xFF2A344B);
      _textColor = Colors.white;
    }
  }
}

class CityViewModel {
  bool isOpened;
  final cityName;
  final country;

  factory CityViewModel.makeViewModel(CityModel city) {
    var cityName = city.name;
    var country = city.sys.country;
    var isOpen = false;
    return CityViewModel(cityName, country, isOpen);
  }

  CityViewModel(this.cityName, this.country, this.isOpened);
}

class FaqViewModel {
  final question;
  final text;
  bool isOpened;

  factory FaqViewModel.makeViewModel(FaqModel faqModel) {
    var question = faqModel.question;
    var text = faqModel.text;
    var isOpened = false;
    return FaqViewModel(question, text, isOpened);
  }

  FaqViewModel(this.question, this.text, this.isOpened);
}

class CityWeatherViewModel {
  final cityName;
  final country;
  final icon;
  final typeWeather;
  final weatherDescription;
  final date;
  final temp;
  final tempMax;
  final tempMin;

  factory CityWeatherViewModel.makeViewModel(CityModel city) {
    var name = city.name;
    var country = city.sys.country;
    var icon =
        'http://openweathermap.org/img/wn/${city.weather.first.icon}@2x.png';
    var typeWeath = city.weather.first.main;
    var description = StringUtils.capitalize(city.weather.first.description);
    var todayDate = DateFormat('d MMMM y').format(DateTime.now());
    var temperature = makeTemperature(city.main.temp);
    var temperatureMax = makeTemperature(city.main.temp_max);
    var temperatureMin = makeTemperature(city.main.temp_min);
    return CityWeatherViewModel(name, country, icon, typeWeath, description,
        todayDate, temperature, temperatureMax, temperatureMin);
  }

  CityWeatherViewModel(
      this.cityName,
      this.country,
      this.icon,
      this.typeWeather,
      this.weatherDescription,
      this.date,
      this.temp,
      this.tempMax,
      this.tempMin);
}

String makeTemperature(double temp) {
  var temperature = temp.floor();
  var result = '';
  if (temperature > 0) {
    result = '+$temperature';
  } else {
    result = '$temperature';
  }
  return '$result°C';
}
