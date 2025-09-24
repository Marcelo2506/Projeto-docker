# Dockerfile para Aplicação Streamlit com Python 3.12

# 1. Imagem Base
FROM python:3.12-slim

# 2. Definir o Diretório de Trabalho
WORKDIR /app

# 3. Copiar o arquivo de requisitos
COPY requirements.txt .

# 4. (NOVO) Instalar dependências do sistema operacional necessárias para compilar pacotes
RUN apt-get update && apt-get install -y build-essential

# 5. Instalar as dependências Python
RUN pip install --no-cache-dir -r requirements.txt

# 6. Copiar o Código da Aplicação
COPY . .

# 7. Expor a Porta
EXPOSE 8501

# 8. Comando para Executar a Aplicação
# Lembre-se de substituir "seu_app.py" pelo nome do seu arquivo Python principal.
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]