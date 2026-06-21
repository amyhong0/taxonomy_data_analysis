-- 이커머스 상품 분류 체계 최적화를 위해 핵심 속성 키워드를 추출하는 쿼리입니다.
-- This query extracts core attribute keywords to optimize e-commerce taxonomy classification.
SELECT 
    main_category,
    -- 상품명에서 브랜드 편향을 방지하기 위해 핵심 제품 속성인 두 번째 단어만 추출합니다.
    -- Extracts only the second word to mitigate brand bias and focus on inherent product attributes.
    LOWER(SUBSTR(
        SUBSTR(name, INSTR(name, ' ') + 1), 
        1, 
        INSTR(SUBSTR(name, INSTR(name, ' ') + 1) || ' ', ' ') - 1
    )) AS second_word_keyword,
    COUNT(*) AS frequency
FROM amazon_products
WHERE name LIKE '% %'
  -- 2글자 미만, 소수점(1.5 등), 순수 숫자(123 등)와 같은 노이즈 데이터를 필터링합니다.
  -- Filters out noise data such as words shorter than 2 chars, decimals, and numeric-only strings.
  AND LENGTH(SUBSTR(SUBSTR(name, INSTR(name, ' ') + 1), 1, INSTR(SUBSTR(name, INSTR(name, ' ') + 1) || ' ', ' ') - 1)) >= 2
  AND SUBSTR(SUBSTR(name, INSTR(name, ' ') + 1), 1, INSTR(SUBSTR(name, INSTR(name, ' ') + 1) || ' ', ' ') - 1) NOT GLOB '*.*'
  AND SUBSTR(SUBSTR(name, INSTR(name, ' ') + 1), 1, INSTR(SUBSTR(name, INSTR(name, ' ') + 1) || ' ', ' ') - 1) NOT GLOB '[0-9]*'
  -- 도메인 지식을 활용하여 분석 가치가 낮은 관사 및 마케팅 용어를 제외합니다.
  -- Uses domain knowledge to exclude common stop-words and marketing terms with low analytical value.
  AND LOWER(SUBSTR(SUBSTR(name, INSTR(name, ' ') + 1), 1, INSTR(SUBSTR(name, INSTR(name, ' ') + 1) || ' ', ' ') - 1)) NOT IN (
      'the', 'and', 'with', 'from', 'your', 'made', 'best', 'high', 'home', 'this', 'that', 'mens', 'womens', 'for', 'are',
      'men', 'women', 'men''s', 'women''s', 'fashion', 'by', 'polo', 'brand', 'heusen', 'black', 'baby',
      'england', 'wear', 'plus', 'tape', 'shoes', 'pack', 'boys', 'sales', 'chandra', 'jewels', 'jewellery', 'analogue',
      'unisex-adult', 'yellow', 'klein', 'solly', 'jewellers', 'designer', 'colors', 'avenue', 'pro', 'mini', 'diva', 'chief'
  )
GROUP BY 1, 2
HAVING frequency > 50
ORDER BY 1, 3 DESC;
