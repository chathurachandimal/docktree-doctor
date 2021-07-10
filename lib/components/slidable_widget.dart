import 'package:doctor_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

enum SlidableAction { pres, ref }

class SlidableWidget<T> extends StatelessWidget {
  final Widget child;
  final Function(SlidableAction action) onDismissed;

  const SlidableWidget({
    @required this.child,
    @required this.onDismissed,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Slidable(
        actionPane: SlidableDrawerActionPane(),
        child: child,

        /// left side
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'Prescription',
            color: Colors.blue,
            icon: Icons.local_hospital,
            onTap: () => onDismissed(SlidableAction.pres),
          ),
          IconSlideAction(
            caption: 'Referel',
            color: kPrimaryColor,
            icon: Icons.note,
            onTap: () => onDismissed(SlidableAction.ref),
          ),
        ],

        /// right side
        // secondaryActions: <Widget>[
        //   IconSlideAction(
        //     caption: 'More',
        //     color: Colors.black45,
        //     icon: Icons.more_horiz,
        //     onTap: () => onDismissed(SlidableAction.more),
        //   ),
        //   IconSlideAction(
        //     caption: 'Delete',
        //     color: Colors.red,
        //     icon: Icons.delete,
        //     onTap: () => onDismissed(SlidableAction.delete),
        //   ),
        // ],
      );
}
