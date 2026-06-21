# 이커머스 상품 분류 체계(Taxonomy) 최적화 및 검색 연관성 데이터 분석

## 📌 개요 (Overview)
이커머스 플랫폼의 핵심인 상품 분류 체계(Taxonomy)와 고객의 검색 의도(Search Intent) 간의 정합성을 진단하기 위한 데이터 분석 프로젝트입니다. 단순한 데이터 추출을 넘어, 상품 메타데이터와 카테고리 매핑 간의 오류를 발견하고 검색 품질(Search Relevance)을 높이기 위한 데이터 정제 및 최적화 로드맵을 구축했습니다.

---

## 🛠 Tech Stack
* **Language & Database:** SQL (SQLite), Python (Pandas, Scikit-learn)
* **Visualization:** Tableau Public
* **Methodology:** 
    * **Data Cleaning:** Heuristic Filtering, Stop-words Management, Regex Pattern Matching
    * **Analysis:** Exploratory Data Analysis (EDA), Text Mining (Keyword Extraction)
    * **Automation:** TF-IDF (Term Frequency-Inverse Document Frequency)

---

## 📊 프로젝트 프로세스 (Project Workflow)

### 1. SQL 기반 데이터 정제 (SQL Data Wrangling)
상품명 데이터의 노이즈를 제거하고 유의미한 키워드만 추출하는 파이프라인을 구축했습니다.
* **로직:** '두 번째 단어 추출 전략'을 통해 브랜드 편향(Brand Bias)을 제거하고 상품의 본질적인 속성(e.g., Wireless, Jeans)을 식별했습니다.
* **정제:** 길이, 숫자/소수점 패턴 매칭, 도메인 특화 불용어(Stop-words) 리스트를 활용해 데이터 정밀도를 높였습니다.

### 2. 시각화 및 문제 진단 (Tableau Heatmap)
정제된 데이터를 바탕으로 카테고리와 핵심 키워드 간의 연관성을 히트맵으로 시각화했습니다.
* **매핑 모호성 탐지:** 여러 카테고리에 중복 분포하는 키워드 식별.
* **덤프 카테고리(Dump Category) 식별:** 속성이 모호한 카테고리 구조 발견.
![Taxonomy Heatmap](images/taxonomy_heatmap.png)

### 3. 기술적 확장 로드맵 (Python & TF-IDF)
수동 정제 방식의 한계를 극복하기 위해 통계적 기법인 **TF-IDF** 모델을 도입했습니다. 특정 카테고리에서만 변별력이 높은 키워드를 자동으로 추출하여, 운영 효율성을 극대화하는 로드맵을 설계했습니다.

---

## 🔍 핵심 통찰 (Key Insights)
1. **데이터 정합성:** 정제된 키워드와 카테고리의 매핑 패턴을 통해 Taxonomy의 안정성을 검증함.
2. **비즈니스 정렬:** 정제 기준을 '기술적 정확성'뿐만 아니라 '고객의 검색 행동'이라는 비즈니스 관점에서 정의함.
3. **지속 가능한 구조:** Taxonomy는 고정된 체계가 아니라, 검색 트렌드에 맞춰 반복적으로 최적화되어야 하는 '살아있는 구조'임을 이해함.

---

## 🔍 히트맵 분석 결과 (Heatmap Analysis Insights)

히트맵 시각화를 통해 도출한 Taxonomy의 주요 개선 인사이트는 다음과 같습니다.

### 1. 정합성 구간 (Success Alignment)
* **`accessories` - `jeweller`, `gold`, `gems`**: 이 구간은 키워드와 카테고리 간 매핑이 매우 진하게 나타납니다. 이는 고객의 검색 의도와 시스템의 분류가 완벽하게 일치하는 성공적인 분류 사례로, 향후 타 카테고리 최적화의 벤치마크로 활용 가능합니다.

