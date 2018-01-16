# HYCBaseViewController
UIViewController父类,继承了UINav,并且实现了很多UINav的方法,更加方便的调用
## podfile
To integrate HYCBaseViewController into your Xcode project using CocoaPods, specify it in your Podfile:

`$ pod 'HYCBaseViewController'`

or

`pod 'HYCBaseViewController', '~> 1.0'`

Then, run the following command:

`$ pod install`

## Usage
### 首先需要在创建Viewcontroller的时候继承HYCBaseViewController
```
- (void)viewDidLoad {
    [super viewDidLoad];
    self.leftNavImageName = @"";//左边的图片名字
    self.rightNavImageName = @"";//右边如果是图片的话的名字
    self.rightNavTitle = @"";//右边按钮如果是文字的话的字符串
    self.navTranslucent = NO;//导航条是否半透明
    self.navBottomLineHidden = NO;//导航条底部的线是否隐藏
    self.navItemTintColor = UIColor.groupTableViewBackgroundColor;//导航条的按钮颜色
    self.topViewEdge = 20;//和上面的距离
    NSLog(@"%.0f",self.tabbarHeight);//返回tabbar的高度(只能读)
    self.leftItem.title = @"返回";//左边的按钮的抽象类,如果我的设计觉得不合理可以自己创建上一个按钮替换上去
    self.rightItem.image = [UIImage imageNamed:@""];//右边按钮的抽象类
    
    
    // Do any additional setup after loading the view.
}

- (void)leftNavBackAction{//左边按钮的点击事件
    
}
- (void)rightNavItemAction{//右边按钮的点击事件
    
}
- (void)setUI{//这个是空的啥也没有,我就觉得自己打这几个单词没有提示很别扭,就写了个空方法
    
}
- (void)loadSquareRequest{//同上一个方法
    
}
```
# 鸣谢
感谢 __刘佳奇__ 同学对此控件提供的部分技术支持
