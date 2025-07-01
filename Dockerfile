# Usa uma imagem oficial do Python como base
FROM python:3.13.4-alpine3.22

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia os arquivos de dependências para o container
COPY requirements.txt .

# Instala as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante da aplicação para o container
COPY . .

# Expõe a porta padrão do FastAPI/Uvicorn
EXPOSE 8000

# Comando para iniciar a aplicação
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"] 