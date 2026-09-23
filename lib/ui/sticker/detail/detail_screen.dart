import 'package:flutter/widgets.dart';

typedef DetailArgs = ({
  String code,
  int number,
  String team,
  String country,
  Color teamColor,
  bool rare,
  int count,
});

class const DetailScreen({super.key, required final DetailArgs sticker})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
