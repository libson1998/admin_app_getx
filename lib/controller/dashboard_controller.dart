import 'package:adminapp/helper/shared_preference.dart';
import 'package:adminapp/network/login_network/home_network.dart';
import 'package:adminapp/network/models/PawsomeResponse.dart';
import 'package:adminapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum OrientationType { portrait, landscape }

class DashboardController extends GetxController {
  // Define your variables here
  Rx<DateTime> startDate = DateTime
      .now()
      .obs;
  Rx<DateTime?> endDate = DateTime
      .now()
      .obs;
  RxString selectedItem = 'Dashboard'.obs;
  RxString formatedFromDate = ''.obs;
  RxString formatedToDate = ''.obs;
  RxBool isLoading = false.obs;
  var pawSomeResponse = PawsomeResponse().obs;
  Rx<OrientationType> orientation = Rx<OrientationType>(
      OrientationType.portrait);
  RxBool showLogoutTile = false.obs;

  @override
  void onInit() async {
    final now = DateTime.now();
    formatedFromDate.value = DateFormat('dd-MM-yyyy').format(now);
    formatedToDate.value = DateFormat('dd-MM-yyyy').format(now);
    pawSomeData();
    super.onInit();
  }

  void toggleLogoutTile() {
    showLogoutTile.value = !showLogoutTile.value;
  }

  void showLogoutDialog() {
    Get.dialog(
      Theme(
        data: ThemeData(
          dialogBackgroundColor: Colors.white, // Set dialog background color
        ),
        child: AlertDialog(
          title: const Text("Logout"),
          content: const Text("Are you sure you want to logout?"),
          actions: [
            ElevatedButton(
              onPressed: () {
                clearSpecificPreference(PreferenceConstants.strToken);
                clearSpecificPreference(PreferenceConstants.blnIsLoggedIn);
                Get.offNamed("/LoginScreen");
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white, // Set button text color
              ),
              child: const Text('Logout', style: TextStyle(color: Colors.red),),
            ),
            ElevatedButton(
              onPressed: () {
                Get.back(); // Close the dialog
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white, // Set button text color
              ),
              child: const Text(
                'Cancel', style: TextStyle(color: Colors.black),),
            ),
          ],
        ),
      ),
    );
  }

  void setOrientation(Orientation newOrientation) {
    if (newOrientation == Orientation.portrait) {
      orientation.value = OrientationType.portrait;
    } else {
      orientation.value = OrientationType.landscape;
    }
  }

  void pawSomeData() async {
    try {
      isLoading.value = true;
      var response = await HomeNetwork.getPawSomeData(
          formatedFromDate.toString(), formatedToDate.toString());
      if (response!.statuscode == 200) {
        print(pawSomeResponse);
        pawSomeResponse.value = response;
      } else {
        pawSomeResponse.value = response;
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> clearSpecificPreference(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  Future<void> selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      initialDateRange: DateTimeRange(
        start: startDate.value,
        end: endDate.value ?? DateTime.now().add(const Duration(days: 7)),
      ),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      startDate.value = picked.start;
      endDate.value = picked.end;

      // Format and print dates in dd-MM-yyyy or desired format
      formatedFromDate.value = DateFormat('dd-MM-yyyy').format(startDate.value);
      formatedToDate.value = DateFormat('dd-MM-yyyy').format(endDate.value!);

      print('Formatted From Date: $formatedFromDate');
      print('Formatted To Date: $formatedToDate');

      // Use formattedStartDate and formattedEndDate for further processing
      // (e.g., display in UI, store in database)
      pawSomeData();
    }
  }

// Other methods and logic can be added here as needed
}

class BookingRecord {
  final String date;
  final String bookingDetails;
  final String paymentStatus;
  final String receiptNo;
  final String paymentMode;
  final String salesAmount;
  final String collectedAmount;

  BookingRecord({
    required this.date,
    required this.bookingDetails,
    required this.paymentStatus,
    required this.receiptNo,
    required this.paymentMode,
    required this.salesAmount,
    required this.collectedAmount,
  });
}

class ExpenseReport {
  final String date;
  final String expenseDetails;
  final String expAmount;

  ExpenseReport({
    required this.date,
    required this.expenseDetails,
    required this.expAmount,
  });
}
