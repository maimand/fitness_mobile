import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final List<Widget>? horizontalList;
  final String? title;

  const Section({Key? key, this.title, this.horizontalList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 35.0),
      child: Column(
        children: <Widget>[
          SectionTitle((title != null) ? title! : ''),
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20.0, top: 10.0),
            scrollDirection: Axis.horizontal,
            child: Row(
                children:
                    (horizontalList != null) ? horizontalList! : []),
          )
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String _text;

  const SectionTitle(this._text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          _text,
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
