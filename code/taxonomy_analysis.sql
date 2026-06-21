-- e-commerce Taxonomy Data Analysis
-- Objective: 상품명에서 핵심 속성 키워드를 추출하여 카테고리 매핑 정합성 분석
SELECT 
    main_category,
    LOWER(SUBSTR(
        SUBSTR(name, INSTR(name, ' ') + 1), 
        1, 
        INSTR(SUBSTR(name, INSTR(name, ' ') + 1) || ' ', ' ') - 1
    )) AS second_word_keyword,
    COUNT(*) AS frequency
FROM amazon_products
WHERE name LIKE '% %'
  AND LENGTH(SUBSTR(SUBSTR(name, INSTR(name, ' ') + 1), 1, INSTR(SUBSTR(name, INSTR(name, ' ') + 1) || ' ', ' ') - 1)) >= 2
  AND SUBSTR(SUBSTR(name, INSTR(name, ' ') + 1), 1, INSTR(SUBSTR(name, INSTR(name, ' ') + 1) || ' ', ' ') - 1) NOT GLOB '*.*'
  AND SUBSTR(SUBSTR(name, INSTR(name, ' ') + 1), 1, INSTR(SUBSTR(name, INSTR(name, ' ') + 1) || ' ', ' ') - 1) NOT GLOB '[0-9]*'
  AND LOWER(SUBSTR(SUBSTR(name, INSTR(name, ' ') + 1), 1, INSTR(SUBSTR(name, INSTR(name, ' ') + 1) || ' ', ' ') - 1)) NOT IN (
      'the', 'and', 'with', 'from', 'your', 'made', 'best', 'high', 'home', 'this', 'that', 'mens', 'womens', 'for', 'are',
      'men', 'women', 'men''s', 'women''s', 'fashion', 'by', 'polo', 'brand', 'heusen', 'black', 'baby',
      'england', 'wear', 'plus', 'tape', 'shoes', 'pack', 'boys', 'sales', 'chandra', 'jewels', 'jewellery', 'analogue',
      'unisex-adult', 'yellow', 'klein', 'solly', 'jewellers', 'designer', 'colors', 'avenue', 'pro', 'mini', 'diva', 'chief'
  )
GROUP BY 1, 2
HAVING frequency > 50
ORDER BY 1, 3 DESC;