# Mine Selfhosted Stacks

Kun stacks – Portainer kører allerede på maskinen.

### Sådan deployer du
I Portainer → Stacks → Add stack → Git repository  
- Repository URL: https://github.com/borgersupportcom/voresid.com.git  
- Compose path: `stacks/traefik/docker-compose.yml` (eller hvilken stack du vil)

### Opdatering af alle stacks
Kør på Pi'en:
```bash
cd /home/dev0001
./scripts/update-all.sh
