##STEPS
- gcloud auth login
- bq --project_id <project id> extract -m de_zoomcamp.tip_model gs://<bucket name>/tip_model
- mkdir /tmp/model
- gsutil cp -r gs://<bucket name>/tip_model/tip_model /tmp/model
- mkdir -p serving_dir/tip_model/1
- cp -r /tmp/model/tip_model/* serving_dir/tip_model/1
- docker pull tensorflow/serving
- docker run -p 8501:8501 --mount type=bind,source=pwd/serving_dir/tip_model,target= /models/tip_model -e MODEL_NAME=tip_model -t tensorflow/serving &
- curl -d '{"instances": [{"passenger_count":1, "trip_distance":12.2, "PULocationID":"193", "DOLocationID":"264", "payment_type":"2","fare_amount":20.4,"tolls_amount":0.0}]}' -X POST http://localhost:8501/v1/models/tip_model:predict
- http://localhost:8501/v1/models/tip_model



##My Version
- mkdir -p serving_dir/tip_model/1
- ls serving_dir/tip_model/1
- gcloud auth login
- bq --project_id <project id> extract -m de_zoomcamp.tip_model gs://<bucket name>/tip_model
- $ gsutil cp -r gs://<bucket name>/tip_model serving_dir/tip_model/1/
- mv serving_dir/tip_model/1/tip_model/* serving_dir/tip_model/1/
- ls serving_dir/tip_model/1
##stop any current running docker at port 8051
- docker run -p 8501:8501 \
  --mount type=bind,source="$(pwd)"/serving_dir/tip_model,target=/models/tip_model \
  -e MODEL_NAME=tip_model \
  -t tensorflow/serving &


##WORKING ONE - THE CHOSEN ONE
docker run -p 8500:8500 -p 8501:8501 \
--mount type=bind,source="$(pwd)"/serving_dir/tip_model,target=/models/tip_model \
-e MODEL_NAME=tip_model \
-t emacski/tensorflow-serving &


##NOT WORKING
docker run -p 8500:8500 -p 8501:8501 \
--mount type=bind,source="$(pwd)"/serving_dir/tip_model,target=/models/tip_model \
-e MODEL_NAME=tip_model \
-t bitnami/tensorflow-serving &



##should see results on http://localhost:8501/v1/models/tip_model
http://localhost:8501/v1/models/tip_model:predict:
##something like this:
{
 "model_version_status": [
  {
   "version": "1",
   "state": "AVAILABLE",
   "status": {
    "error_code": "OK",
    "error_message": ""
   }
  }
 ]
}
##test the endpoint:
- curl -d '{"instances": [{"passenger_count":1, "trip_distance":12.2, "PULocationID":"193", "DOLocationID":"264", "payment_type":"2","fare_amount":20.4,"tolls_amount":0.0}]}' \
  -X POST http://localhost:8501/v1/models/tip_model:predict

##should see results on http://localhost:8501/v1/models/tip_model:predict

docker stop ...


