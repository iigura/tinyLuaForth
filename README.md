# tinyLuaForth ver. 1.2
Eduardo Ochs の [miniforth](http://angg.twu.net/miniforth/miniforth5.lua.html) - 
["Boostrapping a Forth in 40 lines of Lua code"](http://angg.twu.net/miniforth-article.html) に触発されて、
Lua にて書かれた小型 Forth インタプリタ。
言語処理系の核をコンパクトに記述することを目指している。

各ファイルの構成と行数は以下の通り
（注：[miniforth](http://angg.twu.net/miniforth/miniforth5.lua.html) 同様、
行数が少なくなるように工夫してある）：

* 内部インタプリタ（innerInterpreter.lua）  6 行
* 外部インタプリタ（outerInterpreter.lua） 32 行

なお、実際にインタプリタとして試せるよう、以下のファイルも用意した。
* テスト用辞書　　（tinyDict.lua）    28 行
* REPL　　　　　 （tinyLuaForth.lua） 9 行

# 解説文書
* [6 行の Lua プログラムで、Forth の内部インタプリタを作る](https://qiita.com/iigura/items/855954ad000fe1da6c59)
* [38 行の Lua プログラムで Forth インタプリタを作る（内部インタプリタ 6 行、外部インタプリタ 32 行）](https://qiita.com/iigura/items/a9b0fff73f7f9639ca3c)

# 使い方
## 起動
Lua インタプリタ上で、

    dofile("tinyLuaForth.lua")
    tinyLuaForth("tinyDict.lua")
    
として起動。

## 終了
空行を入力すると終了。


# 履歴
* ver.1.2 不明なトークンを表示するように変更 2018.09.16
* ver.1.1 トークンの評価順序を変更（Forth に合わせた） 2018.09.12 
* ver.1.0 最初の公開（Qiita にて） 2017.09.20 
