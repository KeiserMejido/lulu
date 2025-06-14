@echo off
echo ========================================
echo    DEPLOY TIMELINE RELACIONAMENTO
echo ========================================
echo.

echo Verificando se o Git esta configurado...
git --version >nul 2>&1
if errorlevel 1 (
    echo ERRO: Git nao encontrado! Instale o Git primeiro.
    pause
    exit /b 1
)

echo Git encontrado!
echo.

echo Adicionando arquivos...
git add .

echo.
set /p commit_msg="Digite a mensagem do commit (ou pressione Enter para usar padrao): "
if "%commit_msg%"=="" set commit_msg=Atualizacao da timeline

echo Fazendo commit...
git commit -m "%commit_msg%"

echo.
echo Enviando para GitHub...
git push

if errorlevel 1 (
    echo.
    echo ERRO: Falha ao enviar para GitHub!
    echo Verifique se:
    echo 1. O repositorio remoto esta configurado
    echo 2. Voce tem permissao para enviar
    echo 3. Sua conexao com internet esta funcionando
    echo.
    echo Para configurar o repositorio remoto, execute:
    echo git remote add origin https://github.com/SEU_USUARIO/timeline-relacionamento-luanna.git
    pause
    exit /b 1
)

echo.
echo ========================================
echo     DEPLOY REALIZADO COM SUCESSO!
echo ========================================
echo.
echo Sua timeline estara disponivel em alguns minutos em:
echo https://KeiserMejido.github.io/timeline-relacionamento-luanna/timeline_relacionamento.html
echo.
echo (Substitua SEU_USUARIO pelo seu username do GitHub)
echo.
pause