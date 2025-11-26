# Métricas e Classificação em Aprendizagem Automática  
Implementação em MATLAB

## Descrição Geral
Este repositório contém a implementação integral, em MATLAB, de um sistema de análise e classificação de padrões binários utilizando um algoritmo do tipo **Lloyd (K-Medoids)** e dois classificadores supervisionados: **k-Nearest Neighbors (k-NN)** e **classificação por representante mais próximo**.  
O trabalho incide sobre um conjunto de eventos representados por vetores binários de dimensão 25, correspondentes a imagens 5×5 que exibem três padrões distintos semelhantes às formas “A”, “P” e “+”.

Todos os ficheiros necessários para execução encontram-se neste repositório.

## Estrutura dos Dados
- **BD1.txt**: base de dados não rotulada com 30 eventos.  
- **teste.txt** e **teste2.txt**: ficheiros de teste com 25 atributos e etiqueta de classe.  
- Os dados representam imagens 5×5 tratadas como vetores binários.

## Algoritmos Implementados

### Algoritmo de Lloyd (K-Medoids)
Particiona os dados em **k = 3** clusters usando uma métrica de dissimilaridade binária:

\[
d(x,y)=\frac{1}{25}\sum_{i=1}^{25} \mathbf{1}(x_i \neq y_i)
\]

Os representantes de cada cluster são medoides que minimizam a dissimilaridade total.

### Classificadores
**k-Nearest Neighbors (k-NN)**  
Classificador supervisionado que utiliza a mesma métrica. Inclui seleção automática do melhor valor de *k*.

**Representante mais próximo**  
Classificação baseada na proximidade ao medoide do cluster correspondente.

## Resultados Obtidos
- Bom desempenho geral dos classificadores.  
- O k-NN apresenta melhor separação entre classes semelhantes.  
- Foram incluídas tabelas de confusão, valores de accuracy, F1-score e exemplos de classificações incorretas.

## Código
Inclui:
- Leitura e preparação dos dados.  
- Implementação do algoritmo de Lloyd.  
- Classificação com k-NN (`knn_predict`).  
- Classificação por representante mais próximo.  
- Avaliação (accuracy, F1-score) e visualização de erros de classificação.

## Requisitos
- MATLAB (qualquer versão compatível).  
- Sem dependências adicionais.
