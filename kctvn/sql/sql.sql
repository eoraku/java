/*
T3H : 3시간 기온

*/

/* 날씨 - 육상 */
(SELECT W3_X, W3_Y, RD_NAME, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER, ROUND(WL_T1H) WL_T1H FROM WEATHER LEFT JOIN REGION_COORD ON RD_X = W3_X AND RD_Y = W3_Y LEFT JOIN WEATHER_LIVE ON WL_X = W3_X AND WL_Y = W3_Y WHERE W3_X = '52' AND W3_Y = '38' ORDER BY W3_SEQ LIMIT 1)
UNION (SELECT W3_X, W3_Y, RD_NAME, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER, ROUND(WL_T1H) WL_T1H  FROM WEATHER LEFT JOIN REGION_COORD ON RD_X = W3_X AND RD_Y = W3_Y LEFT JOIN WEATHER_LIVE ON WL_X = W3_X AND WL_Y = W3_Y WHERE W3_X = '59' AND W3_Y = '38' ORDER BY W3_SEQ LIMIT 1)
UNION (SELECT W3_X, W3_Y, RD_NAME, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER, ROUND(WL_T1H) WL_T1H  FROM WEATHER LEFT JOIN REGION_COORD ON RD_X = W3_X AND RD_Y = W3_Y LEFT JOIN WEATHER_LIVE ON WL_X = W3_X AND WL_Y = W3_Y WHERE W3_X = '58' AND W3_Y = '34' ORDER BY W3_SEQ LIMIT 1)
UNION (SELECT W3_X, W3_Y, RD_NAME, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER, ROUND(WL_T1H) WL_T1H  FROM WEATHER LEFT JOIN REGION_COORD ON RD_X = W3_X AND RD_Y = W3_Y LEFT JOIN WEATHER_LIVE ON WL_X = W3_X AND WL_Y = W3_Y WHERE W3_X = '53' AND W3_Y = '32' ORDER BY W3_SEQ LIMIT 1)
UNION (SELECT W3_X, W3_Y, RD_NAME, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER, ROUND(WL_T1H) WL_T1H  FROM WEATHER LEFT JOIN REGION_COORD ON RD_X = W3_X AND RD_Y = W3_Y LEFT JOIN WEATHER_LIVE ON WL_X = W3_X AND WL_Y = W3_Y WHERE W3_X = '48' AND W3_Y = '32' ORDER BY W3_SEQ LIMIT 1)
UNION (SELECT W3_X, W3_Y, RD_NAME, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER, ROUND(WL_T1H) WL_T1H  FROM WEATHER LEFT JOIN REGION_COORD ON RD_X = W3_X AND RD_Y = W3_Y LEFT JOIN WEATHER_LIVE ON WL_X = W3_X AND WL_Y = W3_Y WHERE W3_X = '48' AND W3_Y = '36' ORDER BY W3_SEQ LIMIT 1)
UNION (SELECT W3_X, W3_Y, RD_NAME, ROUND(W3_PTY) W3_PTY, ROUND(W3_SKY) W3_SKY, ROUND(W3_T3H) W3_T3H, RD_SCREEN_X, RD_SCREEN_Y, RD_ORDER, ROUND(WL_T1H) WL_T1H  FROM WEATHER LEFT JOIN REGION_COORD ON RD_X = W3_X AND RD_Y = W3_Y LEFT JOIN WEATHER_LIVE ON WL_X = W3_X AND WL_Y = W3_Y WHERE W3_X = '53' AND W3_Y = '35' ORDER BY W3_SEQ LIMIT 1)
ORDER BY RD_ORDER;

/* 날씨 - 육상 상세 */
SELECT W3_TIME, ROUND(W3_T3H) W3_T3H, ROUND(W3_PTY) W3_PTY,ROUND(W3_SKY) W3_SKY, ROUND(W3_WSD) W3_WSD, W3_WAV, ROUND(W3_R12) W3_R12, ROUND(W3_S12) W3_S12
	FROM WEATHER 
	WHERE W3_X = '59' AND W3_Y = '38' 
	ORDER BY W3_SEQ LIMIT 16;

/* 지역 코드 */
SELECT * FROM region_code;
SELECT * FROM region_coord;