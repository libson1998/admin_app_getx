import 'package:adminapp/common_widgets/sized_box_heigh_width.dart';
import 'package:adminapp/ui/home/dashboard_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DashboardGrid extends StatelessWidget {
  final List<ServiceInfo> serviceInfoList;

  const DashboardGrid({super.key, required this.serviceInfoList});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const CustomSizedBox(
              height: 12,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: screenWidth < 600 ? 3 : 4,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: serviceInfoList.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(screenWidth < 600 ? 16 : 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AutoSizeText(
                            serviceInfoList[index].title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: screenWidth < 600 ? 12 : 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          AutoSizeText(
                            serviceInfoList[index].value.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: screenWidth < 600 ? 12 : 18,
                              color: Colors.grey,
                            ),
                          ),
                          const CustomSizedBox(height: 12)
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
