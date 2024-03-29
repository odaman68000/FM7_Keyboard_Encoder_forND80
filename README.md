FM-77 Keyboard Encoder for ND80
-----
ひょんな事から入手してしまった FM-77。  
入手した時は、本体もモニタもキーボードもあった。入手した直ぐは、いつかは6809プログラミングって気分。しかし時は既にWindows95の時代。今更8bitなんて、と長い長いお蔵入り状態に。  
あれから数十年が経ち。近年、久々に発掘してみるとまだ電源が入る事が判り、ちょっと使ってみようかなと思うも、いつの間にかキーボードだけは紛失していた。まぁきっと、置きっ放しだったので誰かが捨てたんだな。パソコンもキーボードが無ければただの箱。面倒だからそのまま本体も捨ててしまおうかと思ったものの、ちょうど 8bitブームが自分の中で来ていた為、あの時の「いつかは6809」を具現化すべく、得意の Z80 で 6809 マシンを復活させてみた。  
こうなってしまうと「究極の8bit CPU」も形なしｗ Z80に助けてもらってる気分はどうですか？と少し感じるけどｗ、今の時代になれば Z80 も 6809 も、どっちも単なるシンプルな 8bit CPU です。直交性がどうたら、電卓上がりがどうたら等、ナンセンスな事は言いっこ無しで共存共栄でいきましょう。

という事で
-----
このソフトウェアは、中日電工さんが出してる ND80Z3.5 という Z80 ワンボードマイコンのキットで動くものです。  
中日電工 - [http://userweb.alles.or.jp/chunichidenko/index.htm](http://userweb.alles.or.jp/chunichidenko/index.htm)

このワンボードマイコン、独立化キットというものを追加すると、PC-8001や MZ-80 時代を彷彿とさせる 80 文字コンソール環境と、PS/2キーボードが接続可能になる上に、外部ストレージとして SD カードが載ります。これを使わない手はない！

この ND80Z3.5 は、 8255 PPI も搭載しています。そうなんです、FM-77 背面のキーボード端子と、この 8255 PPI を接続して、FM-77 を騙してあたかもキーボードが付いているかのように振る舞えば、FM-77を使えるようになるなぁ、というのが最初の着想です。

で、どんな仕組みなの？
-----
FM-77 のキーボード端子は、4bitの出力と 8bitの入力から成り立っています。  
4bitの出力からは、0,1,2,3,4,...てな要領でビットパターンが送り出されてくるので、それを検知して適切に 8bit の入力ポートに信号を送り出してやればいいだけです。ND80Z3.5に接続されている PS/2 キーボードのキーを判定して、4bitポートから信号が来た瞬間に、8bit情報を返してやれば良いのです。  

FM-77のキーボードマトリクスデータを調べるのは少し骨の折れる作業だったけど、それさえ判ればあとは作り込むだけ。  
今では我が家の FM-77 には欠かす事のできないシステムになりました。  

思い返せば、FM-77 のオリジナルのキーボードなんて使えたものじゃなかったような。  
なぜか黄色くてゴツいカールコード。77本体からキーボードを離そうにも、カールコード自体に引っ張られてキーボードが引きづられていく。なんだこれｗ　カールしてる意味が全くない。しかも、ケーブル長も微妙に短くて案外使えない。  

現代の、好きな PS/2 キーボードを使えるというのが何より大きい。しかも他にもいくつかの機能追加を行っている。  
これは、オリジナルのキーボードを間違いなく超えており、今更オリジナルのキーボードなんて必要ないばかりか、タダでも要らないのであったｗｗｗ

他の機能追加は？
-----
ついでなので、色んなモードを追加してみたｗ

#### オートキータイプ機能
SDカード上に保存されている BASIC のプログラムとかを自動的にキーボードタイプして、FM-77側に入力できるシステムを構築。  
READ, DATA でマシン語データを POKE して EXEC するような BASIC プログラムも簡単に送り出せます。

#### データ送信機能
FM-77 のプリンタポートも使って、ND80Z3.5とFM-77の間で 1,200bpsの速度でデータを送受信する機能を追加してみた。  
今では別の仕組みを使っているのでもう不要だけど、当時は自作プログラムを FM-77 に転送するのに重宝しました。

#### ゲームモード
FM-7のゲーム、2,8,4,6キーで上下左右はまだいいんだけど、動き出したら止まらないってどういう事よ？というド定番の問題点があります。  
そこで、カーソルキーで2,8,4,6の送り出しと、キーを離してる時は常時 5 を送り出すモードを追加してみた。  
このモードが無いと私はフラッピーもゼビウスも、とてもじゃないがプレイできない。まぁ本当のところ、今更FM-7のゲームなんて大してやる気は無いが...

#### キーマップ変更
キーマップを複数持ち、選択可能にしてみた。  
まぁソフトによって気に食わないキーアサインがあるけども、これを改善可能。

最後に
-----
一応、 githubにアップロードはしたが。  
自分以外にこれを誰が使うのか。  
今時 FM-77 というのもニッチだが、さらに同時に ND80Z3.5 というのがニッチ度を爆上げさせているのが我ながら凄いと思う。普通、ここまでするくらいならエミュレータ使った方が早くね？と思うだろうけど、世の中常に「実行あるのみ」。  
理屈が判るからと、避けて通るところに知識の積み重ねは無い。経験無いところに実績も無い。経験なく知識だけを語ってても虚しいだけ。やっぱり JUST DO IT だよねｗ


Copyright (C) 2018-2019 by odaman68000. All rights reserved.

