#!/bin/bash

sudo su root

terraform init ./terraform/.

terraform apply ./terraform/.
