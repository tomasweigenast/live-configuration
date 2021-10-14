class Project {
  final String id;
  final String name;

  Project({required this.id, required this.name}); 

  static final Project undefined = Project(id: "-", name: "-");
}