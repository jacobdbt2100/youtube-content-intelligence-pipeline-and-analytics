# Metrics

## 1. `fct_video_performance`

| Metric              | Logic                        | Description                                                  |
| ------------------- | ---------------------------- | ------------------------------------------------------------ |
| Views               | `view_count`                 | Total attention a video has received                         |
| Likes               | `like_count`                 | Total positive reactions                                     |
| Comments            | `comment_count`              | Total audience discussion/interactions                       |
| Like Rate           | `likes / views`              | How strongly viewers respond with likes relative to reach    |
| Comment Rate        | `comments / views`           | How strongly viewers respond with comments relative to reach |
| Engagement Rate     | `(likes + comments) / views` | Overall audience interaction relative to views               |

## 2. Content Velocity

### 2A. `fct_content_daily_velocity`

| Metrics                 | Logic                                          | Description                                |
| ----------------------- | ---------------------------------------------- | ------------------------------------------ |
| Views Gained Per Day    | `current_day_views - previous_day_views`       | Additional views a video gains each day    |
| Likes Gained Per Day    | `current_day_likes - previous_day_likes`       | Additional likes a video gains each day    |
| Comments Gained Per Day | `current_day_comments - previous_day_comments` | Additional comments a video gains each day |

### 2B. `fct_content_early_velocity`

| Metrics                   | Logic                        | Description                                                       |
| ------------------------- | ---------------------------- | ----------------------------------------------------------------- |
| 1-Day Views               | `views accumulated by day 1` | Video's immediate launch performance                              |
| 3-Day Views               | `views accumulated by day 3` | Video's short-term performance                                    |
| 7-Day Views               | `views accumulated by day 7` | Video's early sustained performance                               |
| 7-Day Early View Velocity | `7-day views / 7`            | How quickly a video accumulated attention during its first 7 days |

## 3. Content Freshness (Longevity) & Decay

### 3A `fct_content_freshness_daily`

| Metrics                     | Logic                        | Description                                        |
| --------------------------- | ---------------------------- | -------------------------------------------------- |
| Content Age                 | `tracking_day - 1`           | Elapsed days since tracking began                  |
| Views Over Content Age      | `view_count`                 | Cumulative views at each content age               |
| Engagement Over Content Age | `like_count + comment_count` | Cumulative audience engagement at each content age |

### 3B `fct_content_freshness`

| Metrics                    | Logic                                                                | Description                                        |
| -------------------------- | -------------------------------------------------------------------- | -------------------------------------------------- |
| Peak View Velocity         | `MAX(views_gained_per_day)`                                          | Highest daily view growth                          |
| Time to Peak               | `peak_tracking_day - 1`                                              | Elapsed days until peak                            |
| Pre-Peak View Velocity     | `SUM(views_gained_per_day before peak) / number of days before peak` | Average daily view growth before peak              |
| Post-Peak View Velocity    | `SUM(views_gained_per_day after peak) / number of days after peak`   | Average daily view growth after peak               |
| Velocity Change After Peak | `post_peak_view_velocity - pre_peak_view_velocity`                   | Change in average daily view growth after the peak |

### 4. `fct_creator_daily_performance`

| Metrics                | Logic                                                                       | Description                                                         |
| ---------------------- | --------------------------------------------------------------------------- | ------------------------------------------------------------------- |
| Subscriber Count       | `Current subscriber count`                                                  | Total subscribers recorded for the creator on the collection date   |
| Subscriber Growth      | `current subscribers - previous subscribers`                                | Change in subscriber count since the previous collection            |
| Subscriber Growth Rate | `(current subscribers - previous subscribers) / previous subscribers * 100` | Percentage change in subscriber count since the previous collection |

### 5. `fct_creator_publishing_performance`

| Metrics | Logic | Description |
|---|---|---|
| Subscriber Count | `latest subscriber count` | Total subscribers for the creator |
| Total View Count | `latest total view count` | Total cumulative views across the creator's channel |
| Video Count | `latest video count` | Total videos uploaded by the creator |
| Average Views per Video | `total view count / video count` | Average cumulative views per video across the entire channel |
| Average Views per Tracked Video | `total latest views of tracked videos / number of tracked videos` | Average cumulative views per video among the videos tracked by this project |
| Average Days Between Publications | `AVG(current publication date - previous publication date)` | Average number of days between a creator's video publications |

## Overall Analytical Output

### Strategic Question

- What patterns should influence future content strategy?

### Potential Insights

- Which content patterns are associated with strong early performance?
- Which content patterns are associated with sustained performance?
- Which characteristics are associated with stronger engagement?
- Which characteristics are associated with faster or slower attention decay?
- Does high view volume necessarily correspond to high engagement?
- What patterns distinguish short-lived content from sustained content?
