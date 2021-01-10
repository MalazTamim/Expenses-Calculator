import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal; //rename later

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      FittedBox(child: Text('\$${spendingAmount.toStringAsFixed(0)}')), //amoount spent in a certain day with no decimal digits

      SizedBox(height: 4),
      Container(
        height: 60,
        width: 10,
        child: Stack(
          children: <Widget>[
            //elements of stack are from bottom to top
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10)),
            ),

            FractionallySizedBox(
              heightFactor: spendingPctOfTotal,
              child: Container(
                decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10), //it should be of same size as the firts cotainer
                ),
              ),
            ),            
          ]
        )
      ),
       SizedBox(height: 4),
       Text(label), //hilds weekday
     ]
   );
  }
}
