# E-commerce Taxonomy Data Analysis & Search Relevance Optimization

## 개요

이커머스 상품 분류 체계(Taxonomy)의 구조적 결함을 진단하고 검색 연관성을 높이기 위한 데이터 분석 프로젝트입니다.
상품 메타데이터를 정제하여 고객의 검색 의도를 파악하고, 카테고리 매핑의 정합성을 검증하는 파이프라인을 구축했습니다.

## Tech Stack

- Language & Database: SQL (SQLite), Python (spaCy, Pandas)
- Visualization: Tableau Public
- Methodology:
  - 데이터 클렌징 (불용어 관리, 휴리스틱 필터링)
  - 탐색적 데이터 분석 (EDA) 및 히트맵 시각화
  - NLP 자동화 로드맵 설계

## 프로젝트 코드 구조

- `code/taxonomy_analysis.sql`: 데이터 정제 및 키워드 추출을 위한 SQL 쿼리
- `code/taxonomy_nlp.py`: NLP 기반의 자동화 분석 로드맵 코드
- `images/taxonomy_heatmap.png`: 시각화 히트맵 이미지

## 주요 성과

1. 데이터 정합성 확보: '두 번째 단어 추출' 및 다단계 정제 로직(길이, 숫자, 불용어 처리)을 통해 상품 속성 키워드의 신뢰도를 높였습니다.
2. 비즈니스 인사이트 도출: Tableau 히트맵 분석으로 매핑 오류(Mis-mapping)와 덤프 카테고리(Dump Category)를 식별해 Taxonomy 최적화 전략을 제시했습니다.
3. 확장성 고려: 실무 환경에서 수동 불용어 관리의 한계를 극복하기 위해 NLP(POS Tagging) 및 통계적 방법론(TF-IDF) 기반의 자동화 파이프라인을 설계했습니다.

> 단순 분석을 넘어, 데이터의 비즈니스적 가치를 찾아내고 기술적으로 최적화하는 과정을 담았습니다.