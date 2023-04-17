import 'package:artie/components/cards/Gcode_draws_card.dart';
import 'package:artie/model/feature.dart';
import 'package:artie/models/image.dart';
import 'package:artie/service/childapi_service.dart';
import 'package:flutter/material.dart';

class GcodeDraws extends StatefulWidget {
  const GcodeDraws({super.key});

  @override
  State<GcodeDraws> createState() => _GcodeDrawsState();
}

class _GcodeDrawsState extends State<GcodeDraws> {
  List<Draw> _draws = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadDraws();
  }

  void updateChilds() {
    _loadDraws();
  }

  void _loadDraws() async {
    final List<Draw> draws = await ChildApiService.getimages();
    setState(() {
      _draws = draws;
    });
    print(_draws);
  }

  final List<Gradient> gradient = [
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF5BCEA6),
        Color(0xFF1997AB),
      ],
    ),
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFA931E5),
        Color(0xFF4B02FE),
      ],
    ),
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF4E62CC),
        Color(0xFF202A78),
      ],
    ),
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF5BCEA6),
        Color(0xFF1997AB),
      ],
    ),
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFA931E5),
        Color(0xFF4B02FE),
      ],
    ),
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF4E62CC),
        Color(0xFF202A78),
      ],
    ),
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF5BCEA6),
        Color(0xFF1997AB),
      ],
    ),
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFA931E5),
        Color(0xFF4B02FE),
      ],
    ),
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF4E62CC),
        Color(0xFF202A78),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: _draws.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 20.0 : 0.0),
            child: GcodeDrawsCard(
              feature: _draws[index],
              gradient: gradient[index],
            ),
          );
        },
      ),
    );
  }
}
