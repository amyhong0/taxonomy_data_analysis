import pandas as pd
import spacy


# NLP 자동화 키워드 추출 로직
def automate_taxonomy_refinement(csv_path):
    # nlp 모델 로드
    nlp = spacy.load("en_core_web_sm")
    df = pd.read_csv(csv_path)

    def extract_keywords(text):
        doc = nlp(text.lower())
        # 명사(NOUN)와 형용사(ADJ)만 추출하여 속성 키워드로 정의
        keywords = [token.text for token in doc if token.pos_ in ['NOUN', 'ADJ'] and not token.is_stop]
        return keywords[1] if len(keywords) > 1 else None

    df['extracted_keyword'] = df['name'].apply(extract_keywords)
    return df.dropna()


# 이 코드는 향후 데이터 규모 확장 시 도입할 NLP 기반 파이프라인의 프로토타입입니다.