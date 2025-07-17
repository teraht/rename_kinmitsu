@echo off
setlocal enabledelayedexpansion

REM --- 引数確認 ---
set "EXECUTE=false"
if "%~1"=="-e" (
    set "EXECUTE=true"
    echo 実行モード: リネームを行います。
) else (
    echo プレビューモード: 実際にはファイル名は変更されません。
)

echo.

REM --- ファイル走査 ---
for /r %%F in (*.*) do (
    set "filename=%%~nxF"
    set "folder=%%~dpF"

    REM すでに「機密」が付いているファイルは除外
    echo !filename! | findstr /b /c:"【機密】" >nul
    if errorlevel 1 (
        set "newname=【機密】!filename!"
        echo [対象] %%F
        echo [変更後] !folder!!newname!

        if "!EXECUTE!"=="true" (
            ren "%%F" "!newname!"
        )
        echo.
    )
)

if "%EXECUTE%"=="false" (
    echo.
    echo ↑ この内容でリネームを実行したい場合は、 `-e` 引数を付けてください:
    echo     rename_kinmitsu.bat -e
)

endlocal

pause