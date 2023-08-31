class NewTrips {
  Map<dynamic, dynamic>? businessSeats;
  Map<dynamic, dynamic>? economySeats;

  String? airline;
  String? backCome;
  String? backDate;
  String? backLeave;
  String? from;
  String? goToCome;
  String? goToDate;
  String? goToLeave;
  String? price;
  String? round;
  String? to;
  String? officeName;

  NewTrips(
      {this.businessSeats,
      this.economySeats,
      this.airline,
      this.backCome,
      this.backDate,
      this.backLeave,
      this.from,
      this.goToCome,
      this.goToDate,
      this.goToLeave,
      this.price,
      this.round,
      this.to,
      this.officeName});

  NewTrips.fromJson(Map<dynamic, dynamic> json1) {
    businessSeats = json1['BusinessSeats'];
    economySeats = json1['EconomySeats'];

    airline = json1['Airline'];
    backCome = json1['Back Come'];
    backDate = json1['Back Date'];
    backLeave = json1['Back Leave'];
    from = json1['From'];
    goToCome = json1['Go To Come'];
    goToDate = json1['Go To Date'];
    goToLeave = json1['Go To Leave'];
    price = json1['Price'];
    round = json1['Round'];
    to = json1['To'];
    officeName = json1['OfficeName'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['BusinessSeats'] = businessSeats;

    data['EconomySeats'] = economySeats;
    data['Airline'] = airline;
    data['Back_Come'] = backCome;
    data['Back_Date'] = backDate;
    data['Back_Leave'] = backLeave;
    data['From'] = from;
    data['Go_To_Come'] = goToCome;
    data['Go_To_Date'] = goToDate;
    data['Go_To_Leave'] = goToLeave;
    data['Price'] = price;
    data['Round'] = round;
    data['To'] = to;
    data['OfficeName'] = officeName;
    return data;
  }
}
