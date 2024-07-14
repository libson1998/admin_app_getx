import 'package:adminapp/network/models/PawsomeResponse.dart';
import 'package:adminapp/utils/constants.dart';
import 'package:flutter/material.dart';
class SummaryTable extends StatelessWidget {
  final PawSomeData ?pawSomeData;
  const SummaryTable({super.key, required this.pawSomeData});

  @override
  Widget build(BuildContext context) {
    return
      Table(
        border: TableBorder.all(), // Add border decoration
        children: [
          TableRow(
            children: [
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Total Sales Amount',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '$currency ${pawSomeData?.totalSale?.toString() ?? ""}${pawSomeData?.totalSale != null ? "/-" : ""}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Total Collected By',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '$currency ${pawSomeData?.totalCollect?.toString() ?? ""}${pawSomeData?.totalCollect != null ? "/-" : ""}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Total Expenses',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '$currency ${pawSomeData?.totalExp?.toString() ?? ""}${pawSomeData?.totalExp != null ? "/-" : ""}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ],
      );

  }
}
