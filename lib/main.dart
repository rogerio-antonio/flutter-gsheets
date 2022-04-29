import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

// criar credenciais
const _credentials = r'''
{
  "type": "service_account",
  "project_id": "flutter-gsheets-348717",
  "private_key_id": "cc151618ecf5f1213366c7e6f9d4d77155cc41c7",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCM9I2KvahciWjs\nClxE52QB7imKj/NSG14rcbQOOoxRZxP+qNF06z8c7zNOVV1Ec1B7dSoPZ+7ozlHb\ncNb0lnX10SZJbJQ0XNtTLyIg/svB5bMZyH7mTE0C8s+hbzXbhn7HZHtkjOGAZJrz\nTqMz54SoBkCuxQRAF09AVQq9EfTgeRFP26NtZ8mwnd/2c2s/CcroBORWgLvpeJks\n9HGxEUf/GHZ3biY4I0x26JDTiSGWfAXrNtPrZpvP9459cZlTBDJglcKkm+yKGKtY\n9PnfUsPWfQwnS5AHMJsR/LKPI3Ahi5Mb6pqodBStWwwabhM3J7lpz5vE9ZtyytqV\n2Q0j5HMzAgMBAAECggEACR2127+5WEbAxOdEoWYvpxpOkHoP3AMOG5Qud28c7RTU\nC7fCWCPwwH/N2yaVMhydG2bv8fAgWOkjDSSmmkny1hORPNVrXlmVC7O0KtsftWoU\nI7o+Tsmnf2XRvNiS7KAtqdqbSlz8JpAbH1o6Hty9zRoea88tH7ICO6BkYeb75dqG\nDE+5JXh+kGLICBALKJMuivH0rtlLOOJZGIazTNHnRtCQO8kScnnSPJ7KmwhG+KlW\naTJruc2srdkMJoMUEGSxXCN6bIE27booC4MRa9oITg1Lsnkev1O6x1L5yUJ5AG8h\n990+JSdmMZ1lP+Ma900mNIv8MQqio5ZlRFhvx/9scQKBgQC/HQe43vIXi/t6mHE1\n5i+AWl9glTn1oYPnXu2tFXunSExPwRPe/yiqCXxIK24JAMVwIPDPsE/p2Z+kNB9I\nWLTfTUF3CDfSblHfKmJmz8m7ng2KlEKre8c1PXO5h+ptlcaPuLLya0M2p80kyAtz\nNqlvoQXWu/x8bE4npFWuAz3UMQKBgQC8z/BOYkUDLNug9cGCC9qdxmvi9Iazyc8R\nPgxVzhiBiP6kQpw4NemmS+Zlej12crlEu6MQwACHptCXiVxOxmGzXHtem3oH3yGP\neJWZMi0/LZ49XjJnT55M+Q+YSRJmPV0p3Jsp3GY1Yzoy+/5fOtyZtc+8GCyCdVjM\n/avUwg3YowKBgEjNATUOUIBhxaFU0sNqdSvawTxkfBiytzF6+uUVKu51XwR+k1g+\nMLpdNKe1S4xIa+2jzrf+/OIjEWoWpNgFWpk5r7dtPP5/Idb2KVfqzXkX4yaoBaGX\nXDJOv3esa8Pk6yeyfxBThd4bG81oGtx/tRmd6EB9idfH1hnJww2vlGzxAoGBALXb\nhnbI+fWz+BrRej+a0UdT/UgNA80ZXMMbw1/F8R6a58EokzUk4FYXFuO42IhEuaO1\nIruYYypFBvZeDDWnqCTMt9sI34HDbZy1pUl35dLLSnWLS/rr2eoDnfysrPcitaAD\nZsPsD9nuJ/lBc+EfXakDUAG4Ou6wvgY7coyrGBEHAoGBAJ6ERfcZJzdid5F8XafH\nUw8Ccka34hE290Q3tp9sNxOmUxDIFNTCOl2T3cML6Hx9D5axS6mzme2zt41KdnTl\n8kBqObZnyLSdu8ikFR9xUoWU7mYgODINgw+LawsxzmUximqZ2rD2xbjaZSExG7sA\ng78luLMpZwDoRHiivGLt/uQN\n-----END PRIVATE KEY-----\n",
  "client_email": "flutter-gsheets@flutter-gsheets-348717.iam.gserviceaccount.com",
  "client_id": "118001492748736159336",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/flutter-gsheets%40flutter-gsheets-348717.iam.gserviceaccount.com"
}
''';

// spreadsheet id
const _spreadsheetId = '1L8mcsc29qqz0Y-lFA2XJlnpXb3cgB1QykKKQgZOb_0w/';

void main() async {
  // init Gsheets
  final gsheets = GSheets(_credentials);
  // fetch spreadsheet by its id
  final ss = await gsheets.spreadsheet(_spreadsheetId);
  // get worksheet by its id
  var sheet = ss.worksheetByTitle('Worksheet1');

  // update a cell
  await sheet!.values.insertValue('ROGER', column: 1, row: 1);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
