// ONLY SCROLLS WITH MOUSE OR TOUCH, NOT WITH TRACKPAD/ARROWS
import 'package:flutter/material.dart';

class Yearpicker extends StatelessWidget {
  final List<DateTime> list;
  const Yearpicker(this.list, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // space between each year on the scrollview
    double spacing_height = 40;
    var middle_index = (list.length / 1.7).floor();
    var scrollController = ScrollController(
        // current year is pre-selected
        initialScrollOffset: middle_index * spacing_height);
    int num_visibleYears = 5;
    double picker_height = spacing_height * num_visibleYears;
    // the index of the preselected year
    var selected_year = ValueNotifier(list[middle_index]);
    // changing year selection on scroll
    scrollController.addListener(() {
      selected_year.value =
          list[(scrollController.offset / spacing_height).round()];
    });
    return Column(children: [
      Stack(children: [
        Positioned.fill(
          child: Center(
              child: Container(
            height: spacing_height,
            width: .5 * MediaQuery.of(context).size.width,
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                color: Colors.grey.shade300),
          )),
        ),
        //picker
        // ONLY SCROLLS WITH MOUSE OR TOUCH, NOT WITH TRACKPAD/ARROWS
        SizedBox(
            height: picker_height,
            child: ListWheelScrollView(
              diameterRatio: 1.3,
              itemExtent: spacing_height,
              controller: scrollController,
              physics: AlwaysScrollableScrollPhysics(),
              children: list
                  .map(
                    (element) => Align(
                      alignment: Alignment.center,
                      child: Text('${element.year}'),
                    ),
                  )
                  .toList(),
            ))
      ]),
      // selected year
      ValueListenableBuilder(
          valueListenable: selected_year,
          builder: (context, DateTime value, _) =>
              Text('Season: ${value.year}'))
    ]);
  }
}
