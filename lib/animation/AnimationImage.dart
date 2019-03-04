import 'package:flutter/material.dart';

class AnimationImage extends AnimatedWidget {

  AnimationImage({Key key, Animation<double> animation}): super(key: key,listenable: animation);

  @override
  Widget build(BuildContext context){
    final Animation<double> anim = listenable;
    return Center(child: Image.network("http://pic32.photophoto.cn/20140915/0034034424700073_b.jpg",width: anim.value,height: anim.value,),);
  }

}