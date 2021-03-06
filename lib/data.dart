class StationDetails {
  late String stationName, stationAddress;

  StationDetails({required String sn, required String sa}) {
    stationName = sn;
    stationAddress = sa;
  }
}

class BatteryDetails {
  late String batteryName, batteryStats, batteryPrice;

  BatteryDetails({required String bn, required String bs, required String bp}) {
    batteryName = bn;
    batteryStats = bs;
    batteryPrice = bp;
  }
}

class StationBrain {
  List<StationDetails> stationBank = [
    StationDetails(
        sn: 'Indore Airport',
        sa: 'Devi Ahillyabai Holkar Airport Area, Indore, Madhya Pradesh 453112'),
    StationDetails(
        sn: 'District Court Indore',
        sa: 'New Siyaganj, Indore, Madhya Pradesh 452007'),
    StationDetails(
        sn: 'Central Museum Indore',
        sa: 'Near GPO Square, Residency, Navlakha, Indore, Madhya Pradesh 452001'),
  ];
}

class BatteryBrain {
  List<BatteryDetails> batteryBank = [
    BatteryDetails(
        bn: 'Car Battery Efficient', bs: '120KWh/120Km/car', bp: 'Rs 250'),
    BatteryDetails(
        bn: 'Bike Battery Efficient', bs: '130KWh/140Km/bike', bp: 'Rs 250'),
    BatteryDetails(bn: 'Auto battery', bs: '130KWh/140Km/auto', bp: 'Rs 250'),
  ];
}
