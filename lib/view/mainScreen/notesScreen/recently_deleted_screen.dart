import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_leo/view/mainScreen/notesScreen/notescreen_viewmodel.dart';
import 'package:stacked/stacked.dart';


class RecentlyDeletedScreen extends StatelessWidget {
  const RecentlyDeletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(viewModelBuilder: () => NotescreenViewmodel(), builder: (context, viewModel, child) =>  Scaffold(
      appBar: AppBar(
        title: const Text('Recently Deleted'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('user')
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .collection('recentlyDeleted')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('No Recently Deleted Notes'));
            } else {
              final deletedNotes = snapshot.data!.docs.reversed.toList();
              return MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                itemCount: deletedNotes.length,
                itemBuilder: (context, index) {
                  final note = deletedNotes[index].data();
                  final noteId = deletedNotes[index].id;
                  return Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        height: (index % 3 + 1) * 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              note['title'] ?? 'No Title',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Text(
                                  note['note'] ?? 'No Content',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 4,
                        right: 4,
                        child: IconButton(
                          icon: const Icon(Icons.restore, color: Colors.white),
                          onPressed: () async {
                          
                            
                            viewModel.noteAdd(title: note['title'], note: note['note'], date: note['date']);
                            
                            
                            await FirebaseFirestore.instance
                                .collection('user')
                                .doc(FirebaseAuth.instance.currentUser?.uid)
                                .collection('recentlyDeleted')
                                .doc(noteId)
                                .delete();
                          },
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
      ),
    ),);
  }
}
