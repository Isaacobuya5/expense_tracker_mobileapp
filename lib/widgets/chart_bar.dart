import 'package:flutter/material.dart';

class Chartbar extends StatelessWidget {

  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  Chartbar(this.label,this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        // Fitted box prevents the child from wrapping to the next line
        // thus shrinks the child as much as possible to occupy only it space
        FittedBox(child: Text('\$${spendingAmount.toStringAsFixed(0)}')),
        SizedBox(height: 4,),
        Container(
          height: 60,
          width: 10,
          child: Stack(children: <Widget> [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0,),
                color: Color.fromRGBO(220, 220, 220, 1),
                borderRadius: BorderRadius.circular(10)
              ),
              // child: null,
              ),
              FractionallySizedBox(
                heightFactor: spendingPctOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10)
                    )
                ),)
          ]),
        ),
        SizedBox(height: 4,),
        Text(label),
      ]
    );
  }
}