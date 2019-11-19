import 'dart:io';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; 
import 'package:pull_to_refresh/pull_to_refresh.dart';


typedef FuncType = Function();
typedef FuncRefreshType = Function(LoadStatus state);

//获取当前像素点
double ScreenPix = window.devicePixelRatio;
//获取屏幕宽度
double ScreenWidth = (window.physicalSize.width/ScreenPix);
//获取屏幕高度
double ScreenHeight = (window.physicalSize.height/ScreenPix);
//是否为安卓
bool is_iOS = Platform.isIOS;
//是否为iOS
bool  is_Android = Platform.isAndroid;
//透明色
Color alphaColor = Color(0x00000000);












/***
 * 图片带圆角方法
 * path:图片地址（本地、url）
 * num:圆角大小
 * placeImg:占位图片 （可选）
 * type: 内容填充模式 （可选）
 */
imgCorner(String placeImg,double num,{String path,BoxFit type = BoxFit.cover}) {

  bool isUrl = false;
  if(path != null){
    isUrl = path.contains("http");
  }
  Widget img;
  

  if(isUrl){
      img = CachedNetworkImage(
        placeholder: (context, url) => Image.asset(placeImg),
        imageUrl: path,
        fit: type,
      );
  }else{
    img = Image.asset(placeImg,fit:type);
  }
  
  return ClipRRect(
      borderRadius: BorderRadius.circular(num),
      child: img,
  );
  
}

///hexToColor:16进制转颜色
Color hexToColor(String s,[double alpha = 1.0]) {
  // 如果传入的十六进制颜色值不符合要求，返回默认值
  if (s == null || s.length != 7 || int.tryParse(s.substring(1, 7), radix: 16) == null) {
    return null;
  }
  Color col = Color(int.parse(s.substring(1, 7), radix: 16) + 0xFF000000);
  
  int num = 255;
  if(alpha < 1.0){
     num = (255.0 * alpha).toInt();
    col= col.withAlpha(num);
  }

  return col;

}

/**
 * push到一个控制器
*/
Future push(BuildContext con,Widget vc) {
  return Navigator.push(con, MaterialPageRoute(builder: (BuildContext context) => vc));
}

/**
 * content：alert内容
 * okClick:     确定回调
 * cancelClick: 取消回调
*/
showAlert(BuildContext con,String content,
{FuncType okClick,FuncType cancelClick,
 String okStr = '确定',String cancelStr = '取消',String title = '提示'}) {
   CupertinoAlertDialog alert = CupertinoAlertDialog(
     title: Text(title),
     content: Text(content),
     actions: <Widget>[
       CupertinoDialogAction(
         child: Text(okStr),
         onPressed: (){
           Navigator.pop(con);
           if(okClick != null){
            okClick();
           }
         },
       ),
       CupertinoDialogAction(
         child: Text(cancelStr),
         onPressed: (){
           Navigator.pop(con);
           if(cancelClick != null){
            cancelClick();
           }
         },
       ),
     ],
   );
   showCupertinoDialog(context:con,builder: (_) => alert );
}




refreshTableView(ListView list,BuildContext con,RefreshController conVC,{FuncRefreshType callBack}) {
      return SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: ClassicHeader(
          height: 45,
          refreshingText: '正在刷新',
          completeText: '刷新完成',
          failedText: '刷新失败',
          idleText: '下拉刷新',
          releaseText: '释放刷新',
        ),
        footer: CustomFooter(
          builder: (con,mode){
           Widget str = null;
            if(mode == LoadStatus.failed){
                str = Text('加载失败');
            }
            if(mode == LoadStatus.loading){
                str = CupertinoActivityIndicator();
            }

            if(mode == LoadStatus.idle){
                str = Text('释放加载');
            }
            if(mode == LoadStatus.noMore){
                str = Text('暂无数据');
            }

            if(mode == LoadStatus.canLoading){
                str = Text('释放加载');
            }

            return Container(
              height: 45,
              child:  Center(child:str),
            );

          },
        ),
        controller: conVC,
        onLoading: (){
          callBack(LoadStatus.loading);
        },
        onRefresh: (){
          callBack(LoadStatus.idle);
        },
        child: list,
      );
}
