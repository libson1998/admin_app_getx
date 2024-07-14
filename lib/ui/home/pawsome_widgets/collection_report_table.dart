import 'package:adminapp/common_widgets/list_view_widget.dart';
import 'package:adminapp/network/models/PawsomeResponse.dart';
import 'package:flutter/material.dart';
class CollectionReportTable extends StatelessWidget {
  final List<Bookingdata> ?bookingData;
  const CollectionReportTable({super.key, required this.bookingData});

  @override
  Widget build(BuildContext context) {
    return
      ListViewWidget(
        shrinkWrap: true,
        scrollPhysics: const NeverScrollableScrollPhysics(),
        itemCount: (bookingData?.length ??
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
                          "Booking Details",
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
                          "Payment Status",
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
                          "Receipt No",
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
                          "Payment Mode",
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
                          "Sales Amount",
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
                          "Collected Amount",
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

          final serviceData = bookingData![index - 1];
          return Table(
            border: TableBorder.all(), // Add border decoration
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        (index).toString(),
                        style: const TextStyle(color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        serviceData?.serviceDate ?? "",
                        style: const TextStyle(color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        [
                          serviceData?.customerName ?? '',
                          serviceData?.areaName ?? '',
                          serviceData?.serviceTypeName ?? '',
                          serviceData?.dscPaystatus ?? '',
                          serviceData?.dscPaytype ?? '',
                          serviceData?.dscReceiptno ?? '',
                          serviceData?.dscPaidremarks ?? '',
                        ]
                            .where((element) => element.isNotEmpty)
                            .join(' '),
                        // Filter out empty strings and join with spaces
                        style: const TextStyle(color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        serviceData?.dscPaystatus ?? "",
                        style: const TextStyle(color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        serviceData?.dscReceiptno ?? "",
                        style: const TextStyle(color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        serviceData?.dscPaytype ?? "",
                        style: const TextStyle(color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        serviceData?.totalFee.toString() ?? "",
                        style: const TextStyle(color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        serviceData?.totalAmt.toString() ?? "",
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
