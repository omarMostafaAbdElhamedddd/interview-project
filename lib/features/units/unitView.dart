import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled11/features/units/manager.dart';

class UnitView extends StatelessWidget {
  const UnitView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
        backgroundColor: Colors.black,
          title: Text('All units'),

        ),
        body: Column(
          children: [
            SizedBox(height: 20,),
            Text('All units ', style: TextStyle(
              fontSize: 2
            ),),

            Expanded(
              child: FutureBuilder(
                future: FetchUnits().fetchUnits(),
                builder: (context, snabshot) {
                  if (snabshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snabshot.hasData) {
                    return ListView.builder(itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(
                            snabshot.data![index].name,
                            style: TextStyle(fontSize: 30),
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
