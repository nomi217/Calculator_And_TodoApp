import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  var output = "";
  List<dynamic> lstname = ['Nauman', 'Arslan'];
  List<dynamic> lstage = [1, 2];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: lstname.length,
          itemBuilder: (context, index) {
            return Card(
                elevation: 6,
                shadowColor: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                margin: EdgeInsets.all(10),
                child: ListTile(
                  //leading: Text("Age: ${lstage[index]}"),
                  title: Column(
                    children: [
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(top: 30)),
                          Text(
                            "Name: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("${lstname[index]}"),
                        ],
                      ),
                    ],
                  ),
                  trailing: Container(
                    width: 50,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Edit Item'),
                                    content: TextField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Name'),
                                      autofocus: true,
                                      onChanged: (value) {
                                        output = value;
                                      },
                                    ),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              lstname.replaceRange(
                                                  index, index + 1, {output});
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Edit'))
                                    ],
                                  );
                                });
                          },
                          child: Icon(
                            Icons.edit,
                            color: Colors.blue[300],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Delete'),
                                    content: Text(
                                        'Are you sure you want to delete?'),
                                    actions: [
                                      FlatButton(
                                          child: Text('Yes'),
                                          onPressed: () {
                                            setState(() {
                                              lstname.removeAt(index);
                                              lstage.removeAt(index);
                                            });
                                            Navigator.of(context).pop();
                                          }),
                                      FlatButton(
                                          child: Text('No'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          })
                                    ],
                                  );
                                });
                            // setState(() {
                            //   lstname.removeAt(index);
                            // });
                          },
                          child: Icon(
                            Icons.delete,
                            color: Colors.red[300],
                          ),
                        )
                      ],
                    ),
                  ),
                ));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Add Item'),
                  content: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: 'Name'),
                        autofocus: true,
                        onChanged: (value) {
                          output = value;
                        },
                      ),
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            lstname.add(output);
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text('Add'))
                  ],
                );
              });
        },
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ),
    );
  }
}
