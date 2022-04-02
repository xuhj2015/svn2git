
```git-svn教程.md```是单个项目从svn同步到git的教程。

```batch2git```是在通过shell将svn项目批量导入到git。

## 注意事项

```
1、Author: xxx not defined in /root/svn2git/userinfo.txt file
需要把xxx加入到userinfo.txt文件中

2、projects.txt放svn和git的目录，将svn下面的项目导入到git目录下。

3、svn路径可以包含中文，但是项目名不可以包含中文

4、会存在个别项目无法导入的情况，因为是少数，所以可以手动从svn下载，在上传到git。


```
projects.txt文件示例：
```
[git]
http://172.16.1.190/parse/JXZX
[svn]
svn://xxx1
svn://xxx2
[git]
xxx
[svn]
xxx1
xxx2
xxx3
```
