import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ChatsSection(),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mobile app training"),
      ),
      body: ListView(scrollDirection: Axis.vertical),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              label: "Home", icon: Icon(Icons.home_outlined)),
          BottomNavigationBarItem(label: "Chats", icon: Icon(Icons.chat)),
          BottomNavigationBarItem(
              label: "Settings", icon: Icon(Icons.settings)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NewChat()));
          },
          child: Icon(Icons.message)),
    );
  }
}

class NewChat extends StatefulWidget {
  NewChat({super.key});

  @override
  State<NewChat> createState() => _NewChatState();
}

class _NewChatState extends State<NewChat> {
  final List<String> contacts = ['Chizzy', 'Bella ', 'Donald Trump'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add a new Chat")),
      body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: Text(contacts[index]),
                onTap: () {
                  // Handle tapping on a message
                  print('Tapped on Contact: ${contacts[index]}');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChatScreen(userName: contacts[index]),
                      ));
                });
          }),
    );
  }
}

class ChatsSection extends StatefulWidget {
  final List<String> chatsfrontpage = [
    'Lionel Messi',
    "Paul Chido",
    'Mark Zuck',
    'Lauren German',
    "Tom Ellis",
    "Acekid",
    'Ella',
    'Eren Jaegar',
    "Precious",
    "Smit Hirpara",
    'Elon Musk',
    'Cristiano Ronaldo',
    "Heidelberg University",
    'BOUESTI',
    'Dad',
    "Bestie",
    'AIU',
    'Bowling Green State University',
    'Pogba',
    "Mr Anderson",
    'Aria Montgommery',
    'Royalle Romanillos',
    "Ida Gringio",
    'Dominic Toretto',
    'Chinsos'
  ];
  ChatsSection({Key? key}) : super(key: key);

  @override
  State<ChatsSection> createState() => _ChatsSectionState();
}

class _ChatsSectionState extends State<ChatsSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChatApp"),
      ),
      body: ListView.builder(
        itemCount: widget.chatsfrontpage.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(widget.chatsfrontpage[index]),
              onTap: () {
                // Handle tapping on a message
                print('Tapped on Contact: ${widget.chatsfrontpage[index]}');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ChatScreen(userName: widget.chatsfrontpage[index]),
                    ));
              });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(label: "Chats", icon: Icon(Icons.message)),
        BottomNavigationBarItem(label: "Settings", icon: Icon(Icons.settings))
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NewChat()));
          },
          child: Icon(Icons.message)),
    );
  }
}

class ChatScreen extends StatefulWidget {
  final String userName;
  ChatScreen({required this.userName, Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> messages = [
    Message(sender: 'Chizzy', text: 'Hi there!'),
    Message(sender: 'User', text: 'Hello! How are you?'),
    Message(sender: 'Chizzy', text: 'I\'m good. What about you?'),
  ];

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userName),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ChatMessage(message: messages[index]);
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              _sendMessage(_textController.text);
            },
          ),
        ],
      ),
    );
  }

  void _sendMessage(String text) {
    if (text.isNotEmpty) {
      setState(() {
        messages.add(Message(sender: 'User', text: text));
        _textController.clear();
      });
    }
  }
}

class Message {
  final String sender;
  final String text;

  Message({required this.sender, required this.text});
}

class ChatMessage extends StatelessWidget {
  final Message message;

  ChatMessage({required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: message.sender == 'User'
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: message.sender == 'User' ? Colors.blue : Colors.green,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              message.text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
