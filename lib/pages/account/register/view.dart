import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late FocusNode _focus;
  late TextEditingController _accountController; // 账号输入框控制器(可以使用_accountController.text获取输入内容)
  late TextEditingController _phoneController; // 手机号输入框控制器
  late TextEditingController _captchaController; // 验证码输入框控制器
  late TextEditingController _passwordController; // 密码输入框控制器
  late TextEditingController _secondPasswordController; // 确认密码输入框控制器
  late TextEditingController _referrerController; // 推荐人输入框控制器
  String _accountText = ''; // 定义账号输入框输入内容
  String _phoneText = ''; // 定义手机号输入框输入内容
  String _captchaText = ''; // 定义验证码输入框输入内容
  String _passwordText = ''; // 定义密码输入框输入内容
  String _secondPasswordText = ''; // 定义确认密码输入框输入内容
  String _referrerText = ''; // 定义推荐人输入框输入内容
  bool showPassword = false; // 是否显示密码

  /// 定义清空账号输入框方法
  void _onAccountClean() {
    _accountController.clear(); // 输入框控制器清空输入内容
    setState(() {
      _accountText = '';
    });
  }

  /// 定义清空手机号输入框方法
  void _onPhoneClean() {
    _phoneController.clear(); // 输入框控制器清空输入内容
    setState(() {
      _phoneText = '';
    });
  }

  /// 定义清空验证码输入框方法
  void _onCaptchaClean() {
    _captchaController.clear(); // 输入框控制器清空输入内容
    setState(() {
      _captchaText = '';
    });
  }

  /// 定义清空密码输入框方法
  void _onPasswordClean() {
    _passwordController.clear(); // 输入框控制器清空输入内容
    setState(() {
      _passwordText = '';
    });
  }

  /// 定义清空确认密码输入框方法
  void _onSecondPasswordClean() {
    _secondPasswordController.clear(); // 输入框控制器清空输入内容
    setState(() {
      _secondPasswordText = '';
    });
  }

  /// 定义清空推荐人输入框方法
  void _onReferrerClean() {
    _referrerController.clear(); // 输入框控制器清空输入内容
    setState(() {
      _referrerText = '';
    });
  }

  @override
  void initState() {
    _focus = FocusNode(); // 定义输入框焦点实例(获取焦点: FocusScope.of(context).requestFocus(_focus);失去焦点: _focus.unfocus())
    _accountController = TextEditingController(text: _accountText); // 初始化账号输入框控制器
    _phoneController = TextEditingController(text: _phoneText); // 初始化手机号输入框控制器
    _captchaController = TextEditingController(text: _captchaText); // 初始化手机号输入框控制器
    _passwordController = TextEditingController(text: _passwordText); // 初始化密码输入框控制器
    _secondPasswordController = TextEditingController(text: _secondPasswordText); // 初始化确认密码输入框控制器
    _referrerController = TextEditingController(text: _referrerText); // 初始化确认密码输入框控制器
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.fromLTRB(28, 50, 28, 0),
        children: [
          Center(
            child: Image.asset('assets/icons/loginIcon.png', width: 100, height: 100),
          ),
          const Padding(padding: EdgeInsets.only(top: 50, bottom: 20), child: Text('注册', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
          TextField(
            cursorColor: Colors.lightBlueAccent,
            cursorWidth: 1,
            controller: _accountController, // 输入框控制器(清空输入内容时使用 _accountController.clear())
            inputFormatters: [
              // 显示输入格式
              FilteringTextInputFormatter.allow(RegExp('[0-9a-z]')), // 只允许小写字母和数字需要flutter/services.dart
              LengthLimitingTextInputFormatter(8), // 最大只能输入8位
            ],
            onChanged: (value) {
              setState(() {
                _accountText = value;
              });
            },
            decoration: InputDecoration(
                hintText: '请输入账号',
                prefixIcon: Container(
                    width: 80,
                    alignment: Alignment.bottomLeft,
                    child: const Padding(padding: EdgeInsets.only(bottom: 8), child: Text('账号', style: TextStyle(fontSize: 15)))),
                suffix: _accountText.isNotEmpty
                    ? InkWell(
                        // 输入框内嵌后置图标(输入时显示)
                        child: Icon(Icons.clear, color: Colors.grey.shade500, size: 18),
                        onTap: () {
                          setState(() {
                            _onAccountClean();
                          });
                        })
                    : null,
                enabledBorder: UnderlineInputBorder(
                    // 未输入时边框样式
                    borderSide: BorderSide(color: Colors.grey.shade400)),
                focusedBorder: UnderlineInputBorder(
                    // 输入时边框样式
                    borderSide: BorderSide(color: Colors.grey.shade400))),
          ),
          const SizedBox(height: 8),
          TextField(
            cursorColor: Colors.lightBlueAccent,
            cursorWidth: 1,
            controller: _phoneController, // 输入框控制器(清空输入内容时使用 _accountController.clear())
            inputFormatters: [
              // 显示输入格式
              FilteringTextInputFormatter.allow(RegExp('[0-9]')), // 只允许数字需要flutter/services.dart
              LengthLimitingTextInputFormatter(11), // 最大只能输入8位
            ],
            onChanged: (value) {
              setState(() {
                _phoneText = value;
              });
            },
            decoration: InputDecoration(
                hintText: '请输入您的手机号',
                prefixIcon: Container(
                    width: 80,
                    alignment: Alignment.bottomLeft,
                    child: const Padding(padding: EdgeInsets.only(bottom: 8), child: Text('手机号', style: TextStyle(fontSize: 15)))),
                suffix: _phoneText.isNotEmpty
                    ? InkWell(
                        // 输入框内嵌后置图标(输入时显示)
                        child: Icon(Icons.clear, color: Colors.grey.shade500, size: 18),
                        onTap: () {
                          setState(() {
                            _onPhoneClean();
                          });
                        })
                    : null,
                enabledBorder: UnderlineInputBorder(
                    // 未输入时边框样式
                    borderSide: BorderSide(color: Colors.grey.shade400)),
                focusedBorder: UnderlineInputBorder(
                    // 输入时边框样式
                    borderSide: BorderSide(color: Colors.grey.shade400))),
          ),
          const SizedBox(height: 8),
          TextField(
            cursorColor: Colors.lightBlueAccent,
            cursorWidth: 1,
            controller: _captchaController, // 输入框控制器(清空输入内容时使用 _passwordController.clear())
            inputFormatters: [
              // 显示输入格式
              FilteringTextInputFormatter.allow(RegExp('[0-9]')), // 只允许数字需要flutter/services.dart
              LengthLimitingTextInputFormatter(6), // 最大只能输入16位
            ],
            onChanged: (value) {
              setState(() {
                _captchaText = value;
              });
            },
            decoration: InputDecoration(
                hintText: '请输入验证码',
                prefixIcon: Container(
                    width: 80,
                    alignment: Alignment.bottomLeft,
                    child: const Padding(padding: EdgeInsets.only(bottom: 8), child: Text('验证码', style: TextStyle(fontSize: 15)))),
                suffix: _captchaText.isNotEmpty
                    ? InkWell(
                        // 输入框内嵌后置图标(输入时显示)
                        child: Icon(Icons.clear, color: Colors.grey.shade500, size: 18),
                        onTap: () {
                          setState(() {
                            _onCaptchaClean();
                          });
                        })
                    : null,
                suffixIcon: OutlinedButton(
                  onPressed: () {},
                  child: Text('发送验证码'),
                ),
                enabledBorder: UnderlineInputBorder(
                    // 未输入时边框样式
                    borderSide: BorderSide(color: Colors.grey.shade400)),
                focusedBorder: UnderlineInputBorder(
                    // 输入时边框样式
                    borderSide: BorderSide(color: Colors.grey.shade400))),
          ),
          const SizedBox(height: 8),
          TextField(
            cursorColor: Colors.lightBlueAccent,
            cursorWidth: 1,
            obscureText: !showPassword,
            controller: _passwordController, // 输入框控制器(清空输入内容时使用 _passwordController.clear())
            inputFormatters: [
              // 显示输入格式
              LengthLimitingTextInputFormatter(16), // 最大只能输入16位
            ],
            onChanged: (value) {
              setState(() {
                _passwordText = value;
              });
            },
            decoration: InputDecoration(
                hintText: '请输入密码6~12位',
                prefixIcon: Container(
                    width: 80,
                    alignment: Alignment.bottomLeft,
                    child: const Padding(padding: EdgeInsets.only(bottom: 8), child: Text('密码', style: TextStyle(fontSize: 15)))),
                suffix: _passwordText.isNotEmpty
                    ? InkWell(
                        // 输入框内嵌后置图标(输入时显示)
                        child: Icon(Icons.clear, color: Colors.grey.shade500, size: 18),
                        onTap: () {
                          setState(() {
                            _onPasswordClean();
                          });
                        })
                    : null,
                suffixIcon: IconButton(
                    // 输入框内嵌后置图标(一直显示)
                    iconSize: 20,
                    alignment: Alignment.bottomRight,
                    icon: Icon(showPassword ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    }),
                enabledBorder: UnderlineInputBorder(
                    // 未输入时边框样式
                    borderSide: BorderSide(color: Colors.grey.shade400)),
                focusedBorder: UnderlineInputBorder(
                    // 输入时边框样式
                    borderSide: BorderSide(color: Colors.grey.shade400))),
          ),
          const SizedBox(height: 10),
          TextField(
            cursorColor: Colors.lightBlueAccent,
            cursorWidth: 1,
            obscureText: !showPassword,
            controller: _secondPasswordController, // 输入框控制器(清空输入内容时使用 _passwordController.clear())
            inputFormatters: [
              // 显示输入格式
              LengthLimitingTextInputFormatter(16), // 最大只能输入16位
            ],
            onChanged: (value) {
              setState(() {
                _secondPasswordText = value;
              });
            },
            decoration: InputDecoration(
                hintText: '请输入密码6~12位',
                prefixIcon: Container(
                    width: 80,
                    alignment: Alignment.bottomLeft,
                    child: const Padding(padding: EdgeInsets.only(bottom: 8), child: Text('确认密码', style: TextStyle(fontSize: 15)))),
                suffix: _secondPasswordText.isNotEmpty
                    ? InkWell(
                        // 输入框内嵌后置图标(输入时显示)
                        child: Icon(Icons.clear, color: Colors.grey.shade500, size: 18),
                        onTap: () {
                          setState(() {
                            _onSecondPasswordClean();
                          });
                        })
                    : null,
                suffixIcon: IconButton(
                    // 输入框内嵌后置图标(一直显示)
                    iconSize: 20,
                    alignment: Alignment.bottomRight,
                    icon: Icon(showPassword ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    }),
                enabledBorder: UnderlineInputBorder(
                    // 未输入时边框样式
                    borderSide: BorderSide(color: Colors.grey.shade400)),
                focusedBorder: UnderlineInputBorder(
                    // 输入时边框样式
                    borderSide: BorderSide(color: Colors.grey.shade400))),
          ),
          const SizedBox(height: 10),
          TextField(
            cursorColor: Colors.lightBlueAccent,
            cursorWidth: 1,
            controller: _referrerController, // 输入框控制器(清空输入内容时使用 _accountController.clear())
            inputFormatters: [
              // 显示输入格式
              FilteringTextInputFormatter.allow(RegExp('[0-9a-z]')), // 只允许小写字母和数字需要flutter/services.dart
              LengthLimitingTextInputFormatter(8), // 最大只能输入8位
            ],
            onChanged: (value) {
              setState(() {
                _referrerText = value;
              });
            },
            decoration: InputDecoration(
                hintText: '选填',
                prefixIcon: Container(
                    width: 80,
                    alignment: Alignment.bottomLeft,
                    child: const Padding(padding: EdgeInsets.only(bottom: 8), child: Text('推荐人', style: TextStyle(fontSize: 15)))),
                suffix: _referrerText.isNotEmpty
                    ? InkWell(
                        // 输入框内嵌后置图标(输入时显示)
                        child: Icon(Icons.clear, color: Colors.grey.shade500, size: 18),
                        onTap: () {
                          setState(() {
                            _onReferrerClean();
                          });
                        })
                    : null,
                enabledBorder: UnderlineInputBorder(
                    // 未输入时边框样式
                    borderSide: BorderSide(color: Colors.grey.shade400)),
                focusedBorder: UnderlineInputBorder(
                    // 输入时边框样式
                    borderSide: BorderSide(color: Colors.grey.shade400))),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size.square(50)),
              backgroundColor: MaterialStateProperty.all(const Color(0xFF454545)),
            ),
            child: const Text('登录', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(height: 30),
          OutlinedButton(
              onPressed: () {
                Get.back();
              },
              style: ButtonStyle(minimumSize: MaterialStateProperty.all(const Size.square(50))),
              child: const Text('返回', style: TextStyle(color: Colors.black))),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('已有账号?(', style: TextStyle(color: Colors.black54)),
              GestureDetector(
                  onTap: () {
                    Get.offAllNamed('login');
                  },
                  child: const Text('马上登录', style: TextStyle(decoration: TextDecoration.underline, decorationThickness: 2.0))),
              const Text(')', style: TextStyle(color: Colors.black54))
            ],
          ),
          const SizedBox(height: 30)
        ],
      ),
    );
  }
}
