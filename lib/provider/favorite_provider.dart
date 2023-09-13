import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/models/meal.dart';

class FavoriteMealNotifier extends StateNotifier<List<Meal>>{
  FavoriteMealNotifier():super([]);
  bool toggleMealFavoriteStatus(Meal meal){
    final mealIsAFavorite=state.contains(meal);

    if(mealIsAFavorite){
      state=state.where((m) => m.id!=meal.id).toList();
       return false;
    }
    else{
       state=[...state,meal];
       return true;
    }
 }

}

final favoriteMEalProvider= StateNotifierProvider<FavoriteMealNotifier,List<Meal>>((ref ){
  return FavoriteMealNotifier();
});