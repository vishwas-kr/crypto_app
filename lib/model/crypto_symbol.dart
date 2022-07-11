// class CryptoSymbol {
//   CryptoSymbol({
//     required this.status,
//     required this.code,
//     required this.msg,
//     required this.response,
//     required this.info,
//   });
//   late final bool status;
//   late final int code;
//   late final String msg;
//   late final List<Response> response;
//   late final Info info;

//   CryptoSymbol.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     code = json['code'];
//     msg = json['msg'];
//     response =
//         List.from(json['response']).map((e) => Response.fromJson(e)).toList();
//     info = Info.fromJson(json['info']);
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['code'] = code;
//     _data['msg'] = msg;
//     _data['response'] = response.map((e) => e.toJson()).toList();
//     _data['info'] = info.toJson();
//     return _data;
//   }
// }

// class Response {
//   Response({
//     required this.id,
//     required this.name,
//     required this.decimal,
//     required this.symbol,
//   });
//   late final String id;
//   late final String name;
//   late final String decimal;
//   late final String symbol;

//   Response.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     decimal = json['decimal'];
//     symbol = json['symbol'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['decimal'] = decimal;
//     _data['symbol'] = symbol;
//     return _data;
//   }
// }

// class Info {
//   Info({
//     required this.serverTime,
//     required this.creditCount,
//     required this.t,
//   });
//   late final String serverTime;
//   late final int creditCount;
//   late final String t;

//   Info.fromJson(Map<String, dynamic> json) {
//     serverTime = json['server_time'];
//     creditCount = json['credit_count'];
//     t = json['_t'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['server_time'] = serverTime;
//     _data['credit_count'] = creditCount;
//     _data['_t'] = t;
//     return _data;
//   }
// }


class CryptoModelData {
  List<CryptoData>? data;

  CryptoModelData( this.data);

  CryptoModelData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CryptoData>[];
      json['data'].forEach((v) {
        data!.add(CryptoData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CryptoData {
  String? id;
  String? rank;
  String? symbol;
  String? name;
  String? supply;
  String? maxSupply;
  String? marketCapUsd;
  String? volumeUsd24Hr;
  String? priceUsd;
  String? changePercent24Hr;
  String? vwap24Hr;
  String? explorer;

  CryptoData(
      {this.id,
      this.rank,
      this.symbol,
      this.name,
      this.supply,
      this.maxSupply,
      this.marketCapUsd,
      this.volumeUsd24Hr,
      this.priceUsd,
      this.changePercent24Hr,
      this.vwap24Hr,
      this.explorer});

  CryptoData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rank = json['rank'];
    symbol = json['symbol'];
    name = json['name'];
    supply = json['supply'];
    maxSupply = json['maxSupply'];
    marketCapUsd = json['marketCapUsd'];
    volumeUsd24Hr = json['volumeUsd24Hr'];
    priceUsd = json['priceUsd'];
    changePercent24Hr = json['changePercent24Hr'];
    vwap24Hr = json['vwap24Hr'];
    explorer = json['explorer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['rank'] = this.rank;
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    data['supply'] = this.supply;
    data['maxSupply'] = this.maxSupply;
    data['marketCapUsd'] = this.marketCapUsd;
    data['volumeUsd24Hr'] = this.volumeUsd24Hr;
    data['priceUsd'] = this.priceUsd;
    data['changePercent24Hr'] = this.changePercent24Hr;
    data['vwap24Hr'] = this.vwap24Hr;
    data['explorer'] = this.explorer;
    return data;
  }
}
