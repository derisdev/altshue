class BankAccount {
  BankAccount({
    required this.status,
    required this.message,
  });
  late final int status;
  late final String message;

  BankAccount.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
