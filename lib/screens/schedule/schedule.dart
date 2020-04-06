import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Schedule {
  String diaFuncionamento;
  String cafe;
  String almoco;
  String jantar;

  Schedule({this.diaFuncionamento, this.cafe, this.almoco, this.jantar});

  static List<Schedule> getSchedule() {
    return <Schedule>[
      Schedule(
          diaFuncionamento: "Segunda a Sexta",
          cafe: "a partir das 07h",
          almoco: "11h às 13h30",
          jantar: "	18:30h às 21h"),
          Schedule(
          diaFuncionamento: "Sábados",
          cafe: "a partir das 07h",
          almoco: "11h às 13h30",
          jantar: "Não funciona"),
    ];
  }
}

class ScheduleScreen extends StatelessWidget {
  final selectedSchedule = [];
  final schedules = Schedule.getSchedule();

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
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: (DataTable(
              columns: [
                DataColumn(
                    label: Text("Dias da semana"),
                    numeric: false,
                    tooltip: "Dias da semana em que o RU funciona"),
                DataColumn(
                    label: Text("Café da manhã"), numeric: false, tooltip: ""),
                DataColumn(
                    label: Text("Almoço"),
                    numeric: false,
                    tooltip: "this is a valor"),
                DataColumn(
                    label: Text("Jantar"),
                    numeric: false,
                    tooltip: "this is a valor"),
              ],
              rows: schedules
                  .map(
                    (schedule) => DataRow(
                        selected: selectedSchedule.contains(schedule),
                        cells: [
                          DataCell(
                            Text(schedule.diaFuncionamento),
                            onTap: () {
                              // write your code..
                            },
                          ),
                          DataCell(
                            Text(schedule.cafe),
                          ),
                          DataCell(
                            Text(schedule.almoco),
                          ),
                          DataCell(
                            Text(schedule.jantar),
                          ),
                        ]),
                  )
                  .toList(),
            )),
          ),
        ));
  }
}
