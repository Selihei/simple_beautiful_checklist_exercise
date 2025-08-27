import 'package:simple_beautiful_checklist_exercise/data/database_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedprefencesRepository implements DatabaseRepository {
  static const String _storageKey = 'checklist_items';
  SharedPreferences? _prefs;

  Future<void> initializePersistence() async {
    _prefs = await SharedPreferences.getInstance();
  }

  List<String> _loadItems() {
    return _prefs?.getStringList(_storageKey) ?? [];
  }

  Future<void> _saveItems(List<String> items) async {
    await _prefs?.setStringList(_storageKey, items);
  }

  @override
  Future<int> getItemCount() async {
    final items = _loadItems();
    return items.length;
  }

  @override
  Future<List<String>> getItems() async {
    final items = _loadItems();
    return items;
  }

  @override
  Future<void> addItem(String item) async {
    final items = _loadItems();
    if (item.isNotEmpty && !items.contains(item)) {
      items.add(item);
      await _saveItems(items);
    }
  }

  @override
  Future<void> deleteItem(int index) async {
    final items = _loadItems();
    if (index >= 0 && index < items.length) {
      items.removeAt(index);
      await _saveItems(items);
    }
  }

  @override
  Future<void> editItem(int index, String newItem) async {
    final items = _loadItems();
    if (newItem.isNotEmpty && !items.contains(newItem)) {
      if (index >= 0 && index < items.length) {
        items[index] = newItem;
        await _saveItems(items);
      }
    }
  }
}
