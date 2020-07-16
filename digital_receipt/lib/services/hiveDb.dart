
import 'dart:convert';

import 'package:digital_receipt/models/customer.dart';
import 'package:digital_receipt/models/receipt.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';


class HiveDb extends ChangeNotifier {

  Box draftBox;
  Box receiptHistoryBox;
  Box customerBox;



   /* FOR Customer PAGE */
  initCustomerBox() async {
    customerBox = await Hive.openBox('customer');
   // print('object:: $draftBox');
    notifyListeners();
  }

  Future<void> addCustomer(List customer) async {
    print(customerBox);
    var res = json.encode(customer);
    await customerBox.put('customer', res);
  }

  getCustomer() {
    var customer = customerBox.get('customer');
    if (customerBox != null) {
      return jsonDecode(customer);
    }
  }





   /* FOR ReeceiptHistory PAGE */
  initReceiptHistoryBox() async {
    receiptHistoryBox = await Hive.openBox('receiptHistory');
   // print('object:: $draftBox');
    notifyListeners();
  }

  Future<void> addReceiptHistory(List receipts) async {
    print(receiptHistoryBox);
    var res = json.encode(receipts);
    await receiptHistoryBox.put('receiptHistory', res);
  }

  getReceiptHistory() {
    var receiptHistory = receiptHistoryBox.get('receiptHistory');
    if (receiptHistoryBox != null) {
      return jsonDecode(receiptHistory);
    }
  }






  /* FOR DRAFT PAGE */

  Future<void> addDraft(List receipts) async {
    var draftBox = await Hive.openBox('draft');
    var res = json.encode(receipts);
    await draftBox.put('draft', res);
  }

  Future getDraft() async {
    // print('dfdf');
    var draftBox = await Hive.openBox('draft');
    var draft = draftBox.get('draft');
    return json.decode(draft);
  }
}
