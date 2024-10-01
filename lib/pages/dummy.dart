class Schedule {
  final String location;
  final String bankName;
  final String startTime;
  final String endTime;

  Schedule(this.location, this.bankName, this.startTime, this.endTime);
}

List<Schedule> scheduleData = [
  Schedule("Sewon dan sekitarnya", "Bank Sampah Daureisk", "07:00", "10:00"),
  Schedule("Kasihan dan sekitarnya", "Bank Sampah ABC", "09:00", "11:00"),
  Schedule("Sragen dan sekitarnya", "Bank Sampah KKRO", "07:00", "10:00"),
];
