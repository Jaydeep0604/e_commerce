import 'package:e_commerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

class RatingChartRow extends StatefulWidget {
  int label;
  // double pct;
  int pct;
  RatingChartRow({Key? key, required this.label, required this.pct})
      : super(key: key);

  @override
  State<RatingChartRow> createState() => _RatingChartRowState();
}

class _RatingChartRowState extends State<RatingChartRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.label == widget.label)
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Wrap(
                  children: List<Widget>.generate(widget.label, (int index) {
                    return Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 20,
                    );
                  }),
                )
              ],
            ),
          ),
        SizedBox(width: 8),
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
            child: Stack(children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.30,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(50)),
                child: Text(''),
              ),
              Container(
                width:
                    MediaQuery.of(context).size.width * (widget.pct / 100) * 2,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(50)),
                child: Text(''),
              ),
            ]),
          ),
        ),
        Expanded(
            child: Text('${widget.pct}%',
                style: TextStyle(color: AppColors.greyColor))),
      ],
    );
  }
}
