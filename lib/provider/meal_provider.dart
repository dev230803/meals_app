
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/data/dummy_data.dart';

var mealProvider=Provider((ref){
  return dummyMeals;

});
