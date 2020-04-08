import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScheduleBreakfest {
  String workingDay;
  String schedule;

  ScheduleBreakfest({this.workingDay, this.schedule});

  static List<ScheduleBreakfest> getSchedule() {
    return <ScheduleBreakfest>[
      ScheduleBreakfest(
        workingDay: "Segunda a Sexta",
        schedule: "a partir das 07h",
      ),
      ScheduleBreakfest(
        workingDay: "Sábados",
        schedule: "a partir das 07h",
      ),
    ];
  }
}

class ScheduleLunch {
  String workingDay;
  String schedule;

  ScheduleLunch({this.workingDay, this.schedule});

  static List<ScheduleLunch> getSchedule() {
    return <ScheduleLunch>[
      ScheduleLunch(
        workingDay: "Segunda a Sexta",
        schedule: "11h às 13h30h",
      ),
      ScheduleLunch(
        workingDay: "Sábados",
        schedule: "11h às 13h30h",
      ),
    ];
  }
}

class ScheduleDinner {
  String workingDay;
  String schedule;

  ScheduleDinner({this.workingDay, this.schedule});

  static List<ScheduleDinner> getSchedule() {
    return <ScheduleDinner>[
      ScheduleDinner(
        workingDay: "Segunda a Sexta",
        schedule: "18:30h às 21h",
      ),
      ScheduleDinner(
        workingDay: "Sábados",
        schedule: "Não abre",
      ),
    ];
  }
}

class ScheduleScreen extends StatelessWidget {
  final selectedBreakfestSchedule = [];
  final breakfestSchedule = ScheduleBreakfest.getSchedule();

  final selectedLunchSchedule = [];
  final lunchSchedule = ScheduleLunch.getSchedule();

  final selectedDinnerSchedule = [];
  final dinnerSchedule = ScheduleDinner.getSchedule();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Horários de funcionamento'),
        backgroundColor: Colors.blue[900],
        elevation: 0.0,
      ),
      bottomNavigationBar: Container(
        height: 50.0,
        color: Colors.white,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Café da manhã'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: (
                DataTable(
                columns: [
                  DataColumn(
                      label: Text("Dias da semana"),
                      numeric: false,
                      tooltip: "Dias da semana em que o restaurante abre"),
                  DataColumn(
                      label: Text("Horários"),
                      numeric: false,
                      tooltip: "Horários de funcionamento"),
                ],
                rows: breakfestSchedule
                    .map(
                      (schedule) => DataRow(
                          selected: selectedBreakfestSchedule.contains(schedule),
                          cells: [
                            DataCell(
                              Text(schedule.workingDay),
                            ),
                            DataCell(
                              Text(schedule.schedule),
                            ),
                          ]),
                    )
                    .toList(),
              )),
            ),
            SizedBox(height: 50,),
            Text('Almoço'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: (DataTable(
                columns: [
                  DataColumn(
                      label: Text("Dias da semana"),
                      numeric: false,
                      tooltip: "Dias da semana em que o restaurante abre"),
                  DataColumn(
                      label: Text("Horários"),
                      numeric: false,
                      tooltip: "Horários de funcionamento"),
                ],
                rows: lunchSchedule
                    .map(
                      (schedule) => DataRow(
                          selected: selectedLunchSchedule.contains(schedule),
                          cells: [
                            DataCell(
                              Text(schedule.workingDay),
                            ),
                            DataCell(
                              Text(schedule.schedule),
                            ),
                          ]),
                    )
                    .toList(),
              )),
            ),
            SizedBox(height: 50,),
            Text('Jantar'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: (DataTable(
                columns: [
                  DataColumn(
                      label: Text("Dias da semana"),
                      numeric: false,
                      tooltip: "Dias da semana em que o restaurante abre"),
                  DataColumn(
                      label: Text("Horários"),
                      numeric: false,
                      tooltip: "Horários de funcionamento"),
                ],
                rows: dinnerSchedule
                    .map(
                      (schedule) => DataRow(
                          selected: selectedDinnerSchedule.contains(schedule),
                          cells: [
                            DataCell(
                              Text(schedule.workingDay),
                            ),
                            DataCell(
                              Text(schedule.schedule),
                            ),
                          ]),
                    )
                    .toList(),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
