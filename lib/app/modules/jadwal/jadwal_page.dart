import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/modules/jadwal/jadwal_conroller.dart';

class JadwalPage extends StatefulWidget {
  @override
  _JadwalPageState createState() => _JadwalPageState();
}

class _JadwalPageState extends State<JadwalPage> {
  JadwalController controller = Get.put(JadwalController());

  DateTime _currentDate = DateTime.now();
  DateTime _targetDateTime = DateTime.now();
  List<Widget> _cardJadwal;

  static Widget _eventIcon = new Container(
    decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.black, width: 2.0)),
    child: Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );

  EventList<Event> _markedDateMap = EventList<Event>(
    events: {
      DateTime(2021, 4, 9): [
        Event(
          date: new DateTime(2021, 4, 28),
          title: 'Event 2',
          icon: _eventIcon,
        ),
      ],
    },
  );

  CalendarCarousel _calendarCarousel, _calendarCarouselNoHeader;
  @override
  void initState() {
    // _markedDateMap.addAll(new DateTime(2021, 4, 13), [
    //   new Event(
    //     date: new DateTime(2021, 4, 29),
    //     title: 'Event 1',
    //     icon: _eventIcon,
    //   ),
    //   new Event(
    //     date: new DateTime(2021, 4, 30),
    //     title: 'Event 2',
    //     icon: _eventIcon,
    //   ),
    //   new Event(
    //     date: new DateTime(2021, 8, 13),
    //     title: 'Event 3',
    //     icon: _eventIcon,
    //   ),
    //   new Event(
    //     date: new DateTime(2021, 4, 29),
    //     title: 'Event 3',
    //     icon: _eventIcon,
    //   ),
    // ]);

    _cardJadwal = [];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: Colors.blue,
      todayButtonColor: Colors.blue[200],
      selectedDayButtonColor: Colors.blue,
      selectedDayBorderColor: Colors.blue[800],
      weekdayTextStyle: TextStyle(color: Colors.black),
      firstDayOfWeek: 0,
      iconColor: Colors.black,
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate = date);
        _cardJadwal = [];

        if (events.length > 0) {
          events.forEach((event) {
            _cardJadwal.add(Card(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  event.title,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ));
          });
        }
      },
      daysHaveCircularBorder: false,
      showOnlyCurrentMonthDate: true,
      weekendTextStyle: TextStyle(
        color: Colors.black,
      ),
      // thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
//      firstDayOfWeek: 4,
      markedDatesMap: _markedDateMap,
      height: 380,
      selectedDateTime: _currentDate,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),

      inactiveDaysTextStyle: TextStyle(
        color: Colors.pink,
        fontSize: 16,
      ),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          // _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );

    return GetBuilder<JadwalController>(
        builder: (_) => Scaffold(
            backgroundColor: Colors.grey[50],
            appBar: new AppBar(
              title: new Text("Jadwal"),
            ),
            body: Obx(() {
              if (_.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var tanggal = DateTime.now();
                DateTime hariAwal;

                _markedDateMap.clear();

                if (tanggal.weekday > 1) {
                  hariAwal =
                      tanggal.add(Duration(days: -(tanggal.weekday) + 1));
                } else {
                  hariAwal = tanggal;
                }

                for (var i = 1; i <= 7; i++) {
                  for (var item in _.jadwal) {
                    var hari = int.tryParse(item.hari);

                    switch (hari) {
                      case 1:
                        hari = 7;
                        break;

                      case 2:
                        hari = 1;
                        break;

                      case 3:
                        hari = 2;
                        break;

                      case 4:
                        hari = 3;
                        break;

                      case 5:
                        hari = 4;
                        break;

                      case 6:
                        hari = 5;
                        break;

                      case 7:
                        hari = 6;
                        break;
                    }

                    (hari == i)
                        ? _markedDateMap.add(
                            DateTime(
                                hariAwal.year, hariAwal.month, hariAwal.day),
                            Event(
                                date: DateTime(hariAwal.year, hariAwal.month,
                                    hariAwal.day),
                                title: "Peternakan " + item.peternakan,
                                icon: _eventIcon))
                        : "";
                  }
                  hariAwal = hariAwal.add(Duration(days: 1));
                }

                return Column(
                  children: <Widget>[
                    Expanded(
                        child: Container(
                      child: _calendarCarouselNoHeader,
                      decoration: BoxDecoration(color: Colors.white),
                    )),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(10),
                      child: ListView(
                          children: (_cardJadwal.length < 1)
                              ? [
                                  Center(
                                    child: Text(
                                        "Pilih Tanggal untuk melihat informasi jadwal.."),
                                  )
                                ]
                              : _cardJadwal),
                    ))
                  ],
                );
              }
            })));
  }
}
