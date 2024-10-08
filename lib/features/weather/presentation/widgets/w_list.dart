import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/main_bloc.dart';


final regions = [
  {'name': 'Andijon', 'latitude': 40.7821, 'longitude': 72.3442, 'timezone': 'Asia/Tashkent'},
  {'name': 'Farg\'ona', 'latitude': 40.3734, 'longitude': 71.7978, 'timezone': 'Asia/Tashkent'},
  {'name': 'Namangan', 'latitude': 41.0050, 'longitude': 71.6726, 'timezone': 'Asia/Tashkent'},
  {'name': 'Toshkent', 'latitude': 41.3112, 'longitude': 69.2797, 'timezone': 'Asia/Tashkent'},
  {'name': 'Toshkent shah', 'latitude': 41.2995, 'longitude': 69.2401, 'timezone': 'Asia/Tashkent'},
  {'name': 'Samarqand', 'latitude': 39.6542, 'longitude': 66.9597, 'timezone': 'Asia/Tashkent'},
  {'name': 'Buxoro', 'latitude': 39.7747, 'longitude': 64.4286, 'timezone': 'Asia/Tashkent'},
  {'name': 'Qashqadaryo', 'latitude': 38.8631, 'longitude': 65.7891, 'timezone': 'Asia/Tashkent'},
  {'name': 'Navoiy', 'latitude': 40.0844, 'longitude': 65.3792, 'timezone': 'Asia/Tashkent'},
  {'name': 'Surxondaryo', 'latitude': 37.9373, 'longitude': 67.7916, 'timezone': 'Asia/Tashkent'},
  {'name': 'Jizzax', 'latitude': 40.1250, 'longitude': 67.8803, 'timezone': 'Asia/Tashkent'},
  {'name': 'Sirdaryo', 'latitude': 40.5017, 'longitude': 68.7756, 'timezone': 'Asia/Tashkent'},
  {'name': 'Qoraqalpog\'iston Res', 'latitude': 42.4884, 'longitude': 59.6108, 'timezone': 'Asia/Tashkent'},
  {'name': 'Xorazm', 'latitude': 41.5503, 'longitude': 60.6333, 'timezone': 'Asia/Tashkent'},
];
List<Widget> buildRegionList(BuildContext context) {
  return [
    for (int index = 0; index < regions.length; index++)
      ListTile(
        title: Text(
          regions[index]['name'] as String,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18),
        ),
        onTap: () {
          Navigator.of(context).pop();
          context.read<MainBloc>().add(ChangeRegionEvent(
                regionName:regions[index]['name'].toString(),
                onError: () {},
                onSuccess: () {},
                slugName: regions[index]['timezone'].toString(),
                lat: regions[index]['latitude'].toString(),
                long: regions[index]['longitude'].toString(),
              ));
        },
      ),
  ];
}
