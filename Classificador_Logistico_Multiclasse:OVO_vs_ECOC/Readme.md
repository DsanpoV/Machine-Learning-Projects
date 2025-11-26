# Classificação Multiclasse com Classificador Logístico: Comparação entre OvO e ECOC

## 1. Enquadramento
Este repositório apresenta o desenvolvimento, implementação e análise comparativa de duas metodologias para extensão de classificadores binários a problemas de classificação multiclasse: **One-vs-One (OvO)** e **Error-Correcting Output Codes (ECOC)**.  
Ambas foram aplicadas a diferentes versões do **classificador logístico binário** — primal, dual, dual com kernel polinomial, mini-batch, estocástico e estocástico ordenado — com o objetivo de avaliar precisão, estabilidade e custo computacional.

As experiências incluíram aplicações sobre bases artificiais (AND, XOR e dataset sintético) e sobre o dataset real MNIST, conforme documentado no relatório original do projeto.

## 2. Objetivos
O objetivo do trabalho consiste em:
- Implementar algoritmos do classificador logístico binário nas versões primal e dual.
- Estender estes classificadores a problemas multiclasse através das metodologias OvO e ECOC.
- Avaliar o desempenho de cada abordagem em diferentes tipos de dados.
- Comparar robustez, precisão, velocidade de treino e consistência das previsões.
- Identificar cenários em que cada metodologia se revela mais adequada.

## 3. Classificador Logístico Binário

### 3.1 Versão Primal
A versão primal foi implementada segundo três variantes de gradiente:
- **Mini-Batch (MGmB)**  
- **Estocástico (MGE)**  
- **Estocástico Ordenado (MGE-Ordenado)**  

Estas variantes diferem na escolha das amostras para cada atualização, influenciando a variância do gradiente, a estabilidade e a convergência.

### 3.2 Versão Dual
A formulação dual permite introduzir funções de kernel, tendo sido utilizadas:
- Dual sem kernel (caso linear)
- Dual com kernel polinomial de grau \( d \)

Também aqui foram testadas variantes mini-batch, estocástica e estocástica ordenada.  
Esta abordagem revelou-se essencial para lidar com bases não linearmente separáveis.

## 4. Aplicações Iniciais: Bases AND e XOR
As primeiras validações foram realizadas sobre dois problemas clássicos:

- **Base AND** (linearmente separável): todas as versões do classificador (primal e dual) classificaram correctamente os dados.  
- **Base XOR** (não linearmente separável): apenas a versão dual com kernel polinomial de grau ≥ 2 conseguiu separar corretamente as classes, confirmando o comportamento esperado.

Estas experiências serviram como verificação preliminar das implementações.

## 5. Metodologia OvO (One-vs-One)
A metodologia OvO transforma um problema com \( K \) classes num conjunto de  
\[
\frac{K(K-1)}{2}
\]
classificadores binários, cada um treinado sobre um par distinto de classes.

Em predição, cada classificador atribui um voto e a classe final resulta da classe com maior número de votos.  
Foram analisadas as características:
- Baixa complexidade por classificador (apenas duas classes por treino).  
- Bom desempenho quando as fronteiras são simples.  
- Menor custo computacional em comparação com ECOC.

## 6. Metodologia ECOC (Error-Correcting Output Codes)
O ECOC representa cada classe por um código binário numa matriz de códigos.  
Cada coluna da matriz corresponde a um classificador binário, permitindo redundância e capacidade de correção de erros via distância de Hamming.

Propriedades estudadas:
- Robustez a ruído e classificadores fracos.  
- Flexibilidade na construção das matrizes de códigos.  
- Melhor separação entre classes quando existe redundância suficiente.  
- Custo computacional superior dependendo do número de colunas.

Para 4 classes foi utilizada uma matriz exaustiva com 7 bits.

## 7. Experiências em Datasets Diversificados

### 7.1 Dataset Sintético
Foi construído manualmente um dataset com 3 classes bem separadas.  
Resultados: todos os métodos (OvO e ECOC, primal e dual) classificaram corretamente todos os pontos de teste, como esperado pela simplicidade do problema.

### 7.2 Dataset MNIST
O MNIST foi reduzido para duas versões:
- 3 classes (0, 1, 2) — validação inicial  
- 4 classes (0, 1, 2, 3) — análise detalhada  

Hiperparâmetros utilizados:
- 1000 iterações  
- Taxa de aprendizagem: 0.5  
- Kernel polinomial: grau 2 nas versões dual com kernel  
- 100 imagens de treino e 100 de teste por classe  

Resultados avaliados através de:
- Matrizes de confusão  
- Acurácia  
- Precisão  
- Recall  
- F1-Score  
- Evolução do erro ao longo do treino  

Os gráficos correspondentes encontram-se nos anexos do relatório.

### Observações Gerais
- OvO foi consistentemente mais rápido do que ECOC.  
- Versões estocásticas ordenadas tenderam a pior desempenho, evidenciando desvantagens sem aleatoriedade na seleção das amostras.  
- As versões duais com kernel produziram as melhores métricas, frequentemente acima de 90%, demonstrando elevada capacidade de generalização.

## 8. Análise Comparativa
As conclusões experimentais indicam que:
- OvO e ECOC alcançaram excelentes resultados no MNIST reduzido.  
- O classificador logístico dual com kernel foi globalmente o mais eficaz.  
- ECOC apresentou maior consistência em alguns cenários devido à redundância dos códigos.  
- OvO beneficiou de maior eficiência computacional e implementação mais simples.  

## 9. Conclusões
O trabalho demonstrou que a combinação do classificador logístico binário com métodos OvO e ECOC permite resolver eficazmente problemas multiclasse.  
Destacam-se:  
- A superioridade das versões duais com kernel polinomial.  
- A boa performance geral das metodologias analisadas.  
- A necessidade de melhorias como afinação de hiperparâmetros, utilização de kernels mais variados, *learning rates* dinâmicos e validação cruzada.

## 10. Estrutura do Repositório
