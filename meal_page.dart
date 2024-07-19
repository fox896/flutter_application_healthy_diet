import 'package:flutter/material.dart';

class MealPage extends StatefulWidget {
  final String mealName;

  MealPage({required this.mealName});

  @override
  _MealPageState createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  int _selectedNavIndex = 0;

  void _onNavButtonPressed(int index) {
    setState(() {
      _selectedNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mealName),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            child: Text('添加${widget.mealName}', style: TextStyle(fontSize: 24)),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.green),
                hintText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavigationButton(
                  text: '推荐',
                  isSelected: _selectedNavIndex == 0,
                  onTap: () => _onNavButtonPressed(0),
                ),
                _NavigationButton(
                  text: '收藏',
                  isSelected: _selectedNavIndex == 1,
                  onTap: () => _onNavButtonPressed(1),
                ),
                _NavigationButton(
                  text: '我吃过的',
                  isSelected: _selectedNavIndex == 2,
                  onTap: () => _onNavButtonPressed(2),
                ),
                _NavigationButton(
                  text: '自定义',
                  isSelected: _selectedNavIndex == 3,
                  onTap: () => _onNavButtonPressed(3),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('食材 $index', style: TextStyle(color: Colors.black)),
                      Text('100千卡/100克', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  trailing: Icon(Icons.circle, color: Colors.green),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey)),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Icon(Icons.local_dining, color: Colors.orange),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('0千卡', style: TextStyle(color: Colors.black, fontSize: 16)),
                          Text('....摄入热量', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: Text('完成', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NavigationButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavigationButton({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: onTap,
          child: Text(
            text,
            style: TextStyle(color: Colors.black),
          ),
        ),
        if (isSelected)
          Container(
            height: 2,
            width: 20,
            color: Colors.green,
          ),
      ],
    );
  }
}
