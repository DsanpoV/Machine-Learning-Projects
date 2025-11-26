# Estimativa de Incerteza na Previsão de Séries Temporais com Deep Learning

Este repositório reúne o código, resultados e documentação do projeto desenvolvido no âmbito da Unidade Curricular **Projeto Integrado em Matemática e Computação** (Mestrado em Matemática e Computação, Universidade do Minho). O trabalho centra-se na implementação e comparação de técnicas de previsão de séries temporais capazes de produzir **estimativas de incerteza**, indo além das previsões pontuais tradicionais.

## Objetivo

O projeto avalia diferentes abordagens de Deep Learning aplicadas à previsão de séries temporais, analisando não apenas a precisão das previsões, mas também a capacidade de quantificar a incerteza. São comparados três métodos probabilísticos com uma LSTM determinística usada como baseline:

- **Deep Ensemble**
- **Monte Carlo Dropout**
- **LSTM Probabilística** (inspirada em redes neuronais Bayesianas)

## Dados

Os dados utilizados baseiam-se no conjunto da competição **M5 Forecasting – Uncertainty** (Walmart).  
Foram analisadas duas séries temporais distintas:

1. **Loja CA1** — vendas diárias agregadas.  
2. **Produto HOBBIES 2 004** — vendas diárias de um único item.

Ambas apresentam comportamentos diferentes: uma série estável e sazonal (CA1) e outra mais irregular e difícil de modelar (HOBBIES 2 004).

## Metodologia

O pré-processamento incluiu agregação das vendas, junção com dados de calendário, tratamento de outliers, normalização e criação de janelas temporais com **timesteps = 7**.  
Os modelos foram treinados com 85% dos dados (10% para validação) e avaliados sobre os restantes 15%.

A análise comparativa integra métricas de erro (MAE, MSE, RMSE) e métricas probabilísticas como **Coverage** para diferentes intervalos de previsão.

## Resultados (Resumo)

- A **LSTM determinística** apresenta bom desempenho na série da Loja CA1, mas falha em capturar a variabilidade do produto HOBBIES 2 004.  
- **Deep Ensemble** e **MC Dropout** produzem intervalos de incerteza mais realistas e coberturas mais consistentes.  
- A **LSTM probabilística** é eficiente e conceptualmente elegante, mas tende a subestimar a variância em séries mais irregulares.  
- Séries estáveis beneficiam mais dos modelos; séries altamente ruidosas revelam maiores limitações previsivas.

## Conclusões

A introdução de incerteza melhora substancialmente a interpretação das previsões e a adequação dos modelos a cenários reais. Métodos como Deep Ensemble e MC Dropout demonstram ser soluções robustas e acessíveis para previsão probabilística. Os resultados reforçam a importância de modelos que forneçam não apenas valores previstos, mas também a sua confiança associada.

