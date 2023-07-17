import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Hello',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Hello'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 45,left: 5,right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: (){},
                        icon: const Icon(
                        Icons.menu,
                    color: Colors.white
                      ,)),
                    IconButton(
                        onPressed: (){},
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white
                          ,)),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    TextButton(onPressed: (){},
                        child: const Text(
                          "Messages",
                          style: TextStyle(color: Colors.white,fontSize: 25),
                        )),
                    const SizedBox(
                      width: 35,
                    ),
                    TextButton(onPressed: (){},
                        child: const Text(
                          "Online",
                          style: TextStyle(color: Colors.white,fontSize: 25),
                        )),
                    const SizedBox(
                      width: 35,
                    ),
                    TextButton(onPressed: (){},
                        child: const Text(
                          "Group",
                          style: TextStyle(color: Colors.white,fontSize: 25),
                        )),
                    const SizedBox(
                      width: 35,
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
              top: 155,
              left:0,
              right:0,
              child: Container(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 25),
            height: 200,
            decoration: const BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40))),

                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Recent Contacts", style: TextStyle(color: Colors.white),),
                        IconButton(
                            onPressed: (){},
                            icon: const Icon(
                              Icons.more_horiz,
                              color: Colors.white
                              ,)),
                      ],
                    ),
                    SizedBox(
                      height: 90,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children:  [
                          buildContactAvatar('kaustubh', 'img1.jpg'),
                          buildContactAvatar('sukanya', 'img2.jpg'),
                          buildContactAvatar('sanket', 'img3.jpg'),
                          buildContactAvatar('pranav', 'img4.jpg'),
                          buildContactAvatar('surya', 'img5.jpg'),
                          buildContactAvatar('hrishi', 'img6.jpg'),
                        ],
                      ),
                    )
                  ],
                ),
             ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            top: 320,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
                  child: ListView(
                    padding: const EdgeInsets.only(left: 20),
                    children: [
                      buildConversationRow('kaustubh', 'Saved Messages', 'img1.jpg', 0),
                      buildConversationRow('sukanya', 'kay zale??', 'img2.jpg', 0),
                      buildConversationRow('sanket', 'kachori khanar ka re?', 'img3.jpg', 5),
                      buildConversationRow('pranav', 'model kele na SW madhe tu .. ', 'img4.jpg', 7),
                      buildConversationRow('surya', 'kothe ahe re?', 'img5.jpg', 1),
                      buildConversationRow('hrishi', 'call kelta ka ??', 'img6.jpg', 2),
                    ],
                  )
              ),
          ),
        ],
      ),
    );
  }

  Column buildConversationRow(String name, String message, String filename, int msgcount) {
    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Column(
                            children: [
                              Row(children: [UserAvatar(filename: filename),
                               const SizedBox(width: 15,),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [Text(name,style: const TextStyle(color: Colors.black),),
                                const SizedBox(height: 5,),
                                Text(message,style: const TextStyle(color: Colors.black),),],
                               )
                              ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 25,top: 5),
                            child: Column(
                              children: [
                                const Text(
                                  '16:35',
                                style: TextStyle(fontSize: 10),
                                ),
                                const SizedBox(height: 15,),
                                if(msgcount>0)
                                CircleAvatar(
                                  radius: 7,
                                  backgroundColor: Colors.cyan,
                                  child: (
                                  Text(
                                    msgcount.toString(),
                                    style: const TextStyle(
                                      fontSize: 10,color: Colors.white),
                                  )
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                        ),
                        const Divider(
                          indent: 50,
                        )
                      ],
                    );
  }

  Padding buildContactAvatar(String name, String filename) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
                            children: [
                              UserAvatar(
                                filename: filename,
                              ),
                              const SizedBox(
                               height: 5,
                              ),
                              Text(
                                name,
                                style: const TextStyle(color: Colors.white, fontSize: 16),
                              )
                            ],
                          ),
    );
  }
}

class UserAvatar extends StatelessWidget {
  final String filename;
  const UserAvatar({
    super.key, required this.filename,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 32,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 30,
        backgroundImage: Image.asset('assets/images/$filename').image,
      ),
    );
  }
}
