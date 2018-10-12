如何运行这个示例工程：

    1、在mysql数据库中，执行 maven.sql文件
    2、在码云上，将这个工程下载到本地或idea开发工具中
        码云下载地址：https://gitee.com/itcast_bos/ssm_demo_v2.0.git（开源的，无密码）
    3、运行前，先配置ssm_dao中的db.properties文件中的，数据库的连接参数
    4、检查窗口 Maven Projects中是否自动识别4个工程：
           ssm_dao  ssm_service  ssm_web 和 ssm_maven_demo(root)
    5、直接在ssm_maven_demo(root)中，执行 install
    6、可以运行ssm_web的war工程
    7、测试
        测试web工程中，界面是否可以获取数据库中的数据
            测试的地址：http://localhost:8099/ssm_web/items/findDetail
        测试控制层是否能支持json格式数据的交互：
            测试地址： http://localhost:8099/ssm_web/items/findDetail_json



