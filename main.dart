import 'package:flutter/material.dart'; // 导入 Flutter 的 Material 库，提供各种 UI 组件

void main() => runApp(MyApp()); // 程序入口，运行 MyApp 组件

class MyApp extends StatelessWidget { // 定义 MyApp 组件，继承自 StatelessWidget，表示这是一个无状态组件
  @override
  Widget build(BuildContext context) { // 构建组件树
    return MaterialApp( // 使用 MaterialApp 组件，提供应用程序的基本框架
      home: RecipePage(), // 设置 RecipePage 作为应用程序的主页
    );
  }
}

class RecipePage extends StatefulWidget { // 定义 RecipePage 组件，继承自 StatefulWidget，表示这是一个有状态组件
  @override
  _RecipePageState createState() => _RecipePageState(); // 创建一个 _RecipePageState 对象，作为 RecipePage 的状态管理器
}

class _RecipePageState extends State<RecipePage> with SingleTickerProviderStateMixin { // 定义 _RecipePageState 类，继承自 State<RecipePage>，并混入 SingleTickerProviderStateMixin，用于管理 TabController
  late TabController _tabController; // 定义一个 TabController 变量，用于控制选项卡
  final List<String> _recipeTitles = [ // 定义一个字符串列表，存储选项卡标题
    '推荐',
    '血压',
    '血糖',
    '均衡',
  ];
  final List<List<String>> _recipeData = [ // 定义一个二维字符串列表，存储每个选项卡对应的食谱数据
    // 推荐食谱
    ['番茄炒蛋', '清蒸鱼', '红烧肉'],
    // 血压食谱
    ['芹菜炒肉', '冬瓜汤', '清蒸鲈鱼'],
    // 血糖食谱
    ['燕麦粥', '凉拌黄瓜', '清蒸鸡'],
    // 均衡食谱
    ['水果沙拉', '蔬菜炒肉', '糙米饭'],
  ];
  String _selectedRegion = '地区'; // 定义一个字符串变量，存储选择的地区
  int _selectedIndex = 1; // 定义一个整数变量，存储底部导航栏当前选中的索引

  @override
  void initState() { // 初始化状态
    super.initState(); // 调用父类的 initState 方法
    _tabController = TabController(length: _recipeTitles.length, vsync: this); // 创建 TabController，并设置选项卡数量和动画控制器
  }

  @override
  void dispose() { // 销毁状态
    _tabController.dispose(); // 销毁 TabController
    super.dispose(); // 调用父类的 dispose 方法
  }

