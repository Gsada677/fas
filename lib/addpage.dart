import 'package:flutter/material.dart';
import 'package:gus/app_database.dart';

class AddPage extends StatefulWidget {
final String tittle;
  const AddPage({super.key,required this.tittle});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  late final AppDatabase appDatabase;
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  
  String _massege = '';
  Color _messageColor = Colors.red; 

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _saveTask() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context, _controller.text.trim());
    } else {
      setState(() {
        _massege = '';
      });
    }
  }
void _saveTodo() async {
    try {
        await appDatabase.insertTodo(TodosCompanion.insert(
              tittle: _controller.text, 
              date: DateTime.now().toString()));
             showAppSnackBar(context, text: 'saved',backgroundColor: Colors.yellow,icon: Icons.check);
              
    } catch (e) {
      showAppSnackBar(context, text: "Должно быть минимум 3 символа!", backgroundColor: Colors.red);
    }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("новая заметка"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.black12, height: 1.0),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                TextFormField(
                  controller: _controller,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Название задачи",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Tasks cant be empty';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    if (_massege.isNotEmpty) {
                      setState(() => _massege = '');
                    }
                  },
                ),
               
                const SizedBox(height: 12),
                if (_massege.isNotEmpty)
                  Text(
                    _massege,
                    style: TextStyle(
                      color: _messageColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                const SizedBox(height: 303), 
                ElevatedButton(
                  onPressed: _saveTask,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 140, 255),
                    minimumSize: const Size(double.infinity, 60),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  child: const Text(
                    "Сохранить",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
    void showAppSnackBar(
  BuildContext context, {
  required String text,
  Color? backgroundColor,
  IconData? icon,
  VoidCallback? onRetry,
  String retryText = "Повторить",
}) {
  final messenger = ScaffoldMessenger.of(context);

  messenger.hideCurrentSnackBar();
  messenger.showSnackBar(
    SnackBar(
      content: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
          ],
          Expanded(child: Text(text)),
        ],
      ),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 400),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      duration: const Duration(seconds: 3),
      action: onRetry == null
          ? null
          : SnackBarAction(
              label: retryText,
              onPressed: onRetry,
              textColor: Colors.white,
            ),
    ),
  );
}
}