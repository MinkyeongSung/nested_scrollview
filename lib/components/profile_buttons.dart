import 'package:flutter/material.dart';

class ProfileButtons extends StatelessWidget {
  const ProfileButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildFollowButton(),
        _buildMessageButton(),
      ],
    );
  }

  Widget _buildMessageButton() {
    return OutlinedButton(
      onPressed: () {
        print("Message 버튼 클릭됨");
      },
      child: Text(
        "Message",
        style: TextStyle(color: Colors.black),
      ),
      style: OutlinedButton.styleFrom(
        minimumSize: Size(150, 45),
      ),
    );
  }

  Widget _buildFollowButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text("Follow", style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        minimumSize: Size(150, 45),
      ),
    );
  }
}
