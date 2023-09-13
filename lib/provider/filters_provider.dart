

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/provider/meal_provider.dart';

enum Filter{
    vegan,
    vegetarian,
    lactoseFree,
    glutenFree
 }

class FilterNotifier extends StateNotifier<Map<Filter,bool>>{

  FilterNotifier(): super({
    Filter.glutenFree:false,
     Filter.vegan:false,
     Filter.vegetarian:false,
      Filter.lactoseFree:false,

});
  
 void setFiters(Map<Filter,bool > chosenFilers){
  state=chosenFilers;
 }
 void setFiter(Filter filter ,bool isActive){
   
   state={
    ...state,
    filter:isActive,
   };

 }
}

final filterProvider= StateNotifierProvider<FilterNotifier,Map<Filter,bool>>((ref){  
return FilterNotifier();}
);

final filteredMealsProvider=Provider((ref){
   final meals=ref.watch(mealProvider);
   final availblefilter=ref.watch(filterProvider);
  return meals.where((meal) {
      
      if(availblefilter[Filter.glutenFree]! &&  !meal.isGlutenFree){
      return false;}
      if(availblefilter[Filter.lactoseFree]! &&  !meal.isLactoseFree){
      return false;}
      if(availblefilter[Filter.vegan]! &&  !meal.isVegan){
      return false;}
      if(availblefilter[Filter.vegetarian]! &&  !meal.isVegetarian){
      return false;}
      return true;
    }).toList();
});