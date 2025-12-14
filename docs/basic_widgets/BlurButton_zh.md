# BlurButton（模糊背景按钮）
一款带高斯模糊背景的自定义按钮组件，支持本地图片、第三方Image对象、自定义布局等灵活用法。

## 本地图片模糊按钮效果
![带图片模糊按钮](/example_resources/basic_widgets/blur_button.png)

## 功能特点
1. 可自定义高斯模糊程度、圆角、背景色；
2. 支持传入本地图片路径，或直接传入Image组件（含第三方库返回的Image）；
3. 支持通过child参数传入任意Widget（如图片+文字组合）；
4. 半透明模糊效果适配各类背景，视觉体验更优。

## 参数说明
| 参数名           | 类型        | 必填 | 默认值                          | 说明                                   |
|------------------|-------------|------|---------------------------------|----------------------------------------|
| onTap            | VoidCallback| 是   | -                               | 按钮点击回调函数                       |
| blur             | double      | 否   | 8.0                             | 高斯模糊程度，值越大模糊效果越明显     |
| radius           | double      | 否   | 12.0                            | 按钮圆角半径                           |
| color            | Color       | 否   | Color.fromRGBO(255,255,255,0.3) | 按钮背景色（建议使用半透明色）         |
| width            | double      | 否   | 80.0                            | 按钮宽度                               |
| height           | double      | 否   | 40.0                            | 按钮高度                               |
| assetImagePath   | String?     | 否   | null                            | 【兼容用法】本地图片路径（已标注废弃） |
| imageWidth       | double?     | 否   | 30.0                            | 仅对assetImagePath生效，图片宽度       |
| imageHeight      | double?     | 否   | 30.0                            | 仅对assetImagePath生效，图片高度       |
| imageFit         | BoxFit      | 否   | BoxFit.contain                  | 仅对assetImagePath生效，图片适配模式   |
| child            | Widget?     | 否   | null                            | 【推荐】按钮内部Widget（支持任意布局） |

## 使用示例
### 示例1：基础用法（仅点击回调）
```dart
import 'package:jige_basickit/jige_basickit.dart';

BlurButton(
  onTap: () {
    print('模糊按钮被点击');
  },
);
```

### 示例 2：传入本地图片
```dart
BlurButton(
  onTap: () {},
  assetImagePath: 'assets/ic_icon.png',
  width: 50,
  height: 50,
  radius: 25,
  blur: 12,
  color: Colors.black.withValues(alpha: 0.3),
);
```

### 示例 3：复杂布局（图片 + 文字）
```dart
BlurButton(
  onTap: () {},
  width: 120,
  height: 120,
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Image.asset('assets/ic_search.png', width: 20, height: 20),
      SizedBox(width: 6),
      Text(
        '搜索',
        style: TextStyle(color: Colors.black87, fontSize: 14),
      ),
    ],
  ),
);
```

## 真实案例
```dart
class BlurButtonDemo extends StatelessWidget {
  const BlurButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 给按钮加背景图，突出模糊效果
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://picsum.photos/1080/1920'), // 测试图片
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: BlurButton(
            width: 50,
            height: 50,
            radius: 25,
            color: Colors.black.withValues(alpha: 0.3),
            blur: 12,
            child: Image.asset(
              'assets/images/basic_widgets/car.webp',
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
            onTap: () {
              // 点击事件：弹出提示
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('按钮被点击啦！')));
            },
          ),
        ),
      ),
    );
  }
}
```
