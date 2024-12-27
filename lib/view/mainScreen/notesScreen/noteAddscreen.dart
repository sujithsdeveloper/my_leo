import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_leo/view/mainScreen/notesScreen/notescreen_viewmodel.dart';
import 'package:stacked/stacked.dart';

class NoteAddScreen extends StatelessWidget {
  const NoteAddScreen({super.key, this.isEdit = false, this.title, this.note,});
  final bool isEdit;
  final String? title;
  final String? note;
  @override
  Widget build(BuildContext context) {
    final date = DateFormat('EEEE,MMMM d H:m aaa').format(DateTime.now());
    final _titleController = TextEditingController();
    final _noteController = TextEditingController();
    if (isEdit) {
      _titleController.text = title!;
      _noteController.text = note!;
    }
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => NotescreenViewmodel(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.undo, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.redo, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.check, color: Colors.green),
              onPressed: () async {
                try {
                  await viewModel.noteAdd(
                      title: _titleController.text,
                      note: _noteController.text,
                      date: date);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Note added successfully!')),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: ${e.toString()}')),
                  );
                }
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _titleController,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  hintText: 'Title',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    date,
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: TextField(
                  controller: _noteController,
                  maxLines: null,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  decoration: const InputDecoration(
                    hintText: 'Note',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
