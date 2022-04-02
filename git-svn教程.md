1.安装git-svn
```
yum install -y git-svn
```

2.创建并进入到一个工作目录（文件夹）
```
mkdir ~/svn2git/workspace
cd ~/svn2git/workspace
```

3.创建并添加用户信息
```
vim userinfo.txt
```
格式为：```svn用户=git用户<邮箱地址>```。例如：```xuhj=xuhj<xuhj@botech.com.cn>```。

git-svn会同步代码及代码提交日志，需要将所有提交代码的svn用户加入到userinfo.txt。


4.导出svn项目
```
git svn clone -r${svn版本号}:HEAD  ${svn项目地址} --authors-file=userinfo.txt
```
如果出现```Author: xxx not defined in userinfo.txt file```，那就在userinfo.txt里面添加一个xxx用户。然后删除已经导出的svn项目，重新执行导出命令。

5.将svn项目上传到git中
```
cd ${svn项目目录}
git remote add origin ${git项目地址}
git push origin master --tags
```
然后根据提示输入git用户名和密码。
