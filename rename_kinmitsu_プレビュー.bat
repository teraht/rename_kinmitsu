@echo off
setlocal enabledelayedexpansion

REM --- �����m�F ---
set "EXECUTE=false"
if "%~1"=="-e" (
    set "EXECUTE=true"
    echo ���s���[�h: ���l�[�����s���܂��B
) else (
    echo �v���r���[���[�h: ���ۂɂ̓t�@�C�����͕ύX����܂���B
)

echo.

REM --- �t�@�C������ ---
for /r %%F in (*.*) do (
    set "filename=%%~nxF"
    set "folder=%%~dpF"

    REM ���łɁu�@���v���t���Ă���t�@�C���͏��O
    echo !filename! | findstr /b /c:"�y�@���z" >nul
    if errorlevel 1 (
        set "newname=�y�@���z!filename!"
        echo [�Ώ�] %%F
        echo [�ύX��] !folder!!newname!

        if "!EXECUTE!"=="true" (
            ren "%%F" "!newname!"
        )
        echo.
    )
)

if "%EXECUTE%"=="false" (
    echo.
    echo �� ���̓��e�Ń��l�[�������s�������ꍇ�́A `-e` ������t���Ă�������:
    echo     rename_kinmitsu.bat -e
)

endlocal

pause