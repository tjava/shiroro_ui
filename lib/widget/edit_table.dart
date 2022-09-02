import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pop_alert/pop_alert.dart';
import 'package:shiroro_ui/constants/colors.dart';
import 'package:shiroro_ui/controllers/edit_table_controller.dart';
import 'package:shiroro_ui/controllers/home_controller.dart';
import 'package:shiroro_ui/widget/custom_text.dart';
import 'package:shiroro_ui/widget/table_content.dart';

class EditTable extends StatefulWidget {
  const EditTable({Key? key}) : super(key: key);

  @override
  State<EditTable> createState() => _EditTableState();
}

class _EditTableState extends State<EditTable> {
  HomeController homeController = Get.find();
  EditTableController editTableController = Get.find();

  TextEditingController manhoursCompletedController = TextEditingController();
  TextEditingController fatalitiesController = TextEditingController();
  TextEditingController nearMissesReportedController = TextEditingController();
  TextEditingController lostTimeIncidentController = TextEditingController();
  TextEditingController environmentalIncidentsController =
      TextEditingController();
  TextEditingController firstAidCaseController = TextEditingController();
  TextEditingController emergencyDrillsController = TextEditingController();

  TextEditingController manhoursCompletedCumulativeController =
      TextEditingController();
  TextEditingController fatalitiesCumulativeController =
      TextEditingController();
  TextEditingController nearMissesReportedCumulativeController =
      TextEditingController();
  TextEditingController lostTimeIncidentCumulativeController =
      TextEditingController();
  TextEditingController environmentalIncidentsCumulativeController =
      TextEditingController();
  TextEditingController firstAidCaseCumulativeController =
      TextEditingController();
  TextEditingController emergencyDrillsCumulativeController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Table(
              border: TableBorder.all(width: 2),
              columnWidths: const {
                0: FractionColumnWidth(0.46),
                1: FractionColumnWidth(0.2),
                2: FractionColumnWidth(0.34),
              },
              children: [
                TableContent.buildHeaderRow(
                  [
                    CustomText(
                      text: 'DESCRIPTION',
                      color: red,
                      size: 15,
                      weight: FontWeight.bold,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'LAST MONTH',
                        style: TextStyle(
                          color: red,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    CustomText(
                      text: 'CUMULATIVE',
                      color: red,
                      size: 15,
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
                TableContent.buildRow(
                  [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: 'MAN-HOUR',
                          color: black,
                          size: 15,
                          weight: FontWeight.bold,
                        ),
                        CustomText(
                          text: 'COMPLETED',
                          color: black,
                          size: 15,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                    TextField(
                      controller: manhoursCompletedController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: black,
                          ),
                        ),
                        label: Center(
                          child: CustomText(
                            text: homeController.manhoursCompleted.value,
                            size: 30,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      style: TextStyle(
                        fontSize: 30,
                        color: black,
                      ),
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(2),
                      ],
                    ),
                    TextField(
                      controller: manhoursCompletedCumulativeController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: black,
                          ),
                        ),
                        label: Center(
                          child: CustomText(
                            text: homeController
                                .cumulativeManhoursCompleted.value,
                            size: 30,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      style: TextStyle(
                        fontSize: 30,
                        color: black,
                      ),
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(4),
                      ],
                    ),
                  ],
                ),
                TableContent.buildRow(
                  [
                    CustomText(
                      text: 'FATALITIES',
                      color: black,
                      size: 15,
                      weight: FontWeight.bold,
                    ),
                    TextField(
                      controller: fatalitiesController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: black,
                          ),
                        ),
                        label: Center(
                          child: CustomText(
                            text: homeController.fatalities.value,
                            size: 30,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      style: TextStyle(
                        fontSize: 30,
                        color: black,
                      ),
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(2),
                      ],
                    ),
                    TextField(
                      controller: fatalitiesCumulativeController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: black,
                          ),
                        ),
                        label: Center(
                          child: CustomText(
                            text: homeController.cumulativeFatalities.value,
                            size: 30,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      style: TextStyle(
                        fontSize: 30,
                        color: black,
                      ),
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(4),
                      ],
                    ),
                  ],
                ),
                TableContent.buildRow(
                  [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: 'NEAR MISSES',
                          color: black,
                          size: 15,
                          weight: FontWeight.bold,
                        ),
                        CustomText(
                          text: 'REPORTED',
                          color: black,
                          size: 15,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                    TextField(
                      controller: nearMissesReportedController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: black,
                          ),
                        ),
                        label: Center(
                          child: CustomText(
                            text: homeController.nearMissesReported.value,
                            size: 30,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      style: TextStyle(
                        fontSize: 30,
                        color: black,
                      ),
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(2),
                      ],
                    ),
                    TextField(
                      controller: nearMissesReportedCumulativeController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: black,
                          ),
                        ),
                        label: Center(
                          child: CustomText(
                            text: homeController
                                .cumulativeNearMissesReported.value,
                            size: 30,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      style: TextStyle(
                        fontSize: 30,
                        color: black,
                      ),
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(4),
                      ],
                    ),
                  ],
                ),
                TableContent.buildRow(
                  [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: 'LOST TIME',
                          color: black,
                          size: 15,
                          weight: FontWeight.bold,
                        ),
                        CustomText(
                          text: 'INCIDENT(LT1)',
                          color: black,
                          size: 15,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                    TextField(
                      controller: lostTimeIncidentController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: black,
                          ),
                        ),
                        label: Center(
                          child: CustomText(
                            text: homeController.lostTimeIncident.value,
                            size: 30,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      style: TextStyle(
                        fontSize: 30,
                        color: black,
                      ),
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(2),
                      ],
                    ),
                    TextField(
                      controller: lostTimeIncidentCumulativeController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: black,
                          ),
                        ),
                        label: Center(
                          child: CustomText(
                            text:
                                homeController.cumulativeLostTimeIncident.value,
                            size: 30,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      style: TextStyle(
                        fontSize: 30,
                        color: black,
                      ),
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(4),
                      ],
                    ),
                  ],
                ),
                TableContent.buildRow(
                  [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: 'ENVERONMENTAL',
                          color: black,
                          size: 15,
                          weight: FontWeight.bold,
                        ),
                        CustomText(
                          text: 'INCIDENTS',
                          color: black,
                          size: 15,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                    TextField(
                      controller: environmentalIncidentsController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: black,
                          ),
                        ),
                        label: Center(
                          child: CustomText(
                            text: homeController.environmentalIncidents.value,
                            size: 30,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      style: TextStyle(
                        fontSize: 30,
                        color: black,
                      ),
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(2),
                      ],
                    ),
                    TextField(
                      controller: environmentalIncidentsCumulativeController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: black,
                          ),
                        ),
                        label: Center(
                          child: CustomText(
                            text: homeController
                                .cumulativeEnvironmentalIncidents.value,
                            size: 30,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      style: TextStyle(
                        fontSize: 30,
                        color: black,
                      ),
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(4),
                      ],
                    ),
                  ],
                ),
                TableContent.buildRow(
                  [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: 'FIRST AID',
                          color: black,
                          size: 15,
                          weight: FontWeight.bold,
                        ),
                        CustomText(
                          text: 'CASE',
                          color: black,
                          size: 15,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                    TextField(
                      controller: firstAidCaseController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: black,
                          ),
                        ),
                        label: Center(
                          child: CustomText(
                            text: homeController.firstAidCase.value,
                            size: 30,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      style: TextStyle(
                        fontSize: 30,
                        color: black,
                      ),
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(2),
                      ],
                    ),
                    TextField(
                      controller: firstAidCaseCumulativeController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: black,
                          ),
                        ),
                        label: Center(
                          child: CustomText(
                            text: homeController.cumulativeFirstAidCase.value,
                            size: 30,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      style: TextStyle(
                        fontSize: 30,
                        color: black,
                      ),
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(4),
                      ],
                    ),
                  ],
                ),
                TableContent.buildRow(
                  [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: 'EMERGENCY',
                          color: black,
                          size: 15,
                          weight: FontWeight.bold,
                        ),
                        CustomText(
                          text: 'DRILLS',
                          color: black,
                          size: 15,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                    TextField(
                      controller: emergencyDrillsController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: black,
                          ),
                        ),
                        label: Center(
                          child: CustomText(
                            text: homeController.emergencyDrills.value,
                            size: 30,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      style: TextStyle(
                        fontSize: 30,
                        color: black,
                      ),
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(2),
                      ],
                    ),
                    TextField(
                      controller: emergencyDrillsCumulativeController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: black,
                          ),
                        ),
                        label: Center(
                          child: CustomText(
                            text:
                                homeController.cumulativeEmergencyDrills.value,
                            size: 30,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      style: TextStyle(
                        fontSize: 30,
                        color: black,
                      ),
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(4),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: GestureDetector(
              onTap: () {
                editTableController.editTable([
                  manhoursCompletedController.text,
                  fatalitiesController.text,
                  nearMissesReportedController.text,
                  lostTimeIncidentController.text,
                  environmentalIncidentsController.text,
                  firstAidCaseController.text,
                  emergencyDrillsController.text,
                  manhoursCompletedCumulativeController.text,
                  fatalitiesCumulativeController.text,
                  nearMissesReportedCumulativeController.text,
                  lostTimeIncidentCumulativeController.text,
                  environmentalIncidentsCumulativeController.text,
                  firstAidCaseCumulativeController.text,
                  emergencyDrillsCumulativeController.text,
                ]);

                PopAlert.loadingAlert(context: context);
                // print(editTableController.status.value);
                Future.delayed(const Duration(milliseconds: 2000), () {
                  if (editTableController.status.value == 200) {
                    Navigator.pop(context);
                    PopAlert.iconAlert(
                      context: context,
                      title: 'Successfully Updated',
                      icon: PopAlertIcon.success,
                      color: Colors.green,
                    );
                  } else {
                    Navigator.pop(context);
                    PopAlert.iconAlert(
                      context: context,
                      title: editTableController.errorMessage.value,
                      texts: editTableController.errors.value,
                      icon: PopAlertIcon.failed,
                      color: Colors.red,
                    );
                  }
                });
              },
              child: Container(
                height: 60,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: light,
                  boxShadow: [
                    const BoxShadow(
                      blurRadius: 8.0,
                      offset: Offset(-6, -6),
                      color: Colors.white,
                    ),
                    BoxShadow(
                      blurRadius: 8.0,
                      offset: const Offset(-6, -6),
                      color: dark,
                    ),
                  ],
                ),
                child: Center(
                  child: CustomText(
                    text: 'Submit',
                    color: black,
                    size: 20,
                    weight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
