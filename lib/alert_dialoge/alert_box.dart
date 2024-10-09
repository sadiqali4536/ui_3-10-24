import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AlertBox extends StatefulWidget {
  const AlertBox({super.key});

  @override
  State<AlertBox> createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: ()async{
        await showDialog(context: context, builder: (context){
            return AlertDialog(
              content: Text('Something error'),
              title: Text('check internet connection'),
              actions: [
                TextButton(onPressed: (){
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("internet connection is fixed"),
                   backgroundColor: Colors.green,));
                }, child:Text('Ok') ),
                // TextButton(onPressed: (){
                //   Navigator.pop(context);
                //   Fluttertoast.showToast(msg: "not connected");
                // }, child: Text("cancel"))
                ElevatedButton(
                  onPressed: (){Navigator.pop(context);
                    Fluttertoast.showToast(
                      msg: "canceled the alert",
                      
                    );
                  }, 
                  child: Text("Cancel")
                )
              ],
            );
          });
        }, child: Text('show alertbox')),
      ),
    );
  }
}
