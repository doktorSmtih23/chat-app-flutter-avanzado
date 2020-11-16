import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/painting.dart';

import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_8.dart';

class ChatMessage extends StatelessWidget {
  final String texto;
  final String uid;
  final AnimationController animationController;

  const ChatMessage(
      {Key key,
      @required this.texto,
      @required this.uid,
      @required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor:
            CurvedAnimation(parent: animationController, curve: Curves.easeOut),
        child: Container(
          child: this.uid == authService.usuario.uid ? _myMessage() : _notMyMessage(),
        ),
      ),
    );
  }

  Widget _myMessage() {
    return ChatBubble(
      clipper: ChatBubbleClipper8(type: BubbleType.sendBubble),
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(top: 10),
      backGroundColor: Colors.orange[400],
        child: Container(
        padding: EdgeInsets.all(8.0),
        child: Text(this.texto, style: TextStyle(color: Colors.white, fontSize:16),
        ),
      ),
    );
  }

  Widget _notMyMessage() {
    return ChatBubble(
      clipper: ChatBubbleClipper8(type: BubbleType.receiverBubble),
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 10,bottom: 10),
      backGroundColor: Colors.grey[400],
      child: Container(
        padding: EdgeInsets.all(8.0),
          child: Text(this.texto, style: TextStyle(color: Colors.white,fontSize:16),
        ),
      ),
    );
  }
}
