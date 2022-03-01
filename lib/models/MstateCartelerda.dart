class MstateCarteleras {
  String currentCartelera;
  String mes;
  int initialDay;
  int endDay;
  int firstDayMonth;

  MstateCarteleras({
    required this.currentCartelera,
    required this.mes,
    required this.initialDay,
    required this.endDay,
    required this.firstDayMonth,
  });

  MstateCarteleras.fromMap(Map<String, dynamic> res)
      : currentCartelera = res['currentCartelera'],
        mes = res["mes"],
        initialDay = res["initialDay"],
        endDay = res["endDay"],
        firstDayMonth = res['firstDayMonth'];

  Map<String, Object?> toMap() {
    return {
      'currentCartelera': currentCartelera,
      'mes': mes,
      'initialDay': initialDay,
      'endDay': endDay,
      'firstDayMonth': firstDayMonth,
    };
  }
}
