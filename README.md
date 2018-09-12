# tinyLuaForth ver. 1.1
Eduardo Ochs の ["Boostrapping a Forth in 40 lines of Lua code"](http://angg.twu.net/miniforth-article.html) に触発されて、
Lua にて書かれた小型 Forth インタプリタ。各ファイルの構成と行数は以下の通り（注：行数が少なくなるように工夫してある）：

* 内部インタプリタ（innerInterpreter.lua）  6 行
* 外部インタプリタ（outerInterpreter.lua） 32 行

なお、実際にインタプリタとして試せるよう、以下のファイルも用意した。
* テスト用辞書　　（tinyDict.lua）    28 行
* REPL　　　　　 （tinyLuaForth.lua） 8 行

# 使い方
Lua インタプリタ上で、

    dofile("tinyLuaForth.lua")
    tinyLuaForth("tinyDict.lua")
    
として起動。空行を入力すると終了。


# 履歴
* ver.1.1 トークンの評価順序を変更（Forth に合わせた） 2018.09.12 
* ver.1.0 最初の公開（Qiita にて） 2017.09.20 
