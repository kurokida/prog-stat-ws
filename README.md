# prog-stat-ws
プログラミングと統計のワークショップ

# お知らせ
- 10/13（金）から統計ワークショップを始めます。基本的には毎週金曜日の14:50開始です。
- 10/27（金）と11/3（金）はお休みです。

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

## 第６回 PsychoPyの紹介（7月28日の2限と4限）
PsychoPy (Peirce et al., 2019) は[公式サイト](https://www.psychopy.org/index.html)からダウンロードしてください。教材として、[小川洋和先生のPsychoPy講座](https://ogwlab.org/?page_id=460)、[十河宏行先生のPsychoPy Builderで作る心理学実験](http://www.s12600.net/psy/python/ppb/html/index.html)、[公式のYouTubeチャンネル](https://www.youtube.com/channel/UCQo2aB6cXJasHyXJp0afaWg)がお勧めです。

## 第７回 統計ツールを使ってみよう（10月13日の4限）
このワークショップでは、[JASP (JASP Team, 2023)](https://jasp-stats.org/), [R (R Core Team, 2022)](https://cran.rstudio.com/) ([RStuido (Posit team, 2022)](https://posit.co/download/rstudio-desktop/)), [HAD (清水, 2016)](https://norimune.net/had) を主に使用します。それぞれのツールで、t検定を行う方法を中心に話を進めます。特にJASPでは簡単にベイズ統計に基づいたt検定を行うことが可能です。そのあたりまでお話ができればと思っています。

## 第８回 統計ツールを使ってみよう２（10月20日の4限）
前回は大まかな話で終わったので、具体的にみなさんのパソコンで操作をしてもらいながら、JASPとRになじんでもらおうと思います。さらに、ベイズファクターについても簡単にご紹介する予定です。

## 第９回 SuperpowerでANOVAの検定力を調べよう（11月10日の4限）
[Lakens & Caldwell (2021)](https://journals.sagepub.com/doi/10.1177/2515245920951503) を読みながら、SuperpowerでANOVAの検定力を調べます。SuperpowerはRのライブラリですが、Superpowerと同じことをウェブで行うことができます。
- [ANOVA_power](https://arcaldwell49.shinyapps.io/anova-power/) 
- [ANOVA_exact](https://arcaldwell49.shinyapps.io/anova-exact/)

# 引用文献
- Brainard, D.H. (1997). The Psychophysics Toolbox. *Spatial Vision, 10*, 433-436. 
- de Leeuw, J.R., Gilbert, R.A., & Luchterhandt, B. (2023). jsPsych: Enabling an open-source collaborative ecosystem of behavioral experiments. *Journal of Open Source Software, 8*(85), 5351, https://joss.theoj.org/papers/10.21105/joss.05351.
- JASP Team (2023). JASP (Version 0.17.2) [Computer software].
- Kleiner, M., Brainard, D. & Pelli, D. (2007). What’s new in Psychtoolbox-3? *Perception, 36*, ECVP Abstract Supplement.
- Lakens D, & Caldwell A.R. (2021). Simulation-Based Power Analysis for Factorial Analysis of Variance Designs. Advances in Methods and Practices in Psychological Science, 4(1). [doi:10.1177/2515245920951503](https://journals.sagepub.com/doi/10.1177/2515245920951503)
- Peirce, J.W., Gray, J.R., Simpson, S., MacAskill, M.R., Höchenberger, R., Sogo, H., Kastman, E., Lindeløv, J. (2019). PsychoPy2: experiments in behavior made easy. Behavior Research Methods. [10.3758/s13428-018-01193-y](https://link.springer.com/article/10.3758/s13428-018-01193-y)
- Pelli, D.G. (1997). The VideoToolbox software for visual psychophysics: Transforming numbers into movies. *Spatial Vision 10*, 437-442.
- R Core Team (2022). R: A language and environment for statistical computing. *R Foundation for Statistical Computing, Vienna, Austria.*　**citation()コマンドで確認可能**
- Posit team (2022). RStudio: Integrated Development Environment for *R. Posit Software, PBC, Boston, MA.* **RStudio.Version()コマンドで確認可能**
- 清水 裕士 (2016). フリーの統計分析ソフトHAD：機能の紹介と統計学習・教育，研究実践における利用方法の提案　 メディア・情報・コミュニケーション研究, 1, 59-73.
