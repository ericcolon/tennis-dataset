SELECT
heads.id as id,
flash."matchUrl" as url_match_flash,
atp.url as url_match_atp,
flash."tournamentUrl" as url_tour,
flash."tournamentName" as name_tour_flash,
atp.name as name_tour_atp,
csv.tourney_name as name_tour_csv,
flash.round as round_flash,
csv.round as round_csv,
flash.qualification as qualif,
atp.door as door,
atp.surface as surface,
atp.prize as prize,
atp.year as year_atp,
flash.year as year_flash,
flash."dateTime" as date_flash,
csv.tourney_date as date_csv,
atp.date as date_atp,
flash.country as loc_flash,
atp.location as loc_atp,
atp.winner as name_win_atp,
csv.winner_name as name_win_csv,
atp.loser as name_los_atp,
csv.loser_name as name_los_csv,
atp.winner_url as url_win_atp,
atp.loser_url as url_los_atp,
csv.winner_hand as hand_win,
csv.loser_hand as hand_los,
csv.draw_size as draw_size,
csv.tourney_level as level_tour,
csv.winner_seed as seed_win,
csv.winner_entry as entry_win,
csv.loser_seed as seed_los,
csv.loser_entry as entry_los,
csv.winner_ht as ht_win,
csv.loser_ht as ht_win,
csv.winner_rank_points as points_win,
csv.loser_rank_points as points_los,
csv.winner_age as age_win,
csv.loser_age as age_los,
csv.score as score,
home."playerUrl" as url_home,
home."fullName" as name_home,
home."age" as birthday_home,
home.country as country_home,
away."playerUrl" as url_away,
away."fullName" as name_away,
away."age" as birthday_away,
away.country as country_away,
weather."weatherUrl" as url_weather,
weather.location as loc_weather,
weather.temp as temp_weather,
weather.press as press_weather,
weather.humid as humid_weather,
com.uncertainty as uncertainty_1year,
com.count as count_match_1year,
com.serve_rating as serve_rating_1year,
com.aces as aces_1year,
com.double_faults as double_faults_1year,
com.first_serve as first_serve_1year,
com.first_serve_point_won as first_serve_point_won_1year,
com.second_serve_point_won as second_serve_point_won_1year,
com.bp_saved as bp_saved_1year,
com.service_game_played as service_game_played_1year,
com.return_rating as return_rating_1year,
com.first_serve_return_point_won as first_serve_return_point_won_1year,
com.bp_converted as bp_converted_1year,
com.return_games_played as return_games_played_1year,
com.service_point_won as service_point_won_1year,
com.return_point_won as return_point_won_1year,
com.total_point_won as total_point_won_1year,
opp.uncertainty as uncertainty_20years,
opp.count as count_match_20years,
opp.serve_rating as serve_rating_20years,
opp.aces as aces_20years,
opp.double_faults as double_faults_20years,
opp.first_serve as first_serve_20years,
opp.first_serve_point_won as first_serve_point_won_20years,
opp.second_serve_point_won as second_serve_point_won_20years,
opp.bp_saved as bp_saved_20years,
opp.service_game_played as service_game_played_20years,
opp.return_rating as return_rating_20years,
opp.first_serve_return_point_won as first_serve_return_point_won_20years,
opp.bp_converted as bp_converted_20years,
opp.return_games_played as return_games_played_20years,
opp.service_point_won as service_point_won_20years,
opp.return_point_won as return_point_won_20years,
opp.total_point_won as total_point_won_20years,
combine.nb_match_win as winner_loser_match_win,
combine.h2h as h2h,
combine.minutes as minutes_loser_winner
FROM "heads"
INNER JOIN "flashscores" AS flash ON flash."flashscoreId" = "heads"."flashscoreId"
INNER JOIN "weather" ON weather."weatherId" = heads."weatherId"
INNER JOIN "players" AS home ON home."playerId" = "heads"."homeId"
INNER JOIN "players" AS away ON away."playerId" = "heads"."awayId"
INNER JOIN "csvs" AS csv ON csv."hashId" = heads."csvDataId"
INNER JOIN "atpworldtours" AS atp ON atp."hashId" = "heads"."atpWorldTourId"
INNER JOIN "commonopponents" AS com ON com.id = "heads"."co1yearid"
INNER JOIN "commonopponents" AS opp ON opp.id = "heads"."co20yearsid"
INNER JOIN "combines" AS combine ON combine.id = heads.combineid
WHERE atp.year = '2017' OR atp.year = '2018'
