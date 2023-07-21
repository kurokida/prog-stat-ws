% このプログラムは、https://peterscarfe.com/rectangle.html　を参照しており、
% 長方形を呈示します。

% 基本的にどのプログラムでも最初に行うおまじない
sca;
close all;
clear;
PsychDefaultSetup(2);

Screen('Preference', 'SkipSyncTests', 1); % 本当はこれを書かないほうがよいのですが、windowsやmacではおそらく必須です

% 現在お使いのパソコンのディスプレイ情報を収集します。詳しくは、コマンドウィンドウに次のように打ち込んでください。
% Screen Screens?
screens = Screen('Screens');
screenNumber = max(screens);

black = BlackIndex(screenNumber); % 黒色を指定します。black = 0; と書いてもOK
white = WhiteIndex(screenNumber); % 白色を指定します。white = 1; と書いてもOK

% 黒い背景で全画面表示にします。
% 詳しくは、 Screen OpenWindow?
%[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black);

% プログラムの完成前は、ウィンドウ表示のほうがよい
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black, [0, 0, 800, 600]);

% 画面の中心座標（原点は左上）
[xCenter, yCenter] = RectCenter(windowRect);

% 描きたい長方形のサイズを指定します。数値の意味は、長方形の左上X, 左上Y, 右下X, 右下Yです。
% ここで指定するのはサイズのみで、位置は関係ありません。左上の座標は、(x, y) = (0, 0) としてください。
baseRect = [0 0 200 250]; % 数値をいろいろ変えてみましょう！

% baseRectを画面の中心に移動させて、そのときの長方形の座標を取得します。
centeredRect = CenterRectOnPointd(baseRect, xCenter, yCenter);

for trial_cnt = 1:3
    switch trial_cnt
        case 1
            rectColor = [1 0 0]; % 赤
        case 2
            rectColor = [0 1 0]; % 緑
        otherwise
            rectColor = [0 0 1]; % 青
    end
    
    % 試行の番号を表示（日本語を表示するには工夫が必要）
    DrawFormattedText(window, ['Trial ' int2str(trial_cnt)], 100, 100, white);
    
    % 長方形を画面に描画。ただし実際には画面に表示されない。
    Screen('FillRect', window, rectColor, centeredRect);
    
    % Flipをして、初めて画面に表示されます。
    %Screen('Flip', window);
    
    % キーボードからの反応を待つ
    [secs, keyCode, deltaSecs] = KbStrokeWait;
    KbName(keyCode) % どのキーを押したかをコマンドウィンドウに出力
end

% 画面をクリア
sca;