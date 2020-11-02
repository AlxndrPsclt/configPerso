#! /usr/bin/env bash

ansible-playbook -i inventory.yml --vault-password-file vault-password-file --extra-vars '@vars/passwords/passwords.yml' playbook.yml
