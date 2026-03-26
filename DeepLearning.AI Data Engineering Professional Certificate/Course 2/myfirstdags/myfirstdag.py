from airflow import DAG
from datetime import datetime
#context manager
with DAG(
    dag_id = "my_first_dag",
    description = "ETL pipeline",
    tags = ["data_engineering_team"]
    schedule = "@daily",
    start_date = datetime(2024,12,1),
    catchup = False):
        
        #define tasks here
        task_1= PythonOperator(task_id='extract', python_callable= extract_data)
        task_2= PythonOperator(task_id='transform', python_callable= transform_data)
        task_3= PythonOperator(task_id='load', python_callable= load_data)