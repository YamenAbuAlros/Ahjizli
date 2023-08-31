class AirLinesData {
  static Map<String, String> airLinesImages = {
    'SyrianAirlines': 'assets/images/SyrianAirlines.png',
    'ChamWings': 'assets/images/ChamWings.png',
    'AirArabia': 'assets/images/AirArabia.png',
    'GulfAir': 'assets/images/GulfAir.png',
    'Emirates': 'assets/images/Emirates.png'
  };

  static Map<String, dynamic> officeData = {};
  static String selectedOfficeName='',selectedOfficePhone='';

  static Map<String, String> nameCodeAirport = {
    'Damascus': 'DAM',
    'Aleppo': 'ALP',
    'Latakia': 'LTK',
    'Deir ez-Zor': 'DEZ',
    "Cairo": 'CAI',
    'Jordan': 'AMM',
    'AbuDhabi': 'OMAA',
    'Dubai': 'DXB',
    'DubiMaktom': 'DWC',
    'Sharjah': 'SHJ',
    'RasAlkhaema': 'RKT',
    'Alain': 'AAN',
    'Moscow': 'MOW',
    'Bahren': 'BAH',
    'Alriyad': 'OERK',
    'Jeddah': 'OEJN',
    'Sudan': 'KRT',
    'Alsomal': 'MGQ',
    'Bagdad': 'BGW',
    'Kuait': 'KWI',
    'Moroco': 'CMN',
    'Alyamn': 'SAH',
    'Tunis': 'TUN',
    'JozarAlqamar': 'HAH',
    'Jebote': 'JIB',
    'Amman': 'MCT',
    'Palseten': 'GZA',
    'Qatar': 'DOH',
    'Lebanon': 'BEY',
    'Libyia': 'TIP',
    'Iskandrya': 'HBE',
    'Somaj': 'HMB',
    'Mortyana': 'NKC',
  };
  static Map<String, dynamic> businessSeats = {
    'A1': 1,
    'A2': 1,
    'A3': 1,
    'A4': 1,
    'A5': 1,
    'A6': 1,
    'A7': 1,
    'A8': 1,
    'A9': 1,
    'A10': 1,
    'A11': 1,
    'A12': 1,
    'A13': 1,
    'A14': 1,
    'A15': 1,
    'A16': 1,
    'A17': 1,
    'A18': 1,
    'A19': 1,
    'A20': 1,
  };
  static Map<String, dynamic> economySeats = {
    'A1': 1,
    'A2': 1,
    'A3': 1,
    'A4': 1,
    'A5': 1,
    'A6': 1,
    'A7': 1,
    'A8': 1,
    'A9': 1,
    'A10': 1,
    'A11': 1,
    'A12': 1,
    'A13': 1,
    'A14': 1,
    'A15': 1,
    'A16': 1,
    'A17': 1,
    'A18': 1,
    'A19': 1,
    'A20': 1,
    'A21': 1,
    'A22': 1,
    'A23': 1,
    'A24': 1,
    'A25': 1,
    'A26': 1,
    'A27': 1,
    'A28': 1,
    'A29': 1,
    'A30': 1,
    'A31': 1,
    'A32': 1,
    'A33': 1,
    'A34': 1,
    'A35': 1,
    'A36': 1,
    'A37': 1,
    'A38': 1,
    'A39': 1,
    'A40': 1,
    'A41': 1,
    'A42': 1,
    'A43': 1,
    'A44': 1,
    'A45': 1,
    'A46': 1,
    'A47': 1,
    'A48': 1,
    'A49': 1,
    'A50': 1,
    'A51': 1,
    'A52': 1,
    'A53': 1,
    'A54': 1,
    'A55': 1,
    'A56': 1,
    'A57': 1,
    'A58': 1,
    'A59': 1,
    'A60': 1,
    'A61': 1,
    'A62': 1,
    'A63': 1,
    'A64': 1,
    'A65': 1,
    'A66': 1,
    'A67': 1,
    'A68': 1,
    'A69': 1,
    'A70': 1,
    'A71': 1,
    'A72': 1,
    'A73': 1,
    'A74': 1,
    'A75': 1,
    'A76': 1,
    'A77': 1,
    'A78': 1,
    'A79': 1,
    'A80': 1,
    'A81': 1,
    'A82': 1,
    'A83': 1,
    'A84': 1,
    'A85': 1,
    'A86': 1,
    'A87': 1,
    'A88': 1,
    'A89': 1,
    'A90': 1,
  };
}



