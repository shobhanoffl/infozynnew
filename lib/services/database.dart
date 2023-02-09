import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;

class Database {
  List name = [];
  List downurl = [];

  getAvaliableYear() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await FirebaseFirestore.instance
          .collection('techarticle')
          .orderBy('realdate', descending: false)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          List a = [
            // "id": doc.id,
            doc['academic_year'],
          ];
          for (int i = 0; i < a.length; i++) {
            docs.add(a[i]);
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return docs;
  }

  getEventAvaliableYear() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await FirebaseFirestore.instance
          .collection('wrapper')
          .orderBy('realdate', descending: false)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          List a = [
            // "id": doc.id,
            doc['academic_year'],
          ];
          for (int i = 0; i < a.length; i++) {
            docs.add(a[i]);
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return docs;
  }

  getDataFromFirestore() async {
    List items = [];
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final res = await firebaseFirestore.collection("wrapper").doc().snapshots();
    return res;
  }

  Future getfeed() async {
    List items = [];
    await FirebaseFirestore.instance
        .collection("wrapper")
        .orderBy('date', descending: true)
        .get()
        .then((querysnapshots) {
      querysnapshots.docs.forEach((element) {
        items.add(element.data());
      });
    });
    return items;
  }

  Future getlastestfeed() async {
    List items = [];
    await FirebaseFirestore.instance
        .collection("wrapper")
        .orderBy('date', descending: true)
        .limit(3)
        .get()
        .then((querysnapshots) {
      querysnapshots.docs.forEach((element) {
        items.add(element.data());
      });
    });
    return items;
  }

  Future searchCategory(categoryname) async {
    List items = [];
    await FirebaseFirestore.instance
        .collection("wrapper")
        .where(
          'category',
          isEqualTo: categoryname,
        )
        .orderBy('realdate', descending: false)
        .get()
        .then((querysnapshots) {
      querysnapshots.docs.forEach((element) {
        items.add(element.data());
      });
    });
    return items;
  }

  Future searchEvent(eventname) async {
    List items = [];
    await FirebaseFirestore.instance
        .collection("wrapper")
        .where('eventname', isGreaterThanOrEqualTo: eventname)
        .get()
        .then((querysnapshots) {
      querysnapshots.docs.forEach((element) {
        items.add(element.data());
      });
    });
    return items;
  }

  Future yearlypost(year) async {
    List items = [];
    await FirebaseFirestore.instance
        .collection("wrapper")
        .where('academicyear', isEqualTo: year)
        .get()
        .then((querysnapshots) {
      querysnapshots.docs.forEach((element) {
        items.add(element.data());
      });
    });
    return items;
  }

  // uploadLikes(int likes, docname) async {
  //   String docid = docname.toString();
  //   var res = await FirebaseFirestore.instance
  //       .collection("wrapper")
  //       .doc(docid)
  //       .update({'likes': likes});
  //   return res;
  // }

  uploadFeedback(String message, String doc) {
    try {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      firebaseFirestore
          .collection("Feedbacks")
          .doc(doc)
          .set({"message": message});
    } catch (e) {
      print(e.toString());
    }
  }

  // updatelike(String uid, String postid, bool val) async {
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   await firestore.collection('likes').doc(uid).set({postid: val});
  // }

  searchArchives(year, issue) async {
    List items = [];
    await FirebaseFirestore.instance
        .collection('wrapper')
        .where('academic_year', isEqualTo: year)
        .where('issue', isEqualTo: issue)
        .orderBy('realdate', descending: false)
        .get()
        .then((querysnapshots) {
      querysnapshots.docs.forEach((element) {
        items.add(element.data());
      });
    });
    return items;
  }

  uploadUpcomingEvents(title, desc, date) async {
    try {
      await FirebaseFirestore.instance.collection('upcomingevents').doc().set({
        'title': title,
        'description': desc,
        'date': date,
        'realdate': DateTime.now()
      });
    } catch (e) {
      print(e.toString());
    }
  }

