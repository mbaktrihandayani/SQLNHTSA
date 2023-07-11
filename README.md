# Refocus Special Project: United States National Highway Research
The United States National Highway Research involved analyzing NHTSA (National Highway Traffic Safety Administration) accident data using PostgreSQL and Spreadsheets to identify conditions that increase the risk of accidents on toll roads. Common trends among the top 10 states with the highest number of accidents were determined and targeted safety campaigns were developed for peak accident hours. This research aimed to increase awareness of accident risk factors and develop strategies to improve road safety.

## Introduction
According to the National Highway Traffic Safety Administration (NHTSA), an estimated 42,915 people lost their lives in motor vehicle accidents in the United States in 2021, representing a 10.5% increase from the previous year. This data reflects the highest number of fatalities since 2005. The recorded deaths include pedestrians, cyclists, and others who lost their lives in accidents. NHTSA projected an increase in traffic-related deaths in 44 states, the District of Columbia, and Puerto Rico in 2021 compared to 2020. The data suggest that the increased fatalities are linked to the increased mileage on U.S. highways compared to previous years. Major causes of fatal car accidents include speeding, driving under the influence, distracted driving, and failure to wear seat belts. NHTSA also released preliminary estimates of traffic fatalities for the first nine months of 2021, projecting around 31,720 deaths, a 12% increase from the previous year. It is important to note that while overall statistical data on traffic deaths in the United States and by state is available, specific information regarding individual car accidents that occurred on U.S. highways in 2021 is not yet available. Therefore, Refocus Consultant has collected and analyzed relevant data, along with providing a list of recommendations to NHTSA on ways to reduce accident rates on toll roads.

## Objective
The general objective of this analysis is to gain a better understanding of the operational issues in road traffic, identify hazardous road sections or accident-prone areas, identify risk factors, develop accurate diagnoses and improvement measures, and evaluate the effectiveness of road safety programs, particularly on U.S. toll roads. The collected data can be used by law enforcement to identify responsible parties in road traffic accidents, insurance companies seeking facts about accident claims, decision-makers in developing long-term strategic plans for traffic and highway safety at the state level, and highway safety administrators to help educate the public. Specifically, this analysis aims to provide recommendations to NHTSA for reducing accident rates on U.S. toll roads.

## Data Cleaning and Preparation
The initial SQL data obtained from NHTSA indicates there were 35,451 accident incidents on U.S. toll roads. After thorough observation, it was found that the “timestamp_of_crash” column used the +7 timezones, or Western Indonesian Time. The United States itself has a total of 6 time zones distributed across its states. Therefore, the first step is to determine the time zone for each state listed in the SQL data. Then, a query is created to create a new table where the time zone has been adjusted for each state. After adjusting the time zones, the second step is to check if all the data occurred in the year 2021. By using the “extract” and “count” syntax, it is found that there are 39 incidents that occurred in 2020. The incidents that occurred in 2020 should be removed using the “delete” syntax to ensure that the query results are not contaminated by unwanted data. After the second cleansing step, there are a total of 35,412 accidents occurred in the United States in 2021.

## Data Exploration and Visualization
To gain insights from the data and make it more understandable, various visualizations were created using a spreadsheet tool. Pivot tables and bar charts were used to present the information in a clear and concise manner. Here is a summary of the visualizations:

Total Accidents by Light Conditions: A bar chart was created to display the total number of accidents based on different light conditions. The chart shows the number of accidents for each light condition category, such as daylight, dark-not lighted, and dark-lighted.

Total Accidents by Atmospheric Conditions: A pivot table was used to summarize the total number of accidents based on different atmospheric conditions. The table presents the count of accidents for each atmospheric condition category, such as clear/sunny, rain, fog, and others.

Accidents by Intersection Types: A pivot table was used to analyze the accidents based on intersection types. The table shows the count of accidents for each intersection type, such as four-way intersections, T-intersections, and others.

Count of Drunken Drivers: A bar chart was created to visualize the count of accidents involving drunken drivers. The chart represents the number of accidents associated with drivers under the influence of alcohol.

Top 10 States with Accidents Involving Drunk Drivers: A bar chart was used to display the top 10 states with the highest number of accidents involving drunk drivers. The chart presents the number of accidents for each state, allowing for a quick comparison.

