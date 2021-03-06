import 'package:inspiring_person_app/models/inspiringPerson.dart';

class PersonRepository {
  List<InspiringPerson> _inspiringPeopleList = [
    InspiringPerson(
        image:
            "https://upload.wikimedia.org/wikipedia/commons/0/01/LinuxCon_Europe_Linus_Torvalds_03_%28cropped%29.jpg",
        birthday: DateTime(1969, 12, 28),
        description:
            "Finski znanstvenik, kreator je Linux kernela. Iako je studirao računarstvo, fakultet nikada nije završio.",
        quote:
            "Bad programmers worry about the code. Good programmers worry about data structures and their relationships."),
    InspiringPerson(
        image:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Dennis_Ritchie_2011.jpg/220px-Dennis_Ritchie_2011.jpg",
        birthday: DateTime(2000, 4, 22),
        description:
            "Američki računalni znanstvenik poznat po svojem utjecaju na ALTRAN, B, BCPL, C, Multics i Unix.",
        quote:
            "UNIX is basically a simple operating system, but you have to be a genius to understand the simplicity."),
    InspiringPerson(
        image:
            "https://upload.wikimedia.org/wikipedia/commons/4/4f/KnuthAtOpenContentAlliance.jpg",
        birthday: DateTime(1938, 1, 10),
        description:
            "Jedan od najpoznatijih informatičara programera i umirovljeni profesor na sveučilištu Stanford. Često je nazivan „ocem algoritama“ jer je doprinio razvoju i sistematizaciji matematičke tehnike za analizu složenih računalnih algoritama.",
        quote: "Premature optimization is the root of all evil.")
  ];
  static final PersonRepository _personRepository =
      PersonRepository._internal();

  factory PersonRepository() {
    return _personRepository;
  }

  PersonRepository._internal();

  List<InspiringPerson> getInspiringPeopleList() {
    return _inspiringPeopleList;
  }

  void addInspiringPerson(InspiringPerson person) {
    _inspiringPeopleList.add(person);
  }

  void deleteInspiringPerson(InspiringPerson person) {
    _inspiringPeopleList.remove(person);
  }

  void editInspiringPerson(InspiringPerson person) {
    _inspiringPeopleList.forEach((element) {
      if (element.id == person.id) {
        element.image = person.image;
        element.description = person.description;
        element.quote = person.quote;
        element.birthday = person.birthday;
      }
    });
  }
}
