#! /usr/bin/env bash

workon ansible
ansible-playbook --ask-become-password --ask-vault-password playbook.yml
