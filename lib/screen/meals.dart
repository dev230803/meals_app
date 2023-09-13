import 'package:flutter/material.dart';

import 'package:meal/models/meal.dart';
import 'package:meal/screen/meal_detail.dart';
import 'package:meal/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
   const MealsScreen({super.key, required this.meals,this.title});

  final String? title;
  final List<Meal> meals;
   
   
  void selectMeal(BuildContext context,Meal meal){

    Navigator.push(context, MaterialPageRoute(builder: (ctx)=>
     MealsDetailScreen(meal: meal),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             Text('Uh oh.....nothing here!!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Try Selecting Different Category',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            )
          ],
        ),
      ); 

    if (meals.isNotEmpty) {
      content=ListView.builder(
        itemCount:meals.length ,
        itemBuilder: ((context, index) =>MealItem(meal: meals[index], onSelectMeal: (meal) { 
          selectMeal(context, meal);
         },)),);
    }

    if(title==null){
      return content;
    }
    return Scaffold(
        appBar: AppBar(
         title: Text(title!),
        ),
        body:content,
        );
        
  }
}
