import 'package:flutter/material.dart';
import '../view_models/home_page_view_model.dart';


class FaqWidget extends StatefulWidget {
  final HomePageViewModel viewModel;
  const FaqWidget({super.key, required this.viewModel});

  @override
  State<FaqWidget> createState() => _FaqWidgetState();
}

class _FaqWidgetState extends State<FaqWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, bottom: 20, top: 20),
      child: Column(
        children: [
          const Text(
            'Frequently Asked       Questions',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: widget.viewModel.faqList.length,
            itemBuilder: (BuildContext context, int index) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        child: Container(
                          height: 55,
                          width: 379,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(247, 247, 247, 0.85),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 20, left: 20, top: 15, bottom: 15),
                            child: Row(
                              children: [
                                Text(
                                  widget.viewModel.faqList[index].question,
                                  style: const TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                const Spacer(),
                                widget.viewModel.faqList[index].isOpened
                                    ? const Icon(
                                        Icons.expand_less,
                                        size: 32,
                                      )
                                    : const Icon(
                                        Icons.expand_more,
                                        size: 32,
                                      ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () => setState(() {
                          widget.viewModel.faqList[index].isOpened =
                              !widget.viewModel.faqList[index].isOpened;
                        }),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      if (widget.viewModel.faqList[index].isOpened)
                        Container(
                          width: 379,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(247, 247, 247, 0.85),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              widget.viewModel.faqList[index].text,
                              style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
