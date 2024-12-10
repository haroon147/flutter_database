import'package:flutter/material.dart';
import 'package:flutter_database/SharedPreferences/preferences.dart';

    class SharedHome extends StatefulWidget {
      const SharedHome({super.key});
      @override
      State<SharedHome> createState() => _SharedHomeState();
    }
    class _SharedHomeState extends State<SharedHome> {
      int num =0;
      bool checked = false;
      List<String> countries = ["PAKISTAN", "INDIA", "AFGHAN","IRAN"];
      List<String> SelectedItem =[];

      @override
  void initState() {
     num = MyPreference.getNumber();
     checked = MyPreference.fetchBool();
     SelectedItem = MyPreference.FetchList();
    super.initState();
  }
      @override
      Widget build(BuildContext context) {
        return Scaffold(
         appBar: AppBar(
           title: const Text("Shared Preferences"),
         ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(" the Number is: $num",
                      style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold,
                    ),
                    ),
                    const SizedBox(width: 20,),
                    ElevatedButton(onPressed: (){
                      setState(() {
                        num = num+1;
                        MyPreference.saveNumber(num);
                      });
                    },
                      style:ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFA68080),
                        shadowColor: const Color(0xFFD00D0D),
                        foregroundColor: const Color(0xFF4093ff),
                      ),
                       child: const Icon(Icons.add),
                                            ),
                  ],
                ),
               CheckboxListTile(
                 value: checked,
                 onChanged: (value){
                   setState(() {
                     checked =!checked;
                     MyPreference.saveCheckBox(checked);

                   });
                 },
                 title: const Text("TRUE/FALSE",
                   style: TextStyle(
                   fontSize: 30,
                     fontWeight: FontWeight.bold,
                 ),
                 ),
               ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: countries.length,
                    itemBuilder: (BuildContext context, int index){
                  return CheckboxListTile(
                      value: SelectedItem.contains(countries[index]),
                    onChanged: (v){
                    setState(() {
                      if(SelectedItem.contains(countries[index])){
                        SelectedItem.remove(countries[index]);
                      }else{
                        SelectedItem.add(countries[index]);
                      }
                    }
                    );
                  },
                    title: Text(countries[index]),
                  );
                }
                ),
                ElevatedButton(onPressed: (){
                  setState(() {
                    MyPreference.saveList(SelectedItem);
                  }

                  );
                }, child: const Text("Save"))
              ],
            ),
          ),
        );
      }
    }
    