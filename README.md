# tableview-sample
tableviewのサンプルプロジェクト


【概要】   
Xcodeで新規プロジェクトを選択した際の「Master」を模した基本的なTableViewを使ったサンプルソースです。  
『+』を押すとTableViewが追加され、Editをタップすると、削除する行を選択できます。  


【今回覚えてもらいたいこと】  
１，モデルの作成の仕方  
　・今回のサンプルでいうと、「ModelList」と「ModelDetail」の関係  
　　→「ModelDetail」の集合が「ModelList」であること。  
　　なので、「ModelDetail」の集合がほしい場合は「ModelList」にそれっぽい関数を書く。例）検索や昇順降順  
２．ビューの使い方  
　・基本的なView  
　　→文字の表示、UILabel  
　　 画像の表示, UIimageView  
　    　　　　　　　　　　　　など  
３．コントローラの使い方  
  ・１画面１ビューコントローラ
  ・addChildViewControllerを使うと複数可能
  ・デリゲート
