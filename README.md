# 小车平台使用方法
 
## 8.17工作日志——驱动小车
1. 从autolabor官网上下载autolaborOS（在迅雷下载文件夹中），并将内容烧录到sd卡
2. 连接树莓派热点autolabor，登录192.168.2.1，在设置中让其连接到wifi nics5303中
3. 查找树莓派在nics5303的ip（打开迅雷下载文件夹中的autolaborremotewin170712，该程序会自动查找）
4. 使用命令```ssh root@192.168.31.144```登录小车的树莓派（小红车）
5. 使用命令```cd firmware/autolabor2.5/launch```

   使用命令```./lidar_nav_sh.sh```

6. 打开另一个窗口，连接树莓派，输入命令```rostopic pub cmd_vel geometry_msgs/Twist [args]```
  控制小车行走
  
    例如一个不断原地转圈的命令：
  ```rostopic pub cmd_vel geometry_msgs/Twist -r 0.5 -- '[0.5, 0.0, 0.0]' '[0.0, 0.0, 3.6]'```

## 8.20工作日志——optitrack笔记
1. 插上黑色的网线，插上usb形状的key，打开桌面上的motive（桌面上的Motive_2.0.2_Final_x64是安装包！）

2. 校准：首先edit->application settings，然后layout->calibrate，在右侧的camera calibration
  工具栏选择mask visible屏蔽已经存在的噪点（在这一步时，可以将界面正中的的
  perspective view上面的toolbar的第一个选项点一下改为multi camera 2d view，切换成
  camera preview这时可以看到每个摄像机，上面都有一些白色噪点（现在没铺地面，所以有
  很多的反光，界面左侧有一个devices工具栏，该工具栏上有一个按钮可以使相机画面在只
  有光点的画面和能成像的画面之间切换），点完mask visible就会发现噪点变红，表示噪点
  被屏蔽了），我们也可以点旁边的clear mask重置这一过程。接下来点击start wanding
 （这一栏下面的optiwand对应我们的丁字杆，如果丁字杆的三个反光点都在b则选择cw-250，
  若是都在a则选择cw-500，我们这个场地用cw-250），然后手持丁字杆在场地中晃悠，直到
  calibration中所有摄像机的采样点都超过3000，然后点击calculate，如果计算结果中的wand
  error小于0.2结果就合格（实际上我们的场地很垃圾，现在用的精度只有0.5）。此时我们应
  该会进入camera calibration工具栏的第二栏ground plane，我们将直角杆放入场地中，然后
  点击set ground plane即可保存校准结果。该文件为cal文件。

3. 开始记录：首先打开刚刚创建的cal文件，将小车放入场地中，将小车上的几个点框起来，右
  键选择 Rigid Body->Create Rigid Body，然后按空格开始记录小车的移动（今天没有开始
  使用同步器，使用同步器之后再更新这里），记录完后仍按空格停止记录。

4. 保存：file->save current take将刚刚记录的结果保存，文件为tak文件。

5. 数据导出：打开刚刚的tak文件，file->export tracking data，结果会存为一个csv文件，
  我们就能用excel查看结果了（关于excel中数据的排列方式需要日后进一步补充）

## 8.30工作日志——GPIO管脚
1.zynq术语详解:

  * PS: 处理系统 （Processing System) ,  就是与FPGA无关的ARM的SOC（系统级芯片）的部分

  * PL: 可编程逻辑 (Progarmmable Logic), 就是FPGA部分

  * APU: 应用处理器单元（Application Processor Unit).  位于PS里面的中心位置。

  * AXI：AXI(Advanced extensible Interfacse)总线是连通PS(programmable system)和

       * PL(programmable logic)的一个总线协议,最终的形式就相当于PL块作为一个

       * ip core 挂载在AXI总线上,然后由PS调用

## 9.4工作日志——设置同步器
1. 同步器通过网线与交换机连接，如果灯亮则表示有电。tx1接入同步器的input1。

2. 选择tools->sync打开同步面板，将最上面的default-free run改为custom sync

3. sync input选择internal clock，input trigger选择falling edge，input divider选择25，input multiplier选择6

4. record triggering中trigger source选择input 1，trigger edge选择falling edge

5. 目前tx1的输出为高电平——短暂的低电平（slam开始启动）——短暂的低电平（slam开始记录数据）
——短暂的低电平（slam结束记录）
 
6. 我们需要在第一个低电平和第二个低电平之间按下空格，此时录制界面边界会变黄，第二个低电平
使边界变红表示开始录制，第三个低电平使边界颜色消失表示结束录制。

7. file->open相应的tak(tak的名称包含录制时的时间)，然后file->export tracking data


## 9.5工作日志——realsense和optitrack的校准
1. 将optitrack导出的excel中的第1-9列数据保存（不要前几行）,发送到服务器用户mwz18的桌面，名称必须为tmp.txt

2. 在当前目录下建立新的文件夹test3，将realsense得到的数据发送到test3中，名称必须为first.txt

2. ```sh test.sh test3```

4. 若想重新测量误差sh retest.sh test3

5. 若以realsense为ground truth则使用evalute_ate.py的第102行屏蔽第101行,
  若以optitrac为ground truth则使用第101行屏蔽第102行