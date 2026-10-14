@echo off
set /p code=Enter code:
if "%code%"=="1234" (
  if exist ".secret" (
    ren ".secret" "secret"
    echo Vault revealed
  ) else if exist "secret" (
    ren "secret" ".secret"
    echo Vault hidden
  )
) else (
  echo Wrong code
)
