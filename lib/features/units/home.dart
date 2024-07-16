import 'package:flutter/material.dart';
import 'package:untitled11/features/add%20invoice/add%20invoice.dart';
import 'package:untitled11/features/invoiceDetails/invoicedetails.dart';
import 'package:untitled11/features/units/unitView.dart';
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(text: 'Get all units' , onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return UnitView();
            }));
          },),
          SizedBox(
            height: 20,
          ),
          CustomButton(text: 'Invoice details' , onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return InvoiceDetials();
            }));
          },),
          SizedBox(height: 20,),
          CustomButton(text: ' add Invoice' , onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return AdddInvoice();
            }));
          },)
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key ,this.onTap, required this.text});
final String text ;
final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: Colors.grey
        ),
        child: Center(child: Text(text, style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500
        ),)),
      ),
    );
  }
}
