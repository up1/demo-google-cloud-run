# Hello Google Cloud Run with Golang

## Step 1 :: Build Docker Image and push to Docker Hub
```
$docker image build -t somkiat/hello_cloud_run:1.0 .
```

Test on localhost
```
$docker container run -d -p 8080:8080 somkiat/hello_cloud_run:1.0
$curl http://localhost:8080/

Hello Google Cloud Run!
```

## Step 2 :: Build and submit Docker Image to Google Container Registry
```
$gcloud builds submit --tag gcr.io/[PROJECT-ID]/helloworld
```

## Step 3 :: Deploy on Google Cloud Run with gcloud command
```
$gcloud components install beta
$gcloud components update

$gcloud beta run deploy --image gcr.io/[PROJECT-ID]/helloworld --region us-central1

✓ Deploying new service... Done.
  ✓ Creating Revision...
  ✓ Routing traffic...
  ✓ Setting IAM Policy...
Done.
Service [helloworld] revision [helloworld-00001] has been deployed and is serving traffic at https://helloworld-6tqzl55hla-uc.a.run.app
```

Delete image !!
```
$gcloud container images delete gcr.io/gitlab-203909/helloworld
```