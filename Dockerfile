# Use uma imagem oficial do Python como imagem base
FROM python:3.13.5-alpine3.22

# Define o diretório de trabalho no contêiner
WORKDIR /app

# Copia o arquivo de dependências para o diretório de trabalho
COPY requirements.txt .

# Instala as dependências
# A flag --no-cache-dir desabilita o cache, o que reduz o tamanho da imagem
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação para o diretório de trabalho
COPY . .


# Expõe a porta que a aplicação FastAPI irá rodar (padrão é 8000)
EXPOSE 8000

# Comando para executar a aplicação
# uvicorn app:app: 'app' é o arquivo app.py, e o segundo 'app' é o objeto FastAPI
# --host 0.0.0.0: Torna o servidor acessível de fora do contêiner
# --port 8000: A porta em que a aplicação será executada
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]