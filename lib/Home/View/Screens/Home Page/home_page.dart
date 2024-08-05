import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import '../../widgets/buttons_widget.dart';
import '../../widgets/text_form_field_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final idController = TextEditingController();
  final dateController = TextEditingController();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final reportNoController = TextEditingController();
  final contactDetailsController = TextEditingController();
  final typeController = TextEditingController();
  final periodController = TextEditingController();
  final driveTypesController = TextEditingController();
  final pnController = TextEditingController();
  final snController = TextEditingController();
  final monthController = TextEditingController();
  final visitDateController = TextEditingController();
  final engineersNameController = TextEditingController();
  final billToController = TextEditingController();
  final lastUpdateController = TextEditingController();
  final totalController = TextEditingController();
  final customerComplainController = TextEditingController();
  final problemController = TextEditingController();
  final problemActionTakenController = TextEditingController();

  DateTime? _visitDate;
  DateTime? _lastUpdateDate;
  DateTime? _monthDate;
  String? _selectedEngineer;
  String? _selectedBillTo;
  String _fileName = 'No file chosen';

  final List<String> _engineers = ['Engineer 1', 'Engineer 2', 'Engineer 3'];
  final List<String> _billTos = ['Company A', 'Company B', 'Company C'];

  Future<void> _selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _fileName = result.files.single.name;
      });
    } else {
      setState(() {
        _fileName = 'No file chosen';
      });
    }
  }

  Future<void> _selectDate(BuildContext context, {bool isVisitDate = false, bool isMonth = false}) async {
    final initialDate = DateTime.now();
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );


    if (selectedDate != null) {
      if (isVisitDate) {
        setState(() {
          _visitDate = selectedDate;
          visitDateController.text = DateFormat.yMd().format(selectedDate);
        });
      } else if (isMonth) {
        setState(() {
          _monthDate = selectedDate;
          monthController.text = DateFormat.MMMM().format(selectedDate);
        });
      } else {
        setState(() {
          _lastUpdateDate = selectedDate;
          lastUpdateController.text = DateFormat.yMd().format(selectedDate);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Danfoss Report FORM",
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        TextButton(onPressed: (){}, child: const Text("Login", style: TextStyle(fontSize: 15),))
                      ],
                    ),
                    const Gap(16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormFieldWidget(
                            controller: idController,
                            labelText: 'ID',
                            hintText: 'Enter Your ID',
                          ),
                        ),
                        const Gap(8),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _selectDate(context, isVisitDate: true),
                            child: AbsorbPointer(
                              child: TextFormFieldWidget(
                                controller: visitDateController,
                                labelText: 'Date',
                                hintText: 'Select Date',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(16),
                    TextFormFieldWidget(
                      controller: nameController,
                      labelText: 'Name',
                      hintText: 'Enter Your Name',
                    ),
                    const Gap(16),
                    TextFormFieldWidget(
                      controller: addressController,
                      labelText: 'Address',
                      hintText: 'Enter Your Address',
                    ),
                    const Gap(16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormFieldWidget(
                            controller: reportNoController,
                            labelText: 'CSC Case No.',
                            hintText: 'Enter CSC Case Number',
                          ),
                        ),
                        const Gap(8),
                        Expanded(
                          child: TextFormFieldWidget(
                            controller: contactDetailsController,
                            labelText: 'Contact Details',
                            hintText: '12345678',
                          ),
                        ),
                      ],
                    ),
                    const Gap(16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormFieldWidget(
                            controller: typeController,
                            labelText: 'Type',
                            hintText: 'Enter Case Type',
                          ),
                        ),
                        const Gap(8),
                        Expanded(
                          child: TextFormFieldWidget(
                            controller: periodController,
                            labelText: 'Period',
                            hintText: 'Enter Period',
                          ),
                        ),
                      ],
                    ),
                    const Gap(16),
                    TextFormFieldWidget(
                      controller: driveTypesController,
                      labelText: 'Drive Type',
                      hintText: 'Enter Drive Type',
                    ),
                    const Gap(16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormFieldWidget(
                            controller: pnController,
                            labelText: 'P/N',
                          ),
                        ),
                        const Gap(8),
                        Expanded(
                          child: TextFormFieldWidget(
                            controller: snController,
                            labelText: 'S/N',
                          ),
                        ),
                      ],
                    ),
                    const Gap(16),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _selectDate(context, isMonth: true),
                            child: AbsorbPointer(
                              child: TextFormFieldWidget(
                                controller: monthController,
                                labelText: 'Month',
                                hintText: 'Select Month',
                              ),
                            ),
                          ),
                        ),
                        const Gap(8),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _selectDate(context, isVisitDate: true),
                            child: AbsorbPointer(
                              child: TextFormFieldWidget(
                                controller: visitDateController,
                                labelText: 'Visit Date',
                                hintText: 'Select Date',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(16),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: _selectFile,
                          child: const Text('ChooseFile'),
                        ),
                        const Gap(8),
                        Expanded(
                          child: Text(
                            _fileName, // Display the file name or default text
                            style: TextStyle(
                              color: _fileName == 'No file chosen' ? Colors.black : Colors.green,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(16),
                    DropdownButtonFormField<String>(
                      value: _selectedEngineer,
                      items: _engineers.map((engineer) {
                        return DropdownMenuItem(
                          value: engineer,
                          child: Text(engineer),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedEngineer = value;
                          engineersNameController.text = value ?? '';
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Engineer\'s Name',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 12.0,
                        ),
                      ),
                    ),
                    const Gap(16),
                    DropdownButtonFormField<String>(
                      value: _selectedBillTo,
                      items: _billTos.map((billTo) {
                        return DropdownMenuItem(
                          value: billTo,
                          child: Text(billTo),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedBillTo = value;
                          billToController.text = value ?? '';
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Bill To',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 12.0,
                        ),
                      ),
                    ),
                    const Gap(16),
                    GestureDetector(
                      onTap: () => _selectDate(context, isVisitDate: false),
                      child: AbsorbPointer(
                        child: TextFormFieldWidget(
                          controller: lastUpdateController,
                          labelText: 'Last Update',
                          hintText: 'Select Date',
                        ),
                      ),
                    ),
                    const Gap(16),
                    TextFormFieldWidget(
                      controller: totalController,
                      labelText: 'Total',
                    ),
                    const Gap(16),
                    TextFormFieldWidget(
                      controller: customerComplainController,
                      labelText: 'Complain',
                    ),
                    const Gap(16),
                    TextFormFieldWidget(
                      controller: problemController,
                      labelText: 'Problem',
                    ),
                    const Gap(16),
                    TextFormFieldWidget(
                      controller: problemActionTakenController,
                      labelText: 'Action Taken',
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButtonWidget(name: "View", onTap: () {}, color: Colors.orange.shade700),
                        const Gap(8),
                        ElevatedButtonWidget(name: "Filter", onTap: () {}, color: Colors.orange.shade700),
                        const Gap(8),
                        ElevatedButtonWidget(name: "Submit", onTap: () {}, color: Colors.orange.shade700),
                        const Gap(8),
                        ElevatedButtonWidget(name: "Previous", onTap: () {}, color: Colors.orange.shade700),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
