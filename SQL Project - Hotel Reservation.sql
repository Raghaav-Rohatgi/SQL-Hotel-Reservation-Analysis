use mentorness;

#Q-1 . What is the total number of reservations in the dataset? #
SELECT 
    COUNT(DISTINCT (Booking_ID)) AS total_no_of_bookings
FROM
    hotel_dataset;
    
#Q-2 Which meal plan is the most popular among guests?#

SELECT 
   type_of_meal_plan AS meal_plan,
   COUNT(type_of_meal_plan) AS no_of_people_selected_the_meal
FROM
    hotel_dataset
GROUP BY type_of_meal_plan
ORDER BY no_of_people_selected_the_meal DESC
LIMIT 1;
    
    
#Q-3 What is the average price per room for reservations involving children? 

SELECT 
    ROUND(AVG(avg_price_per_room), 2) AS avg_price_of_room_involving_children
FROM
    hotel_dataset
WHERE
    no_of_children > 0;

#Q-4 How many reservations were made for the year 20XX (replace XX with the desired year)? #

SELECT
    CASE
        WHEN arrival_date LIKE '%2017%' THEN 'Year 2017'
        WHEN arrival_date LIKE '%2018%' THEN 'Year 2018'
        ELSE 'Other'
    END AS year_pattern,
    COUNT(distinct(Booking_ID)) AS count
FROM
    hotel_dataset
GROUP BY
    year_pattern;

#Q-5 What is the most commonly booked room type?#
SELECT 
    room_type_reserved,
    COUNT(room_type_reserved) AS most_rooms_booked
FROM
    hotel_dataset
GROUP BY room_type_reserved
ORDER BY most_rooms_booked DESC
LIMIT 1;

#Q-6 How many reservations fall on a weekend (no_of_weekend_nights > 0)? #

SELECT 
    COUNT(Booking_ID) AS bookings_on_weekends
FROM
    hotel_dataset
    
WHERE
    no_of_weekend_nights > 0;
    
#Q-7 What is the highest and lowest lead time for reservations? #

SELECT 
    MAX(lead_time) as max_days_taken_for_booking, MIN(lead_time) as min_days_taken_for_booking
FROM
    hotel_dataset;

#Q-8 What is the most common market segment type for reservations?#
SELECT 
    market_segment_type,
    COUNT(market_segment_type) AS most_common_market_segment_type
FROM
    hotel_dataset
GROUP BY market_segment_type
ORDER BY most_common_market_segment_type DESC
LIMIT 1;

#Q-9 How many reservations have a booking status of "Confirmed"?#
 SELECT 
    booking_status, COUNT(booking_status) AS no_of_bookings
FROM
    hotel_dataset
WHERE
    booking_status = 'Not_Canceled'
GROUP BY booking_status;

#Q-10 What is the total number of adults and children across all reservations?#
SELECT 
    SUM(no_of_adults) AS total_adults,
    SUM(no_of_children) AS total_children
FROM
    hotel_dataset;
    
#Q-11 What is the average number of weekend nights for reservations involving children? #

SELECT 
    AVG(no_of_weekend_nights) AS avg_weekend_nights_involving_children
FROM
    hotel_dataset
WHERE
    no_of_children > 0; 
 
#Q-12 . What is the average number of nights (both weekend and weekday) spent by guests for each room
#type? #

SELECT 
    room_type_reserved,
    AVG(no_of_weekend_nights) AS avg_weekend_nights,
    AVG(no_of_week_nights) AS avg_week_nights
FROM
    hotel_dataset
GROUP BY room_type_reserved
ORDER BY room_type_reserved;

#Q-13 For reservations involving children, what is the most common room type, and what is the average
#price for that room type?

SELECT 
    room_type_reserved,
    COUNT(room_type_reserved) AS raghaav_ka_room,
    ROUND(AVG(avg_price_per_room), 2) AS avg_price_per_room_with_children
FROM
    hotel_dataset
WHERE
    no_of_children > 0
GROUP BY room_type_reserved
ORDER BY raghaav_ka_room DESC
LIMIT 1;

#Q-14 Find the market segment type that generates the highest average price per room.#

SELECT 
    market_segment_type,
    ROUND(AVG(avg_price_per_room), 2) AS avg_price_per_room
FROM
    hotel_dataset
GROUP BY market_segment_type
ORDER BY avg_price_per_room DESC;




 





 
