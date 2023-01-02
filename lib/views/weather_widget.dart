import 'package:flutter/material.dart';
import '../view_models/home_page_view_model.dart';
import 'loading_indicator_widget.dart';

class WeatherWidget extends StatefulWidget {
  final HomePageViewModel viewModel;
  const WeatherWidget({super.key, required this.viewModel});

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        (widget.viewModel.cityWeater == null)
            ? Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  color: Color.fromRGBO(255, 255, 255, 0.85),
                ),
                child: const LoadingIndicator(),
              )
            : Container(
                height: 290,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  color: Color.fromRGBO(255, 255, 255, 0.85),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    right: 20,
                    left: 20,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30.0),
                                ),
                                color: Colors.white,
                              ),
                              child: Image.network(
                                widget.viewModel.cityWeater?.icon,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.viewModel.cityWeater?.temp,
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget.viewModel.cityWeater?.typeWeather,
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget.viewModel.cityWeater?.weatherDescription,
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                  color: Color(0xFF9E9E9E),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Text(
                            '${widget.viewModel.cityWeater?.cityName}, ${widget.viewModel.cityWeater?.country}',
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            widget.viewModel.cityWeater?.date,
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              color: Color(0xFF9E9E9E),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 1,
                        decoration: const BoxDecoration(
                          color: Color(0xFFBFDCE8),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 40,
                            ),
                            Column(
                              children: [
                                const Text(
                                  'Min',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 16,
                                    color: Color(0xFF9E9E9E),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.viewModel.cityWeater?.tempMin,
                                  style: const TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              height: 55,
                              width: 1,
                              decoration: const BoxDecoration(
                                color: Color(0xFFBFDCE8),
                              ),
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                const Text(
                                  'Max',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 16,
                                    color: Color(0xFF9E9E9E),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.viewModel.cityWeater?.tempMax,
                                  style: const TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ],
    );
  }
}
