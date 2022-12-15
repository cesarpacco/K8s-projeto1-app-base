#!/bin/bash

echo "Criando as imagens..."

docker build -t cesarpacco/projeto-backend:1.0 backend/.
docker build -t cesarpacco/projeto-database:1.0 database/.

echo "Realizando o push das imagens..."

docker push cesarpacco/projeto-backend:1.0
docker push cesarpacco/projeto-database:1.0

echo "Criando os serviços do cluster kubernetes..."

kubectl apply -f ./services.yml

echo "Criando os deployments..."

kubectl apply -f ./deployment.yml