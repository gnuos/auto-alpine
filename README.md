# AutoAlpine

Auto-Alpine 是一个用于自动化打包创建本地alpine容器镜像的项目，是用go-task这个工具跑的自动化批处理过程。


## 用法

查看任务列表

```bash
go-task -l
```


执行默认任务
```bash
go-task
```


## 修改变量

有三个变量可以在运行时根据需求调整

* `ALPINE_VER` 是用来定义Alpine大版本的参数变量

* `ALPINE_REL` 是用来定义Alpine完整版本的参数变量

* `ALPINE_ARCH` 是用来定义Alpine运行的目标处理器架构的，在目标处理器上面运行的时候会用得到

三个变量都可以在 `go-task` 命令行传递参数进行修改


## 查看结果

生成的文件在 dist 目录中，文件名是 `rootfs.tar.gz`


## WSL移植

这个制作出来的rootfs文件，可以直接导入到WSL2中，符合WSL2的镜像格式要求

