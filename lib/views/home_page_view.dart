// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'faq_widget.dart';
import 'footer_widget.dart';
import '../view_models/home_page_view_model.dart';
import 'popular_cities_widget.dart';
import 'search_results_widget.dart';
import 'search_widget.dart';
import 'weather_widget.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final TextEditingController textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<HomePageViewModel>().isDayNow();
    context.read<HomePageViewModel>().getInitCityWeather();
    context.read<HomePageViewModel>().getPopularCities();
    context.read<HomePageViewModel>().getfaqList();
    textController
        .addListener(() => context.read<HomePageViewModel>().searchInput);
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    final viewModel = context.watch<HomePageViewModel>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        controller: _scrollController,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(viewModel.backgroundImage!),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 130,
                  ),
                  SearchWidget(
                    viewModel: viewModel,
                    textController: textController,
                  ),
                  Stack(
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Stack(
                            children: [
                              WeatherWidget(
                                viewModel: viewModel,
                              ),
                              if (isKeyboard)
                                SearchResultsWidget(
                                  viewModel: viewModel,
                                  textController: textController,
                                ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          PopularCitiesWidget(
              viewModel: viewModel, scrollController: _scrollController),
          FaqWidget(
            viewModel: viewModel,
          ),
          FooterWidget(
            viewModel: viewModel,
          ),
        ],
      ),
    );
  }
}
