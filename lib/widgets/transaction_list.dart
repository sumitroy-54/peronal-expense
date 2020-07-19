import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   // Takes 60% of the screen
    //   height: MediaQuery.of(context).size.height * 0.6,
    //   child:
    return transactions.isEmpty
        ? Column(
            children: <Widget>[
              Text(
                'No transactions added yet!',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  )),
            ],
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text('\$${transactions[index].amount}'),
                      ),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    // style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                  ),
                  // Show button with label depending on available space
                  trailing: MediaQuery.of(context).size.width > 460
                      ? FlatButton.icon(
                          onPressed: () => deleteTx(transactions[index].id),
                          icon: Icon(Icons.delete),
                          textColor: Theme.of(context).errorColor,
                          label: Text('Delete'),
                        )
                      : IconButton(
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () => deleteTx(transactions[index].id),
                        ),
                ),
              );
            },
            itemCount: transactions.length,
          );
    // );
  }
}

// import 'package:flutter/material.dart';
// import '../models/transaction.dart';
// import 'package:intl/intl.dart';

// class TransactionList extends StatelessWidget {
//   final List<Transaction> transactions;
//   final Function deleteTx;

//   TransactionList(this.transactions, this.deleteTx);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 700,
//       child: transactions.isEmpty
//           ? Column(
//               children: <Widget>[
//                 Text(
//                   'No Transactions Added Yet',
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   height: 300,
//                   child: Image.asset(
//                     'assets/images/waiting.png',
//                     fit: BoxFit.cover,
//                   ),
//                 )
//               ],
//             )
//           : ListView.builder(
//               itemBuilder: (ctx, index) {
//                 return Card(
//                     child: Row(
//                   children: <Widget>[
//                     Container(
//                       margin: EdgeInsets.symmetric(
//                         vertical: 10,
//                         horizontal: 15,
//                       ),
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Theme.of(context).primaryColor,
//                           width: 2,
//                         ),
//                       ),
//                       padding: EdgeInsets.all(10),
//                       child: Text(
//                         '\$${transactions[index].amount.toStringAsFixed(2)}',
//                         // transaction.amount.toString(),
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                           color: Colors.purple,
//                         ),
//                       ),
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Row(
//                           children: <Widget>[
//                             Text(
//                               transactions[index].title,
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: <Widget>[
//                                 IconButton(
//                                   icon: Icon(Icons.delete),
//                                   color: Theme.of(context).errorColor,
//                                   onPressed: () => deleteTx(transactions[index].id),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                         Text(
//                           DateFormat('dd MMM yyyy')
//                               .format(transactions[index].date),
//                           // transaction.date.toString(),
//                           style: TextStyle(
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ));
//               },
//               itemCount: transactions.length,
//             ),
//     );
//   }
// }
