import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:sran/core/utils/constant.dart';
import 'package:sran/models/timer_model.dart';

import '../core/utils/common.dart';

class StorageModel{

  static void writeSessionsToStorage({required int duration}) {
    GetStorage getStorage = GetStorage();
    final DateFormat dateFormatter = DateFormat('yyyy-MM-dd');
    final DateFormat dayFormatter = DateFormat('EE');

    TimerSessionData model = TimerSessionData(
      duration: duration.toString(),
      dateTime: dateFormatter.format(DateTime.now()),
    );
    if (getStorage.hasData(kSessionId)) {
      List<dynamic> previousData = getStorage.read(kSessionId);
      int lastIndex = previousData.indexOf(previousData.last);
      DateTime pDate = DateTime.parse(previousData.last['date']);
      DateTime nDate = DateTime.parse(dateFormatter.format(DateTime.now()));
      if (nDate.isSameDate(pDate)) {
        previousData[lastIndex] = TimerSessionData.toMap(model);
        getStorage
            .write(kSessionId, previousData)
            .whenComplete(() => customToast('Same Day Entry'));
      } else {
        previousData.add(TimerSessionData.toMap(model));
        getStorage
            .write(kSessionId, previousData)
            .whenComplete(() => customToast('Diff Day Entry'));
      }
    } else {
      getStorage
          .write(kSessionId, [TimerSessionData.toMap(model)]).whenComplete(
              () => customToast('User First Entry'));
    }
  }

  static String? readDailyGoal(){
    GetStorage getStorage = GetStorage();
    if (getStorage.hasData(kDailyGoalId)) {
      return getStorage.read(kDailyGoalId);
    }
    return null;
  }
  static void writeDailyGoal(int value){
    GetStorage getStorage = GetStorage();
      getStorage.write(kDailyGoalId, value);
  }
}



