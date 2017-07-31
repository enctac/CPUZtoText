
@echo off
cd /d %~dp0
setlocal ENABLEDELAYEDEXPANSION

REM =================================================================
REM　出力ファイルの指定
REM =================================================================

set number=04
set outMode=CPUZ_BENCH

set tempdir=.\temp
mkdir %tempdir% 2> nul

REM 出力ファイル名
set modeResultLog=.\SystemInformation_%number%_%outMode%.txt

REM =================================================================
REM　システム情報収集バッチを呼び出す
REM =================================================================

REM -------------------------------------------------------------------------------------
REM　引数（一括呼び出し時に指定されるもの）
REM　　%1： 実行モード。AUTOで自動モード(メイン処理終了時のメッセージ出力とpauseをしないだけ)
REM　　%2： 結果を格納するファイル名。テキストファイル(*.txt)のみ指定可。
REM　　%3： 出力モード。FULL,NORMAL,SIMPLE,CPUZ_BENCH,X264BENCHのいずれか。
REM　　%4： ログ取得モード。RECYCLEの場合はCPU-Zによる新規ログ取得は行わず既得ログを利用する。
REM -------------------------------------------------------------------------------------

call CPUZtoText_01_FULL.bat MANUAL "%modeResultLog%" %outMode%

IF NOT %ERRORLEVEL%==0 (
 exit /b %ERRORLEVEL%
)

(@echo 【Single】) >> "%modeResultLog%"
(@echo 【Multi】) >> "%modeResultLog%"
(@echo 【MTRatio】) >> "%modeResultLog%"
(@echo 【補足説明】) >> "%modeResultLog%"
