enum PaymentStatus{
  waiting('waiting', '입금대기'),
  completed('completed', '결제완료'),
  cancelled('cancelled', '주문취소');

  const PaymentStatus(this.status, this.statusName);

  final String status;
  final String statusName;

  factory PaymentStatus.getStatusName(String status){
    return PaymentStatus.values.firstWhere((value)=>value.status == status, orElse:() => PaymentStatus.waiting);
  }
}