
import '../../../../core/theme/app_icons.dart';

String getWeatherIcon(int code) {
  if (code == 0) {
    return AppIcons.icSun;
  } else if ([1, 2, 3].contains(code)) {
    return AppIcons.cloudySun;
  } else if ([45, 48].contains(code)) {
    return AppIcons.cloudy;
  } else if ([51, 53, 55, 56, 57, 61, 63, 65, 66, 67, 80, 81, 82].contains(code)) {
    return AppIcons.rain;
  } else if ([71, 73, 75, 77, 85, 86].contains(code)) {
    return AppIcons.snow;
  } else if ([95, 96, 99].contains(code)) {
    return AppIcons.cloudySunRain;
  } else {
    return AppIcons.cloudy;
  }
}
