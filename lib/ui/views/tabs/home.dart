import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color(0x00f9f9f9),
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: Container(
                child: Text("data3"),
                color: Colors.green,
              ),
              flex: 6,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          boxShadow: [
            BoxShadow(
              color: Colors.white10.withOpacity(0.5),
              offset: const Offset(0, 4),
            )
          ],
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16)),
        ),
        child: Column(
          children: [
            _buildProfileSection(context),
            _buildWeeklyCalendar(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 32,
          horizontal: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.purple,
              height: 120,
              width: 120,
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("data")],
              ),
            ),
            OutlinedButton(onPressed: null, child: Text("button"))
          ],
        ),
      ),
    );
  }

  Widget _buildWeeklyCalendar(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Text("cal"),
        ],
      ),
    );
  }


}
