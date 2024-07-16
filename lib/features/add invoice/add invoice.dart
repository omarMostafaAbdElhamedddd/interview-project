import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdddInvoice extends StatefulWidget {
  const AdddInvoice({super.key});

  @override
  State<AdddInvoice> createState() => _AdddInvoiceState();
}

class _AdddInvoiceState extends State<AdddInvoice> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();
  final TextEditingController controller5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Add invoice'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormField(controller: controller1,label: 'Enter lineNo',),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(controller: controller2,label: 'Enter productName',),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(controller: controller3,label: 'Enter unit',),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(controller: controller4,label: 'Enter unitNo',),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormField(controller: controller5,label: 'Enter quantity',),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key,required this.controller, required this.label});
final TextEditingController controller ;
final String label ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
        border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder()
      ),
    );
  }
}
