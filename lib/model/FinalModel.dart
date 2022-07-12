import 'dart:convert';

FinalModel finalModelFromJson(String str) =>
    FinalModel.fromJson(json.decode(str));
String finalModelToJson(FinalModel data) => json.encode(data.toJson());

class FinalModel {
  FinalModel({
    String? status,
    Data? data,
  }) {
    _status = status;
    _data = data;
  }

  FinalModel.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  Data? _data;
  FinalModel copyWith({
    String? status,
    Data? data,
  }) =>
      FinalModel(
        status: status ?? _status,
        data: data ?? _data,
      );
  String? get status => _status;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    Stats? stats,
    List<Coins>? coins,
  }) {
    _stats = stats;
    _coins = coins;
  }

  Data.fromJson(dynamic json) {
    _stats = json['stats'] != null ? Stats.fromJson(json['stats']) : null;
    if (json['coins'] != null) {
      _coins = [];
      json['coins'].forEach((v) {
        _coins?.add(Coins.fromJson(v));
      });
    }
  }
  Stats? _stats;
  List<Coins>? _coins;
  Data copyWith({
    Stats? stats,
    List<Coins>? coins,
  }) =>
      Data(
        stats: stats ?? _stats,
        coins: coins ?? _coins,
      );
  Stats? get stats => _stats;
  List<Coins>? get coins => _coins;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_stats != null) {
      map['stats'] = _stats?.toJson();
    }
    if (_coins != null) {
      map['coins'] = _coins?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// uuid : "Qwsogvtv82FCd"
/// symbol : "BTC"
/// name : "Bitcoin"
/// color : "#f7931A"
/// iconUrl : "https://cdn.coinranking.com/bOabBYkcX/bitcoin_btc.svg"
/// marketCap : "375797998070"
/// price : "19683.745684358615"
/// listedAt : 1330214400
/// tier : 1
/// change : "-4.23"
/// rank : 1
/// sparkline : ["20556.384447587796","20549.861370226827","20478.202119594036","20569.504433852933","20403.315713342567","20409.961219724504","20439.030320668277","20503.30035383251","20591.91424986061","20536.030572357136","20493.726688208186","20403.558595132286","20183.730260318276","20005.89952423015","19976.573387627082","19855.04583808662","19899.453383472628","19944.757087005866","19920.296371501165","19984.580801646036","20017.849906683827","19905.167756263898","19736.11138469966","19728.80180685117","19761.937437562767"]
/// lowVolume : false
/// coinrankingUrl : "https://coinranking.com/coin/Qwsogvtv82FCd+bitcoin-btc"
/// 24hVolume : "24774807486"
/// btcPrice : "1"

Coins coinsFromJson(String str) => Coins.fromJson(json.decode(str));
String coinsToJson(Coins data) => json.encode(data.toJson());

class Coins {
  Coins({
    String? uuid,
    String? symbol,
    String? name,
    String? color,
    String? iconUrl,
    String? marketCap,
    String? price,
    int? listedAt,
    int? tier,
    String? change,
    int? rank,
    List<String>? sparkline,
    bool? lowVolume,
    String? coinrankingUrl,
    String? hVolume,
    String? btcPrice,
  }) {
    _uuid = uuid;
    _symbol = symbol;
    _name = name;
    _color = color;
    _iconUrl = iconUrl;
    _marketCap = marketCap;
    _price = price;
    _listedAt = listedAt;
    _tier = tier;
    _change = change;
    _rank = rank;
    _sparkline = sparkline;
    _lowVolume = lowVolume;
    _coinrankingUrl = coinrankingUrl;
    _hVolume = hVolume;
    _btcPrice = btcPrice;
  }

  Coins.fromJson(dynamic json) {
    _uuid = json['uuid'];
    _symbol = json['symbol'];
    _name = json['name'];
    _color = json['color'];
    _iconUrl = json['iconUrl'];
    _marketCap = json['marketCap'];
    _price = json['price'];
    _listedAt = json['listedAt'];
    _tier = json['tier'];
    _change = json['change'];
    _rank = json['rank'];
    _sparkline =
        json['sparkline'] != null ? json['sparkline'].cast<String>() : [];
    _lowVolume = json['lowVolume'];
    _coinrankingUrl = json['coinrankingUrl'];
    _hVolume = json['24hVolume'];
    _btcPrice = json['btcPrice'];
  }
  String? _uuid;
  String? _symbol;
  String? _name;
  String? _color;
  String? _iconUrl;
  String? _marketCap;
  String? _price;
  int? _listedAt;
  int? _tier;
  String? _change;
  int? _rank;
  List<String>? _sparkline;
  bool? _lowVolume;
  String? _coinrankingUrl;
  String? _hVolume;
  String? _btcPrice;
  Coins copyWith({
    String? uuid,
    String? symbol,
    String? name,
    String? color,
    String? iconUrl,
    String? marketCap,
    String? price,
    int? listedAt,
    int? tier,
    String? change,
    int? rank,
    List<String>? sparkline,
    bool? lowVolume,
    String? coinrankingUrl,
    String? hVolume,
    String? btcPrice,
  }) =>
      Coins(
        uuid: uuid ?? _uuid,
        symbol: symbol ?? _symbol,
        name: name ?? _name,
        color: color ?? _color,
        iconUrl: iconUrl ?? _iconUrl,
        marketCap: marketCap ?? _marketCap,
        price: price ?? _price,
        listedAt: listedAt ?? _listedAt,
        tier: tier ?? _tier,
        change: change ?? _change,
        rank: rank ?? _rank,
        sparkline: sparkline ?? _sparkline,
        lowVolume: lowVolume ?? _lowVolume,
        coinrankingUrl: coinrankingUrl ?? _coinrankingUrl,
        hVolume: hVolume ?? _hVolume,
        btcPrice: btcPrice ?? _btcPrice,
      );
  String? get uuid => _uuid;
  String? get symbol => _symbol;
  String? get name => _name;
  String? get color => _color;
  String? get iconUrl => _iconUrl;
  String? get marketCap => _marketCap;
  String? get price => _price;
  int? get listedAt => _listedAt;
  int? get tier => _tier;
  String? get change => _change;
  int? get rank => _rank;
  List<String>? get sparkline => _sparkline;
  bool? get lowVolume => _lowVolume;
  String? get coinrankingUrl => _coinrankingUrl;
  String? get hVolume => _hVolume;
  String? get btcPrice => _btcPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = _uuid;
    map['symbol'] = _symbol;
    map['name'] = _name;
    map['color'] = _color;
    map['iconUrl'] = _iconUrl;
    map['marketCap'] = _marketCap;
    map['price'] = _price;
    map['listedAt'] = _listedAt;
    map['tier'] = _tier;
    map['change'] = _change;
    map['rank'] = _rank;
    map['sparkline'] = _sparkline;
    map['lowVolume'] = _lowVolume;
    map['coinrankingUrl'] = _coinrankingUrl;
    map['24hVolume'] = _hVolume;
    map['btcPrice'] = _btcPrice;
    return map;
  }
}

