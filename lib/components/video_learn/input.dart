// todo ListView 里面的TextField 键盘出现的时候 让TextField刚好在键盘正上方 resizeToAvoidBottomInset: false, 防止键盘溢出


// // email的控制器
// final TextEditingController _emailController = TextEditingController();
// // 密码的控制器
// final TextEditingController _passController = TextEditingController();

// /// 输入框
// Widget inputTextEdit({
//   @required TextEditingController controller,
//   TextInputType keyboardType = TextInputType.text,
//   String hintText,
//   bool isPassword = false,
//   double marginTop = 15,
//   bool autofocus = false,
// }) {
//   return Container(
//     height: duSetHeight(44),
//     margin: EdgeInsets.only(top: duSetHeight(marginTop)),
//     decoration: BoxDecoration(
//       color: AppColors.secondaryElement,
//       borderRadius: Radii.k6pxRadius,
//     ),
//     child: TextField(
//       autofocus: autofocus,
//       controller: controller,
//       keyboardType: keyboardType,
//       decoration: InputDecoration(
//         hintText: hintText,
//         contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
//         border: InputBorder.none,
//       ),
//       style: TextStyle(
//         color: AppColors.primaryText,
//         fontFamily: "Avenir",
//         fontWeight: FontWeight.w400,
//         fontSize: duSetFontSize(18),
//       ),
//       maxLines: 1,
//       autocorrect: false, // 自动纠正
//       obscureText: isPassword, // 隐藏输入内容, 密码框
//     ),
//   );
// }

// /// email 输入框
// /// 背景白色，文字黑色，带阴影
// Widget inputEmailEdit({
//   @required TextEditingController controller,
//   TextInputType keyboardType = TextInputType.text,
//   String hintText,
//   bool isPassword = false,
//   double marginTop = 15,
//   bool autofocus = false,
// }) {
//   return Container(
//     height: duSetHeight(44),
//     margin: EdgeInsets.only(top: duSetHeight(marginTop)),
//     decoration: BoxDecoration(
//       color: AppColors.primaryBackground,
//       borderRadius: Radii.k6pxRadius,
//       boxShadow: [
//         BoxShadow(
//           color: Color.fromARGB(41, 0, 0, 0),
//           offset: Offset(0, 1),
//           blurRadius: 0,
//         ),
//       ],
//     ),
//     child: TextField(
//       autofocus: autofocus,
//       controller: controller,
//       keyboardType: keyboardType,
//       decoration: InputDecoration(
//         hintText: hintText,
//         contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
//         border: InputBorder.none,
//         hintStyle: TextStyle(
//           color: AppColors.primaryText,
//         ),
//       ),
//       style: TextStyle(
//         color: AppColors.primaryText,
//         fontFamily: "Avenir",
//         fontWeight: FontWeight.w400,
//         fontSize: duSetFontSize(18),
//       ),
//       maxLines: 1,
//       autocorrect: false, // 自动纠正
//       obscureText: isPassword, // 隐藏输入内容, 密码框
//     ),
//   );
// }
