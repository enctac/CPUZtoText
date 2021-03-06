# CPUZtoText

CPU-Zのテキストログからシステム情報を抽出し、  
いくつかの簡易フォーマットに整形してテキスト出力するバッチファイル群です。  
出力サンプルは「[出力サンプルまとめと簡単な説明.txt](出力サンプルまとめと簡単な説明.txt)」を参照して下さい。

現在のバージョン：**【CPUZtoText_20170731】**  
対応しているCPU-Zのバージョン： **[CPU-Z 1.80.0](http://www.cpuid.com/softwares/cpu-z.html)**

**★重要**  
　変なことはしていないはずですが、このバッチによって  
　何らかの損害が発生したとしても、作者は一切責任を負いません。  
　自己責任でご利用ください。

**★検証協力のお願い**  
　動作確認のために色々な環境でのログがあると助かります。バッチ実行後にできる  
　　　.\bin\cpu-z-log.txt  
　というCPU-Zのテキストログファイルをどこかにアップロードしていただくか、  
　[Pastebin.com](https://pastebin.com/) などに貼り付けて教えていただけると大変助かります。  
　詳細なシステム情報を知られたくない場合は、問題が起きている項目に  
　関連する部分だけでも抜粋してご提供いただければ幸いです。  


#### ■これは何ですか？

　●CPU-Zのログからシステム情報を抽出し、色々なフォーマットに整形して  
　　テキスト出力するバッチファイル群です。

　●自作PC系やエンコード系の掲示板などでシステム情報の提示を  
　　求められる機会がありますが、これを使えばシステム情報を  
　　それなりにまとまった形のテキストで簡単に出すことができます。

　●余計な実行ファイルを使わず、標準コマンド(主にfindstr)や  
　　一時ファイル出力を使って力技でログ解析しています。  
　　単純なことしかしていないのでカスタマイズも容易です。


#### ★注意事項

　●CPU-Zのログ形式の都合上、GPUが複数ある場合、各GPUと  
　　　・ドライバーバージョン  
　　　・ドライバーの日付  
　　との紐づけが不確実になることがあります。  
　　なるべく確実になるよう工夫はしていますが、特にこれらの情報の右側に  
　　疑問符("?")がついている場合は、紐づけが正しいかどうか確認し、  
　　間違っている場合は修正して下さい。

　●CPU-Zのログから主要情報を取得しているだけですので、  
　　オーバークロックの設定など、詳細な情報まではとれません。  
　　それらについては補足説明をつけた方が良いでしょう。

　●今のところ、以下の環境とバイナリで動作を確認しています。  
　　・環境 → 「[出力サンプルまとめと簡単な説明.txt](出力サンプルまとめと簡単な説明.txt)」を参照  
　　・CPU-Z →　1.80.0

　●CPU-Zはログの内容をちょくちょく変えているようなので、  
　　CPU-Zが更新されると使えなくなる可能性があります。  
　　なるべく対応はしていきたいと思っていますが、  
　　色々なログファイルが得られないと難しいかも・・・。


#### ■準備と実行

　１．まずは[CPU-Z](http://www.cpuid.com/softwares/cpu-z.html)をダウンロードし、  
　　　「cpuz_x64.exe」「cpuz_x32.exe」「cpuz.ini」を  
　　　バッチファイルと同じ場所にあるbinフォルダの下に置く必要があります。  
　　　現在の対応バージョンは[1.80.0](http://www.cpuid.com/softwares/cpu-z.html#version-history)です。

　２．バイナリを置いたら、好みのフォーマット用のバッチファイルを  
　　　実行するだけです。FULLが本体バッチで、他の物は出力モードを指定して  
　　　本体バッチを呼び出しています。  
　　　詳細は「[出力サンプルまとめと簡単な説明.txt](出力サンプルまとめと簡単な説明.txt)」や  
　　　各バッチファイルの中身を見て下さい。

　　　　各出力モードの説明  
　　　　　FULL　　　　： 取得した全ての情報を表示(CPUの単純名のみ非表示)  
　　　　　NORMAL　　： システム情報全般(一部省略)  
　　　　　SIMPLE　　　： 主要情報だけをシンプルに  
　　　　　CPUZ_BENCH ： [CPU-Zベンチマークスレ](http://egg.2ch.net/test/read.cgi/jisaku/1458374859/l50)用  
　　　　　X264BENCH　： [x264/x265ベンチマークスレ](http://egg.2ch.net/test/read.cgi/jisaku/1460032466/l50)用  

　　　※CPU-Zの起動時にはユーザーアカウント制御で起動許可が求められます。  
　　　　「いいえ」にすると、取得済みのログを利用して処理を継続するように  
　　　　なっていますので、一度CPU-Zでログを取った後に別のフォーマットが  
　　　　欲しいというような場合は「いいえ」を選んで  
　　　　CPU-Zのログ取得処理をスキップするという方法もあります。  
　　　　また、本体バッチをRECYCLEオプション付きで呼び出した場合も  
　　　　ログ取得処理をスキップします。

#### ■ToDo

　●ターボブーストの倍率情報を取得していますが、i7-69**などで使われている  
　　「ターボ・ブースト・マックス・テクノロジー3.0」の倍率が  
　　CPU-Zのログに出るのかどうかがわかっていません。  
　　できることなら取得して表示したいと考えていますので  
　　CPU-Zのログや情報提供をお待ちしております。

　●「Ratio n cores」の項目は nコア負荷時のターボブースト倍率だと  
　　思っているのだけど、6コアのi7-4930Kでは8まで出るようだし、  
　　8コアのi7-6900Kでは24まで出るようなのだけど、なんでだろう？  
　　CPU-Z 1.80.0のバグ？


#### ■メモ

　●CPU-Z 1.80.0のx64版で、GUIからテキストログを保存すると  
　　ログの中の「CPU-Z version」は「1.80.0.x64」になるが、  
　　-txtオプションを使ってテキストログを保存すると末尾の「.x64」が出ない。  
　　仕方ないのでバッチの方で付与するようにしてあるが、  
　　修正された場合はバッチ側の付与処理を外す必要がある。  


#### ■バッチファイルのライセンスについて

　[NYSL](http://www.kmonos.net/nysl/)準拠です。  
　あえて付け加えるならば、SITNYSKBKOULです。

　※SITNYSKBKOULとは  
　　→「責任は一切とらないけど煮るなり焼くなり好きにしてもらって構わないし  
　　　　バグ修正や改善点は教えてもらえると嬉しいライセンス」の意。


#### ■更新履歴

2017/07/31　「CPUZtoText_20170731」を単体でGitHubに公開。

※これ以前はx264_x265_benchmarkの一部としてリリースしていました。  
　　参考：[【x264+Avisynth】実用エンコベンチ Part5.1](http://egg.2ch.net/test/read.cgi/jisaku/1460032466/797-)  

#### ■作成者
　[enctac](https://github.com/enctac)
