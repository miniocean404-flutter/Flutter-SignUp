import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sign_in/config/theme/color/custom.dart';
import 'package:flutter_sign_in/config/theme/font/custom.dart';

class DialogBox extends StatelessWidget {
  final String title;
  final String content;
  final bool isHaveCancel;

  const DialogBox({Key? key, this.title = '提示', this.content = '请输入内容', this.isHaveCancel = false}) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            width: 280.0,
            padding: const EdgeInsets.only(top: 24.0),
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor.withOpacity(0.98),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(bottom: 10.0),
                  child: Text(
                    title,
                    style: CustomAppFont.of(context).fontBold17,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(bottom: 16.0),
                  child: Text(
                    content,
                    textAlign: TextAlign.center,
                    style: CustomAppFont.of(context).font16!.copyWith(height: 1.4),
                  ),
                ),
                BottomButton(
                  cancelButton: isHaveCancel,
                ),
              ],
            ),
          ),
        ),
      );
}

class BottomButton extends StatelessWidget {
  final bool cancelButton;
  const BottomButton({Key? key, this.cancelButton = false}) : super(key: key);

  Widget _buttonWidget(BuildContext context) {
    if (cancelButton) {
      return Row(
        children: <Widget>[
          Expanded(
            child: CupertinoButton(
              padding: const EdgeInsets.all(0.0),
              minSize: 52.0,
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('取消'),
            ),
          ),
          Container(
            width: 0.5,
            height: 52.0,
            color: CustomAppColor.of(context).borderColor,
          ),
          Expanded(
            child: CupertinoButton(
              padding: const EdgeInsets.all(0.0),
              minSize: 52.0,
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('确定'),
            ),
          ),
        ],
      );
    }

    return CupertinoButton(
      padding: const EdgeInsets.all(0.0),
      onPressed: () => Navigator.of(context).pop(),
      child: const Center(child: Text('确定')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.0,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: CustomAppColor.of(context).borderColor,
            width: 0.5,
          ),
        ),
      ),
      child: _buttonWidget(context),
    );
  }
}
