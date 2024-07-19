import 'package:flutter/material.dart';

class RecordApp extends StatefulWidget {
  @override
  _RecordAppState createState() => _RecordAppState();
}

class _RecordAppState extends State<RecordApp> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('今天食谱'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            height: 80,
            color: Colors.grey[300],
            child: Center(child: Text('今日食谱', style: TextStyle(fontSize: 18))),
          ),
          Container(
            margin: EdgeInsets.all(8),
            height: 140,
            width: double.infinity,
            color: Colors.yellow[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('能量', style: TextStyle(fontSize: 16)),
                Text('100千卡', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('= 摄入能量 - 运动量', style: TextStyle(fontSize: 16)),
                Text('摄入的营养物质', style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('早餐', style: TextStyle(fontSize: 12)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('午餐', style: TextStyle(fontSize: 12)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('晚餐', style: TextStyle(fontSize: 12)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('加餐', style: TextStyle(fontSize: 12)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
              ),
            ],
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 2,
              padding: EdgeInsets.all(8),
              children: [
                Card(
                  child: Center(child: Text('血压记录', style: TextStyle(fontSize: 12))),
                ),
                Card(
                  child: Center(child: Text('饮水记录', style: TextStyle(fontSize: 12))),
                ),
                Card(
                  child: Center(child: Text('1200 运动步数', style: TextStyle(fontSize: 12))),
                ),
                Card(
                  child: Center(child: Text('睡眠时间记录', style: TextStyle(fontSize: 12))),
                ),
                Card(
                  child: Center(child: Text('体重BMI', style: TextStyle(fontSize: 12))),
                ),
              ],
            ),
          ),
          BottomNavigationBar(
            // type: BottomNavigationBarType.fixed,//可调整点击前样式
            items: [
              BottomNavigationBarItem(
                
                icon: Icon(Icons.book, size: 20),
                label: '记录',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.restaurant_menu, size: 20),
                label: '食谱',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search, size: 20),
                label: '查询',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people, size: 20),
                label: '社区',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, size: 20),
                label: '个人',
              ),
            ],
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ],
      ),
    );
  }
}
