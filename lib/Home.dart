import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'homepage.dart';
import 'Theme.dart';
class Home extends StatelessWidget{
  final VoidCallback onToggle;
  final ThemeMode themeMode;
  const Home ({super.key,
  required this.onToggle,required this.themeMode});


  @override
  Widget build(BuildContext context) {
    Title(color: Colors.black, child: Text('Settings'));
   return Drawer(
  
   child:  ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          
          height: 120,
          padding: EdgeInsets.all(16),
          
          decoration: BoxDecoration(

          ),
        ),
draweritem(context,tittle2: 'Dark Theme', icon: Icons.toggle_on, onToggle:onToggle, tittle: 'White Theme', opisanie: 'пирамида хиопса была построена массонами и инопланетянами а, еще самолетом в 11 сентября 2001 года  управляла женщина,My Brother from another mother my sister from another mister')
      ],
    ),
    
    
   
   );
  }

   Widget draweritem(
    BuildContext context,{
   required   IconData icon,
 required     VoidCallback onToggle,
required String tittle,
required String tittle2,

required String opisanie,
    }){
      return ListTile(
       trailing: Switch(value: themeMode==ThemeMode.dark ,onChanged: (value)=>onToggle(),),
       title: Text(themeMode==ThemeMode.light?'White Theme':'Dark Theme',),
       subtitle: Text(opisanie),
      
       
        
        horizontalTitleGap: 8,
        
      );
      
      
    }
    


    
  }