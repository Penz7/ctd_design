import 'package:ctd_design/src/widgets/d_inkwell.dart';
import 'package:ctd_design/src/widgets/d_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../app_font/app_font.dart';
import '../constants/colors.dart';
import '../constants/constants.dart';

class DTextField extends StatefulWidget {
  const DTextField({
    super.key,
    this.labelText,
    required this.hintText,
    this.callback,
    this.isPassword = false,
    this.errorText,
    this.headerMaxLines,
    this.tfMaxLines = 1,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.currentNode,
    this.nextNode,
    this.tfMaxLength,
    this.onSubmit,
    this.autoFocus = false,
    this.action = TextInputAction.done,
    this.inputFormatters,
    this.showKeyboardAction = true,
  });
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final Function()? onSubmit;
  final Function(String)? callback;
  final bool isPassword;
  final TextInputType? keyboardType;
  final int? headerMaxLines;
  final int? tfMaxLines;
  final TextEditingController? controller;
  final FocusNode? currentNode;
  final FocusNode? nextNode;
  final int? tfMaxLength;
  final bool autoFocus;
  final TextInputAction? action;
  final List<TextInputFormatter>? inputFormatters;
  final bool showKeyboardAction;

  @override
  AppTextFieldState createState() => AppTextFieldState();
}

class AppTextFieldState extends State<DTextField> {
  bool isHidePassword = true;
  String? errorMessage;
  late FocusNode currentNode;
  bool isShowClearAll = false;

  @override
  void initState() {
    currentNode = widget.currentNode ?? FocusNode();
    super.initState();
    currentNode.addListener(() {
      setState(() {
        if (currentNode.hasFocus) {
          errorMessage = null;
          if (widget.controller?.text.isNotEmpty == true) {
            isShowClearAll = true;
          }
          return;
        }
        if (isShowClearAll) {
          isShowClearAll = false;
        }
      });
    });

    if (widget.controller != null) {
      widget.controller!.addListener(() {
        if (currentNode.hasFocus == false) {
          return;
        }
        if (widget.controller!.text.isNotEmpty == true) {
          if (isShowClearAll != true) {
            setState(() {
              isShowClearAll = true;
            });
          }
          return;
        }
        if (isShowClearAll != false) {
          setState(() {
            isShowClearAll = false;
          });
        }
      });
    }
  }

  setErrorMessage(String message) {
    if (!mounted) {
      return;
    }
    setState(() {
      errorMessage = message;
    });
  }

  Color _getColorForTitle() {
    if (errorMessage != null) {
      return DColor.red;
    }
    if (currentNode.hasFocus == true) {
      return DColor.fieldText;
    }
    return DColor.defaultText;
  }

  Color _getColorForTextFieldBorder() {
    if (errorMessage != null) {
      return DColor.red;
    }
    if (currentNode.hasFocus == true) {
      return DColor.fieldText;
    }
    return Colors.transparent;
  }

  Color _getColorForTextFieldBG() {
    if (errorMessage != null) {
      return DColor.red;
    }
    if (currentNode.hasFocus == true) {
      return DColor.fieldText;
    }
    return DColor.defaultText;
  }


  Widget getTitleWidget() {
    if (errorMessage != null) {
      return DText.bold(
        errorMessage ?? "",
        fontSize: FontSizes.small,
        color: DColor.red,
      );
    }
    if (widget.labelText != null) {
      return DText.bold(
        widget.labelText ?? "",
        fontSize: FontSizes.small,
        maxLines: widget.headerMaxLines,
        color: _getColorForTitle(),
      );
    }
    return const SizedBox();
  }

  Widget? renderSuffixIcon() {
    if (widget.isPassword) {
      return DInkwell.base(
        padding: 0,
        onTap: () {
          setState(() {
            isHidePassword = !isHidePassword;
          });
        },
        child: Icon(
          isHidePassword
              ? Icons.remove_red_eye_outlined
              : Icons.remove_red_eye_rounded,
          size: 24,
          color: DColor.defaultText,
        ),
      );
    }

    if (isShowClearAll) {
      return DInkwell.base(
        padding: 0,
        onTap: () {
          widget.controller!.clear();
        },
        child: const Icon(
          Icons.clear,
          size: 24,
          color: DColor.defaultText,
        ),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      decoration: BoxDecoration(
        color: _getColorForTextFieldBG(),
        border: Border.all(color: _getColorForTextFieldBorder()),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          getTitleWidget(),
          KeyboardActions(
            enable: widget.showKeyboardAction,
            config: KeyboardActionsConfig(
              keyboardBarColor: DColor.white,
              nextFocus: false,
              actions: [
                KeyboardActionsItem(
                  focusNode: currentNode,
                  toolbarButtons: [
                    (node) {
                      return GestureDetector(
                        onTap: () {
                          if (widget.nextNode != null) {
                            widget.nextNode!.requestFocus();
                          } else {
                            currentNode.unfocus();
                          }
                        },
                        child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(8.0),
                          child: DText.regular(
                            "continue",
                          ),
                        ),
                      );
                    }
                  ],
                )
              ],
            ),
            disableScroll: true,
            child: TextField(
              autofocus: widget.autoFocus,
              controller: widget.controller,
              onChanged: widget.callback,
              focusNode: currentNode,
              keyboardType: widget.keyboardType,
              inputFormatters: widget.inputFormatters,
              textInputAction: widget.nextNode != null
                  ? TextInputAction.next
                  : widget.action,
              enableInteractiveSelection: true,
              obscureText: widget.isPassword == true ? isHidePassword : false,
              maxLines: widget.tfMaxLines,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                ),
                border: InputBorder.none,
                fillColor: Colors.transparent,
                hintStyle: regularFont.copyWith(
                  color: DColor.blurTextColor,
                ),
                suffixStyle: regularFont,
                labelStyle: regularFont,
                isDense: true,
                filled: true,
                hintText: widget.hintText,
                suffixIconConstraints: const BoxConstraints(
                  minHeight: 24,
                  minWidth: 24,
                ),
                suffixIcon: renderSuffixIcon(),
                counterText: '',
              ),
              onEditingComplete: () {
                if (widget.nextNode != null) {
                  widget.nextNode!.requestFocus();
                } else {
                  currentNode.unfocus();
                }
                if (widget.onSubmit != null) {
                  widget.onSubmit!.call();
                }
              },
              maxLength: widget.tfMaxLength,
            ),
          ),
        ],
      ),
    );
  }
}
