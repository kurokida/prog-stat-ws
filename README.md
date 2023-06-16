# prog-stat-ws
プログラミングと統計のワークショップ

# シラバス

## 第１回（6月9日の2限と4限）
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

# 引用文献
de Leeuw, J.R., Gilbert, R.A., & Luchterhandt, B. (2023). jsPsych: Enabling an open-source collaborative ecosystem of behavioral experiments. *Journal of Open Source Software, 8*(85), 5351, https://joss.theoj.org/papers/10.21105/joss.05351.