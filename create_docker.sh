 
mkdir trino-tutorial
cd trino-tutorial

 
cat > docker-compose.yml << 'EOF'
version: '3.8'
services:
  trino:
    image: trinodb/trino:latest
    container_name: trino-coordinator
    ports:
      - "8080:8080"
    environment:
      - JAVA_OPTS=-Xmx2G
    volumes:
      - ./catalog:/etc/trino/catalog
      - ./data:/tmp/trino-data
    command: /usr/lib/trino/bin/run-trino

  postgres:
    image: postgres:13
    container_name: postgres-db
    environment:
      POSTGRES_DB: testdb
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data
      - ./init-db.sql:/docker-entrypoint-initdb.d/init-db.sql

volumes:
  postgres_data:
EOF

# Create catalog directory for connectors
mkdir -p catalog data