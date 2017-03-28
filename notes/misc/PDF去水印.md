# PDF 去水印


很多 PDF (很可能是盗版, 不鼓励) 会有水印, 看起来很不舒服, 这时候就需要去除水印了. 事实上很多工具可以做到这一点, 只是大部分是付费软件. 以下我们提供一种方法, 只需要利用免费工具很快就可以为 PDF 文件去除水印 (只适合部分类型的水印).

1. 首先需要安装 [pdftk][id], 免费版或者服务器版均可[^1], 安装完成后在安装目录打开 powershell 或者 cmd. (如果需要经常使用可以把 pdftk 加入环境变量.)

[id]: https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/ 
[^1]: 这里是 windows 系统的说明, 其它系统类似.                    

2. 需要利用 pdftk 解压 PDF 文件
    * 需要去水印的 PDF 文件路径: input.pdf
    * 解压后的 PDF 文件路径: uncompressed.pdf

    运行 <code>pdftk input.pdf output uncompressed.pdf uncompress</code>[^2].

3. 用文本编辑器打开解压后的 PDF 文件 ( 推荐 notepad++ ), 用空白字符串替换掉水印文字, 保存.
    * linux 还可以使用 <code>sed</code> 命令, 即
    <pre><code>sed -e "s/watermarktextstring/ /" uncompressed.pdf > unwatered.pdf</code></pre>

4. 用 pdftk 重新压缩替换后的 PDF 文件.
    
    运行 <code>pdftk uncompressed.pdf output unwatered.pdf compress</code>[^3], 得到去除水印的文件 unwatered.pdf.

少量的文件可以直接使用该方法, 如果大量的 PDF 文件可以写成脚本批量处理. 当然, Python 的 <code>PyPDF2</code> 库也可以实现该功能.
[^2]: powershell 可能提示错误, 命令需要改成<code>./pdftk</code>.
[^3]: 注意中间文件 uncompressed.pdf 的路径.
