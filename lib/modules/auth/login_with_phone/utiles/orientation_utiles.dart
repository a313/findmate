import 'package:findmate/x_res/res.dart';
import 'package:flutter/material.dart';

class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;

  const MultiSelectChip(this.reportList, {super.key});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  List<String> selectedChoices = [];

  // this function will build and return the choice list
  _buildChoiceList() {
    List<Widget> choices = [];
    for (var item in widget.reportList) {
      choices.add(
        Container(
          height: 42,
          margin: const EdgeInsets.only(right: 10, bottom: 12),
          child: ChoiceChip(
            backgroundColor: ColorConst.white,
            selectedColor: ColorConst.appColorFF,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
              side: BorderSide(
                color: ColorConst.appColorFF,
              ),
            ),
            padding:
                const EdgeInsets.only(right: 20, left: 20, top: 9, bottom: 9),
            label: Text(
              item,
              style: TextStyleClass.interRegular(
                size: 16.0,
                color: selectedChoices.contains(item)
                    ? ColorConst.white
                    : ColorConst.appColorFF,
              ),
            ),
            selected: selectedChoices.contains(item),
            onSelected: (selected) {
              setState(
                () {
                  selectedChoices.contains(item)
                      ? selectedChoices.remove(item)
                      : selectedChoices.add(item);
                },
              );
            },
          ),
        ),
      );
    }
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
