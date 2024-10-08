part of 'main_bloc.dart';

abstract class MainEvent {
  const MainEvent();
}

class ChangeRegionEvent extends MainEvent {
  final String regionName;
  final String slugName;
  final String lat;
  final String long;
  final void Function() onSuccess;
  final void Function() onError;

  const ChangeRegionEvent({
    required this.slugName,
    required this.regionName,
    required this.lat,
    required this.long,
    required this.onSuccess,
    required this.onError,
  });
}