  getUpcomingEvents() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await FirebaseFirestore.instance
          .collection('upcomingevents')
          .orderBy('realdate', descending: false)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {
            "id": doc.id,
            "title": doc['title'],
            "description": doc['description'],
            "date": doc['date'],
          };
          docs.add(a);
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return docs;
  }

  Future<void> deleteUpcomingEvents(String id) async {
    try {
      await FirebaseFirestore.instance
          .collection("upcomingevents")
          .doc(id)
          .delete();
    } catch (e) {
      print(e);
    }
  }

  //CRUD operations.....

  uploadImage(image, filename, title, description, date, time, academicYear,
      academicCategory, categoryname, issue) async {
    String url;
    if (image != null) {
      final destination = 'images/$filename';
      try {
        Reference reference = FirebaseStorage.instance.ref(destination);
        final FirebaseAuth auth = FirebaseAuth.instance;
        UploadTask uploadTask = reference.putFile(image);
        uploadTask.whenComplete(() async {
          try {
            url = await reference.getDownloadURL();
            await FirebaseFirestore.instance.collection("wrapper").doc().set({
              "title": title,
              "description": description,
              "date": date,
              "time": time,
              "imageurl": url,
              "realdate": DateTime.now(),
              "academic_year": academicYear,
              "academic_category": academicCategory,
              "category": categoryname,
              "issue": issue,
            });
          } catch (e) {
            e.toString();
          }
        });
        name.add(filename);
      } catch (e) {
        e.toString();
      }
    }
  }

  nonTechArticleUpload(title, image, filename, date, yearofstudy, academic_year,
      authorname, issue) {
    String url;
    if (image != null) {
      final destinaion = 'articleimages/$filename';
      try {
        Reference reference = FirebaseStorage.instance.ref(destinaion);
        final FirebaseAuth auth = FirebaseAuth.instance;
        UploadTask uploadTask = reference.putFile(image);
        uploadTask.whenComplete(() async {
          try {
            url = await reference.getDownloadURL();
            await FirebaseFirestore.instance
                .collection('nontecharticle')
                .doc()
                .set({
              'title': title,
              'date': date,
              'imageurl': url,
              'yearofstudy': yearofstudy,
              'academic_year': academic_year,
              'realdate': DateTime.now(),
              'authorname': authorname,
              'issue': issue,
            });
          } catch (e) {
            print(e.toString());
          }
        });
      } catch (e) {
        print(e.toString());
      }
    }
  }

  getTechArticle(year, issue) async {
    List items = [];
    if (year == 'All') {
      await FirebaseFirestore.instance
          .collection('techarticle')
          .where('issue', isEqualTo: issue)
          .orderBy('realdate', descending: true)
          .get()
          .then((querysnapshots) {
        querysnapshots.docs.forEach((element) {
          items.add(element.data());
        });
      });
      return items;
    } else {
      await FirebaseFirestore.instance
          .collection('techarticle')
          .where('academic_year', isEqualTo: year)
          .where('issue', isEqualTo: issue)
          .orderBy('realdate', descending: true)
          .get()
          .then((querysnapshots) {
        querysnapshots.docs.forEach((element) {
          items.add(element.data());
        });
      });
      return items;
    }
  }

  getNonTechArticle(year, issue) async {
    List items = [];
    if (year == 'All') {
      await FirebaseFirestore.instance
          .collection('nontecharticle')
          .where('issue', isEqualTo: issue)
          .orderBy('realdate', descending: true)
          .get()
          .then((querysnapshots) {
        querysnapshots.docs.forEach((element) {
          items.add(element.data());
        });
      });
      return items;
    } else {
      await FirebaseFirestore.instance
          .collection('nontecharticle')
          .where('academic_year', isEqualTo: year)
          .where('issue', isEqualTo: issue)
          .orderBy('realdate', descending: true)
          .get()
          .then((querysnapshots) {
        querysnapshots.docs.forEach((element) {
          items.add(element.data());
        });
      });
      return items;
    }
  }

  Future<void> uploadTechArticle(
      title, desc, date, authorname, yearofstudy, academic_year, issue) async {
    try {
      FirebaseFirestore.instance.collection('techarticle').doc().set({
        'authorname': authorname,
        'description': desc,
        'title': title,
        'date': date,
        'yearofstudy': yearofstudy,
        'academic_year': academic_year,
        'realdate': DateTime.now(),
        'issue': issue,
      });
    } catch (e) {
      e.toString();
      print(e);
    }
  }

  Future<List> Eventread() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await FirebaseFirestore.instance
          .collection('wrapper')
          .orderBy('realdate', descending: true)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {
            "id": doc.id,
            "imageurl": doc["imageurl"],
            "title": doc['title'],
            "description": doc['description'],
            "time": doc['time'],
            "date": doc['date'],
            "academic_year": doc['academic_year'],
            "academic_category": doc['academic_category'],
            "category": doc['category']
          };
          docs.add(a);
        }
      }
    } catch (e) {
      print(e);
    }
    return docs;
  }

  techArticleRead() async {
    // List items = [];
    // List ids = [];
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await FirebaseFirestore.instance
          .collection('techarticle')
          .orderBy('realdate', descending: false)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {
            "id": doc.id,
            "title": doc['title'],
          };
          docs.add(a);
        }
      }
    } catch (e) {
      print(e);
    }
    return docs;
  }

  nontechArticleRead() async {
    // List items = [];
    // List ids = [];
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await FirebaseFirestore.instance
          .collection('nontecharticle')
          .orderBy('realdate', descending: false)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {
            "id": doc.id,
            "title": doc['title'],
          };
          docs.add(a);
        }
      }
    } catch (e) {
      print(e);
    }
    return docs;
  }

  Future<void> update(title, description, date, time, categoryName,
      academicyear, academiccategory) async {
    try {
      await FirebaseFirestore.instance.collection("wrapper").doc().update({
        "title": title,
        "description": description,
        "date": date,
        "time": time,
        "realdate": DateTime.now(),
        "categoryname": categoryName,
        "academic_year": academicyear,
        "academic_category": academiccategory
      });
    } catch (e) {
      e.toString();
    }
  }

  Future<void> delete(String id, imagepath) async {
    try {
      await FirebaseFirestore.instance.collection("wrapper").doc(id).delete();
      await FirebaseStorage.instance.ref().child(imagepath).delete();
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteTechArticle(String id, imagepath) async {
    try {
      await FirebaseFirestore.instance
          .collection("techarticle")
          .doc(id)
          .delete();
      await FirebaseStorage.instance.ref().child(imagepath).delete();
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteNonTechArticle(String id, imagepath) async {
    try {
      await FirebaseFirestore.instance
          .collection("nontecharticle")
          .doc(id)
          .delete();
      await FirebaseStorage.instance.ref().child(imagepath).delete();
    } catch (e) {
      print(e);
    }
  }
}
