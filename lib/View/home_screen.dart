import 'package:flutter/material.dart';
import 'package:todo_login/Provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? homeProviderT;
  HomeProvider? homeProviderF;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("TODO App"),
            centerTitle: true,
            backgroundColor: Colors.cyan,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text("   Todo(${homeProviderF!.todo.length})",
                  style:
                  const TextStyle(fontSize: 23, fontWeight: FontWeight.w600)),
              SizedBox(
                width: 350,
                height: 300,
                child: ListView.builder(
                  itemBuilder: (context, index) =>
                      Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.black26))),
                        child: Row(
                          children: [
                            Container(
                              width: 10,
                              height: 50,
                              color: Colors.teal,
                            ),
                            Text("  ${homeProviderT!.todo[index]}",
                                style: const TextStyle(fontSize: 20)),
                            const Expanded(child: SizedBox()),
                            InkWell(
                              onTap: () {
                                homeProviderF!
                                    .ctodoadd(
                                    homeProviderT!.todo[index], index);
                              },
                              child: Container(
                                height: 35,
                                width: 35,
                                color: Colors.green,
                                child: const Icon(
                                    Icons.done, color: Colors.white),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                homeProviderF!.txttodo = TextEditingController(
                                    text: homeProviderF!.todo[index]);
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      AlertDialog(
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextField(
                                              decoration: const InputDecoration(
                                                  focusedBorder: OutlineInputBorder(
                                                      borderSide:
                                                      BorderSide(
                                                          color: Colors.black)),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderSide:
                                                      BorderSide(
                                                          color: Colors.black)),
                                                  label: Text(
                                                    "Todo",
                                                    style: TextStyle(
                                                        color: Colors.black54),
                                                  )),
                                              controller: homeProviderF!
                                                  .txttodo,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text("Back")),
                                                TextButton(
                                                    onPressed: () {
                                                      homeProviderF!.todoedit(
                                                          homeProviderF!.txttodo
                                                              .text,
                                                          index);
                                                      homeProviderF!.txttodo
                                                          .clear();
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text("Save")),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                );
                              },
                              child: Container(
                                height: 35,
                                width: 35,
                                color: Colors.amber,
                                child: const Icon(
                                    Icons.edit, color: Colors.white),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                homeProviderF!.delettodo(index);
                              },
                              child: Container(
                                height: 35,
                                width: 35,
                                color: Colors.red,
                                child: const Icon(
                                    Icons.delete, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                  itemCount: homeProviderT!.todo.length,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text("   Done(${homeProviderF!.ctodo.length})",
                  style:
                  const TextStyle(fontSize: 23, fontWeight: FontWeight.w600)),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) =>
                      Container(
                        child: Row(
                          children: [
                            Container(
                              width: 10,
                              height: 50,
                              color: Colors.green,
                            ),
                            Container(
                                height: 30,
                                width: 350,
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.black26))),
                                child: Text(
                                  "  ${homeProviderT!.ctodo[index]}",
                                  style: const TextStyle(fontSize: 20),
                                )),
                          ],
                        ),
                      ),
                  itemCount: homeProviderT!.ctodo.length,
                ),
              ),
            ],
          ),
        ));
  }
}
