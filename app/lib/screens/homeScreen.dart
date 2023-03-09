// ignore: file_names
import 'dart:math';

import 'package:app/models/todo.dart';
import 'package:app/widget/card_todo.dart';
import 'package:flutter/material.dart';
import 'package:app/const/Colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final todoList = todo.todolist();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _gustombarapp(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            const searchbox(),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 15, bottom: 20),
                    child: const Text(
                      "All ToDos",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                  ),
                  for (todo itemtodo in todoList) card_todo(todoitem: itemtodo)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _gustombarapp() {
    return AppBar(
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          Container(
            width: 40,
            height: 40,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/images/avatar.jpeg')),
          )
        ],
      ),
      backgroundColor: tdBGColor,
    );
  }
}

class searchbox extends StatelessWidget {
  const searchbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: const TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
          border: InputBorder.none,
          hintText: "Search",
        ),
      ),
    );
  }
}
