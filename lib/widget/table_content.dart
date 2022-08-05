import 'package:flutter/material.dart';
import 'package:segment_display/segment_display.dart';
import 'package:shiroro_ui/constants/colors.dart';

class TableContent {
  // const TableContent();

  static SevenSegmentDisplay dispay({
    String? number,
    double? size,
  }) =>
      SevenSegmentDisplay(
        value: number!,
        size: size,
        backgroundColor: Colors.transparent,
        segmentStyle: HexSegmentStyle(
          enabledColor: black,
          disabledColor: black.withOpacity(0.15),
          segmentBaseSize: const Size(1.0, 2.0),
        ),
      );

  static TableRow buildRow(
    List<Widget> cells,
  ) =>
      TableRow(
        children: cells
            .map(
              (cell) => SizedBox(
                height: 60,
                child: Center(
                  child: cell,
                ),
              ),
            )
            .toList(),
      );

  static TableRow buildHeaderRow(
    List<Widget> cells,
  ) =>
      TableRow(
        children: cells
            .map(
              (cell) => SizedBox(
                height: 40,
                child: Center(
                  child: cell,
                ),
              ),
            )
            .toList(),
      );

  static TableRow buildBigHeaderRow(
    List<Widget> cells,
  ) =>
      TableRow(
        children: cells
            .map(
              (cell) => SizedBox(
                height: 80,
                child: Center(
                  child: cell,
                ),
              ),
            )
            .toList(),
      );
}
