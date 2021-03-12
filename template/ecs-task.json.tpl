[
  {
    "name": "${container_name}",
    "image": "wordpress",
    "cpu": 1024,
    "memory": 2048,
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ]
    }
   ]