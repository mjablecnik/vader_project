import 'package:flutter/material.dart';
import 'dialog_list.style.dart';

class DialogList extends StatelessWidget {
  const DialogList({
    super.key,
    required this.title,
    //required this.content,
    required this.items,
    this.cancelButtonText = "Cancel",
    this.onCancel,
    this.onSelectItem,
    this.style,
  });

  final String title;
  //final String content;
  final List<DialogListItem> items;
  final String cancelButtonText;
  final GestureTapCallback? onCancel;
  final Function(DialogListItem)? onSelectItem;
  final DialogListStyle? style;

  @override
  Widget build(BuildContext context) {
    final currentStyle = style!;
    return AlertDialog(
        title: Text(title),
        backgroundColor: Colors.white,
        content: SizedBox(
          width: 300,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              final item = items[index];
              return ListTile(
                title: Text(item.text),
                onTap: () {
                  onSelectItem?.call(item);
                  Navigator.of(context).pop(item);
                },
              );
            },
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(cancelButtonText),
            onPressed: () {
              onCancel?.call();
              Navigator.of(context).pop();
            },
          ),
        ],
      );
  }
}

class DialogListItem {
  final String text;
  final String value;

  DialogListItem({required this.text, required this.value});
}
