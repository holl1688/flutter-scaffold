class BankOptionsModel {
  int? id;
  String? bankName;

  BankOptionsModel({int? id, String? bankName}) {
    if (id != null) {
      this.id = id;
    }
    if (bankName != null) {
      this.bankName = bankName;
    }
  }

  BankOptionsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankName = json['bank_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['bank_name'] = bankName;
    return data;
  }
}