import 'dart:convert';
import 'package:http/http.dart' as http;
class InVoiceModel {
  late int lineNo;
  late String productName;
  late var unit;
  late var unitNo;
  late var  price;
  late var quantity;
  late var total;
  late String expiryDate;

  InVoiceModel({required this.lineNo,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.total,
    required this.expiryDate,
    required this.unit,
    required this.unitNo});

  factory InVoiceModel.fromjson(json){
    return InVoiceModel(lineNo: json['lineNo']??'',
        productName:json['productName']??'',
        price: json['price']??0,
        quantity: json['quantity']??0,
        total: json['total']??0,
        expiryDate: json['expiryDate'] ??'',
        unit: json['unit']??0,
        unitNo: json['unitNo']??0);
  }
}


class FetchInvoice {
  Future<List<InVoiceModel>> fetchInvoices () async{
    String url = 'http://appydev-001-site2.atempurl.com/InvoiceDetail';
    final response = await http.get(Uri.parse(url));

    List<dynamic> invoices = jsonDecode(response.body);

    List<InVoiceModel> invoicesList = [];

    for(int i=0 ;i<invoices.length;i++){
      invoicesList.add(InVoiceModel.fromjson(invoices[i]));
    }
    return invoicesList;
  }
}