/// total : 14867
/// totalCoins : 14867
/// totalMarkets : 29001
/// totalExchanges : 166
/// totalMarketCap : "923117862242"
/// total24hVolume : "64381296748"

Stats statsFromJson(String str) => Stats.fromJson(json.decode(str));
String statsToJson(Stats data) => json.encode(data.toJson());

class Stats {
  Stats({
    int? total,
    int? totalCoins,
    int? totalMarkets,
    int? totalExchanges,
    String? totalMarketCap,
    String? total24hVolume,
  }) {
    _total = total;
    _totalCoins = totalCoins;
    _totalMarkets = totalMarkets;
    _totalExchanges = totalExchanges;
    _totalMarketCap = totalMarketCap;
    _total24hVolume = total24hVolume;
  }

  Stats.fromJson(dynamic json) {
    _total = json['total'];
    _totalCoins = json['totalCoins'];
    _totalMarkets = json['totalMarkets'];
    _totalExchanges = json['totalExchanges'];
    _totalMarketCap = json['totalMarketCap'];
    _total24hVolume = json['total24hVolume'];
  }
  int? _total;
  int? _totalCoins;
  int? _totalMarkets;
  int? _totalExchanges;
  String? _totalMarketCap;
  String? _total24hVolume;
  Stats copyWith({
    int? total,
    int? totalCoins,
    int? totalMarkets,
    int? totalExchanges,
    String? totalMarketCap,
    String? total24hVolume,
  }) =>
      Stats(
        total: total ?? _total,
        totalCoins: totalCoins ?? _totalCoins,
        totalMarkets: totalMarkets ?? _totalMarkets,
        totalExchanges: totalExchanges ?? _totalExchanges,
        totalMarketCap: totalMarketCap ?? _totalMarketCap,
        total24hVolume: total24hVolume ?? _total24hVolume,
      );
  int? get total => _total;
  int? get totalCoins => _totalCoins;
  int? get totalMarkets => _totalMarkets;
  int? get totalExchanges => _totalExchanges;
  String? get totalMarketCap => _totalMarketCap;
  String? get total24hVolume => _total24hVolume;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = _total;
    map['totalCoins'] = _totalCoins;
    map['totalMarkets'] = _totalMarkets;
    map['totalExchanges'] = _totalExchanges;
    map['totalMarketCap'] = _totalMarketCap;
    map['total24hVolume'] = _total24hVolume;
    return map;
  }
}
