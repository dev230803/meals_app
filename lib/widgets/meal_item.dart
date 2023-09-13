import 'package:flutter/material.dart';

import 'package:meal/models/meal.dart';

import 'package:meal/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget{
  const MealItem({super.key,required this.meal,required this.onSelectMeal});
  final Meal meal;
  final void Function(Meal meal) onSelectMeal;


  String get complexityText{
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
  }
  String get affordibilityText{
    return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
  }
  
  
  @override
  Widget build(BuildContext context) {
    return  Card(
      margin: const EdgeInsetsDirectional.all(8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      child:InkWell(
        onTap: (){
           onSelectMeal(meal)  ;
        },
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(placeholder: MemoryImage(kTransparentImage),
               image: NetworkImage(meal.imageUrl),
               fit: BoxFit.cover,
               height: 200,
               width: double.infinity,
               ),
            ),
             Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 44),
                child: Column(
                  children: [
                    Text(
                    meal.title,
                    maxLines: 2,
                    softWrap: true,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style:const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      

                      ),
                      ),
                    const SizedBox(height: 16,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(icon: Icons.schedule, label: '${meal.duration} min'),
                        const SizedBox(width: 12,),
                        MealItemTrait(icon: Icons.work ,label:complexityText),
                        const SizedBox(width: 12,),
                        MealItemTrait(icon: Icons.attach_money ,label:affordibilityText),

                      ],
                    )
                  ],
                   
                ),
                
              ),),


          ],
        ),


        
        

      
      ),
    );
  }


}