import 'package:flutter/material.dart';
import 'DbHelperclass.dart';


class SQLiteHome extends StatefulWidget {
  @override
  _SQLiteHomeState createState() => _SQLiteHomeState();
}

class _SQLiteHomeState extends State<SQLiteHome> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  final TextEditingController _nameController = TextEditingController();
  List<Map<String, dynamic>> _items = [];

  @override
  void initState() {
    super.initState();
    _refreshItems();
  }

  Future<void> _refreshItems() async {
    final data = await _dbHelper.getItems();
    setState(() {
      _items = data;
    });
  }

  Future<void> _addItem(String name) async {
    await _dbHelper.insertItem({'name': name});
    _refreshItems();
  }

  Future<void> _updateItem(int id, String name) async {
    await _dbHelper.updateItem(id, {'name': name});
    _refreshItems();
  }

  Future<void> _deleteItem(int id) async {
    await _dbHelper.deleteItem(id);
    _refreshItems();
  }

  void _showForm(int? id) {
    if (id != null) {
      final existingItem = _items.firstWhere((element) => element['id'] == id);
      _nameController.text = existingItem['name'];
    } else {
      _nameController.clear();
    }

    showModalBottomSheet(
      context: context,
      builder: (_) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (id == null) {
                  _addItem(_nameController.text);
                } else {
                  _updateItem(id, _nameController.text);
                }
                Navigator.of(context).pop();
              },
              child: Text(id == null ? 'Add Item' : 'Update Item'),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SQLite CRUD Example')),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) => Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(_items[index]['name']),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _showForm(_items[index]['id']),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteItem(_items[index]['id']),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showForm(null),
      ),
    );
  }
}
