// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, unnecessary_this

import 'package:dialogflow_flutter/googleAuth.dart';
import 'package:dialogflow_flutter/language.dart';
import 'package:flutter/material.dart';
import 'package:dialogflow_flutter/dialogflowFlutter.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _ChatBot createState() => _ChatBot();
}

class _ChatBot extends State<ChatBot> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();

  Widget _buildTextComposer() {
    return IconTheme(
      // the send button will turn green | this is for user input field
      data: IconThemeData(color: Colors.green),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              // The TextField widget needs both a controller and onSubmitted attributes.
              // The onSubmitted attribute calls the given method, _handleSubmitted in our case, once the user hits enter.
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                    InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              // The IconButton widget is another way to submit text to DialogFlow
              // IconButton for submitting a query.
              child: IconButton(
                icon: Icon(Icons.send),
                // Its onPressed function calls _handleSubmitted as well.
                // onPressed: () => _handleSubmitted(_textController.text)
                onPressed: () async {
                        // check if it's empty
                        if ( _textController.text == "") {
                          // empty
                          // ensure no null is submitted > will crash
                          _handleSubmitted("empty");
                        } 
                        else {
                          _handleSubmitted(_textController.text);
                        }
                }
              ),
            ),
          ],
        ),
      ),
    );
  }

  void Response(query) async {
    // first clears the input TextField to get it ready for the next user interaction.
    _textController.clear();
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "assets/credentials.json").build();
    DialogFlow dialogflow =
        DialogFlow(authGoogle: authGoogle, language: Language.english);
    AIResponse response = await dialogflow.detectIntent(query);
    ChatMessage message = ChatMessage(
      text: response.getMessage() ??
          (response.getListMessage()![0]).title,
      name: "R3Bot",
      type: false,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  // when _handleSubmitted is called from IconButton's onPressed method,
  // the text is retrieved from the _textController and passed to the _handleSubmitted method.
  void _handleSubmitted(String text) {
    // first clears the input TextField to get it ready for the next user interaction.
    _textController.clear();
    // takes the TextField text and creates a data structure, FactsMessage to display the interaction log.
    ChatMessage message = ChatMessage(
      text: text,
      name: "Me",
      type: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    Response(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("CHATBOT"),
        backgroundColor: Colors.green,
      ),
      body: Column(children: <Widget>[
        Flexible(
            child: ListView.builder(
          padding: EdgeInsets.all(8.0),
          reverse: true,
          itemBuilder: (_, int index) => _messages[index],
          itemCount: _messages.length,
        )),
        Divider(height: 1.0),
        // textfield color | textfield
        Container(
          decoration: BoxDecoration(color: Theme.of(context).cardColor),
          child: _buildTextComposer(),
        ),
      ]),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({required this.text, required this.name, required this.type});

  final String text;
  final String name;
  final bool type;

  List<Widget> botMessage(context) {
    return <Widget>[
      // Since it's DP followed by username on the right
      Container(
          margin: const EdgeInsets.only(right: 16.0),
          // PROFILE PICTURE (BOT)
          child: CircleAvatar(child: Text('RB'))),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // the BotName
            Text(this.name, style: TextStyle(fontWeight: FontWeight.bold)),
            // the BotMessage
            Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(text, style: TextStyle(fontSize: 16))),
          ],
        ),
      ),
    ];
  }

  // User Message
  List<Widget> userMessage(context) {
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            // the UserName
            Text(name),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              // the UserMessage
              child: Text(text, style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
      // PROFILE PICTURE (USER)
      // Since it's username followed by DP on the right
      Container(
          margin: const EdgeInsets.only(left: 16.0),
          child: CircleAvatar(
            child: Text("M"),
          )),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? userMessage(context) : botMessage(context),
      ),
    );
  }
}
