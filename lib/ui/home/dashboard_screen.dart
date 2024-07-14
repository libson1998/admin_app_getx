import 'package:adminapp/common_widgets/sized_box_heigh_width.dart';
import 'package:adminapp/controller/dashboard_controller.dart';
import 'package:adminapp/theme/theme.dart';
import 'package:adminapp/ui/home/dashboard_grid.dart';
import 'package:adminapp/ui/home/screen_pawsome.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    print(screenWidth.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(
          () {
            if (controller.isLoading.value) {
              return const Center(
                child: SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: Color(0xFF3E11D3),
                    )),
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/user.jpg",
                          height: 50,
                          width: 50,
                        ),
                        const SizedBox(width: 8),
                        DropdownButton<String>(
                          dropdownColor: Colors.white,
                          underline: SizedBox(),
                          value: controller.selectedItem.value,
                          // Set the initial value
                          items: const [
                            DropdownMenuItem<String>(
                              value: 'Dashboard',
                              child: AutoSizeText(
                                'Dashboard',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Pawsome',
                              child: AutoSizeText(
                                'Pawsome',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                          onChanged: (value) {
                            controller.selectedItem.value =
                                value!; // Update selected value
                            // Perform actions based on selected value (optional)
                          },
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            controller.selectDateRange(context);
                          },
                          icon: const Icon(Icons.filter_alt_outlined),
                          color: const Color(0xFF3E11D3),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                            onPressed: () {
                            controller.showLogoutDialog();

                            }, icon: Icon(Icons.more_vert))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(screenWidth < 600 ? 12 : 18),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: greyColor.withOpacity(0.2)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AutoSizeText(
                          "From: ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth < 600 ? 12 : 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          controller.formatedFromDate.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth < 600 ? 12 : 16,
                              fontWeight: FontWeight.w700),
                        ),
                        const CustomSizedBox(
                          width: 12,
                        ),
                        Text(
                          "To: ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth < 600 ? 12 : 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          controller.formatedToDate.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth < 600 ? 12 : 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  controller.selectedItem.value == "Dashboard"
                      ? DashboardGrid(serviceInfoList: serviceInfoList)
                      : ScreenPawSome(
                          dashboardController: controller,
                        ),
                  const CustomSizedBox(
                    height: 12,
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

List<ServiceInfo> serviceInfoList = [
  ServiceInfo(title: "ONGOING SERVICES", value: 45),
  ServiceInfo(title: "MAIDS WITH DRIVERS", value: 3),
  ServiceInfo(title: "MAIDS WITH JALAL", value: 1),
  ServiceInfo(title: "MAIDS WITH NIMESH", value: 2),
  ServiceInfo(title: "MAIDS WITH THAVUS", value: 0),
  ServiceInfo(title: "TOTAL DROPPED", value: 48),
  ServiceInfo(title: "AM AVAILABLE", value: 1),
  ServiceInfo(title: "PM AVAILABLE", value: 10),
  ServiceInfo(title: "IN ACCOMMODATION", value: 2),
  ServiceInfo(title: "ABSENT", value: 5),
  ServiceInfo(title: "SUSPENDED", value: 0),
  ServiceInfo(title: "TOT. SALES AMT", value: 6181.12),
  ServiceInfo(title: "TODAY'S MONTHLY", value: 1260.92),
  ServiceInfo(title: "TOTAL COLLECTED", value: 0.00),
  ServiceInfo(title: "NEW CUSTOMERS", value: 5),
  ServiceInfo(title: "TOTAL REGULAR", value: 147),
  ServiceInfo(title: "AM OCCUPANCY", value: "40.31%"),
  ServiceInfo(title: "PM OCCUPANCY", value: "23.47%"),
  ServiceInfo(title: "PAWSOME BOOKINGS", value: 3),
];

class ServiceInfo {
  final String title;
  final dynamic value;

  ServiceInfo({required this.title, required this.value});
}
