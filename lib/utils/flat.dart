import 'package:cloud_firestore/cloud_firestore.dart';

class Flat {
  final String? owner;
  final String? location;
  final String? type;
  final bool? share;
  final int? rent;
  final List<String>? roommates;

  Flat({
    this.owner,
    this.location,
    this.type,
    this.share,
    this.rent,
    this.roommates,
  });

  factory Flat.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Flat(
      owner: data?['owner'],
      location: data?['location'],
      type: data?['type'],
      share: data?['share'],
      rent: data?['rent'],
      roommates:
          data?['roommates'] is Iterable ? List.from(data?['roommates']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (owner != null) "owner": owner,
      if (type != null) "type": type,
      if (location != null) "location": location,
      if (share != null) "share": share,
      if (rent != null) "rent": rent,
      if (roommates != null) "roommates": roommates,
    };
  }
}
