class BookingTrip {
  String? address;
  String? countryOfIssue;
  String? dateOfBirth;
  String? email;
  String? expiryDate;
  String? firstname;
  String? gender;
  String? lastname;
  String? nationality;
  String? passportNumber;
  String? phone;
  String? tripId;
  String? price;
  String? seat;
  String? noticeId;
  String? officeName;
  String? url;
  String? refname;

  BookingTrip(
      {this.address,
      this.countryOfIssue,
      this.dateOfBirth,
      this.email,
      this.expiryDate,
      this.firstname,
      this.gender,
      this.lastname,
      this.nationality,
      this.passportNumber,
      this.phone,
      this.tripId,
      this.price,
      this.seat,
      this.noticeId,
      this.officeName,
      this.url,
      this.refname});

  BookingTrip.fromJson(Map<String, dynamic> json) {
    address = json['Address'];
    countryOfIssue = json['CountryOfIssue'];
    dateOfBirth = json['DateOfBirth'];
    email = json['Email'];
    expiryDate = json['ExpiryDate'];
    firstname = json['Firstname'];
    gender = json['Gender'];
    lastname = json['Lastname'];
    nationality = json['Nationality'];
    passportNumber = json['PassportNumber'];
    phone = json['Phone'];
    tripId = json['TripId'];
    price = json['price'];
    seat = json['seat'];
    noticeId = json['NoticeId'];
    officeName = json['OfficeName'];
    url = json['Url'];
    refname = json['refname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Address'] = address;
    data['CountryOfIssue'] = countryOfIssue;
    data['DateOfBirth'] = dateOfBirth;
    data['Email'] = email;
    data['ExpiryDate'] = expiryDate;
    data['Firstname'] = firstname;
    data['Gender'] = gender;
    data['Lastname'] = lastname;
    data['Nationality'] = nationality;
    data['PassportNumber'] = passportNumber;
    data['Phone'] = phone;
    data['TripId'] = tripId;
    data['price'] = price;
    data['seat'] = seat;
    data['NoticeId'] = noticeId;
    data['OfficeName'] = officeName;
    data['Url'] = url;
    data['refname']=refname;
    return data;
  }
}
