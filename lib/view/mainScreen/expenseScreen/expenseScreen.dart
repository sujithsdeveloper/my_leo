import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_leo/utils/data/buildDatas.dart';
import 'package:my_leo/view/mainScreen/expenseScreen/expenseAddScreen/expenseAddScreen.dart';
import 'package:my_leo/widgets/transationItem.dart';

class ExpenseManager extends StatelessWidget {
  const ExpenseManager({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          log('log');
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddTransactionScreen(),
              ));
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      appBar: AppBar(
        toolbarHeight: 60,
        leadingWidth: 200,
        leading: Padding(
          padding: const EdgeInsets.only(left: 9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Good Afternoon',
                style: theme.textTheme.bodyMedium,
              ),
              Text(
                'Sujith',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.search, color: theme.iconTheme.color),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text(
                    'This month',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.chipTheme.labelStyle?.color,
                    ),
                  ),
                  backgroundColor: theme.chipTheme.backgroundColor,
                ),
                Icon(Icons.arrow_drop_down, color: theme.iconTheme.color),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.arrow_upward, color: Colors.red),
                        const SizedBox(height: 8),
                        Text('Spending', style: TextStyle(color: Colors.red)),
                        const SizedBox(height: 4),
                        Text(
                          '₹0.00',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.arrow_downward, color: Colors.green),
                        const SizedBox(height: 8),
                        Text('Income', style: TextStyle(color: Colors.green)),
                        const SizedBox(height: 4),
                        Text(
                          '₹0.00',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent transactions',
                  style: theme.textTheme.titleLarge,
                ),
                Text('View All')
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                  children: List.generate(
                5,
                (index) {
                  final data = ExpenseCategories().Categories[index];
                  return TransactionItem(
                      icon: data['icon'],
                      color: data['color'] ?? Colors.grey,
                      title: data['label'],
                      amount: '200',
                      date: '02/2020');
                },
              )),
            ),
          ],
        ),
      ),
    );
  }
}
