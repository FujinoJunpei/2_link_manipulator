# 2_link_manipulator
 
# Requirement
 
* matlab
* simulink
 
# Usage
まずmatlabでカレントディレクトリが2_link_manipulatorになるように移動。

### とりあえずどんな感じか見たいとき
make_simu_data.mの29行目の%を削除した上で以下を実行。
```bash
make_simu_data(1)
```

### 教師データを作るとき(逆モデル)

以下を実行。するとディレクトリ内にcsvファイルができる。csvの1列目2列目がx(t),y(t)のシークエンス。3列目4列目がtau(t)のシークエンス。csvの行数はlen × n_samples。ただしlenは１つのデータの長さ。デフォルトではlen=10001。詳しくはmake_simu_data.mを参照。
```bash
%n_samplesには作る教師データのデータ数を入れる。
make_simu_data(n_samples)
```

### tau(t)からx(t),y(t)を計算するとき(順モデル)

以下を実行。すると、そのtau(t)のシークエンスに従ってトルクをかけたときの手先の軌道が青でプロットされ、答えの線分が赤色でプロットされる。
```bash
%tauがtau(t)のシークエンス,(x_end,y_end)が答え線分の(0,0)以外の端点
brain_tau_to_xy(tau,x_end,y_end)
```
