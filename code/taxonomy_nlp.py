import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer

def get_category_key_attributes(csv_path, top_n=10):
    """
    TF-IDF를 활용하여 각 카테고리별로 변별력이 높은 핵심 속성 키워드를 추출합니다.
    """
    # 데이터 로드
    df = pd.read_csv(csv_path)
    
    # 1. 카테고리별로 상품명을 하나로 합침 (문서 단위 생성)
    category_data = df.groupby('main_category')['name'].apply(lambda x: ' '.join(x)).reset_index()
    
    # 2. TF-IDF Vectorizer 설정
    # stop_words='english'를 통해 기본 불용어 처리, max_features로 상위 키워드 제한
    vectorizer = TfidfVectorizer(stop_words='english', max_features=1000)
    tfidf_matrix = vectorizer.fit_transform(category_data['name'])
    
    # 3. 결과 데이터를 데이터프레임으로 변환
    feature_names = vectorizer.get_feature_names_out()
    tfidf_df = pd.DataFrame(tfidf_matrix.toarray(), columns=feature_names, index=category_data['main_category'])
    
    # 4. 각 카테고리별로 가중치가 높은 상위 N개 키워드 추출
    results = []
    for category in tfidf_df.index:
        top_keywords = tfidf_df.loc[category].sort_values(ascending=False).head(top_n)
        for keyword, score in top_keywords.items():
            results.append({'Category': category, 'Keyword': keyword, 'Score': score})
            
    return pd.DataFrame(results)

# 사용 예시
# analysis_result = get_category_key_attributes('amazon_products.csv')
# print(analysis_result)
