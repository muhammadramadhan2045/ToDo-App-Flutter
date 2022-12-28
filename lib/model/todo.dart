class ToDo {
  final String id;
  final String todoText;
  bool? isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Jogging Pagi', isDone: true),
      ToDo(id: '02', todoText: 'Pergi Kampus', isDone: true),
      ToDo(id: '03', todoText: 'Berkelahi'),
      ToDo(id: '04', todoText: 'Kerjakan Projek Mobile'),
      ToDo(id: '05', todoText: 'Kerjakan Projek Web'),
      // ToDo(id: '06', todoText: 'Kerjakan Projek Web'),
      // ToDo(id: '07', todoText: 'Kerjakan Projek Web'),
      // ToDo(id: '08', todoText: 'Kerjakan Projek Web'),
      // ToDo(id: '09', todoText: 'Kerjakan Projek Web'),
    ];
  }
}
