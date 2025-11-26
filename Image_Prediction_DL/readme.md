# Projeto de Classificação de Imagens com MLP, LSTM e CNN  
### Classificadores e Sistemas Conexionistas (CSC) — Universidade do Minho

## 1. Introdução
Este projeto investiga a aplicação de modelos de *Deep Learning* a três problemas distintos de Visão por Computador, seguindo a metodologia CRISP-DM. O objetivo é avaliar sistematicamente o desempenho de diferentes arquiteturas — **MLP**, **LSTM** e **CNN** — em tarefas de classificação de imagens, bem como analisar o impacto do *tuning* de hiperparâmetros, diferenças estruturais entre modelos e limitações práticas decorrentes dos recursos computacionais disponíveis.

Foram estudados três datasets com características distintas:
- **MNIST** – dígitos manuscritos (dataset clássico, simples e equilibrado)  
- **CIFAR-10** – imagens naturais com 10 classes (dataset intermédio)  
- **Cards Dataset** – classificação de cartas de baralho (53 classes, dataset real e complexo)

## 2. Modelos e Arquiteturas
Foram implementadas e avaliadas três arquiteturas de redes neuronais:

### 2.1 MLP (Multilayer Perceptron)
Rede totalmente ligada construída a partir de um vetor de entrada (flattened image).  
Variáveis testadas:
- Número de neurónios: 128, 512  
- Funções de ativação: *ReLU*, *Softmax*  
- *Learning rate*: 0.001, 0.01  
- Épocas: 15, 30

### 2.2 LSTM (Long Short-Term Memory)
Arquitetura recorrente aplicada às imagens reconstruídas como sequências.  
Variáveis testadas:
- Neurónios: 128, 512  
- Função de ativação: *ReLU* ou *Softmax*  
- *Learning rate*: 0.001, 0.01  
- Épocas: 5, 10

### 2.3 CNN (Convolutional Neural Network)
Arquitetura convolucional adaptada a vários tamanhos de entrada.  
Variáveis testadas:
- Neurónios na camada densa final: 128, 512  
- Função de ativação: *ReLU* ou *Softmax*  
- *Learning rate*: 0.001, 0.01  
- Épocas: 10, 20

### 2.4 Reprodutibilidade
Para todos os modelos foi utilizada *seed* estatística fixa (2024), garantindo replicabilidade entre execuções.

---

## 3. Dataset MNIST
### 3.1 Caracterização
- 60.000 imagens de treino  
- 10.000 imagens de teste  
- Imagens a preto e branco, resolução 28×28  
- Distribuição equilibrada entre as 10 classes (0–9)

### 3.2 Resultados Resumidos
- **MLP** alcançou elevada precisão (≈ 98%), com tempos de execução reduzidos.  
- **LSTM** apresentou bons resultados, mas com tempos significativamente maiores (até várias horas, dependendo dos neurónios).  
- **CNN** foi o modelo com melhor desempenho, atingindo ≈ 99.5% de *accuracy* no melhor caso, e com tempos relativamente moderados.

As análises incluíram:
- Matrizes de confusão  
- Gráficos de evolução da *accuracy*  
- Gráficos de evolução da *loss*

---

## 4. Dataset CIFAR-10
### 4.1 Caracterização
- 50.000 imagens de treino  
- 10.000 imagens de teste  
- 10 classes de objetos (avião, pássaro, automóvel, etc.)  
- Imagens coloridas convertidas para escala de cinzento

### 4.2 Resultados Resumidos
- **MLP** apresentou desempenho baixo (≈ 30–39%), devido à elevada complexidade visual do dataset e à perda de informação após o flatten.  
- **LSTM** obteve resultados moderados (≈ 40–53%), mas com tempos de execução muito elevados.  
- **CNN** destacou-se com resultados fortes (≈ 71–76%), sendo claramente o modelo mais adequado para este tipo de dados.

---

## 5. Dataset de Classificação de Baralhos de Cartas
### 5.1 Caracterização
- 7.654 imagens de treino  
- 265 imagens para teste e validação (5 por classe)  
- Total de **53 classes** representando todas as cartas do baralho  
- Conversão das imagens para escala de cinzento e redução da resolução

### 5.2 Resultados Resumidos
- **MLP** obteve *accuracy* muito baixa (≈ 2–15%), refletindo inadequação para dados altamente complexos e não estruturados.  
- **LSTM** teve desempenho muito variável e, em muitos casos, instável (ocorrência de *NaN* em várias combinações).  
- **CNN** apresentou resultados significativamente mais elevados, atingindo ≈ 84% no melhor caso. Foi o único modelo a demonstrar boa capacidade de generalização no dataset de 53 classes.

---

## 6. Análise Comparativa
### MLP
- Bom desempenho em MNIST  
- Desempenho insuficiente em CIFAR-10 e Cards  
- Rápido treino e baixa complexidade computacional

### LSTM
- Pouco adequado para imagens em geral  
- Tempos de execução demasiado elevados  
- Resultados inconsistentes, principalmente no dataset Cards

### CNN
- Modelo mais adequado aos três datasets  
- Elevada precisão, especialmente em MNIST e Cards  
- Tempos de treino razoáveis face ao número de parâmetros  
- Superior capacidade de extração de características espaciais

Conclusão principal:  
**As CNN ultrapassam MLP e LSTM em todos os cenários relevantes, confirmando a sua adequação a problemas de visão computacional.**

---

## 7. Conclusões Finais
O estudo permitiu comparar de forma sistemática três arquiteturas distintas de redes neuronais em múltiplos contextos. As principais conclusões são:

- A escolha do modelo deve considerar as características do dataset;  
- CNN são a opção mais robusta e eficaz para problemas de classificação de imagem;  
- Modelos totalmente ligados (MLP) tornam-se rapidamente insuficientes à medida que a complexidade visual aumenta;  
- LSTM mostrou-se inadequado para imagens, tanto em precisão como em eficiência temporal;  
- Melhorias possíveis incluem *tuning* avançado, maior capacidade computacional e uso das imagens em resolução original.

---

## 8. Estrutura Sugerida do Repositório
