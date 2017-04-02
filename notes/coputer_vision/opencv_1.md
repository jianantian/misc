# opencv-python 笔记 - 1

## opencv 的安装

> 环境: Windows 10 64位, Visual Studio Community 2017, Anaconda3 4.3.1, Python 3.6.0.

1. 目前 opencv (3.2.0) 只支持 Python 2.7 的版本, 所以我们先用 conda 创建一个 Python 2.7 虚拟环境.
    ``` python
    # 准备工作
    # 创建名为 opencv 的 Python 2.7 虚拟环境
    conda create -n opencv python=2.7
    # 激活该虚拟环境, 注意 powershell 下激活命令可能无效, 在 cmd 中输入命令
    activate opencv
    # 安装必要的包
    conda install numpy numba scipy matplotlib jupyter
    ```

1. 下载相应的 [opencv][id_win] 版本, 并安装 (事实上只是解压)[^1]. 找到 opencv 文件夹, 复制文件

    `../opencv/build/python/2.7/64/cv2.pyd`

    到文件夹

    `../Anaconda3/envs/opencv/Lib/site-packages`

    中[^2].

    [id_win]: https://sourceforge.net/projects/opencvlibrary/files/
    [^1]: 这里是 Windows 系统的安装, 其他系统参见[官方说明][id_other].

    [id_other]: http://docs.opencv.org/3.2.0/da/df6/tutorial_py_table_of_contents_setup.html

    [^2]: 具体路径可能有差别
1. 测试是否安装成功.
    ``` python
    # 测试
    # 激活并进入 opencv 虚拟环境
    activate opencv
    python
    # 测试是否可以导入, 如果没有报错说明已经成功安装 opencv
    import numpy as np
    import cv2
    ```

## opencv 基本图片操作

这里主要介绍 3 个函数 `cv2.imread(), cv2.imshow() 及 cv2.imwrite()`.

1. `cv2.imread(filename, FLAG)`
    该函数读取图片文件, 返回 `numpy.array` 对象. `filename` 对应文件地址, `FLAG` 为读取方式[^3].
    `FLAG` 共有 3 种:
    * `cv2.IMREAD_COLOR` (默认值): 读取彩色图片, 透明度信息将被忽略
    * `cv2.IMREAD_GRAYSCALE`: 灰度模式
    * `cv2.IMREAD_UNCHANGED`: 按原始格式读取图片, 可以包含透明度信息

    文件格式方面, 支持常见的 jpg, png, bmp 等, 完整的说明参看官方文档.

    [^3]: 这 3 种 `FLAG` 也可以分别写作 `1, 0, -1`.
1. `cv2.imshow()`

    创建一个窗口 ( 其大小由图片尺寸决定[^4] ) 来显示图片. 为了正常显示图片, 一般还需要使用 `cv2.waitKey()` 函数和 `cv2.destroyAllWindows()` 来控制窗口的销毁[^5]. 具体说明如下:

    ``` python
    # cv2.imshow(window_name, image_matrix)
    # cv2.imshow() 函数接受两个参数, 窗口名称和图像矩阵
    cv2.imshow("dog", img)

    # cv2.waitKey(delay=0)
    # cv2.waitKey() 函数接受一个整型参数,
    # 表示等待用户按键的时间 ( 毫秒数 ) ,
    # 默认值为 0, 表示无限长的时间
    # 当用户有按键操作 ( 返回按键对应的编码 ) 或是延迟时间结束 (返回 -1),
    # 该语句执行完成, 进入下一语句
    cv2.waitKey(0)

    # cv2.destroyAllWindows()
    # 该函数销毁所有已创建的窗口, 若要销毁指定窗口, 使用
    # cv2.destroyWindow(window_name)
    cv2.destroyAllWindows()
    ```

    [^4]: 若要指定窗口尺寸, 需要在显示图片之前用 `cv2.namedWindow(window_name, FLAG)` 函数自行创建窗口, 详细说明参看官方文档.

    [^5]: 在 Windows 环境下, 可以在图片显示窗口下按 CTRL+C 复制图片或 CTRL+S 保存图片.

1. `cv2.imwrite()`

    ``` python
    # cv2.imwrite(file_name, image_matrix)
    # 接受两个参数, 即需要写入的文件名和图像数据
    # 图片格式由输入的扩展名决定, 更详细的说明参看官方文档, 特别是关于保
    # 存 alpha 通道信息的说明.
    cv2.imwrite('dog.png', img)
    ```

## 下面是一个较完整的例子

``` python
import numpy as np
import cv2

img = cv2.imread('dog.jpg', 0)  # 以灰度模式读取图片
cv2.imshow('dog', img)
key = cv2.waitKey(0) & 0xff # 这是 64 位系统的情形, 取 cv2.waitKey()
                            # 函数返回值的最末一个字节
if key == 27:   # 按下 ESC 键退出
    cv2.destroyAllWindows()
elif key == ord('s'):   # 按下 s 键保存
    cv2.imwrite('new_dog.png', img)
    cv2.destroyAllWindows()
```
