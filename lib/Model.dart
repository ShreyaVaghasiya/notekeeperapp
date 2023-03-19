class NoteData {
  String? title;
  String? desc;

  NoteData({required this.title, required this.desc });

  NoteData.fromMap(Map<String, dynamic> map) {
    title = map[title];
    desc = map[desc];
  }

  Map<String, dynamic> toMap() => {
    'title': title,
    'desc': desc,
  };
}
