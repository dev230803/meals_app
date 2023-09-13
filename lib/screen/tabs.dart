import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:meal/provider/favorite_provider.dart';
import 'package:meal/provider/filters_provider.dart';

import 'package:meal/screen/categories.dart';
import 'package:meal/screen/filters.dart';
import 'package:meal/screen/meals.dart';
import 'package:meal/widgets/main_drawer.dart';


class TabsScreen extends ConsumerStatefulWidget{
  const TabsScreen({super.key});


  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen>{

  var _selectedpageindex=0;
  


   
  
  void _selectPage(int index){
    setState(() {
      _selectedpageindex=index;
    });

  }

  void _selectScreen(String identifier)  async{
    if(identifier=='Filters'){
      Navigator.of(context).pop();

     await Navigator.of(context).push<Map<Filter,bool>>(
  MaterialPageRoute(builder:(ctx)=> const  FiltersScreen() ));
     
   
    }
    else{
      Navigator.of(context).pop();
    }
  }
  @override
  Widget build(BuildContext context) {
    
    final availableMeals=ref.watch(filteredMealsProvider);
    
    Widget activePage= CategoriesScreen(
      
    availableMeals: availableMeals ,);
    var activePageTitle='Categories';

    if(_selectedpageindex==1){
      var favoritemeals=ref.watch(favoriteMEalProvider);
      activePage= MealsScreen(
        meals: favoritemeals,
        );
      activePageTitle='Your Favorite';
    }
      return Scaffold(
        appBar: AppBar(
          title:Text(activePageTitle),

        ),
        drawer: MainDrawer(onSelectScreen: _selectScreen) ,
        body: activePage,
        bottomNavigationBar: BottomNavigationBar(
          onTap:_selectPage,
          currentIndex: _selectedpageindex,
          items:const [
             BottomNavigationBarItem(icon: Icon(Icons.set_meal),label:'Categories' ),
             BottomNavigationBarItem(icon:Icon( Icons.star),label:'Favourites' ),
          ],
          
           ),
      );
  }
}