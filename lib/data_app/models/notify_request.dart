
class NotifyRequest{
  final String fromDate;
  final String toDate;
  final String langID;
  final int pageIndex;
  final int pageSize;
  final String type;


  NotifyRequest({
    required this.fromDate,
    required this.toDate,
    required this.langID,
    required this.pageSize,
    required this.pageIndex,
    required this.type
  });
}