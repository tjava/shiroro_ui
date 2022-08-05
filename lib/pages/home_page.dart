import 'package:cron/cron.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:get/get.dart';
import 'package:shiroro_ui/constants/colors.dart';
import 'package:shiroro_ui/controllers/home_controller.dart';
import 'package:shiroro_ui/widget/custom_text.dart';
import 'package:shiroro_ui/widget/edit_table.dart';
import 'package:shiroro_ui/widget/login.dart';
import 'package:shiroro_ui/widget/pop_up.dart';
import 'package:shiroro_ui/widget/table_content.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.find();
  final cron = Cron();
  bool inset = false;

  @override
  void initState() {
    super.initState();
    cron.schedule(Schedule.parse('*/1 * * * *'), () async {
      await homeController.getDatas();
      // print('every minutes');
      // print(homeController.minute.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    Offset offset = inset ? const Offset(6, 6) : const Offset(8, 8);
    double blur = inset ? 8.0 : 10.0;

    return Scaffold(
      backgroundColor: light,
      body: Obx(
        () => Center(
          child: SizedBox(
            width: 600,
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 100,
                      width: 100,
                      child: Image(
                        image: AssetImage("assets/images/logo.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      children: [
                        CustomText(
                          text: 'NORTH SOUTH POWER',
                          color: green,
                          size: 24,
                          weight: FontWeight.bold,
                          underline: true,
                        ),
                        const SizedBox(height: 10),
                        CustomText(
                          text: 'COMPANY LIMITED',
                          color: blue,
                          size: 24,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ],
                ),
                Center(
                  child: CustomText(
                    text: 'e-STATISTIC BOARD',
                    color: black,
                    size: 24,
                    weight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Table(
                  border: TableBorder.all(width: 2),
                  columnWidths: const {
                    0: FractionColumnWidth(0.55),
                    1: FractionColumnWidth(0.35),
                  },
                  children: [
                    TableContent.buildBigHeaderRow(
                      [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomText(
                                  text: 'DAY',
                                  color: red,
                                  size: 18,
                                  weight: FontWeight.bold,
                                ),
                                TableContent.dispay(
                                  number: homeController.day.value,
                                  size: 6.0,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomText(
                                  text: 'MONTH',
                                  color: red,
                                  size: 18,
                                  weight: FontWeight.bold,
                                ),
                                TableContent.dispay(
                                  number: homeController.month.value,
                                  size: 6.0,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomText(
                                  text: 'YEAR',
                                  color: red,
                                  size: 18,
                                  weight: FontWeight.bold,
                                ),
                                TableContent.dispay(
                                  number: homeController.year.value,
                                  size: 6.0,
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomText(
                                  text: 'HOUR',
                                  color: red,
                                  size: 18,
                                  weight: FontWeight.bold,
                                ),
                                TableContent.dispay(
                                  number: homeController.hour.value,
                                  size: 6.0,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomText(
                                  text: 'MINUTE',
                                  color: red,
                                  size: 18,
                                  weight: FontWeight.bold,
                                ),
                                TableContent.dispay(
                                  number: homeController.minute.value,
                                  size: 6.0,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Table(
                  border: TableBorder.all(width: 2),
                  columnWidths: const {
                    0: FractionColumnWidth(0.4),
                    1: FractionColumnWidth(0.2),
                    2: FractionColumnWidth(0.3),
                  },
                  children: [
                    TableContent.buildHeaderRow(
                      [
                        CustomText(
                          text: 'DESCRIPTION',
                          color: red,
                          size: 18,
                          weight: FontWeight.bold,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'LAST MONTH',
                            style: TextStyle(
                              color: red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        CustomText(
                          text: 'CUMULATIVE',
                          color: red,
                          size: 18,
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
                              size: 18,
                              weight: FontWeight.bold,
                            ),
                            CustomText(
                              text: 'COMPLETED',
                              color: black,
                              size: 18,
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),
                        TableContent.dispay(
                          number: homeController.manhoursCompleted.value,
                          size: 6.0,
                        ),
                        TableContent.dispay(
                          number:
                              homeController.cumulativeManhoursCompleted.value,
                          size: 6.0,
                        ),
                      ],
                    ),
                    TableContent.buildRow(
                      [
                        CustomText(
                          text: 'FATALITIES',
                          color: black,
                          size: 18,
                          weight: FontWeight.bold,
                        ),
                        TableContent.dispay(
                          number: homeController.fatalities.value,
                          size: 6.0,
                        ),
                        TableContent.dispay(
                          number: homeController.cumulativeFatalities.value,
                          size: 6.0,
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
                              size: 18,
                              weight: FontWeight.bold,
                            ),
                            CustomText(
                              text: 'REPORTED',
                              color: black,
                              size: 18,
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),
                        TableContent.dispay(
                          number: homeController.nearMissesReported.value,
                          size: 6.0,
                        ),
                        TableContent.dispay(
                          number:
                              homeController.cumulativeNearMissesReported.value,
                          size: 6.0,
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
                              size: 18,
                              weight: FontWeight.bold,
                            ),
                            CustomText(
                              text: 'INCIDENT(LT1)',
                              color: black,
                              size: 18,
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),
                        TableContent.dispay(
                          number: homeController.lostTimeIncident.value,
                          size: 6.0,
                        ),
                        TableContent.dispay(
                          number:
                              homeController.cumulativeLostTimeIncident.value,
                          size: 6.0,
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
                              size: 18,
                              weight: FontWeight.bold,
                            ),
                            CustomText(
                              text: 'INCIDENTS',
                              color: black,
                              size: 18,
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),
                        TableContent.dispay(
                          number: homeController.environmentalIncidents.value,
                          size: 6.0,
                        ),
                        TableContent.dispay(
                          number: homeController
                              .cumulativeEnvironmentalIncidents.value,
                          size: 6.0,
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
                              size: 18,
                              weight: FontWeight.bold,
                            ),
                            CustomText(
                              text: 'CASE',
                              color: black,
                              size: 18,
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),
                        TableContent.dispay(
                          number: homeController.firstAidCase.value,
                          size: 6.0,
                        ),
                        TableContent.dispay(
                          number: homeController.cumulativeFirstAidCase.value,
                          size: 6.0,
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
                              size: 18,
                              weight: FontWeight.bold,
                            ),
                            CustomText(
                              text: 'DRILLS',
                              color: black,
                              size: 18,
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),
                        TableContent.dispay(
                          number: homeController.emergencyDrills.value,
                          size: 6.0,
                        ),
                        TableContent.dispay(
                          number:
                              homeController.cumulativeEmergencyDrills.value,
                          size: 6.0,
                        ),
                      ],
                    ),
                    TableContent.buildRow(
                      [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: '   ',
                              color: black,
                              size: 18,
                              weight: FontWeight.bold,
                            ),
                            CustomText(
                              text: '   ',
                              color: black,
                              size: 18,
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),
                        TableContent.dispay(
                          number: '  ',
                          size: 6.0,
                        ),
                        TableContent.dispay(
                          number: '    ',
                          size: 6.0,
                        ),
                      ],
                    ),
                    TableContent.buildRow(
                      [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: '   ',
                              color: black,
                              size: 18,
                              weight: FontWeight.bold,
                            ),
                            CustomText(
                              text: '   ',
                              color: black,
                              size: 18,
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),
                        TableContent.dispay(
                          number: '  ',
                          size: 6.0,
                        ),
                        TableContent.dispay(
                          number: '    ',
                          size: 6.0,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Center(
                  child: Listener(
                    onPointerUp: (_) => setState(() {
                      inset = false;
                    }),
                    onPointerDown: (_) => setState(() {
                      inset = true;
                    }),
                    child: GestureDetector(
                      onTap: () {
                        if (homeController.checkAuth()) {
                          showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (context) => const PopUp(
                              form: EditTable(),
                              isLogin: false,
                            ),
                          );
                        } else {
                          showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (context) => const PopUp(form: Login()),
                          );
                        }
                      },
                      child: AnimatedContainer(
                        height: 60,
                        width: 200,
                        duration: const Duration(milliseconds: 100),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: light,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: blur,
                              offset: -offset,
                              color: Colors.white,
                              inset: inset,
                            ),
                            BoxShadow(
                              blurRadius: blur,
                              offset: offset,
                              color: dark,
                              inset: inset,
                            ),
                          ],
                        ),
                        child: Center(
                          child: CustomText(
                            text: 'Update Table',
                            color: black,
                            size: 20,
                            weight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
