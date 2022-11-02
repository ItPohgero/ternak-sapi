import 'package:firebase_messaging/firebase_messaging.dart';

class FCMService {
  FirebaseMessaging messaging;
  final String manajerTernak = 'notifikasi_manajer_ternak';
  final String petugas = 'notifikasi_petugas';

  FCMService() {
    this.messaging = FirebaseMessaging.instance;
  }

  _subscribe(String topic) async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');

    this
        .messaging
        .subscribeToTopic(topic)
        .then((_) => print("Success Subscribe"));
  }

  _unsubscribe(String topic) {
    this
        .messaging
        .unsubscribeFromTopic(topic)
        .then((_) => print("Success Unsubscribe"));
  }

  subscribePetugas() {
    this._subscribe(this.petugas);
  }

  unsubscribePetugas() {
    this._unsubscribe(this.petugas);
  }

  subscribeManajerTernak() {
    this._subscribe(this.manajerTernak);
  }

  unsubscribeManajerTernak() {
    this._unsubscribe(this.manajerTernak);
  }
}
