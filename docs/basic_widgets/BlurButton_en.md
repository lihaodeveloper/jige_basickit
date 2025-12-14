# BlurButton (Blur Background Button)
A custom button component with Gaussian blur background, supporting local images, third-party Image objects, custom layouts, and more flexible usage.

## Local Image Blur Button Effect
![Blur Button with Local Image](/example_resources/basic_widgets/blur_button.png)

## Features
1. Customizable Gaussian blur level, border radius, and background color;
2. Support passing local image paths, or directly passing Image components (including Images returned by third-party libraries);
3. Support passing any Widget through the child parameter (e.g., image + text combination);
4. Translucent blur effect adapts to various backgrounds for a better visual experience.

## Parameter Description
| Parameter Name   | Type        | Required | Default Value                    | Description                                      |
|------------------|-------------|----------|----------------------------------|--------------------------------------------------|
| onTap            | VoidCallback| Yes      | -                                | Button click callback function                   |
| blur             | double      | No       | 8.0                              | Gaussian blur level (larger value = more blur)   |
| radius           | double      | No       | 12.0                             | Button border radius                             |
| color            | Color       | No       | Color.fromRGBO(255,255,255,0.3)  | Button background color (recommend translucent) |
| width            | double      | No       | 80.0                             | Button width                                     |
| height           | double      | No       | 40.0                             | Button height                                    |
| assetImagePath   | String?     | No       | null                             | [Compatible] Local image path (deprecated)       |
| imageWidth       | double?     | No       | 30.0                             | Only valid for assetImagePath, image width       |
| imageHeight      | double?     | No       | 30.0                             | Only valid for assetImagePath, image height      |
| imageFit         | BoxFit      | No       | BoxFit.contain                   | Only valid for assetImagePath, image fit mode    |
| child            | Widget?     | No       | null                             | [Recommended] Internal Widget of the button      |

## Usage Examples
### Example 1: Basic Usage (Only Click Callback)
```dart
import 'package:jige_basickit/jige_basickit.dart';

BlurButton(
  onTap: () {
    print('Blur button clicked');
  },
  blur: 10.0,
  radius: 16.0,
  color: Color.fromRGBO(255, 255, 255, 0.4),
);
```

### Example 2: Pass Local Image
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

### Example 3: Complex Layout (Image + Text)
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
        'Search',
        style: TextStyle(color: Colors.black87, fontSize: 14),
      ),
    ],
  ),
);
```

## Actual Use Cases
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