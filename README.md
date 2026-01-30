# 🛍️ Analise comportamental dos Clientes

## Visão Geral do Projeto

Este projeto realiza uma análise de comportamento de consumo de clientes a partir de dados de um varejo fictício. O objetivo é extrair insights acionáveis relacionados a:

* Padrões de gastos
* Impacto de descontos
* Valor de clientes assinantes
* Fidelização e recorrência
* Performance de produtos e categorias

O fluxo do projeto simula um pipeline real de análise de dados, integrando:

* **Python** para limpeza e EDA
* **SQL** para responder perguntas de negócio
* **Power BI** para visualização e storytelling

---

## Problema de Negócio

A empresa deseja entender melhor o comportamento de compra de seus clientes para melhorar:

* Estratégias de marketing
* Retenção e fidelização
* Política de descontos
* Posicionamento de produtos

Pergunta central do desafio:

> *Como a empresa pode utilizar dados de consumo para identificar tendências, melhorar o engajamento dos clientes e otimizar estratégias de marketing e produto?*

---

## Visão Geral do Dataset

* **Total de registros:** 3.900 compras
* **Total de colunas:** 18
* **Principais informações:**

  * Dados demográficos (idade, gênero, status de assinatura)
  * Detalhes da compra (produto, categoria, valor, estação)
  * Comportamento do cliente (uso de desconto, avaliações, tipo de frete, histórico de compras)
* Tratamento de dados faltantes: valores ausentes em `review_rating`

---

## Análise Exploratória de Dados (Python)

A etapa inicial focou em preparação e enriquecimento dos dados utilizando a biblioteca `pandas`.

### Principais etapas:

* Carregamento e inspeção dos dados (`df.info()`, `df.describe()`)
* Tratamento de valores ausentes em `review_rating` via mediana por categoria
* Padronização dos nomes das colunas para snake_case
* Criação da coluna `age_group`
* Criação de colunas relacionadas à frequência de compra
* Verificação de redundâncias e remoção de colunas desnecessárias

---

## Análise em SQL (Perguntas de Negócio)

Com os dados estruturados no banco, foram respondidas as seguintes perguntas:

1. Receita por gênero
2. Clientes que usaram desconto e gastaram acima da média
3. Top 5 produtos com maior avaliação média
4. Comparação de ticket médio por tipo de frete (Standard vs Express)
5. Assinantes vs não assinantes: gasto médio e receita total
6. Produtos mais dependentes de desconto
7. Segmentação de clientes (New, Returning, Loyal)
8. Top 3 produtos mais comprados por categoria
9. Relação entre compradores recorrentes e assinatura
10. Contribuição de receita por faixa etária

---

## Dashboard (Power BI)

Foi desenvolvido um dashboard no Power BI para apresentar os principais insights de forma visual, permitindo:

* Comparações rápidas entre segmentos
* Identificação de produtos e clientes mais valiosos
* Apoio à tomada de decisão por stakeholders não técnicos

---

## Principais Recomendações de Negócio

* Incentivar assinaturas, oferecendo benefícios exclusivos
* Criar programas de fidelidade para clientes recorrentes
* Revisar a política de descontos para equilibrar volume e margem
* Destacar produtos bem avaliados e mais vendidos em campanhas
* Direcionar ações de marketing para faixas etárias mais lucrativas

---

## 🧰 Tecnologias Utilizadas

* Python (pandas)
* SQL
* Power BI
* Google Colab
* Git & GitHub

---

