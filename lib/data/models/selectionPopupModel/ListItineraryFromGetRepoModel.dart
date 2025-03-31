class ListItineraryFromGetRepoModel {
  List<Itineraries>? itineraries;

  ListItineraryFromGetRepoModel({this.itineraries});

  ListItineraryFromGetRepoModel.fromJson(Map<String, dynamic> json) {
    if (json['itineraries'] != null) {
      itineraries = <Itineraries>[];
      json['itineraries'].forEach((v) {
        itineraries!.add(new Itineraries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.itineraries != null) {
      data['itineraries'] = this.itineraries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Itineraries {
  String? itineraryCode;
  List<Features>? features;

  Itineraries({this.itineraryCode, this.features});

  Itineraries.fromJson(Map<String, dynamic> json) {
    itineraryCode = json['itineraryCode'];
    if (json['features'] != null) {
      features = <Features>[];
      json['features'].forEach((v) {
        features!.add(new Features.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itineraryCode'] = this.itineraryCode;
    if (this.features != null) {
      data['features'] = this.features!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Features {
  String? type;
  Properties? properties;
  Geometry? geometry;

  Features({this.type, this.properties, this.geometry});

  Features.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    properties = json['properties'] != null
        ? new Properties.fromJson(json['properties'])
        : null;
    geometry = json['geometry'] != null
        ? new Geometry.fromJson(json['geometry'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.properties != null) {
      data['properties'] = this.properties!.toJson();
    }
    if (this.geometry != null) {
      data['geometry'] = this.geometry!.toJson();
    }
    return data;
  }
}

class Properties {
  String? name;
  String? image;
  String? description;
  Properties({this.name, this.image});

  Properties.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    image = json['image'];
    description = json['description'];	
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    return data;
  }
}

class Geometry {
  String? type;
  List<double>? coordinates;

  Geometry({this.type, this.coordinates});

  Geometry.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}
