import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login/utils/pallete.dart';
import '../data_app/models/notify_response.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotifyItem extends StatelessWidget {
  final DataItemNotify dataItemNotify;

  const NotifyItem({super.key, required this.dataItemNotify});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          IconType(type: dataItemNotify.notifyType),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: Title(text: dataItemNotify.title)),
                    const SizedBox(width: 8,),
                    dataItemNotify.isRead ?? false ? Container() : const PointCircle()
                  ],
                ),
                DateWidget(dataItemNotify: dataItemNotify),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IconType extends StatelessWidget {
  final String type;

  const IconType({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    if (type == "ACCUMULATE") {
      return boxIcon(
        icon: FontAwesomeIcons.gift,
        color1: '#D92332',
        color2: '#E04F5B',
      );
    }
    else if (type == "DISPLAY") {
      return boxIcon(
        icon: FontAwesomeIcons.solidBuilding,
        color1: '#2D2DFE',
        color2: '#5757FE',
      );
    }
    else if (type == "AUTOPROMO") {
      return boxIcon(
        icon: FontAwesomeIcons.handHoldingDollar,
        color1: '#D92332',
        color2: '#E04F5B',
      );
    }
    return const Placeholder();
  }

  Color hexToColor(String hex) {
    hex = hex.replaceAll('#', '');
    return Color(int.parse('FF$hex', radix: 16));
  }

  Widget boxIcon({required IconData icon, required String color1, required String color2}) {
    return Container(
      margin: EdgeInsets.all(12),
      alignment: Alignment.center,
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [hexToColor(color1), hexToColor(color2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      ),
      child: FaIcon(icon, color: Colors.white),
    );
  }
}

class Title extends StatelessWidget {
  final String text;
  const Title({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Pallete.textPrimaryBlack
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class DateWidget extends StatelessWidget {
  final DataItemNotify dataItemNotify;
  const DateWidget({super.key, required this.dataItemNotify});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Từ ${formatDate(dataItemNotify.fromdate)} - ${formatDate(dataItemNotify.toDate)}',
        style: const TextStyle(
            color: Pallete.textPrimaryGrey,
            fontSize: 14
        ),
      ),
    );
  }
}

class PointCircle extends StatelessWidget {
  const PointCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 16,
          width: 16,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Pallete.colorSecondary.withOpacity(0.08)
          ),
        ),
        Container(
          height: 8,
          width: 8,
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Pallete.colorSecondary
          ),
        )
      ],
    );
  }
}

String formatDate(String date) {
  // Parse the date string
  DateTime dateTime = DateTime.parse(date);

  // Format the date
  String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);

  return formattedDate;
}
