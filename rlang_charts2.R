## 30 바차트 구단승리
df_win_count <- dbGetQuery(conn, 
           "SELECT 
            A.WINNER,
           COUNT(A.WINNER) WIN_COUNT
           FROM(SELECT
           K.SCHE_DATE 경기날짜,
           CASE
           WHEN K.HOME_SCORE > K.AWAY_SCORE THEN HT.TEAM_NAME
           WHEN K.AWAY_SCORE > K.HOME_SCORE THEN AT.TEAM_NAME
           ELSE '무승부'
           END WINNER
           FROM SCHEDULE K
           JOIN TEAM HT
           ON K.HOMETEAM_ID LIKE HT.TEAM_ID
           JOIN TEAM AT
           ON K.AWAYTEAM_ID LIKE AT.TEAM_ID
           WHERE
           K.GUBUN LIKE 'Y'
           AND K.SCHE_DATE LIKE '2012%'
           )A
           WHERE A.WINNER NOT LIKE '무승부'
           GROUP BY A.WINNER
           ORDER BY WIN_COUNT DESC")
df_win_count
#barplot(df_stu$sum, names.arg=df_stu$name)
barplot(names.arg=df_win_count[,1],df_win_count[,2],space=0,width=0.5)

## 29 파이 차트 스타디움별 좌석
df_seat <- dbGetQuery(conn, 
             "SELECT
    ROWNUM NO,
    A.*
FROM (
    SELECT 
        S.STADIUM_NAME STADIUM,
        S.SEAT_COUNT SEATS
    FROM STADIUM S
    ORDER BY
        S.SEAT_COUNT DESC
    ) A"         
                      )
df_seat
df_seat[,2]
df_seat[,1]
pie(df_seat[,1],df_seat[,2],col=rainbow(20),radius =2.5)
pie(df_seat$SEATS,df_seat$STADIUM,col=rainbow(20),radius =2.5
    ,density = 100,angle = 45)
## ??
df_score <- dbGetQuery(conn, 
"SELECT A.*
  FROM (
    SELECT
    HT.TEAM_NAME HOME_TEAM,
    AT.TEAM_NAME AWAY_TEAM,
    ABS(SC.HOME_SCORE - SC.AWAY_SCORE) SCORE    
    FROM SCHEDULE SC
    JOIN TEAM HT ON HT.TEAM_ID LIKE SC.HOMETEAM_ID
    JOIN TEAM AT ON AT.TEAM_ID LIKE SC.AWAYTEAM_ID
    WHERE
    SC.SCHE_DATE LIKE '2012%'
    AND SC.GUBUN LIKE 'Y'
    ORDER BY 
    ABS(SC.HOME_SCORE - SC.AWAY_SCORE) DESC
  ) A
WHERE 
A.SCORE LIKE ( 
  SELECT B.*
    FROM (SELECT       
          ABS(SC.HOME_SCORE - SC.AWAY_SCORE) SCORE    
          FROM SCHEDULE SC
          JOIN TEAM HT ON HT.TEAM_ID LIKE SC.HOMETEAM_ID
          JOIN TEAM AT ON AT.TEAM_ID LIKE SC.AWAYTEAM_ID
          WHERE
          SC.SCHE_DATE LIKE '2012%'
          AND SC.GUBUN LIKE 'Y'
          ORDER BY 
          ABS(SC.HOME_SCORE - SC.AWAY_SCORE) DESC) B
  WHERE ROWNUM = 1)"
)
df_score

## 20 산포
df_games <-dbGetQuery(conn, "SELECT SUBSTR(sche_date,5,2) game_date,
    COUNT(gubun) game_count
           FROM schedule
           GROUP BY SUBSTR(sche_date,5,2)
           ORDER BY SUBSTR(sche_date,5,2)")
df_games
df_games$GAME_DATE = as.numeric(as.character(df_games$GAME_DATE))

plot(x = df_games$GAME_DATE, y = df_games$GAME_COUNT,
     xlab = "date",
     ylab = "count",
     xlim = c(1,12),
     ylim = c(10,50),		 
     main = "Montly games"
)
## 26 팀별 골키퍼의 평균키로 라인차트 
## (인덱스값을 팀이름으로 치환가능한지 찾아볼것)
goalkeeper <-dbGetQuery(conn,
"
SELECT    
        (SELECT T1.TEAM_NAME
        FROM TEAM T1
        WHERE T1.TEAM_ID LIKE T.TEAM_ID) team_name,
        AVG(P.HEIGHT) height    
    FROM PLAYER P 
        JOIN TEAM T ON T.TEAM_ID LIKE P.TEAM_ID 
    WHERE
        P.POSITION LIKE 'GK'
    GROUP BY
        T.TEAM_ID
    ORDER BY 
        AVG(P.HEIGHT) DESC
"                        
)
goalkeeper
plot(goalkeeper$HEIGHT,type = "o" )
## 28 점수차별로 분류한 경기수. 
## 1점차경기 3경기,...6점차경기 1경기, 이렇게 해서 히스토그램

# SQL30 바차트 : 구단승리순으로 순위매기기
query = "SELECT A.WINNER,
COUNT(A.WINNER) WIN_COUNT
FROM(SELECT
K.SCHE_DATE 경기날짜,
CASE
WHEN K.HOME_SCORE > K.AWAY_SCORE THEN HT.TEAM_NAME
WHEN K.AWAY_SCORE > K.HOME_SCORE THEN AT.TEAM_NAME
ELSE '무승부'
END WINNER
FROM SCHEDULE K
JOIN TEAM HT
ON K.HOMETEAM_ID LIKE HT.TEAM_ID
JOIN TEAM AT
ON K.AWAYTEAM_ID LIKE AT.TEAM_ID
WHERE
K.GUBUN LIKE 'Y'
AND K.SCHE_DATE LIKE '2012%'
)A
WHERE A.WINNER NOT LIKE '무승부'
GROUP BY A.WINNER
ORDER BY WIN_COUNT DESC"
rs <- dbGetQuery(conn, query)
barplot(rs[,2],names.arg=rs[,1], main = "승리수")

