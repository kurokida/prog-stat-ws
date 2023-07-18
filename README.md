# prog-stat-ws
プログラミングと統計のワークショップ

# お知らせ
- 6/23（金）はお休みです。
- 6/30（金）はお休みです。
- 9/15（金）はお休みです。
- 12/1（金）はお休みです。

# シラバス

## 第１回 jsPsychを使ってみよう（6月9日の2限と4限）
jsPsych (de Leeuw et al., 2023) を使って、オンライン調査を行うためのプログラムを作成します。jsPsychのサンプルプログラム、jspsych-survey-likert.htmlを元にします。使用する主なプラグインは次の２つです。
- [survey-likert](https://www.jspsych.org/7.3/plugins/survey-likert/)
- [instructions](https://www.jspsych.org/7.3/plugins/instructions/)

調査結果を[localSave関数](https://www.jspsych.org/7.3/reference/jspsych-data/#localsave)を使用してCSVファイルに出力します。JavaScriptコンソールの使い方についても説明します。
時間があれば、画像の呈示も扱いたいです。

[コミット: 教示の追加、およびCSVファイル出力](https://github.com/kurokida/prog-stat-ws/commit/9f1db281e8ecad6e6851be7643921b42833ed24a) を見ると、survey-likert.htmlについて私が変更を加えた箇所を確認することができます。

## 第２回（6月16日の2限と4限）
前回に引き続き、jsPsychについてです。今回のテーマは、
- 出力ファイルの整形（ [jsPsych.data.addProperties](https://www.jspsych.org/7.3/reference/jspsych-data/#jspsychdataaddproperties) と [jsPsych.data.get().addToLast](https://www.jspsych.org/7.3/reference/jspsych-data/#addtolast)を使用）
- デベロッパーツールの使用
- デモプログラムの結合（例題1では[jspsych-instructions](https://github.com/jspsych/jsPsych/blob/main/examples/jspsych-instructions.html)と[jspsych-html-slider-response](https://github.com/jspsych/jsPsych/blob/main/examples/jspsych-html-slider-response.html)、例題2では[jspsych-instructions](https://github.com/jspsych/jsPsych/blob/main/examples/jspsych-instructions.html)と[jspsych-image-button-response](https://github.com/jspsych/jsPsych/blob/main/examples/jspsych-image-button-response.html)と[jspsych-survey-text](https://github.com/jspsych/jsPsych/blob/main/examples/jspsych-survey-text.html)）

です。事前にChromeのインストールを済ませていただけると助かります。
デモプログラムの結合では、既存のjsPsychのデモプログラムをつなぎあわせて、実際の実験プログラムに近づけるという作業を行います。

## 第３回 Timeline variablesを使いこなそう（7月7日の2限と4限）
この回では、timeline variablesを使って、試行ごとに刺激を変化させる方法を学びます。関連して刺激の呈示順番をランダムにし、繰り返して呈示する方法について説明します。[本家のチュートリアル](https://www.jspsych.org/7.3/tutorials/rt-task/)でも詳しく説明されています。

## 第４回 オンラインで動かそう（7月14日の2限と4限）
この回では、みなさんが作ったプログラムをインターネット上で公開して、オンライン実験を実際に行う方法について解説をします。大学のサーバーで公開する方法と、[Cognition](https://www.cognition.run/)というjsPsych専用のホスティングサービスを使用する方法について説明します。[Cognitionはいくつかの制約がありますが無料で利用することが可能です。](https://www.cognition.run/#pricing)

## 第５回 MATLAB + Psychtoolbox（7月21日の2限と4限）
実験棟でよく使用される MATLAB と [Psychtoolbox (Brainard, 1997; Pelli 1997; Kleiner et al., 2007）](http://psychtoolbox.org/) について解説をします。[九州大学の学生は無料でMATLABを使用することができます。](https://soft.iii.kyushu-u.ac.jp/MATLAB/index.html) MATLAB + Psychtoolbox ではオンライン実験を行うことができませんのでご注意ください。プログラミングの学習というよりは、みなさんのパソコンでデモプログラムを動かせるようにすることを目標とします。

[MATLABのシステム要件を事前にご確認ください。](https://jp.mathworks.com/support/requirements/matlab-system-requirements.html)

# 引用文献
- Brainard, D.H.（1997）The Psychophysics Toolbox. *Spatial Vision, 10*, 433-436. 
- de Leeuw, J.R., Gilbert, R.A., & Luchterhandt, B. (2023). jsPsych: Enabling an open-source collaborative ecosystem of behavioral experiments. *Journal of Open Source Software, 8*(85), 5351, https://joss.theoj.org/papers/10.21105/joss.05351.
- Kleiner, M., Brainard, D. & Pelli, D.（2007）What’s new in Psychtoolbox-3? *Perception, 36*, ECVP Abstract Supplement.
- Pelli, D.G.（1997）The VideoToolbox software for visual psychophysics: Transforming numbers into movies. *Spatial Vision 10*, 437-442.
