
import os
import pandas as pd
from sqlalchemy import create_engine
from sqlalchemy.engine import URL

# 1. Caminho do arquivo CSV
arquivo = os.getenv(
    "SUPERSTORE_CSV",
    "dados/Sample - Superstore.csv"
)

# 2. Ler o CSV
df = pd.read_csv(arquivo, encoding="latin1")

print("Dimensões originais:", df.shape)

# 3. Tratar valores nulos
nulos_antes = df.isna().sum().sum()
df = df.dropna()

print("Valores nulos encontrados:", nulos_antes)
print("Dimensões após tratamento:", df.shape)

# 4. Padronizar nomes das colunas
df.columns = (
    df.columns
    .str.replace(" ", "_", regex=False)
    .str.replace("-", "_", regex=False)
)

# 5. Converter a coluna de data
df["Order_Date"] = pd.to_datetime(df["Order_Date"])

# 6. Inspecionar os dados
df.info()

# 7. Configurar conexão com SQL Server
server = os.getenv("SQL_SERVER")
database = os.getenv("SQL_DATABASE", "SuperstoreDB")
driver = os.getenv(
    "SQL_DRIVER",
    "ODBC Driver 17 for SQL Server"
)

if not server:
    raise ValueError(
        "Configure a variável de ambiente SQL_SERVER."
    )

connection_url = URL.create(
    "mssql+pyodbc",
    host=server,
    database=database,
    query={
        "driver": driver,
        "trusted_connection": "yes"
    }
)

engine = create_engine(connection_url)

# 8. Carregar os dados no SQL Server
try:
    df.to_sql(
        "Superstore",
        engine,
        if_exists="replace",
        index=False
    )
    print("Importação concluída!")
finally:
    engine.dispose()

