// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../customization/header_style.dart';
import '../shared/utils.dart' show CalendarFormat, DayBuilder;

class CalendarHeader extends StatelessWidget {
  final dynamic locale;
  final DateTime focusedMonth;
  final CalendarFormat calendarFormat;
  final HeaderStyle headerStyle;
  final VoidCallback onLeftChevronTap;
  final VoidCallback onRightChevronTap;
  final VoidCallback onHeaderTap;
  final VoidCallback onHeaderLongPress;
  final ValueChanged<CalendarFormat> onFormatButtonTap;
  final Map<CalendarFormat, String> availableCalendarFormats;
  final DayBuilder? headerTitleBuilder;

  const CalendarHeader({
    Key? key,
    this.locale,
    required this.focusedMonth,
    required this.calendarFormat,
    required this.headerStyle,
    required this.onLeftChevronTap,
    required this.onRightChevronTap,
    required this.onHeaderTap,
    required this.onHeaderLongPress,
    required this.onFormatButtonTap,
    required this.availableCalendarFormats,
    this.headerTitleBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = headerStyle.titleTextFormatter?.call(focusedMonth, locale) ??
        DateFormat.yMMMM(locale).format(focusedMonth);

    return Container(
      padding: EdgeInsets.only(bottom: 16),
      margin: EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFd4d4d4),
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: headerTitleBuilder?.call(context, focusedMonth) ??
                GestureDetector(
                  onTap: onHeaderTap,
                  onLongPress: onHeaderLongPress,
                  child: Row(
                    children: [
                      Text(
                        text.split(" ").first + " ",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 28,
                          color: Color(0xFF4F4F4F),
                        ),
                      ),
                      Text(
                        text.split(" ").last,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 28,
                          color: Color(0xFF0F0F0F),
                        ),
                      ),
                    ],
                  ),
                ),
          ),
          GestureDetector(
            onTap: onLeftChevronTap,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF0F0F0),
              ),
              child: Icon(
                Icons.chevron_left_rounded,
              ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          GestureDetector(
            onTap: onRightChevronTap,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF0F0F0),
              ),
              child: Icon(
                Icons.chevron_right_rounded,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