// Beijing (BJS) – Capital (PEK) and Daxing (PKX).
// Belo Horizonte (BHZ) – Confins (CNF) and Pampulha (PLU).
// Bucharest (BUH) – Otopeni (OTP) is named after the town of Otopeni where the airport is located, while the city also has a business airport inside the city limits named Băneasa (BBU).
// Buenos Aires (BUE) – Ezeiza (EZE) is named after the suburb in Ezeiza Partido where the airport is located, while Aeroparque Jorge Newbery (AEP) is in the city proper.
// Chicago (CHI) – O'Hare (ORD), named after Orchard Field, the airport's former name, Midway (MDW), and Rockford (RFD)
// Jakarta (JKT) – Soekarno–Hatta (CGK) is named after Cengkareng, the district in which the airport is located, while the city also has another airport, Halim Perdanakusuma (HLP). JKT used to refer to the city's former airport, Kemayoran Airport, which closed down in the mid-1980s.
// London (LON) – Heathrow (LHR), Gatwick (LGW), City (LCY),[7] Stansted (STN), Luton (LTN) and Southend (SEN)
// Milan (MIL) – Malpensa (MXP), Linate (LIN) and Orio al Serio (BGY)
// Montreal (YMQ) – Trudeau (YUL), Mirabel (YMX), and Saint-Hubert (YHU)
// Moscow (MOW) – Sheremetyevo (SVO), Domodedovo (DME), Vnukovo (VKO), Ostafyevo (OSF), Zhukovsky (ZIA)
// New York City (NYC) – John F. Kennedy (JFK, formerly Idlewild (IDL), LaGuardia (LGA), and Newark (EWR)
// Osaka (OSA) – Itami (ITM, formerly OSA), Kansai (KIX), and Kobe (UKB)
// Paris (PAR) – Orly (ORY), Charles de Gaulle (CDG), Le Bourget (LBG) and Beauvais (BVA)
// Rio de Janeiro (RIO) – Galeão (GIG) and Santos Dumont (SDU)
// Rome (ROM) – Fiumicino (FCO) and Ciampino (CIA)
// São Paulo (SAO) – Congonhas (CGH), Guarulhos (GRU) and Campinas (VCP)
// Sapporo (SPK) – Chitose (CTS) and Okadama (OKD)
// Seoul (SEL) – Incheon (ICN) and Gimpo (GMP, formerly SEL)
// Stockholm (STO) – Arlanda (ARN), Bromma (BMA), Nyköping–Skavsta (NYO) and Västerås (VST)
// Tenerife (TCI) – Tenerife North (TFN) and Tenerife South (TFS)
// Tokyo (TYO) – Haneda (HND, formerly TYO) and Narita (NRT)
// Toronto (YTO) – Pearson (YYZ), Billy Bishop (YTZ), Hamilton (YHM), and Waterloo (YKF)
// Washington, D.C. (WAS) – Dulles (IAD), Reagan (DCA), and Baltimore–Washington (BWI)
// Or using a code for the city in one of the major airports and then assigning another code to another airport:

