import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer

# TF-IDF 모델을 사용하여 카테고리별 핵심 변별력 키워드를 자동 추출합니다.
# Automatically extracts highly discriminative keywords for each category using a TF-IDF model.
def get_category_key_attributes(csv_path, top_n=10):
    df = pd.read_csv(csv_path)
    
    # 카테고리별로 상품명을 하나로 합쳐 분석 대상 문서를 생성합니다.
    # Aggregates product titles by category to create documents for analysis.
    category_data = df.groupby('main_category')['name'].apply(lambda x: ' '.join(x)).reset_index()
    
    # 카테고리 전반에 흔한 단어의 가중치는 낮추고 고유 단어는 높이는 TF-IDF 모델을 설정합니다.
    # Sets up a TF-IDF model to lower the weight of common words across categories and highlight unique keywords.
    vectorizer = TfidfVectorizer(stop_words='english', max_features=1000)
    tfidf_matrix = vectorizer.fit_transform(category_data['name'])
    
    # 연산된 점수를 데이터프레임으로 변환하여 카테고리별 키워드 매칭 상태를 정리합니다.
    # Converts calculated TF-IDF scores into a dataframe to map keywords to categories.
    feature_names = vectorizer.get_feature_names_out()
    tfidf_df = pd.DataFrame(tfidf_matrix.toarray(), columns=feature_names, index=category_data['main_category'])
    
    # 각 카테고리별로 가중치가 높은 상위 N개 핵심 속성 키워드를 최종 추출합니다.
    # Extracts the top N key attribute keywords for each category to serve as the final analysis output.
    results = []
    for category in tfidf_df.index:
        top_keywords = tfidf_df.loc[category].sort_values(ascending=False).head(top_n)
        for keyword, score in top_keywords.items():
            results.append({'Category': category, 'Keyword': keyword, 'Score': score})
            
    return pd.DataFrame(results)

# 사용 예시: 결과값을 출력하여 정합성 진단에 활용합니다.
# Usage example: Print the result to evaluate taxonomy alignment.
# analysis_result = get_category_key_attributes('amazon_products.csv')
# print(analysis_result)
