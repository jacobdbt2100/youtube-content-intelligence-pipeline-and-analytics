# YouTube Content Intelligence Pipeline & Analytics

An incremental data pipeline for collecting, transforming, and analyzing YouTube creator and content data.
___

## Architecture

### Data engineering layer

```text
Python
  ↓
API extraction
  ↓
Raw files
  ↓
Bronze
  ↓
PySpark
  ↓
Silver
```

### Analytics engineering / analytical modeling layer

```text
Silver
  ↓
dbt + SQL
  ↓
stg models
  ↓
int models
  ↓
Gold marts
```

**Repo 2**

## YouTube Content Intelligence App

```text
Gold data
   ↓
Plotly interactive visualizations
   ↓
Streamlit app / interactive dashboard
   ↓
Streamlit Community Cloud hosting / deployment
```

## Data Transformation

## Data Modelling