Average Number of Accidents per Day based on Time: A pivot table was used to calculate the average number of accidents per day based on different time periods. The table provides the average count of accidents for each time period, such as morning, afternoon, and night.

Percentage of Accidents Caused by Drunk Drivers: A pivot table was created to calculate the percentage of accidents caused by drunk drivers. The table presents the percentage of accidents attributed to alcohol influence.

Percentage of Accidents in Rural and Urban Areas: A pivot table was used to determine the percentage of accidents occurring in rural and urban areas. The table shows the percentage of accidents in each category, providing insights into the distribution of accidents between these areas.

Number of Accidents Based on the Day: A bar chart was created to visualize the number of accidents based on the day of the week. The chart displays the count of accidents for each day, allowing for easy comparison and identification of patterns.

## Insights
Based on the analysis results, the conditions contributing to increased accident risks are as follows: the lighting condition with the highest number of accidents occurring in daylight, accounting for 16,236 incidents (45.85%), followed by dark-not lighted with 9,671 incidents (27.31%) and dark-lighted with 7,359 incidents (20.78%). Clear or sunny weather conditions were associated with the highest number of accidents, with 24,756 incidents (69.91%). Regarding intersection types, the highest number of accidents occurred at four-way intersections, totaling 5,369 incidents (15.16%). Lastly, there were 8,858 incidents (25.01%) involving drunken drivers.

In 2021, the top 10 states with the highest number of accidents were California, Florida, Georgia, Illinois, Michigan, North Carolina, Ohio, Pennsylvania, Tennessee, and Texas. Texas had the highest number of accidents with 3,513 incidents (19.11%), followed by California with 3,484 incidents (18.96%) and Florida with 3,091 incidents (16.82%). Among these states, California, Texas, and Florida also ranked highest in the number of accidents caused by alcohol influence, with 833 incidents (19.62%), 843 incidents (18.73%), and 663 incidents (14.73%), respectively.

Based on the average hourly distribution of accidents per day, the highest number of accidents occurred from 10 AM to 4 PM, with an average of 5 accidents. This peak in accidents is related to busy hours, contributing to increased traffic volume, congestion, and traffic accidents. Conversely, the number of accidents was relatively lower from 9 PM to 4 AM when there were fewer vehicles on the road.

Based on location, urban areas accounted for 20,101 incidents (57.5%) of accidents, which is higher than rural areas with 14,829 incidents (42.5%). In other words, urban areas had a higher number of accidents compared to rural areas. Furthermore, accidents were most frequently observed on weekends, specifically on Sundays and Saturdays, with 6,340 incidents (17.90%) and 5,837 incidents (16.48%), respectively. The lowest number of accidents occurred on Tuesdays, with 4,345 incidents (12.27%).

## Recommendations
Based on the insights gained from the analysis, the following recommendations are provided to NHTSA to reduce accident rates on U.S. toll roads:

Improve Lighting Conditions: Enhance lighting infrastructure on highways, especially in areas with high accident rates during daylight and dark-not lighted conditions.

Alcohol Education and Enforcement: Strengthen education campaigns on the dangers of driving under the influence of alcohol and implement stricter enforcement measures, such as sobriety checkpoints and penalties for drunk driving.

Intersection Safety Measures: Focus on improving safety measures at four-way intersections, which have shown a higher frequency of accidents. Implement measures such as improved signage, traffic lights, and traffic control devices.

Time-Specific Safety Initiatives: Develop targeted initiatives during peak accident hours (10 AM to 4 PM) to address congestion, improve traffic flow, and increase awareness of safe driving practices.

Urban Safety Enhancements: Implement traffic management strategies and infrastructure improvements in urban areas to reduce accident rates, including road design enhancements, pedestrian safety measures, and improved traffic flow management.

Weekend Safety Programs: Launch safety programs and awareness campaigns during weekends, particularly targeting Sundays and Saturdays, to encourage responsible driving behavior and reduce accidents.

By implementing these recommendations, it is expected that the accident rates on U.S. toll roads can be reduced, contributing to improved road safety and a decrease in fatalities.

Visit my portfolio: https://dataexplorewithyani.my.canva.site/

BI portfolio: https://www.novypro.com/profile_projects/trihandayani

LinkedIn profile: http://www.linkedin.com/in/tri-handayani00
