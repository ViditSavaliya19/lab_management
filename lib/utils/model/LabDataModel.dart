/// pcNo : "r22"
/// GRID : ""
/// NAME : ""
/// L/P : ""
/// Course : ""
/// Faculty : ""

class LabDataModel {
  LabDataModel({
    String? pcNo,
    int? grid,
    String? name,
    String? lp,
    String? course,
    String? faculty,
  }) {
    _pcNo = pcNo;
    _grid = grid;
    _name = name;
    _lp = lp;
    _course = course;
    _faculty = faculty;
  }

  LabDataModel.fromJson(dynamic json) {
    _pcNo = json['pcNo'];
    _grid = json['GRID'];
    _name = json['NAME'];
    _lp = json['L/P'];
    _course = json['Course'];
    _faculty = json['Faculty'];
  }
  String? _pcNo;
  int? _grid;
  String? _name;
  String? _lp;
  String? _course;
  String? _faculty;
  LabDataModel copyWith({
    String? pcNo,
    int? grid,
    String? name,
    String? lp,
    String? course,
    String? faculty,
  }) =>
      LabDataModel(
        pcNo: pcNo ?? _pcNo,
        grid: grid ?? _grid,
        name: name ?? _name,
        lp: lp ?? _lp,
        course: course ?? _course,
        faculty: faculty ?? _faculty,
      );
  String? get pcNo => _pcNo;
  int? get grid => _grid;
  String? get name => _name;
  String? get lp => _lp;
  String? get course => _course;
  String? get faculty => _faculty;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pcNo'] = _pcNo;
    map['GRID'] = _grid;
    map['NAME'] = _name;
    map['L/P'] = _lp;
    map['Course'] = _course;
    map['Faculty'] = _faculty;
    return map;
  }
}
