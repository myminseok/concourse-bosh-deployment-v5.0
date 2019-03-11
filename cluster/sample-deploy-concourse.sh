## deploy concoursee with credhub collocated with concourse ewb on vsphere
## concourse.pcfdemo.net 10.10.10.210

bosh -e d deploy -n --no-redact -d concourse concourse.yml \
  -l ../versions.yml \
  --vars-store cluster-creds.yml \
  -o operations/basic-auth.yml \
  -o operations/privileged-http.yml \
  -o operations/privileged-https.yml \
  -o operations/tls.yml \
  -o operations/tls-vars.yml \
  -o operations/scale.yml \
  -o operations/add-credhub-uaa-to-web.yml \
  -o operations/static-web.yml \
  -o operations/cf-auth.yml \
  --var web_ip=10.10.10.210 \
  --var network_name=concourse \
  --var web_vm_type=medium \
  --var db_vm_type=medium.disk \
  --var worker_vm_type=large.disk \
  --var db_persistent_disk_type=db \
  --var web_instances=1 \
  --var worker_instances=1 \
  --var deployment_name=concourse \
  --var external_host=concourse.pcfdemo.net \
  --var external_url=https://concourse.pcfdemo.net \
  --var local_user.username=admin \
  --var local_user.password=PASSWORD \
  --var cf_client_id=concourse_to_pcf \
  --var cf_client_secret=PASSWORD \
  --var cf_api_url=https://api.system.<PCF> \
  -l ../../opsman.ca
