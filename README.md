# С��ƽ̨ʹ�÷���
 
## 8.17������־��������С��
1. ��autolabor����������autolaborOS����Ѹ�������ļ����У�������������¼��sd��
2. ������ݮ���ȵ�autolabor����¼192.168.2.1�����������������ӵ�wifi nics5303��
3. ������ݮ����nics5303��ip����Ѹ�������ļ����е�autolaborremotewin170712���ó�����Զ����ң�
4. ʹ������```ssh root@192.168.31.144```��¼С������ݮ�ɣ�С�쳵��
5. ʹ������```cd firmware/autolabor2.5/launch```

   ʹ������```./lidar_nav_sh.sh```

6. ����һ�����ڣ�������ݮ�ɣ���������```rostopic pub cmd_vel geometry_msgs/Twist [args]```
  ����С������
  
    ����һ������ԭ��תȦ�����
  ```rostopic pub cmd_vel geometry_msgs/Twist -r 0.5 -- '[0.5, 0.0, 0.0]' '[0.0, 0.0, 3.6]'```

## 8.20������־����optitrack�ʼ�
1. ���Ϻ�ɫ�����ߣ�����usb��״��key���������ϵ�motive�������ϵ�Motive_2.0.2_Final_x64�ǰ�װ������

2. У׼������edit->application settings��Ȼ��layout->calibrate�����Ҳ��camera calibration
  ������ѡ��mask visible�����Ѿ����ڵ���㣨����һ��ʱ�����Խ��������еĵ�
  perspective view�����toolbar�ĵ�һ��ѡ���һ�¸�Ϊmulti camera 2d view���л���
  camera preview��ʱ���Կ���ÿ������������涼��һЩ��ɫ��㣨����û�̵��棬������
  �ܶ�ķ��⣬���������һ��devices���������ù���������һ����ť����ʹ���������ֻ
  �й��Ļ�����ܳ���Ļ���֮���л���������mask visible�ͻᷢ������죬��ʾ���
  �������ˣ�������Ҳ���Ե��Աߵ�clear mask������һ���̡����������start wanding
 ����һ�������optiwand��Ӧ���ǵĶ��ָˣ�������ָ˵���������㶼��b��ѡ��cw-250��
  ���Ƕ���a��ѡ��cw-500���������������cw-250����Ȼ���ֳֶ��ָ��ڳ����л��ƣ�ֱ��
  calibration������������Ĳ����㶼����3000��Ȼ����calculate������������е�wand
  errorС��0.2����ͺϸ�ʵ�������ǵĳ��غ������������õľ���ֻ��0.5������ʱ����Ӧ
  �û����camera calibration�������ĵڶ���ground plane�����ǽ�ֱ�Ǹ˷��볡���У�Ȼ��
  ���set ground plane���ɱ���У׼��������ļ�Ϊcal�ļ���

3. ��ʼ��¼�����ȴ򿪸ոմ�����cal�ļ�����С�����볡���У���С���ϵļ��������������
  ��ѡ�� Rigid Body->Create Rigid Body��Ȼ�󰴿ո�ʼ��¼С�����ƶ�������û�п�ʼ
  ʹ��ͬ������ʹ��ͬ����֮���ٸ����������¼����԰��ո�ֹͣ��¼��

4. ���棺file->save current take���ոռ�¼�Ľ�����棬�ļ�Ϊtak�ļ���

5. ���ݵ������򿪸ոյ�tak�ļ���file->export tracking data��������Ϊһ��csv�ļ���
  ���Ǿ�����excel�鿴����ˣ�����excel�����ݵ����з�ʽ��Ҫ�պ��һ�����䣩

## 8.30������־����GPIO�ܽ�
1.zynq�������:

  * PS: ����ϵͳ ��Processing System) ,  ������FPGA�޹ص�ARM��SOC��ϵͳ��оƬ���Ĳ���

  * PL: �ɱ���߼� (Progarmmable Logic), ����FPGA����

  * APU: Ӧ�ô�������Ԫ��Application Processor Unit).  λ��PS���������λ�á�

  * AXI��AXI(Advanced extensible Interfacse)��������ͨPS(programmable system)��

       * PL(programmable logic)��һ������Э��,���յ���ʽ���൱��PL����Ϊһ��

       * ip core ������AXI������,Ȼ����PS����

## 9.4������־��������ͬ����
1. ͬ����ͨ�������뽻�������ӣ�����������ʾ�е硣tx1����ͬ������input1��

2. ѡ��tools->sync��ͬ����壬���������default-free run��Ϊcustom sync

3. sync inputѡ��internal clock��input triggerѡ��falling edge��input dividerѡ��25��input multiplierѡ��6

4. record triggering��trigger sourceѡ��input 1��trigger edgeѡ��falling edge

5. Ŀǰtx1�����Ϊ�ߵ�ƽ�������ݵĵ͵�ƽ��slam��ʼ�������������ݵĵ͵�ƽ��slam��ʼ��¼���ݣ�
�������ݵĵ͵�ƽ��slam������¼��
 
6. ������Ҫ�ڵ�һ���͵�ƽ�͵ڶ����͵�ƽ֮�䰴�¿ո񣬴�ʱ¼�ƽ���߽���ƣ��ڶ����͵�ƽ
ʹ�߽����ʾ��ʼ¼�ƣ��������͵�ƽʹ�߽���ɫ��ʧ��ʾ����¼�ơ�

7. file->open��Ӧ��tak(tak�����ư���¼��ʱ��ʱ��)��Ȼ��file->export tracking data


## 9.5������־����realsense��optitrack��У׼
1. ��optitrack������excel�еĵ�1-9�����ݱ��棨��Ҫǰ���У�,���͵��������û�mwz18�����棬���Ʊ���Ϊtmp.txt

2. �ڵ�ǰĿ¼�½����µ��ļ���test3����realsense�õ������ݷ��͵�test3�У����Ʊ���Ϊfirst.txt

2. ```sh test.sh test3```

4. �������²������sh retest.sh test3

5. ����realsenseΪground truth��ʹ��evalute_ate.py�ĵ�102�����ε�101��,
  ����optitracΪground truth��ʹ�õ�101�����ε�102��