import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';

class NotescreenViewmodel extends BaseViewModel {
  Future<void> noteAdd({
    required String title,
    required String note,
    required String date,
  }) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception('User not logged in. Cannot add notes.');
      }

      if (note.isEmpty || date.isEmpty) {
        throw Exception('Note and Date cannot be empty.');
      }
      Map<String, dynamic> data = {
        'title': title,
        'note': note,
        'date': date,
      };

      log('User ID: ${user.uid}');
      log('Data: $data');

      final ref = FirebaseFirestore.instance
          .collection('user')
          .doc(user.uid)
          .collection('notes');

      await ref.add(data);
      log('Note added successfully!');
    } catch (e) {
      log('Error adding note: $e');
    }
  }

  Future<void> deleteNote({required String noteId}) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception('User not logged in. Cannot delete notes.');
      }

      final noteRef = FirebaseFirestore.instance
          .collection('user')
          .doc(user.uid)
          .collection('notes')
          .doc(noteId);

      final noteSnapshot = await noteRef.get();

      if (!noteSnapshot.exists) {
        throw Exception('Note does not exist.');
      }

      final noteData = noteSnapshot.data();
      if (noteData != null) {
        final recentlyDeletedRef = FirebaseFirestore.instance
            .collection('user')
            .doc(user.uid)
            .collection('recentlyDeleted');

        await recentlyDeletedRef.add(noteData);
        log('Note added to recentlyDeleted successfully!');

        await noteRef.delete();
        log('Note deleted from notes collection successfully!');
      }
    } catch (e) {
      log('Error deleting note: $e');
    }
  }
}
