# Open Connect Agent

## Setup

### Environment variables

copy `.env.example` to `.env`, and modify the variables.

### Edit SSH Config

edit `~/.ssh/config`, and add the following configs at the top

```ssh_config
Host oc_agent
    Hostname localhost
    User root
    Port 32323
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null
    LogLevel QUIET

Host ag-oc-*
    ProxyCommand ssh oc_agent nc %h %p
```

You can add more configs using prefix `ag-oc-`, and you will automatically connect to the remote server through above config