### 2. 구조적 결함 진단 (Structural Anomaly Diagnosis)
* **`stores` 카테고리의 모호성 (Dump Category):** 분석 결과, `stores` 카테고리에는 오직 `analog` 키워드만 매핑되어 있습니다. 이는 전형적인 '덤프 카테고리(Dump Category)'의 징후로, 고객에게는 아무런 가치를 제공하지 못하는 모호한 분류입니다. 해당 데이터들은 다른 전문 카테고리로 통합하거나 재분류해야 할 최우선 개선 과제입니다.

### 3. 매핑 모호성 탐지 (Mapping Ambiguity)
* **중복 키워드 이슈:** `analog`와 같은 특정 속성 키워드가 `accessories`와 `stores` 카테고리에 분산되어 있습니다. 이는 시스템상 Taxonomy의 역할 정의가 명확하지 않음을 의미하며, 검색 결과의 집중도를 높이기 위해 매핑 로직을 정교화할 필요가 있습니다.


> **"본 프로젝트는 데이터를 통해 비즈니스 문제를 정의하고, 정교한 데이터 파이프라인을 구축하며, 전략적인 최적화 인사이트를 도출하는 저의 분석 및 엔지니어링 역량을 보여줍니다."**

---

# E-commerce Taxonomy Optimization & Search Relevance Data Analysis

## 📌 Overview
This project evaluates the alignment between **product taxonomy structures and actual customer search intent**. By analyzing large-scale product metadata, I diagnosed inconsistencies, structural anomalies, and mapping ambiguities, providing a data-driven roadmap to enhance search relevance.

---

## 🛠 Tech Stack
* **Language & Database:** SQL (SQLite), Python (Pandas, Scikit-learn)
* **Visualization:** Tableau Public
* **Methodology:** 
    * **Data Cleaning:** Heuristic Filtering, Stop-words Management, Regex Pattern Matching
    * **Analysis:** Exploratory Data Analysis (EDA), Text Mining (Keyword Extraction)
    * **Automation:** TF-IDF (Term Frequency-Inverse Document Frequency)

## 📊 Project Workflow

### 1. Data Cleaning (SQL Data Wrangling)
* **Keyword Strategy:** Implemented a 'Second-Word Extraction' logic to mitigate brand bias and focus on inherent product attributes.
* **Refinement:** Applied heuristic rules (length constraints, numerical pattern matching) and stop-word management to isolate high-value data.

### 2. Visualization & Diagnosis (Tableau Heatmap)
Utilized Tableau heatmaps to visualize the mapping relationship between product categories and extracted keywords, pinpointing structural defects such as "Ambiguous Mapping" and "Dump Categories."
![Taxonomy Heatmap](images/taxonomy_heatmap.png)

### 3. Technical Roadmap (Python & TF-IDF)
Proposed an automated pipeline using **TF-IDF** to handle large-scale datasets, mathematically weighing keyword discriminative power to reduce reliance on manual cleaning.

---

## 🔍 Key Insights
1. **Data Alignment:** Validated taxonomy reliability by identifying consistent mapping patterns across primary product categories.
2. **Business-Oriented Cleaning:** Defined data refinement criteria based on search behavior and category-specific discriminative power.
3. **Scalability:** Demonstrated the ability to transition from heuristic-based manual cleaning to automated statistical models for enterprise-level data processing.

---

## 🔍 Heatmap Analysis Insights

Key insights derived from the heatmap analysis are as follows:

### 1. Alignment Success
* **`accessories` - `jeweller`, `gold`, `gems`**: This region shows strong mapping density, indicating that the taxonomy classification perfectly matches customer search intent. This serves as a benchmark for optimizing other product categories.

### 2. Structural Anomaly Diagnosis
* **Ambiguity in 'stores' (Dump Category):** The `stores` category only maps to the `analog` keyword, exhibiting the characteristics of a "Dump Category." It lacks descriptive product attributes, providing little value to customers. These items should be migrated to specialized categories as a top priority for restructuring.

### 3. Mapping Ambiguity
* **Fragmented Mapping:** Keywords like `analog` appear scattered across multiple categories (`accessories` and `stores`). This indicates overlapping category definitions and necessitates a refined mapping logic to concentrate search results and improve relevance.

> **"This project demonstrates my ability to define business problems through data, engineer robust refinement pipelines, and provide strategic optimization insights."**
