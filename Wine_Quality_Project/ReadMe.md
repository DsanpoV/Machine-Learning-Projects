# Projeto: Análise e Segmentação de Dados de Qualidade de Vinho

Este projeto foi desenvolvido no âmbito da unidade curricular **Sistemas Baseados em Similaridade**, com o objetivo de explorar e segmentar dados relativos à qualidade de vinhos, recorrendo a técnicas de pré-processamento, redução de dimensionalidade e clustering.

## 1. Fonte e Estrutura dos Dados

O estudo baseia-se no **Wine Quality Dataset**, composto por dois ficheiros distintos: um ficheiro de treino e um ficheiro de teste.  
Ambos contêm observações sobre características físico-químicas dos vinhos (tais como acidez, pH, dióxido de enxofre, teor alcoólico, entre outras) e uma variável de saída que representa a **qualidade do vinho**.

O ficheiro de treino foi utilizado para desenvolver e ajustar os modelos de clustering, enquanto o ficheiro de teste serviu para avaliar a capacidade de generalização desses modelos.

## 2. Exploração e Análise Inicial

A fase inicial consistiu na **exploração dos dados** para compreender a sua estrutura e identificar possíveis anomalias.  
Da análise efetuada, destacam-se as seguintes observações:
- Não foram identificados valores em falta.
- O atributo com maior desvio-padrão foi o *total sulfur dioxide*.
- Os atributos com maior variância foram *total sulfur dioxide* e *free sulfur dioxide*.
- O atributo com maior assimetria (skewness) e curtose foi *chlorides*.
- A análise de correlação revelou uma forte correlação positiva entre *total sulfur dioxide* e *free sulfur dioxide*, uma correlação moderada entre *alcohol* e *quality*, e uma correlação negativa significativa entre *pH* e *fixed acidity*.

## 3. Pré-processamento dos Dados

Para garantir consistência e comparabilidade entre atributos, foram aplicadas várias operações de pré-processamento:
- Conversão de variáveis para tipos numéricos apropriados.
- **Normalização** de todos os atributos numéricos através de uma transformação linear *Min–Max*, escalando os valores entre 0 e 1.
- Criação de **intervalos (bins)** sobre a variável *citric acid*, dividindo-a em quatro classes de igual frequência e categorizando-as como *Low*, *Medium*, *High* e *Very High*.

## 4. Redução de Dimensionalidade

Aplicou-se o método de **Análise de Componentes Principais (PCA)**, reduzindo o espaço de atributos originais para **duas dimensões**.  
Esta redução visou facilitar a visualização dos dados e permitir uma melhor perceção da estrutura subjacente às observações.  
As representações gráficas obtidas demonstraram uma boa preservação da variabilidade dos dados e evidenciaram a presença de padrões potenciais de agrupamento.

## 5. Segmentação e Clustering

A etapa seguinte consistiu na aplicação de algoritmos de **clustering** com o objetivo de identificar grupos de amostras com características semelhantes.

- O modelo de **K-Means** foi ajustado sobre o conjunto de **treino**, tendo sido definidos **três clusters**.  
- Em seguida, o modelo treinado foi utilizado para atribuir rótulos de cluster às instâncias do **conjunto de teste**, recorrendo a um procedimento de **atribuição automática de clusters**.  
  Este processo permitiu avaliar a consistência das segmentações obtidas em dados não utilizados durante o treino.

As visualizações bidimensionais revelaram uma separação razoável entre grupos, com associações visíveis entre as variáveis de qualidade e os clusters obtidos.

## 6. Testes e Comparações Adicionais

Para complementar a análise, foram testados e comparados outros métodos de clustering:
- O algoritmo **K-Medoids**, que apresentou segmentações semelhantes às do K-Means, confirmando a estabilidade da estrutura de agrupamento identificada.
- O algoritmo **Fuzzy-Means**, que produziu separações distintas, permitindo observar sobreposições parciais entre clusters e fornecendo uma perspetiva alternativa da distribuição dos dados.

## 7. Automação e Visualização

Foram criadas variáveis de fluxo para parametrizar o número de bins, o número de clusters e os nomes dos gráficos gerados, de modo a tornar o processo mais flexível e reproduzível.  
Os resultados gráficos foram integrados num único componente visual, permitindo uma análise conjunta e comparativa das diferentes abordagens.

## 8. Conclusões

A análise realizada permitiu:
- Identificar relações significativas entre atributos físico-químicos e a qualidade do vinho;
- Demonstrar a utilidade da PCA para reduzir a dimensionalidade mantendo a informação essencial;
- Confirmar a capacidade dos métodos de clustering (K-Means e K-Medoids) em segmentar os dados de forma coerente;
- Evidenciar que métodos de clustering fuzzy podem revelar estruturas alternativas e complementar a interpretação tradicional dos grupos.

## 9. Ferramenta Utilizada

Todo o processo foi desenvolvido na plataforma **KNIME Analytics Platform**, uma ferramenta de *data science* orientada a fluxos de trabalho modulares, adequada à execução de processos de análise, mineração de dados e modelação de similaridade.
Todos os ficheiros utilizados e obtidos encontram-se neste repositório.



**Autor:** José Virgílio Silva Loureiro  
**Unidade Curricular:** Sistemas Baseados em Similaridade  
