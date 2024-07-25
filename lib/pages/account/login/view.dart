import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../mock/login_mock.dart';
import 'package:get/get.dart';

import '/common/logic.dart';
import '/hooks/generate.dart';
import '/model/login_model.dart';
import '/request/provider/open.dart';
import '/popup/loading.dart';
import '/storage/index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final commonLogic = Get.put(CommonLogic());
  late FocusNode _focus;
  late TextEditingController _accountController; // 账号输入框控制器(可以使用_accountController.text获取输入内容)
  late TextEditingController _passwordController; // 账号输入框控制器(可以使用_accountController.text获取输入内容)
  String _accountText = ''; // 定义输入框输入内容
  String _passwordText = ''; // 定义输入框输入内容
  bool showPassword = false; // 是否显示密码
  OpenProvider openProvider = Get.put(OpenProvider()); // 网络接口实例
  late Storage storage; // 持久化

  /// 定义清空账号输入框方法
  void _onAccountClean() {
    _accountController.clear(); // 输入框控制器清空输入内容
    setState(() {
      _accountText = '';
    });
  }

  /// 定义清空密码输入框方法
  void _onPasswordClean() {
    _passwordController.clear(); // 输入框控制器清空输入内容
    setState(() {
      _passwordText = '';
    });
  }

  /// 登录
  void _login() async {
    loading();
    final Map<String, dynamic> data = {'email': genAccount(_accountController.text), 'gotrue_meta_security': {}, 'password': _passwordController.text};
    Response response = await openProvider.login(data);
    late LoginModel loginModel;
    try {
      loginModel = LoginModel.fromJson(response.body);
    } catch (error) {
      loginModel = LoginModel.fromJson(loginMock);
    } finally {
      Storage.setString(StorageKeys.token, loginModel.accessToken!);
      commonLogic.setUserInfo(loginModel.user!);
      Get.offAllNamed('');
    }
  }

  @override
  void initState() {
    _focus = FocusNode(); // 定义输入框焦点实例(获取焦点: FocusScope.of(context).requestFocus(_focus);失去焦点: _focus.unfocus())
    _accountController = TextEditingController(text: _accountText); // 初始化账号输入框控制器
    _passwordController = TextEditingController(text: _passwordText); // 初始化账号输入框控制器

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(_focus);

    /// 构建时输入框获取焦点
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.fromLTRB(28, 50, 28, 0),
        children: [
          const Padding(padding: EdgeInsets.only(top: 50, bottom: 20), child: Text('登录', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
          TextField(
            focusNode: _focus,
            cursorColor: Colors.lightBlueAccent,
            cursorWidth: 1,
            controller: _accountController, // 输入框控制器(清空输入内容时使用 _accountController.clear())
            inputFormatters: [
              // 显示输入格式
              FilteringTextInputFormatter.allow(RegExp('[0-9a-z]')), // 只允许小写字母和数字需要flutter/services.dart
              LengthLimitingTextInputFormatter(8), // 最大只能输入8位
            ],
            decoration: InputDecoration(
                hintText: '请输入账号',
                prefixIcon: Container(
                    width: 60,
                    alignment: Alignment.bottomLeft,
                    child: const Padding(padding: EdgeInsets.only(bottom: 2), child: Text('账号', style: TextStyle(fontSize: 15)))),
                suffix: IconButton(
                    // 输入框内嵌后置图标(输入时显示)
                    iconSize: 18,
                    icon: Icon(Icons.clear, color: Colors.grey.shade500),
                    alignment: Alignment.bottomRight,
                    onPressed: () {
                      setState(() {
                        _onAccountClean();
                      });
                    }),
                enabledBorder: UnderlineInputBorder(
                    // 未输入时边框样式
                    borderSide: BorderSide(color: Colors.grey.shade400)),
                focusedBorder: UnderlineInputBorder(
                    // 输入时边框样式
                    borderSide: BorderSide(color: Colors.grey.shade400))),
          ),
          const SizedBox(height: 8),
          TextField(
            cursorColor: Colors.lightBlueAccent, // 光标颜色
            cursorWidth: 1, // 光标宽度
            obscureText: !showPassword, // 是否隐藏输入内容
            controller: _passwordController, // 输入框控制器(清空输入内容时使用 _passwordController.clear())
            inputFormatters: [
              // 显示输入格式
              LengthLimitingTextInputFormatter(16), // 最大只能输入16位
            ],
            decoration: InputDecoration(
                hintText: '请输入密码',
                prefixIcon: Container(
                    width: 60,
                    alignment: Alignment.bottomLeft,
                    child: const Padding(padding: EdgeInsets.only(bottom: 2), child: Text('密码', style: TextStyle(fontSize: 15)))),
                suffix: IconButton(
                    // 输入框内嵌后置图标(输入时显示)
                    iconSize: 18,
                    icon: Icon(Icons.clear, color: Colors.grey.shade500),
                    alignment: Alignment.bottomRight,
                    onPressed: () {
                      setState(() {
                        _onPasswordClean();
                      });
                    }),
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
          GestureDetector(
              onTap: () {
                Get.toNamed('retrieve');
              },
              child: const Text(
                "忘记密码?",
                style: TextStyle(decoration: TextDecoration.underline, decorationColor: Colors.blueGrey, decorationThickness: 2.0, color: Colors.blueGrey),
              )),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: _login,
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
              const Text('您还没有账号? 请点击《', style: TextStyle(color: Colors.black54)),
              GestureDetector(
                  onTap: () {
                    Get.toNamed('register');
                  },
                  child: const Text('注册账号', style: TextStyle(color: Colors.blue))),
              const Text('》', style: TextStyle(color: Colors.black54))
            ],
          ),
          const SizedBox(height: 30)
        ],
      ),
    );
  }
}
