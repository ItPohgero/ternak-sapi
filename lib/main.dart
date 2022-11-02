import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pemantauan_ternak/app/core/utils/my_behaviour.dart';
import 'package:pemantauan_ternak/app/core/utils/storage_provider.dart';
import 'package:pemantauan_ternak/app/core/values/colors.dart';
import 'package:pemantauan_ternak/app/data/services/home_service.dart';
import 'package:pemantauan_ternak/app/routes/app_pages.dart';
import 'package:pemantauan_ternak/app/routes/app_routes.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    'This channel is used for important notifications',
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Message ID : " + message.messageId);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseMessaging messaging;

  @override
  void initState() {
    this.messagingInitialized();
    super.initState();
  }

  Future<void> messagingInitialized() async {
    if (StorageProvider.getIdRole()) {
      HomeService homeService = HomeService();
      await homeService.getNewToken();

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print("Receive ${message.notification.title}");

        RemoteNotification notification = message.notification;
        AndroidNotification android = message.notification?.android;

        if (notification != null && android != null) {
          flutterLocalNotificationsPlugin.show(
              notification.hashCode,
              notification.title,
              notification.body,
              NotificationDetails(
                  android: AndroidNotificationDetails(
                      channel.id, channel.name, channel.description,
                      color: Colors.blue,
                      playSound: true,
                      icon: '@mipmap/ic_launcher')));
        }
      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        print("OPEN NOTIFICATION");
        print("OPEN : ${message.notification.body.toString()}");

        RemoteNotification notification = message.notification;
        AndroidNotification android = message.notification?.android;

        if (notification != null && android != null) {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: Text(notification.title),
                    content: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[Text(notification.body)],
                      ),
                    ),
                  ));
        }
      });
    } else {
      StorageProvider.emptySession();
      Get.offAllNamed(AppRoutes.LOGIN);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return GetMaterialApp(
      title: 'Pemantauan Ternak',
      theme: ThemeData(
          fontFamily: 'Roboto',
          primarySwatch: ColorsPallete.PRIMARY,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: (StorageProvider.getIdRole() != null)
          ? AppRoutes.HOME
          : AppRoutes.LOGIN,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.full,
      builder: (context, child) {
        return ScrollConfiguration(behavior: MyBehaviour(), child: child);
      },
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

//     return GetMaterialApp(
//       title: 'Pemantauan Ternak',
//       theme: ThemeData(
//           fontFamily: 'Roboto',
//           primarySwatch: ColorsPallete.PRIMARY,
//           visualDensity: VisualDensity.adaptivePlatformDensity),
//       initialRoute: AppRoutes.LOGIN,
//       getPages: AppPages.pages,
//       debugShowCheckedModeBanner: false,
//       smartManagement: SmartManagement.full,
//     );
//   }
// }
