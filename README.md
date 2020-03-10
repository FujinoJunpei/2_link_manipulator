# 2-link-manipulator
 
# Requirement
 
* matlab
* simulink
 
# Usage
まずmatlabでカレントディレクトリが2_link_manipulatorになるように移動。

### とりあえずどんな感じか見たいとき

以下を実行。すると(1,0)を中心とした半径1の円内からランダムに1点が選ばれ、(1,0)からそこに向かって2-link-manipulatorが線を引く。そのときの手先の軌道が青でプロットされ、答えの線分が赤色でプロットされる。(とてもうまく引けるので青の線と赤の線がほぼ完全に重なって青の線はほとんど見えない。)また、初回の実行にはsimulinkの起動に少し時間がかかる。
```bash
otameshi
```

### 教師データを作るとき(逆モデル)

以下を実行。するとディレクトリ内にcsvファイルができる。csvの1列目2列目が(x_end、y_end)。ただし、(x_end, y_end)は単位円内の点。3列目4列目がtau(t)のシークエンス。csvの行数はlen × n_samples。ただしlenは１つのデータの長さ。デフォルトではlen=251。詳しくはmake_simu_data.mを参照。
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
