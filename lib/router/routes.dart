import 'package:get/get_navigation/src/routes/get_route.dart';
import '/pages/security/verifyForPayPassword/view.dart';
import '/pages/financial/addWithdrawMethod/view.dart';
import '/pages/financial/bindIdentity/view.dart';
import '/pages/financial/addBankCard/view.dart';
import '/pages/account/register/view.dart';
import '/pages/account/retrieve/view.dart';
import '/pages/account/login/view.dart';
import '/pages/security/main/view.dart';
import '/pages/tabBar/view.dart';

class Routers {
  static List<GetPage> getPages = [
    GetPage(
        // 主页(tabBar)
        name: "/", // 路由名称
        page: () => const TabBarPage() // 映射的页面
        ),
    GetPage(
        // 登录页
        name: "/login", // 路由名称
        page: () => const LoginPage() // 映射的页面
        ),
    GetPage(
        // 注册页
        name: "/register", // 路由名称
        page: () => const RegisterPage() // 映射的页面
        ),
    GetPage(
        // 找回密码
        name: "/retrieve", // 路由名称
        page: () => const RetrievePage() // 映射的页面
        ),
    GetPage(
        // 找回密码
        name: "/security", // 路由名称
        page: () => SecurityPage() // 映射的页面
        ),
    GetPage(
        // 绑定身份
        name: "/bindIdentity", // 路由名称
        page: () => BindIdentityPage() // 映射的页面
        ),
    GetPage(
        // 获取手机验证码(设置支付密码)
        name: "/verifyForPayPassword", // 路由名称
        page: () => VerifyForPayPasswordPage() // 映射的页面
        ),
    GetPage(
        // 添加提款方式
        name: "/addWithdrawMethod", // 路由名称
        page: () => AddWithdrawMethodPage() // 映射的页面
        ),
    GetPage(
        // 添加银行卡
        name: "/addBankCard", // 路由名称
        page: () => AddBankCardPage() // 映射的页面
        ),
  ];
}
