{
  "variables": {
    "nodejs_version": "6"
  },
  "builders":[{
    "type": "docker",
    "image": "debian:jessie-slim", 
    "commit": true
  }],
  "provisioners":[{
    "type": "shell",
    "inline":[ 
      "apt-get update",
      "apt-get install -y curl sudo",
      "curl -sL https://deb.nodesource.com/setup_{{ user `nodejs_version` }}.x | sudo -E bash -",
      "apt-get install -y nodejs"
    ]
  }],
  "post-processors": [
    [
      {
        "type": "docker-tag",
        "repository": "nodejs:{{ user `nodejs_version` }}"
      }
    ]
  ]
}
