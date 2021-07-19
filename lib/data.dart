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
    StationDetails(sn: 'WeSwap Station #1', sa: 'Address of station #1'),
    StationDetails(sn: 'WeSwap Station #2', sa: 'Address of station #2'),
    StationDetails(sn: 'WeSwap Station #3', sa: 'Address of station #3'),
  ];
}

class BatteryBrain {
  List<BatteryDetails> batteryBank = [
    BatteryDetails(bn: 'Battery #1', bs: '10KWh/250Km/auto', bp: 'Rs 250'),
    BatteryDetails(bn: 'Battery #2', bs: '10KWh/250Km/auto', bp: 'Rs 250'),
    BatteryDetails(bn: 'Battery #3', bs: '10KWh/250Km/auto', bp: 'Rs 250'),
  ];
}
