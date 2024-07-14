import 'package:adminapp/common_widgets/list_view_widget.dart';
import 'package:adminapp/common_widgets/sized_box_heigh_width.dart';
import 'package:adminapp/controller/dashboard_controller.dart';
import 'package:adminapp/theme/theme.dart';
import 'package:adminapp/ui/home/pawsome_widgets/expense_table.dart';
import 'package:adminapp/ui/home/pawsome_widgets/collection_report_table.dart';
import 'package:adminapp/ui/home/pawsome_widgets/summary_table.dart';
import 'package:adminapp/utils/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenPawSome extends StatelessWidget {
  final DashboardController dashboardController;

  const ScreenPawSome({super.key, required this.dashboardController});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 const Padding(
                   padding: EdgeInsets.all(16.0),
                   child: Center(
                    child: Text(
                      "Summary",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                                   ),
                 ),

                SummaryTable(
                    pawSomeData:
                        dashboardController.pawSomeResponse.value.pawSomeData),
                const CustomSizedBox(
                  height: 12,
                ),
                const Center(
                  child: Text(
                    "Collection Report",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                ),
                const CustomSizedBox(
                  height: 12,
                ),
                CollectionReportTable(
                    bookingData: dashboardController
                            .pawSomeResponse.value.pawSomeData?.bookingdata ??
                        []),
                const CustomSizedBox(
                  height: 12,
                ),
                const Center(
                  child: Text(
                    "Expense Report",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                ),
                const CustomSizedBox(
                  height: 12,
                ),
                ExpenseTable(
                    expenseData: dashboardController
                            .pawSomeResponse.value.pawSomeData?.expensedata ??
                        []),
                Table(
                  border: TableBorder.all(), // Add border decoration
                  children: [
                    TableRow(
                      children: [
                        const TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Total:",
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              dashboardController.pawSomeResponse.value
                                      .pawSomeData?.totalExp
                                      .toString() ??
                                  "",
                              style: const TextStyle(color: Colors.black),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
