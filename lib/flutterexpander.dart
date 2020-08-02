library flutterexpander;

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Expander extends StatelessWidget{
  Expander({@required this.nodes, this.label});
  final List<Widget> nodes;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        initialExpanded: true,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ScrollOnExpand(
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToExpand: true,
                      tapBodyToCollapse: true,
                      hasIcon: false,
                    ),
                    header: Container(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Row(
                          children: [
                            ExpandableIcon(
                              theme: const ExpandableThemeData(
                                expandIcon: Icons.arrow_right,
                                collapseIcon: Icons.arrow_drop_down,
                                iconColor: Colors.white,
                                iconSize: 28.0,
                                iconRotationAngle: math.pi / 2,
                                iconPadding: EdgeInsets.only(right: 5),
                                hasIcon: false,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                label,
                                style: Theme.of(context)
                                    .textTheme
                                    .body2
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    expanded: Column(
                        children: nodes)
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
