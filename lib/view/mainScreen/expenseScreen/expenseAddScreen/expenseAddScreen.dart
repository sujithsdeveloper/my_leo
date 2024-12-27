import 'package:flutter/material.dart';
import 'package:my_leo/utils/constants/color_constants.dart';
import 'package:my_leo/view/mainScreen/expenseScreen/expenseAddScreen/expenseadd_viewmodel.dart';
import 'package:stacked/stacked.dart';

class AddTransactionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {



    return ViewModelBuilder.reactive(viewModelBuilder: () => ExpenseaddViewmodel(), builder: (context, viewModel, child) => DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: ExpenseScreenColors.primaryColor,
          child: const Icon(
            Icons.save,
            color: Colors.white,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          title: const Text(
            'Add Transaction',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          backgroundColor: ExpenseScreenColors.primaryColor,
          elevation: 4,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Container(
              color: ExpenseScreenColors.primaryColor,
              child: TabBar(
                indicatorColor: Colors.white,
                labelStyle: TextStyle(color: Colors.white, fontSize: 17),
                unselectedLabelStyle: TextStyle(fontSize: 15),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white70,
                tabs: const [
                  Tab(text: 'Expense'),
                  Tab(text: 'Income'),
                  Tab(text: 'Transfer'),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            AddTransactionForm(type: 'Expense'),
            AddTransactionForm(type: 'Income'),
            AddTransactionForm(type: 'Transfer'),
          ],
        ),
      ),
    ),);
  }
}

class AddTransactionForm extends StatelessWidget {
  final String type;
  const AddTransactionForm({required this.type});

  @override
  Widget build(BuildContext context) {
        final priceController=TextEditingController();
    final descriptionController=TextEditingController();
   late String? category;
   late String? paymentMethod;
    return ViewModelBuilder.reactive(viewModelBuilder: () => ExpenseaddViewmodel(), builder: (context, viewModel, child) => Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Amount',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: priceController,
              decoration: InputDecoration(
                prefixIcon:
                    const Icon(Icons.currency_rupee, color: Colors.deepPurple),
                hintText: 'Enter amount',
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            const Text(
              'Category',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              onSaved: (newValue) {
                category=newValue;
              },
              
              hint: Text('Select Category'),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              items: <String>[
                'Fuel',
                'Food',
                'Beverages',
                'Groceries',
                'Others'
              ].map((String value) {
                return DropdownMenuItem<String>(
                  
                   
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {},
            ),
            const SizedBox(height: 16),
            const Text(
              'Payment Mode',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              onSaved: (newValue) {
                paymentMethod=newValue;
              },
              hint: Text('Select Payment method'),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              items: <String>['Cash', 'Card', 'UPI'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {},
            ),
            const SizedBox(height: 16),
            const Text(
              'Other Details',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                hintText: 'Write a note',
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    ),);
  }
}
