# T4Tech Sales Performance - Project Overview
**The goal of this project is to investigate the overall sales trends and growth rates at T4Tech between 2019 and 2022, together with the performance of its loyalty program and refund rates to surface recommendations for future marketing campaigns.**

## Project Background
Founded in 2018, T4Tech is an e-commerce company that sells popular electronics products and has since expanded to a global customer base. Like most e-commerce companies, T4Tech sells products through its online site and mobile app. They use a variety of marketing channels to reach customers, including Email campaigns, SEO, and affiliate links. Over the last few years, their more popular products have been products from Apple, Samsung, and ThinkPad. T4Tech aims to harness a wealth of incoming user data to uncover valuable insights essential for identifying opportunities and informing strategic decisions, ensuring they remain competitive in their market niche.

# Dataset Structure

The dataset consisted of four tables, including information about order values, customer acquision methods, purchase location and purchase times, as well as loyalty program adoption data.

<img src="https://github.com/user-attachments/assets/e9872fe0-c2c5-43b2-a0a4-6e5b37f45a34" width="700">


# Insights Deep-dive
## Yearly Summary and Growth Rates
•	On average, there were 27k sales each year, generating an average annual revenue of approximately $7 million, with the average order value standing at $254. 

•	The year 2021 recorded the peak in sales volume at 36k, whereas 2020 had the highest average order value at $300.

•	**The year 2020 experienced a significant growth rate in total sales, order count and AOV, achieving over twice the sales volume and total revenue compared to 2019.** 

•	Although 2021 saw an increase in the number of sales, the overall revenue declined as customers opted for items that were, on average, 15% less expensive than those purchased in 2020.

![image](https://github.com/user-attachments/assets/7e7607b0-8ee3-4088-bb24-cc3c4f25a78b)


## Regional Performance
•	In all regions, 2020 saw the highest growth rate in total sales, nearly doubling both sales numbers and revenue compared to 2019, indicating growth was driven by a global macroeconomic factor, which was the Covid-19 pandemic. Total sales revenue and volumes in March 2020 were approximately 50% higher than in February 2020, coinciding with the pandemic’s onset. 

•	In 2022, total sales revenue and volumes declined sharply in all regions by approximately 50% and 40%, respectively, due to a macroeconomic factor which was the global semiconductor chip shortage. **As semiconductor chips are essential for all T4Tech products, this global shortage led to severe supply constraints despite high demand.**

•	The LATAM and APAC regions show significantly lower total sales revenue and volumes compared to other regions, **despite comparable average order values.** 

•	Furthermore, the APAC region has the highest AOV of all the regions, suggesting increased competition in the region and highlighting the need to enhance customer base, product offering and brand awareness.

![image](https://github.com/user-attachments/assets/5fd96eca-cfa6-4fa0-8932-b9338099c7d3)

## Key Product Performance
### Macro-level product trends
•	In 2020, total sales revenue and volumes for all products saw a significant increase, **with the MacBook Air achieving over four times the sales revenue and volumes compared to 2019, while the ThinkPad laptop experienced more than a threefold increase.** The onset of the pandemic drove demand for these products as students and corporate employees sought them for their work-from-home setups.

•	In 2022, **all products experienced a sharp decline in total sales revenue and volumes**, underscoring the impact of **supply constraints from the global semiconductor chip shortage**, despite strong demand.

### Best and worst performing products
•	The 27-inch gaming monitor (36% contribution), Apple AirPods (29% contribution), and MacBook Air (20% contribution) are consistently the top three products in terms of total revenue contribution. For total order count, the best performers are the Apple AirPods (45% contribution) , 27-inch gaming monitor (22% contribution) , and Samsung charging cable (21% contribution).

•	**The Samsung charging cable has a high order count but low revenue contribution due to many zero-dollar sales**, indicating it may be given away as a complimentary accessory or that transaction values are not accurately recorded. This issue should be discussed with the data management and sales teams.

•	Conversely, the Bose SoundSport headphones, Apple iPhone, and Samsung webcam are the three worst performers in revenue contribution. The Samsung webcam, despite strong initial sales, has seen a steady decline. The Bose SoundSport headphones are underperforming in sales volume and revenue, averaging the third-lowest purchase price ($124) , suggesting a need for re-evaluation of its shelf presence. **All three are also the lowest in order volume.**

•	The MacBook Air ($1588) , ThinkPad laptop ($1100) , and Apple iPhone ($740) consistently have the highest average sales values. **While the Apple iPhone boasts a high average order value, it does not perform well in order count or total revenue contribution.** This indicates a potential opportunity for growth in iPhone sales through financing options or bundling with other products, as T4Tech's customers may see it as an expensive product with limited appeal compared to other products

## Seasonality
•	Total sales revenue and volume typically experience the strongest growth during the holiday season (November to December) each year, with December experiencing around 20% growth on average.

•	Following this peak, both metrics see a sharp decline, indicating typical post-holiday spending patterns, with a subsequent recovery occurring between July and September.

•	On average, the most significant drops in sales revenue and volume are observed in February (-23%) and October (-35%) each year, showing that **T4Tech's customers typically withhold spending in anticipation of summer and holiday season sales promotions.** 

## Loyalty Program Performance
•	In 2019, non-loyalty members drove around 90% of sales revenue and volume, with higher average spending ($232) compared to loyalty members ($185).

•	By 2020, loyalty program performance improved, contributing 30% of sales revenue and 37% of volume. Loyalty members’ average spending rose to $225 but remained below the $344 average for non-loyalty members.

•	In 2021 and early 2022, loyalty members became the primary revenue source, averaging 55% of total revenue and volume. In 2022, loyalty members spent more per purchase ($240) than non-loyalty members ($215).

•	In Q4 2022, non-loyalty members contributed over 60% of total sales revenue and volume, suggesting reduced effectiveness of the loyalty program in driving sales during that period

•	The MacBook Air remains a top seller, yet 90% of its revenue and volume come from non-loyalty members, who have had lower order values. This suggests potential revenue growth through loyalty program engagement.

## Refund Rate Trends
•	Refunds peaked in 2020 with a 9.2% rate, likely as customers tested new brands and products for remote work setups but regretted some purchases. In that year, the MacBook Air and ThinkPad laptop had the highest refund rates at 17% each.

•	Apple AirPods were the most refunded product in 2020, with 1,5k returns. Apple products made up 60% of that year's 3.1k refunds. 

•	Over the entire period, the MacBook Air and ThinkPad laptops had the highest refund rates at 11% and 12%, potentially due to defects.

•	Refund rates dropped sharply after 2020, falling to 3.6% in 2021 and 0% in 2022, **reflecting significant improvements in T4Tech's quality control.**
