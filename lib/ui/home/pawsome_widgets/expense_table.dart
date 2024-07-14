import 'package:adminapp/common_widgets/list_view_widget.dart';
import 'package:adminapp/network/models/PawsomeResponse.dart';
import 'package:flutter/material.dart';

class ExpenseTable extends StatelessWidget {
  final List<Expensedata>?expenseData;
  const ExpenseTable({super.key, required this.expenseData});

  @override
  Widget build(BuildContext context) {
    return
      ListViewWidget(
        shrinkWrap: true,
        scrollPhysics: const NeverScrollableScrollPhysics(),
        itemCount: (expenseData?.length ??
            0) +
            1,
        itemBuilder: (context, index) {
          if (index == 0) {
            // Return the header row
            return Table(
              border: TableBorder.all(), // Add border decoration
              children: const [
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "##",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Date",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Expense Details",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Exp Amount",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }

          final expense = expenseData?[index - 1];
          return Table(
            border: TableBorder.all(),
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        index == 0 ? "##" : index.toString(),
                        style: const TextStyle(color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        expense?.entryDate ?? "",
                        style: const TextStyle(color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        expense?.expenseRemarks ?? "",
                        style: const TextStyle(color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        expense?.expAmount ?? "",
                        style: const TextStyle(color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      );

  }
}