// Almaty (ALA) – Self-named (ALA) and Burundai (BXJ)
// Bangkok (BKK) – Suvarnabhumi (BKK) and Don Mueang (DMK, formerly BKK)
// Belfast (BFS) – International (BFS) and George Best (BHD)
// Berlin (BER) – Self-named (BER). The city also previously had three airports, Tempelhof (THF), Schönefeld (SXF) and Tegel (TXL), with THF and TXL both now closed. The former Berlin Schönefeld Airport was absorbed into Berlin Brandenburg Airport, with the old Schönefeld terminal becoming Terminal 5.
// Chengdu (CTU) – Shuangliu (CTU), Tianfu (TFU), and Huaizhou (HZU).[12]
// Colombo (CMB) – Bandaranaike (CMB) and Ratmalana (RML)
// Dakar (DKR) – Senghor (DKR) and Diass (DSS)
// Dallas–Fort Worth (DFW) – Self-named (DFW), Love Field (DAL), Meacham (FTW), Alliance (AFW), Addison (ADS)
//? Dubai (DXB) – Self-named (DXB) and Al Maktoum (DWC)
// Glasgow (GLA) – International (GLA) and Prestwick (PIK)
// Houston (HOU) - Hobby (HOU), George Bush Intercontinental (IAH) and Ellington (EFD)
// Istanbul (IST) – Self-named (IST), Sabiha Gökçen (SAW) and Atatürk (ISL, formerly IST)
// Johannesburg (JNB) – O. R. Tambo (formerly Jan Smuts) (JNB) and Lanseria (HLA)
// Kuala Lumpur (KUL) – Sepang (KUL) and Subang (SZB, formerly KUL)
// Kyiv (IEV) – Zhuliany (IEV) and Boryspil (KBP)
// Los Angeles (LAX) – Self-named (LAX), San Bernardino (SBD), Ontario (ONT), Orange County (SNA), Van Nuys (VNY), Palmdale (PMD), Long Beach (LGB) and Burbank (BUR)
// Medellín (MDE) – José María Córdova (MDE) and Olaya Herrera (EOH)
// Mexico City (MEX) – Self-named (MEX) and Felipe Ángeles (NLU)
// Melbourne (MEL) – Tullamarine (MEL), Essendon (MEB) and Avalon (AVV)
// Miami (MIA) – Self-named (MIA), Fort Lauderdale (FLL), West Palm Beach (PBI)
// Nagoya (NGO) – Centrair (NGO) and Komaki (NKM, formerly NGO)
// San Diego – Self-named (SAN) and Tijuana (TIJ). TIJ is physically located in Tijuana, Mexico, but offers access directly to and from the US via the Cross Border Xpress.
// San Francisco (SFO) – Self-named (SFO), Oakland (OAK), San Jose–Mineta (SJC), Sonoma–Schulz (STS)
// Seattle (SEA) – Tacoma (Sea–Tac) (SEA), Boeing Field (BFI) and Paine Field (PAE)
// Shanghai (SHA) – Pudong (PVG) and Hongqiao (SHA)
// Taipei (TPE) – Taoyuan (formerly Chiang Kai-shek) (TPE) and Songshan (TSA, formerly TPE)
// Tehran (THR) – Imam Khomeini (IKA) and Mehrabad (THR)
// When different cities with the same name each have an airport, they need to be assigned different codes. These are some examples:

