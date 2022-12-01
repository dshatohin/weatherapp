# Run docker containers as systemd services

This repo contains role to install docker-ce and run any container images as systemd services.

## How to use

1. Create playbook with any name
2. Define services to run like so:

   ```yaml
   # nginx-playbook.yml
   ---
   - hosts: 127.0.0.1
     connection: local
     become: true
     vars:
       services:
       - name: my-nginx
         image: nginx:latest
         args:
         - --publish 80:80
       ansible_pull:
         enabled: true
         minutes_every: 30
         url: https://github.com/dshatohin/ansible.git
         playbook: nginx-playbook.yml
     roles:
     - systemd-docker
   ```

3. Run this playbook by `ansible-pull` command:

   ```plain
   $ ansible-pull --url https://github.com/dshatohin/ansible.git --full nginx-playbook.yml
   ```

4. If `ansible_pull.enabled` set to `true` systemd timer would be created to run every 30 minutes (so it's kind of gitops)
