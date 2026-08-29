class BookingModel {
  final int? id;
  final int? challengeId;
  final int? bookedByUserId;
  final String? totalPrice;
  final String? status;
  final Payment? payment;
  final String? createdAt;
  final String? updatedAt;

  BookingModel({
    this.id,
    this.challengeId,
    this.bookedByUserId,
    this.totalPrice,
    this.status,
    this.payment,
    this.createdAt,
    this.updatedAt,
  });

  BookingModel copyWith({
    int? id,
    int? challengeId,
    int? bookedByUserId,
    String? totalPrice,
    String? status,
    Payment? payment,
    String? createdAt,
    String? updatedAt,
  }) =>
      BookingModel(
        id: id ?? this.id,
        challengeId: challengeId ?? this.challengeId,
        bookedByUserId: bookedByUserId ?? this.bookedByUserId,
        totalPrice: totalPrice ?? this.totalPrice,
        status: status ?? this.status,
        payment: payment ?? this.payment,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
    id: json["id"],
    challengeId: json["challenge_id"],
    bookedByUserId: json["booked_by_user_id"],
    totalPrice: json["total_price"],
    status: json["status"],
    payment: json["payment"] == null ? null : Payment.fromJson(json["payment"]),
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "challenge_id": challengeId,
    "booked_by_user_id": bookedByUserId,
    "total_price": totalPrice,
    "status": status,
    "payment": payment?.toJson(),
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class Payment {
  final int? id;
  final int? bookingId;
  final String? method;
  final String? amount;
  final String? status;
  final PaymentAccount? paymentAccount;
  final int? confirmedByUserId;
  final String? confirmedAt;
  final String? createdAt;
  final String? updatedAt;

  Payment({
    this.id,
    this.bookingId,
    this.method,
    this.amount,
    this.status,
    this.paymentAccount,
    this.confirmedByUserId,
    this.confirmedAt,
    this.createdAt,
    this.updatedAt,
  });

  Payment copyWith({
    int? id,
    int? bookingId,
    String? method,
    String? amount,
    String? status,
    PaymentAccount? paymentAccount,
    int? confirmedByUserId,
    String? confirmedAt,
    String? createdAt,
    String? updatedAt,
  }) =>
      Payment(
        id: id ?? this.id,
        bookingId: bookingId ?? this.bookingId,
        method: method ?? this.method,
        amount: amount ?? this.amount,
        status: status ?? this.status,
        paymentAccount: paymentAccount ?? this.paymentAccount,
        confirmedByUserId: confirmedByUserId ?? this.confirmedByUserId,
        confirmedAt: confirmedAt ?? this.confirmedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
    id: json["id"],
    bookingId: json["booking_id"],
    method: json["method"],
    amount: json["amount"],
    status: json["status"],
    paymentAccount: json["payment_account"] == null ? null : PaymentAccount.fromJson(json["payment_account"]),
    confirmedByUserId: json["confirmed_by_user_id"],
    confirmedAt: json["confirmed_at"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "booking_id": bookingId,
    "method": method,
    "amount": amount,
    "status": status,
    "payment_account": paymentAccount?.toJson(),
    "confirmed_by_user_id": confirmedByUserId,
    "confirmed_at": confirmedAt,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class PaymentAccount {
  final String? accountName;
  final String? recipientName;
  final String? recipientPhone;
  final String? accountIdentifier;
  final String? qrImagePath;

  PaymentAccount({
    this.accountName,
    this.recipientName,
    this.recipientPhone,
    this.accountIdentifier,
    this.qrImagePath,
  });

  PaymentAccount copyWith({
    String? accountName,
    String? recipientName,
    String? recipientPhone,
    String? accountIdentifier,
    String? qrImagePath,
  }) =>
      PaymentAccount(
        accountName: accountName ?? this.accountName,
        recipientName: recipientName ?? this.recipientName,
        recipientPhone: recipientPhone ?? this.recipientPhone,
        accountIdentifier: accountIdentifier ?? this.accountIdentifier,
        qrImagePath: qrImagePath ?? this.qrImagePath,
      );

  factory PaymentAccount.fromJson(Map<String, dynamic> json) => PaymentAccount(
    accountName: json["account_name"],
    recipientName: json["recipient_name"],
    recipientPhone: json["recipient_phone"],
    accountIdentifier: json["account_identifier"],
    qrImagePath: json["qr_image_path"],
  );

  Map<String, dynamic> toJson() => {
    "account_name": accountName,
    "recipient_name": recipientName,
    "recipient_phone": recipientPhone,
    "account_identifier": accountIdentifier,
    "qr_image_path": qrImagePath,
  };
}