// Juan Santamaría International Airport (SJO) is in Alajuela, serving the capital San José de Costa Rica. While Norman Y. Mineta San Jose International Airport (SJC) is in San Jose, California, the United States.
// Birmingham–Shuttlesworth International Airport (BHM) is in Birmingham, Alabama, the United States and Birmingham Airport (BHX) is in Birmingham, England, United Kingdom.
// Portland International Jetport (PWM) is in Portland, Maine, while Portland International Airport (PDX) is in Portland, Oregon.
// Manchester Airport (MAN) is in Manchester, England, United Kingdom, while Manchester-Boston Regional Airport (MHT) is in Manchester, New Hampshire, United States.




  // 'DZA_Bomden': 'ALG',
    // 'DZA_Satef': 'QSF',
    // 'DZA_Wahran': 'ORN',
    // 'DZA_Qastantya': 'CZL',
    // 'DZA_Anaba': 'AAE',
    // 'DZA_Batna': 'BLJ',
    // 'DZA_Telmasan': 'TLM',
    // 'DZA_Jejl': 'GJL',
    // 'DZA_Bijaea': 'BJA',
    // 'DZA_Gardaya': 'GHA',
    // 'DZA_Alshelf': 'QAS',
    // 'DZA_Skekda': 'SKI',
    // 'DZA_Mostaganm': 'MQV',
    // 'DZA_Glezan': 'QZN',
    // 'DZA_Aljelqa': 'QDJ',

    //!
    //     Syria  -- UAE --  Egypt -- Russia -- Sudan -- Iraq -- Kuwait -- Bahrain  --  Qatar --



  //   static Map<String, dynamic> seats = {
  //   'A1': AppColors.mainBlue1,
  //   'A2': AppColors.mainBlue1,
  //   'A3': AppColors.mainBlue1,
  //   'A4': AppColors.mainBlue1,
  //   'A5': AppColors.mainBlue1,
  //   'A6': AppColors.mainBlue1,
  //   'A7': AppColors.mainBlue1,
  //   'A8': AppColors.mainBlue1,
  //   'A9': AppColors.mainBlue1,
  //   'A10': AppColors.mainBlue1,
  //   'A11': AppColors.mainBlue1,
  //   'A12': AppColors.mainBlue1,
  //   'A13': AppColors.mainBlue1,
  //   'A14': AppColors.mainBlue1,
  //   'A15': AppColors.mainBlue1,
  //   'A16': AppColors.mainBlue1,
  //   'A17': AppColors.mainBlue1,
  //   'A18': AppColors.mainBlue1,
  //   'A19': AppColors.mainBlue1,
  //   'A20': AppColors.mainBlue1,
  //   'A21': AppColors.mainBlue1,
  //   'A22': AppColors.mainBlue1,
  //   'A23': AppColors.mainBlue1,
  //   'A24': AppColors.mainBlue1,
  //   'A25': AppColors.mainBlue1,
  //   'A26': AppColors.mainBlue1,
  //   'A27': AppColors.mainBlue1,
  //   'A28': AppColors.mainBlue1,
  //   'A29': AppColors.mainBlue1,
  //   'A30': AppColors.mainBlue1,
  //   'A31': AppColors.mainBlue1,
  //   'A32': AppColors.mainBlue1,
  //   'A33': AppColors.mainBlue1,
  //   'A34': AppColors.mainBlue1,
  //   'A35': AppColors.mainBlue1,
  //   'A36': AppColors.mainBlue1,
  //   'A37': AppColors.mainBlue1,
  //   'A38': AppColors.mainBlue1,
  //   'A39': AppColors.mainBlue1,
  //   'A40': AppColors.mainBlue1,
  //   'A41': AppColors.mainBlue1,
  //   'A42': AppColors.mainBlue1,
  //   'A43': AppColors.mainBlue1,
  //   'A44': AppColors.mainBlue1,
  //   'A45': AppColors.mainBlue1,
  //   'A46': AppColors.mainBlue1,
  //   'A47': AppColors.mainBlue1,
  //   'A48': AppColors.mainBlue1,
  //   'A49': AppColors.mainBlue1,
  //   'A50': AppColors.mainBlue1,
  //   'A51': AppColors.mainBlue1,
  //   'A52': AppColors.mainBlue1,
  //   'A53': AppColors.mainBlue1,
  //   'A54': AppColors.mainBlue1,
  //   'A55': AppColors.mainBlue1,
  //   'A56': AppColors.mainBlue1,
  //   'A57': AppColors.mainBlue1,
  //   'A58': AppColors.mainBlue1,
  //   'A59': AppColors.mainBlue1,
  //   'A60': AppColors.mainBlue1,
  //   'A61': AppColors.mainBlue1,
  //   'A62': AppColors.mainBlue1,
  //   'A63': AppColors.mainBlue1,
  //   'A64': AppColors.mainBlue1,
  //   'A65': AppColors.mainBlue1,
  //   'A66': AppColors.mainBlue1,
  //   'A67': AppColors.mainBlue1,
  //   'A68': AppColors.mainBlue1,
  //   'A69': AppColors.mainBlue1,
  //   'A70': AppColors.mainBlue1,
  //   'A71': AppColors.mainBlue1,
  //   'A72': AppColors.mainBlue1,
  //   'A73': AppColors.mainBlue1,
  //   'A74': AppColors.mainBlue1,
  //   'A75': AppColors.mainBlue1,
  //   'A76': AppColors.mainBlue1,
  //   'A77': AppColors.mainBlue1,
  //   'A78': AppColors.mainBlue1,
  //   'A79': AppColors.mainBlue1,
  //   'A80': AppColors.mainBlue1,
  //   'A81': AppColors.mainBlue1,
  //   'A82': AppColors.mainBlue1,
  //   'A83': AppColors.mainBlue1,
  //   'A84': AppColors.mainBlue1,
  //   'A85': AppColors.mainBlue1,
  //   'A86': AppColors.mainBlue1,
  //   'A87': AppColors.mainBlue1,
  //   'A88': AppColors.mainBlue1,
  //   'A89': AppColors.mainBlue1,
  //   'A90': AppColors.mainBlue1,
  // };