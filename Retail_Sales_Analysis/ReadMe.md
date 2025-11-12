# Análise de Vendas Semanais — Sistemas Baseados em Similaridade

## Descrição do Projeto
Este projeto tem como objetivo analisar e prever o volume de vendas semanais de lojas de retalho, utilizando técnicas de **aprendizagem automática** no **KNIME**.  
O trabalho foi desenvolvido no âmbito da unidade curricular *Sistemas Baseados em Similaridade*.

## Fontes de Dados
Foram utilizados dois conjuntos de dados com origem no Kaggle:
- **Lojas**: contém informações sobre cada loja, incluindo tipo e tamanho.  
- **Vendas Semanais**: contém o histórico de vendas por data, loja e indicador de feriados.

Os datasets foram integrados através do atributo comum **Store**.

## ⚙️ Procedimentos e Metodologia

### 1. Exploração dos Dados
- Análise estatística descritiva: desvio padrão, variância, skewness e kurtosis.  
- Verificação de *missing values* (nenhum encontrado).  
- Visualizações:
  - Média de vendas ao longo do tempo → pico antes do Natal.  
  - Comparação de vendas por tipo de loja e por feriados → lojas tipo A e períodos de feriado apresentam vendas superiores.  
- Cálculo da **correlação** entre variáveis → correlação negativa entre *Type* e *Size*.

### 2. Preparação dos Dados
- Conversão da variável booleana `isHoliday` para 1 (feriado) e 0 (normal).  
- Extração de **ano** e **mês** a partir da variável `Date`.  
- Agregação mensal por loja, tipo e tamanho (soma das vendas semanais e presença de feriados).  
- Normalização das vendas (Min-Max entre 0 e 1).  
- Criação de classes de vendas (`Low`, `Medium`, `High`, `Very High`) com *binning* de igual frequência.

### 3. Modelagem

#### Decision Tree
- Modelo treinado para prever a categoria de vendas mensais.  
- **Accuracy inicial:** 65.9%.  
- **Otimização de parâmetros:**
  - Melhor valor para *mínimo de registos por nó*: **6**.  
  - Teste de diferentes critérios de qualidade e métodos de *pruning*.  
  - Melhor combinação: *Gain Ratio* + *MDL pruning* → **accuracy ≈ 68%**.

#### Random Forest
- Modelo treinado sobre os mesmos dados processados.  
- **Accuracy inicial** superior à Decision Tree.  
- *Tuning* de hiperparâmetros:
  - Número máximo de níveis, critério de divisão e número de árvores.  
  - Melhor configuração atingiu **accuracy ≈ 70.5%**.  
  - Melhoria limitada, possivelmente devido à dimensão reduzida do dataset.

### 4. Comparação de Modelos

| Modelo | Accuracy (%) | Observações |
|--------|---------------|-------------|
| Decision Tree (tuned) | 68.0 | Mais rápido no treino |
| Random Forest (tuned) | 70.5 | Melhor performance, tuning mais lento |

## Resultados e Conclusões
- As vendas apresentam picos sazonais, principalmente antes do Natal.  
- Feriados e tipo de loja influenciam positivamente as vendas.  
- O modelo de **Random Forest** superou a **Decision Tree**, mas o ganho de precisão foi modesto.  
- Espera-se melhoria com datasets maiores e mais equilibrados.

---
