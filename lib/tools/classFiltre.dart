class LevelFilterListData {
  LevelFilterListData(
      {this.titleTxt = '', this.isSelected = false, this.value = ''});

  String titleTxt;
  String value;
  bool isSelected;

  void reset() {
    // Réinitialise les valeurs de l'objet
    isSelected = false;
  }

  static List<LevelFilterListData> popularFList = <LevelFilterListData>[
    LevelFilterListData(
      titleTxt: 'Niveau 1',
      value: '1',
    ),
    LevelFilterListData(
      titleTxt: 'Niveau 2',
      value: '2',
    ),
    LevelFilterListData(
      titleTxt: 'Niveau 3',
      value: '3',
    ),
    LevelFilterListData(
      titleTxt: 'Niveau 4',
      value: '4',
    ),
  ];
}

class TimeDeliveyFilteListData {
  TimeDeliveyFilteListData(
      {this.titleTxt = '', this.isSelected = false, this.value = ''});

  String titleTxt;
  String value;
  bool isSelected;

  void reset() {
    // Réinitialise les valeurs de l'objet
    isSelected = false;
  }

  static List<TimeDeliveyFilteListData> listDelivery =
      <TimeDeliveyFilteListData>[
    TimeDeliveyFilteListData(
      titleTxt: 'tout',
      value: '',
      isSelected: true,
    ),
    TimeDeliveyFilteListData(
      titleTxt: 'plus de 24h',
      value: '1',
    ),
    TimeDeliveyFilteListData(
      titleTxt: 'plus de 3 jours',
      value: '2',
    ),
    TimeDeliveyFilteListData(
      titleTxt: 'plus de 7 jours',
      value: '3',
    ),
  ];
}

class LocalisationFreelance {
  //String pays;
  String ville;
  bool isSelected;

  LocalisationFreelance({
    //this.pays = '',
    this.ville = '',
    this.isSelected = false,
  });

  static List<LocalisationFreelance> listeVille = <LocalisationFreelance>[
    LocalisationFreelance(
      ville: 'Kinshasa',
    ),
    LocalisationFreelance(
      ville: 'Lubumbashi',
    ),
    LocalisationFreelance(
      ville: 'Goma',
    ),
    LocalisationFreelance(
      ville: 'Brazzaville',
    ),
    LocalisationFreelance(
      ville: 'Kolwezzi',
    ),
    LocalisationFreelance(
      ville: 'Kipushi',
    ),
  ];
}
