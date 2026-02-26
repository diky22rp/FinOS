import 'package:flutter/material.dart';
import 'widgets/transaction_text_field.dart';
import 'widgets/transaction_dropdown_field.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  int _tabIndex = 1; // 0: Income, 1: Expense
  String? _selectedCategory;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  DateTime? _selectedDate;
  final TextEditingController _notesController = TextEditingController();
  final TextEditingController _tagsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Add Transaction',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Tab Income/Expense
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFEFEFEF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    _buildTabButton('Income', 0),
                    _buildTabButton('Expense', 1),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Transaction Details',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 16),
              // Category
              TransactionDropdownField(
                label: 'Category',
                hint: 'Select a category',
                items: const [
                  'Food',
                  'Groceries',
                  'Rent',
                  'Salary',
                  'Transport',
                  'Other',
                ],
                value: _selectedCategory,
                onChanged: (val) => setState(() => _selectedCategory = val),
                validator: (val) =>
                    val == null ? 'Please select a category' : null,
              ),
              const SizedBox(height: 16),
              // Title
              TransactionTextField(
                label: 'Title',
                hint: 'e.g. Groceries, Rent',
                controller: _titleController,
              ),
              const SizedBox(height: 16),
              // Amount
              TransactionTextField(
                label: 'Amount',
                hint: '0.00',
                controller: _amountController,
                isNumber: true,
              ),
              const SizedBox(height: 16),
              // Date
              TransactionTextField(
                label: 'Date',
                hint: _selectedDate != null
                    ? _formatDate(_selectedDate!)
                    : 'Select date',
                controller: TextEditingController(
                  text: _selectedDate != null
                      ? _formatDate(_selectedDate!)
                      : '',
                ),
                readOnly: true,
                onTap: _pickDate,
              ),
              const SizedBox(height: 24),
              // Additional Information Label
              Row(
                children: const [
                  Text(
                    'Additional Information',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 8),
                  Text(
                    '(Optional)',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Notes
                    TransactionTextField(
                      label: 'Notes',
                      hint:
                          'Add any specific details about this transaction...',
                      controller: _notesController,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 16),
                    // Tags
                    TransactionTextField(
                      label: 'Tags',
                      hint: 'e.g. #urgent, #monthly',
                      controller: _tagsController,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2ECC71),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Save Transaction',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabButton(String label, int index) {
    final isSelected = _tabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _tabIndex = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF2ECC71) : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}/${date.year}';
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? now,
      firstDate: DateTime(now.year - 5),
      lastDate: DateTime(now.year + 5),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }
}
