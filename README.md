# Introduction
This project provides a comprehensive, data-driven analysis of the Data Analyst job market. By leveraging a multi-table database of job postings, the study identifies the high-compensation remote roles, the core technical requirements for top-tier positions, and the "optimal" skills where market demand and financial reward intersect.

Check out the SQL queries here: [project_sql folder](/Project_SQL/)
# Background
The dataset provides a window into the global job market, focusing on:
-  Job Postings: Titles, companies, and salary benchmarks.

- Skills Requirements: The specific technical tools and languages requested by employers.

- Location Strategy: A dedicated look at remote work trends versus traditional on-site roles.

The project is structured around answering five core business questions that reflect the primary concerns of today's job seekers: value, demand, and specific requirements for the highest tiers of the industry.

# Tools I used
- SQL (PostgreSQL): My primary tool for querying the database.

- VS Code: For writing and organizing my SQL scripts.

- Git: For version control.

# Analysis

I broke the project into five strategic queries:

### Top Paying Data Analyst Jobs

I identified the top 10 highest-paying remote Data Analyst roles. I filtered for non-null salaries and localized my search to remote jobs.
- Key takeaway: High-tier salaries often reach      beyond $200k for specialized analyst roles.


### Top Paying Job Skills:

By joining my previous results with skill data, I discovered which specific tools are linked to those top salaries.

- Key takeaway: It's not just SQL; these roles demand a combination of cloud tools (AWS/Azure) and advanced scripting.

### Top Paying Skills:

I calculated the average salary associated with every skill in the database.
<!-- - Logic used: $avg\_salary = \frac{\sum (salary\_year\_avg)}{count(jobs)}$ -->
- Key takeaway: Skills like AI frameworks and specific cloud database technologies command the highest premiums.

### Most Optimal Skills:
Finally, I combined demand and salary into one view. I refined this query from a complex CTE structure into a concise, high-performance aggregation.

# What I learned
Through the development of this project, I achieved several key technical and analytical milestones:

- **Advanced Relational Logic:** Mastered complex JOIN structures to synchronize job metadata with skill dimensions via intermediary bridge tables.

- **Multi-Stage Query Optimization:** Initially developed solutions using multi-CTE (Common Table Expression) logic, which I later refactored into unified aggregations using GROUP BY and HAVING clauses. This transition reduced query complexity and enhanced execution speed.

- **Data Integrity & Validation:** Implemented rigorous filtering protocols (e.g., salary_year_avg IS NOT NULL and ILIKE 'Anywhere') to ensure that insights were based on high-quality, relevant data points.

- **Statistical Significance Thresholds:** Learned the importance of setting thresholds (e.g., HAVING COUNT(*) > 10) to mitigate the impact of outliers and ensure that average salary results reflect genuine market trends rather than isolated high-paying exceptions.

# Conclusion

This analysis provides a definitive roadmap for career optimization in the Data Analyst landscape:

- **The Compensation Gap:** While foundational tools like SQL and Excel remain non-negotiable for entry-level roles, top-tier compensation (exceeding $150,000) is predominantly tied to specialized cloud-native platforms (Snowflake, Azure) and advanced programming (Python).

- **Remote Market Resilience:** The remote market ("Anywhere") remains highly competitive, with a clear preference for analysts who can demonstrate proficiency in the full data lifecycle—from extraction to cloud-based visualization.

- **Strategic Growth Strategy:** Professionals seeking maximum ROI should focus on the "Optimal" skills identified in this study. Mastering high-demand tools that maintain high average salaries provides the strongest buffer against market fluctuations and the best path to long-term financial growth. 

# Closing Thoughts
This project was more than just a technical exercise, it was a strategic exploration into the economic landscape of data analytics. The findings underscore a critical shift in the industry: while the "barrier to entry" remains high-volume tools like SQL and Excel, the "path to mastery" and high compensation is paved with Cloud Infrastructure and Python-driven automation.

<!-- 
    Formats of markdown files

    1. # -> headers
        - no of '#' is header like H1 is #, H2 is ## and so on

 -->