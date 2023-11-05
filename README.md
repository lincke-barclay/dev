# CI/CD Description
## Secrets Management
Secrets _that github needs_ are managed in lincke-barclay https://github.com/organizations/lincke-barclay/settings/secrets/actions
Includes:
  - GH_PAT: The github api token used for pushing and pulling docker containers to the github container registry (might want 2 seperate and specify read / write scopes in the future)
  - LINODE_GITHUB_PASSWORD: There's a github user on the linode instance that has limited `sudo` abilities on the server - (namely starting the server)
  - LINODE_GITHUB_SSH_KEY: Password authentication is disabled on linode. This is the _private key_ for the `github` user
  - LINODE_GITHUB_USERNAME: The username of the github user for linode
  - LINODE_HOST: The ip address of the linode instance
  - LINODE_SSH_PORT: The port used to ssh into the linode instance
All of these secrets are used only in [github actions](https://github.com/lincke-barclay/commune-api/tree/feature/migrate/.github/workflows)

## LiNode 
1. Create an account on [linode](https://cloud.linode.com/account/users) and let me know and I'll grant you access to the linode console (not technically needed, but useful for admin tasks - I avoid using this except for restricting ports)
2. ssh using public private keys using the ip address in the linode console
3. Starting the service:
```
$ systemctl start/stop/restart communeo-api
$ systemctl start/stop/restart communeo-psql # Not necessary rn while we use in memory database
$ systemctl start/stop/restart nginx
```

Files:
```
/etc/nginx/sites-enabled/communeo
/var/log/nginx/**
/home/communeo # Notice the directory layout - it's required - also this folder is read / write / execute to people in the communeo UNIX group - probably want to restrict this more in the future
/home/communeo/env.sh - our end all be all secrets storage - obviously this isn't checked into source - also should probably come up with a better idea in the future
```


Commands:
```
$ journalctl -fu communeo-api
$ journalctl -fu communeo-psql
$ systemctl daemon-reload # reloads service files
```

All the necessary files for running are in `/home/communeo` and you can clone this directory and run `setup.sh` to create symbolic links for systemctl services
