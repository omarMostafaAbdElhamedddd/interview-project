
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled11/features/invoiceDetails/manager.dart';

class InvoiceDetials extends StatelessWidget {
  const InvoiceDetials({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          title: Text('invoice details\ '),

        ),
        body: Column(
          children: [
            SizedBox(height: 20,),
            Text('invoice details ', style: TextStyle(
                fontSize: 2
            ),),

            Expanded(
              child: FutureBuilder(
                future:FetchInvoice().fetchInvoices(),
                builder: (context, snabshot) {
                  if (snabshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snabshot.hasData) {
                    return ListView.builder(itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text('name ${snabshot.data![index].productName}'),
                              Text('expiry date ${snabshot.data![index].expiryDate}'),
                              Text('lineNo ${snabshot.data![index].lineNo.toString()}'),


                            ],
                          ),
                          Column(
                            children: [
                              Text('unit ${snabshot.data![index].unit.toString()}'),
                              Text('quntity ${snabshot.data![index].unit.toString()}'),
                              Text('total ${snabshot.data![index].total.toString()}'),
                            ],
                          )
                        ],
                      ),
                          Divider(),
                        ],
                      );
                    });
                  }else{
                    return Center(child: Text(snabshot.error.toString()),);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