  @override
  Widget build(BuildContext context) { // 构建 RecipePage 的 UI
    return Scaffold( // 使用 Scaffold 组件，提供页面的基本结构
      appBar: AppBar( // 使用 AppBar 组件，提供页面的标题栏
        bottom: PreferredSize( // 设置 AppBar 底部的高度
          preferredSize: Size.fromHeight(kToolbarHeight - 50), // 设置高度为默认工具栏高度加上 50 个像素
          child: Row( // 使用 Row 组件，将子组件水平排列
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // 设置子组件之间的对齐方式
            children: [ // 添加子组件
              Expanded( // 使用 Expanded 组件，让选项卡占满剩余空间
                child: TabBar( // 使用 TabBar 组件，提供选项卡
                  controller: _tabController, // 设置 TabController
                  tabs: _recipeTitles // 设置选项卡标题
                      .map((title) => Tab(text: title)) // 将每个标题转换为 Tab 组件
                      .toList(), // 将结果转换为列表
                ),
              ),
              DropdownButton<String>( // 使用 DropdownButton 组件，提供下拉菜单
                value: _selectedRegion, // 设置下拉菜单的初始值
                items: <String>['地区', '上海', '北京', '广州'] // 设置下拉菜单的选项
                    .map((region) => DropdownMenuItem<String>( // 将每个选项转换为 DropdownMenuItem 组件
                          value: region, // 设置选项的值
                          child: Text(region), // 设置选项的文本
                        ))
                    .toList(), // 将结果转换为列表
                onChanged: (newValue) { // 设置下拉菜单选项改变时的回调函数
                  setState(() { // 使用 setState 方法，重新构建 UI
                    _selectedRegion = newValue!; // 更新选择的地区
                  });
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding( // 使用 Padding 组件，为内容添加内边距
        padding: const EdgeInsets.all(16.0), // 设置内边距为 16 个像素
        child: TabBarView( // 使用 TabBarView 组件，提供选项卡的内容视图
          controller: _tabController, // 设置 TabController
          children: _recipeData.map((data) { // 遍历食谱数据
            return GridView.builder( // 使用 GridView.builder 组件，创建一个网格视图
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( // 设置网格视图的布局
                crossAxisCount: 2, // 设置每行显示的列数
                crossAxisSpacing: 10, // 设置列之间的间距
                mainAxisSpacing: 10, // 设置行之间的间距
              ),
              itemCount: data.length, // 设置网格视图的项目数量
              itemBuilder: (context, index) { // 设置每个项目的构建函数
                return GestureDetector( // 使用 GestureDetector 组件，识别点击事件
                  onTap: () { // 设置点击事件的回调函数
                    Navigator.push( // 使用 Navigator.push 方法，跳转到新的页面
                      context,
                      MaterialPageRoute( // 使用 MaterialPageRoute 组件，创建路由
                        builder: (context) => RecipeDetailPage( // 设置路由的目标页面
                          recipeName: data[index], // 将当前食谱名称传递给目标页面
                        ),
                      ),
                    );
                  },
                  child: Container( // 使用 Container 组件，创建一个容器
                    decoration: BoxDecoration( // 设置容器的装饰
                      color: Colors.white, // 设置背景颜色为白色
                      borderRadius: BorderRadius.circular(10), // 设置圆角
                    ),
                    child: Center( // 使用 Center 组件，将文本居中
                      child: Text( // 使用 Text 组件，显示文本
                        data[index], // 显示当前食谱名称
                        style: TextStyle(fontSize: 18), // 设置文本样式
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList(), // 将结果转换为列表
        ),
      ),
      bottomNavigationBar: BottomNavigationBar( // 使用 BottomNavigationBar 组件，提供底部导航栏
        items: [ // 设置底部导航栏的选项
          BottomNavigationBarItem( // 创建底部导航栏的选项
            icon: Icon(Icons.book, size: 20,), // 设置选项的图标
            label: '记录', // 设置选项的标签
          ),
          BottomNavigationBarItem( // 创建底部导航栏的选项
            icon: Icon(Icons.restaurant_menu, size: 20), // 设置选项的图标
            label: '食谱', // 设置选项的标签
          ),
          BottomNavigationBarItem( // 创建底部导航栏的选项
            icon: Icon(Icons.search, size: 20), // 设置选项的图标
            label: '查询', // 设置选项的标签
          ),
          BottomNavigationBarItem( // 创建底部导航栏的选项
            icon: Icon(Icons.people, size: 20), // 设置选项的图标
            label: '社区', // 设置选项的标签
          ),
          BottomNavigationBarItem( // 创建底部导航栏的选项
            icon: Icon(Icons.person, size: 20), // 设置选项的图标
            label: '个人', // 设置选项的标签
          ),
        ],
        currentIndex: _selectedIndex, // 设置当前选中的索引
        selectedItemColor: Colors.blue, // 设置选中选项的颜色
        unselectedItemColor: Colors.grey, // 设置未选中选项的颜色
        onTap: (index) { // 设置点击选项的回调函数
          setState(() { // 使用 setState 方法，重新构建 UI
            _selectedIndex = index; // 更新当前选中的索引
          });
        },
      ),
    );
  }
}

// 新页面
class RecipeDetailPage extends StatelessWidget { // 定义 RecipeDetailPage 组件，继承自 StatelessWidget，表示这是一个无状态组件
  final String recipeName; // 定义一个字符串变量，用于存储食谱名称

  RecipeDetailPage({required this.recipeName}); // 构造函数，接收食谱名称参数

  @override
  Widget build(BuildContext context) { // 构建组件树
    return Scaffold( // 使用 Scaffold 组件，提供页面的基本结构
      appBar: AppBar( // 使用 AppBar 组件，提供页面的标题栏
        title: Text(recipeName), // 设置标题栏的标题为食谱名称
      ),
      body: Center( // 使用 Center 组件，将文本居中
        child: Text('食谱详情页面 - ${recipeName}'), // 显示食谱详情页面
      ),
    );
  }
}
